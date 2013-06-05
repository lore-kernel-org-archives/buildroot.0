From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 20:53:19 +0200
Subject: [Buildroot] [git commit] libftdi: autoreconf should happen for host
	as well
Message-ID: <20130605191224.740229A967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b713a39802fab4a8c983222273e6641db320a667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d30/d3090804149654e099d3bc9953d48fd920812bf4/build-end.log

The same patches gets applied for target and host, so we should do
autoreconf for the host as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libftdi/libftdi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index c5590ba..06316fe 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -10,6 +10,7 @@ LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
+HOST_LIBFTDI_AUTORECONF = YES
 
 LIBFDTI_CONF_OPT = --without-examples
 
