From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 21:56:49 +0100
Subject: [Buildroot] [PATCH/next 4/4] package/mjpg-streamer: added
 optional dependency to libv4l
In-Reply-To: <1455442176-31448-4-git-send-email-bernd.kuhls@t-online.de>
References: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
 <1455442176-31448-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160214215649.07a73997@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Feb 2016 10:29:36 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBV4L),y)
> +MJPG_STREAMER_DEPENDENCIES += libv4l
> +MJPG_STREAMER_USE_LIBV4L += USE_LIBV4L2=true
> +endif

On this one, some possible further improvements:

 - Use a variable named MJPG_STREAMER_MAKE_OPTS and not
   MJPG_STREAMER_USE_LIBV4L.

 - Pass USE_LIBV4L2=false when libv4l is not enabled (if passing =false
   actually has the intended effect)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
