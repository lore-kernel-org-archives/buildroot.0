From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Apr 2016 07:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: mod_cv needs
	BR2_PACKAGE_OPENCV_LIB_OBJDETECT
In-Reply-To: <1460953338-15043-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460953338-15043-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMKWQQMW9x5P91-E+22ZwZJFZ3Tq0dzuB9qOE9ww7bhqHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Mon, Apr 18, 2016 at 6:22 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Fixes
> http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/freeswitch.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index fdfdbf0..11b77e8 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -269,7 +269,7 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
>  FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
>  endif
>
> -ifeq ($(BR2_PACKAGE_OPENCV),y)
> +ifeq ($(BR2_PACKAGE_OPENCV)$(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),yy)

The condition should also check for improc module since it is a
dependency of objdetect [1], and the opencv-2 package does not have
(yet) inter-module dependency select.

>  FREESWITCH_DEPENDENCIES += opencv
>  FREESWITCH_ENABLED_MODULES += applications/mod_cv
>  endif
> --
> 2.8.0.rc3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://github.com/Itseez/opencv/blob/2.4.12.3/modules/objdetect/CMakeLists.txt#L2

Regards,

-- 
Samuel
