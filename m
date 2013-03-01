From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 17:57:26 +0100
Subject: [Buildroot] [PATCH] qt5: add rPi EGL glue code
In-Reply-To: <1362156380-27083-1-git-send-email-bos@je-eigen-domein.nl>
References: <1362156380-27083-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20130301175726.1bf80e2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri,  1 Mar 2013 17:46:20 +0100, Floris Bos wrote:
> When the rpi-userland package is selected, assume we are targetting the Raspberry Pi, and add the right
> platform glue code when building the Qt5 EGLFS plugin.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Sounds great. Could you wrap your commit log to ~80 columns? I'd like
to apply your patch as-is in my patch series in order to preserve your
authorship.

> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux

Are you sure this is needed? I've added the installation of some .pc
files in the rpi-userland package. At least the first header path is
part of the .pc file for libEGL.

++Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/

We can of course add the second one as well, as long as we understand
if it's needed for OpenGL or EGL.

See the patch 07/30 in my series.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
