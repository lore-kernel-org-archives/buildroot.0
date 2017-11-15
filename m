From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 19:52:35 +0100
Subject: [Buildroot] [PATCH] sdl2: explicitly disable raspberry pi video
 backend
In-Reply-To: <20171025160326.19759-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 25 Oct 2017 18:03:26 +0200")
References: <20171025160326.19759-1-peter@korsgaard.com>
Message-ID: <87k1yrl6h8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d59/d5992dcc9a49ee77afaebdcc9448ac1868fa7de1/
 > http://autobuild.buildroot.net/results/e89/e894f21ce1983ee3bd8d65a8e59e1adab9a62707/

 > The configure script automatically enables support for the raspberry pi
 > video backend if it detects the rpi-userland package.  Unfortunately it
 > hardcodes a number of include/linker paths unsuitable for cross compilation,
 > breaking the build:

 >     if test x$enable_video = xyes -a x$enable_video_rpi = xyes; then
 > ..
 >      RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
 >      RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"
 >     fi

 > So explicitly disable it until the configure script is fixed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
