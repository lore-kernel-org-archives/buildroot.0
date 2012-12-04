From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 22:39:14 +0100
Subject: [Buildroot] [PATCH v2] xtensa: add config option to enable
	longcalls option
In-Reply-To: <50BE5FD3.4000502@zankel.net>
References: <50bc6a34.45e8440a.493d.4091@mx.google.com>
 <20121203140912.1e09f0ea@skate> <50BDB610.7080304@zankel.net>
 <20121204101716.428c2f20@skate> <87wqwxmv7t.fsf@dell.be.48ers.dk>
 <50BE5FD3.4000502@zankel.net>
Message-ID: <20121204223914.1623e889@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Tue, 04 Dec 2012 12:40:51 -0800, Chris Zankel wrote:

> > I agree. Lets use the safe option by default.
> >
> Not sure what you mean with the 'safe option'? I'm also not sure what

I guess Peter means enabling "-mlongcalls" all the time. My
understanding (and I think Peter did understand it the same way) is
that if you build with -mlongcalls, then all binaries will work, both
small and large binaries, even though there is a small size
and performance cost.

So, what we propose is to simply make -mlongcalls part of the CFLAGS
unconditionally in the Buildroot Xtensa support.

> the preference for options is when you pass both, the -mlongcalls and
> -mno-longcalls option at the same time?

The last one takes precedence, I think.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
