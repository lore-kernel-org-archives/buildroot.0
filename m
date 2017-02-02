From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 2 Feb 2017 20:31:06 +0100
Subject: [Buildroot] [PATCH v6 1/9] qt5: add choice between version
 5.6.2 and 5.8.0
In-Reply-To: <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170202203106.10275402@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Tue, 31 Jan 2017 08:59:03 +0100, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:

[...]
> - qt5base: remove gstreamer related config-option ([5])
> 
[...]
> [5]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203
> 
[...]
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index bbbaf0f..c09bf58 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -41,12 +41,19 @@ else
[...]
>  
>  # gstreamer 0.10 support is broken in qt5multimedia
> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
>  QT5BASE_DEPENDENCIES   += gst1-plugins-base
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-gstreamer
>  endif
> +endif

I think this configuration options should go to qt5multimedia.mk for
the Qt5.8 (or not !Qt5.6) case...

Regards,
Peter


	$ grep gstreamer build/qt5multimedia-5.8.0/config_help.txt 
  -no-gstreamer ........ Disable support for GStreamer
  -gstreamer [version] . Enable GStreamer support [auto]
