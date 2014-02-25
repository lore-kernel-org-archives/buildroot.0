From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Feb 2014 23:18:41 +0100
Subject: [Buildroot] [RFC/PATCH 0/1] gst-fsl-plugins: fix compile for
	sysroot based on newer linux kernel headers
Message-ID: <1393366722-27644-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The freescale specific gst-fsl-plugins-3.0.1/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
compile depends on the VIDIOC_DBG_G_CHIP_IDENT ioctl (which was removed
from linux kernel in version 3.11). This breaks compile with toolchains
based on actual linux kernel headers (e.g. buildroot/glibc toolchain).

Which is the right way to fix this problem?

- fix include precedence from sysroot to custom linux kernel headers
  as done in the following patch (latest freescale custom kernel
  is 3.10 based)

- add comment/hint in package description about this dependency

- and/or add dependency (or check) for sysroot linux kernel headers
  version <= 3.10.x (any hint how to do this?)

Peter Seiderer (1):
  gst-fsl-plugins: fix compile for sysroot based on newer linux kernel
    headers

 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.4
