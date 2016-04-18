From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Apr 2016 23:19:06 +0200
Subject: [Buildroot] [PATCH v3 4/4] board/minnowboard-max: Add a X-based
	graphical defconfig
In-Reply-To: <1460820203-6080-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sat, 16 Apr 2016 12:23:23 -0300")
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460820203-6080-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87y48aehth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > This commit adds a new defconfig to build a X-based
 > graphical system for the Minnowboard MAX board.

 >   * The 'openbox' windows manager is chosen because it's simple
 >     and lightweigth.

 >   * Basic X apps are enabled (such as xrandr, xterm), so we
 >     can at least get a console and change video mode.

 >   * ALSA default configuration is provided, so HDMI audio
 >     works out-of-the-box.

 >   * OpenGL is supported.

 > Tested on Minnoboard Turot (which is Minnowboard Max compatible).

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > --
 > Changes from v2:

 >   * Replace cumbersome startx script, with a much simplified
 >     script, that merely wraps xinit to start X on a different VT.

 > Changes from v1:

 >   * Use an overlay instead of post-build.sh to customize the rootfs.

 >   * Remove systemd usage, so we provide a minimum "audio and graphics"
 >     setup.

> +++ b/configs/minnowboard_max-graphical_defconfig
 > @@ -0,0 +1,79 @@
 > +# Architecture
 > +BR2_x86_64=y
 > +BR2_x86_atom=y
 > +
 > +# Toolchain
 > +BR2_OPTIMIZE_2=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 > +BR2_GLIBC_VERSION_2_23=y
 > +BR2_BINUTILS_VERSION_2_26_X=y
 > +BR2_GCC_VERSION_5_X=y

The -O2 and binutils/gcc version selections are not required, so those
should imho not be in the defconfig. You could argue the same about
glibc, but we do it as well for other "big" defconfigs, so I've left
that in and committed, thanks.

-- 
Bye, Peter Korsgaard
