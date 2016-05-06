From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:51:47 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: use -O2 build
 optimization level
In-Reply-To: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160506155147.61d21773@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 May 2016 21:08:27 -0300, Gustavo Zacarias wrote:
> The xorg server is somewhat sensitive to certain gcc versions combined
> with -Os, particularly for ARM and MIPS, typically in the form of the
> following symptom/error:
> 
> (EE) Segmentation fault at address 0x0
> (EE)
> Fatal server error:
> (EE) Caught signal 11 (Segmentation fault). Server aborting
> 
> Force -O2 to work around this problem - for a target rootfs that uses
> X11 the tradeoff is minimal since a sample/test image for qemu vexpress
> with X11 + xinit + xterm + twm + xclock + gtk2 with demos is 60+ MB.
> 
> And it's less complicated than trying to find all of the bad
> combinations.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've added a comment in the .mk file that explains why we are forcing
-O2, and a reference to the Bugzilla bug that this is fixing. Applied
with those changes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
