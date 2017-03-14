From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:40:25 +0100
Subject: [Buildroot] [git commit] libiio: explicitly disable matlab bindings
Message-ID: <20170314224051.EF340825C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f358078b3374f3b316551660e89f5c463cb61608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If building on a machine with MATLAB installed, the MATLAB bindings will
default to ON, which is not the desired behavior for a cross build.

The bindings are designed to be called from within MATLAB, and we are
not currently running MATLAB on buildroot-generated targets.

This does not preclude the use of the bindings from a host connecting
over the network backend (assuming libiio on the host has the bindings
enabled).

Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
Acked-By: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/libiio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 8977610..aaa6c70 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -14,6 +14,7 @@ LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
 	-DWITH_MATLAB_BINDINGS_API=OFF \
+	-DMATLAB_BINDINGS=OFF \
 	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
