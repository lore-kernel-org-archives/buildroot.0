From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Apr 2016 22:39:05 +0200
Subject: [Buildroot] [PATCH 1/4] board/minnowboard-max: Rework to
	generate SD card image
In-Reply-To: <1460438965-28065-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Tue, 12 Apr 2016 02:29:22 -0300")
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <877fg1jlau.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Let's rework the board and config files to use genimage
 > to generate the SD card image directly.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

 > diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
 > index 98996db958ff..47f7d4e96a55 100644
 > --- a/configs/minnowboard_max_defconfig
 > +++ b/configs/minnowboard_max_defconfig
 > @@ -5,9 +5,12 @@ BR2_x86_atom=y
 >  # Misc
 >  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 >  BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
 
 >  # Linux headers same as kernel, a 4.4 series
 >  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 > +BR2_PACKAGE_HOST_DOSFSTOOLS=y
 > +BR2_PACKAGE_HOST_GENIMAGE=y

The vfat handling also uses mcopy, so we also need
BR2_PACKAGE_HOST_MTOOLS=y.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
