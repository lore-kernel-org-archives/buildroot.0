From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:43:11 +0200
Subject: [Buildroot] [PATCH v14 07/20] libva-intel-driver: new package
In-Reply-To: <1405451955-10204-8-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
 <1405451955-10204-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140719004311.14242f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 15 Jul 2014 21:19:02 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                                |    1 +
>  package/libva-intel-driver/Config.in             |   19 ++++++++++++++
>  package/libva-intel-driver/libva-intel-driver.mk |   29 ++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 package/libva-intel-driver/Config.in
>  create mode 100644 package/libva-intel-driver/libva-intel-driver.mk

This package has been added, but is causing build failures in certain
conditions, see:

  http://autobuild.buildroot.org/results/896/896010d8a9ef978386ea1af8e21f5999a735997d/build-end.log

The error is:

In file included from i965_drv_video.c:37:0:
i965_output_wayland.h:31:26: error: unknown type name 'VADriverContextP'
i965_output_wayland.h:34:31: error: unknown type name 'VADriverContextP'
  CC       i965_drv_video_la-i965_encoder.lo
i965_drv_video.c:5243:9: error: 'i965_output_wayland_init' undeclared here (not in a function)
i965_drv_video.c:5244:9: error: 'i965_output_wayland_terminate' undeclared here (not in a function)
make[4]: *** [i965_drv_video_la-i965_drv_video.lo] Error 1
make[4]: *** Waiting for unfinished jobs....

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
