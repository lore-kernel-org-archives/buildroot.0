From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 22:07:52 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
References: <20180815210249.5e11df4d@gmx.net>
 <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <20180908220752.4254ec4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello I?igo,

On Mon,  3 Sep 2018 09:14:00 +0200, I?igo Huguet wrote:
> gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
> is disabled. Added option to enable it, allowing to use elements
> qmlglsrc and qmlglsink.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>

Thanks for this new iteration!

> diff --git a/package/gstreamer1/gst1-plugins-good/0001-configure-fix-qt-qpa-detection.patch b/package/gstreamer1/gst1-plugins-good/0001-configure-fix-qt-qpa-detection.patch
> new file mode 100644
> index 0000000..d755354
> --- /dev/null
> +++ b/package/gstreamer1/gst1-plugins-good/0001-configure-fix-qt-qpa-detection.patch
> @@ -0,0 +1,14 @@
> +configure: fix QT QPA detection
> +
> +Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> +
> +--- gst1-plugins-good-1.14.2/configure_orig	2018-08-15 19:42:48.065311007 +0200
> ++++ gst1-plugins-good-1.14.2/configure	2018-08-15 19:42:58.665528543 +0200
> +@@ -35924,7 +35924,7 @@
> +       else
> +         HAVE_QT="yes"
> +         HAVE_QT_WINDOWING="no"
> +-        QT_VERSION="`$PKG_CONFIG --define-prefix --modversion Qt5Core`"
> ++        QT_VERSION="`$PKG_CONFIG --modversion Qt5Core`"

I think patching GStreamer is not the right approach here. Could you
instead apply http://patchwork.ozlabs.org/patch/967653/, which updates
our pkgconf package to use a newer version that supports the
--define-prefix option ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
