From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 08 Aug 2011 14:24:13 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <4E3FD2D3.9010107@visionsystems.de>
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <4E3FD2D3.9010107@visionsystems.de>
Message-ID: <1312806444.22342.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-08-08 at 14:13 +0200, Yegor Yefremov wrote:
> Hi Sven,
> 
> > after updating buildroot we are getting compile errors from building
> > util-linux. First the linker was complaining that it couldn't find
> > libintl_gettext and related symbols. I was able to fix that by
> > passing --disable-nls to the configure script (patch follows).
> 
> I've tried the 2.20-rc1 and also found this problem, that I didn't see
> before. I got rid of it by selecting libintl and adding it to build
> dependencies. Could you try this?

Well, I don't think that libintl should be selected only because a few
tools from util-linux gain native language support then. But I agree
that it might be better only to use --disable-nls if libintl is not
selected already.


Sven
