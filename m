From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 Jul 2015 15:26:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-14
In-Reply-To: <20150715063016.E7B93101906@stock.ovh.net>
References: <20150715063016.E7B93101906@stock.ovh.net>
Message-ID: <55A65F83.3060704@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:
>           arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/

There are 5 failures like this one today, different archs, all using
uClibc. The error message is:

   CMakeFiles/_cproton.dir/cprotonPYTHON_wrap.c.o: In function 
`SWIG_AsVal_float':
   cprotonPYTHON_wrap.c:(.text+0xcb8): undefined reference to `__finite'

I'm sending a quick fix patch, it's probably not a good one but I
can't do any better right now. At least it fixes the build.

-- 
Luca
