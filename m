From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 21:35:38 +0200
Subject: [Buildroot] [git commit] gutenprint: add optional libusb support
Message-ID: <20160417193802.2C29E81D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a99de14d1f216d81b17bbc31daa0a1e2854ed683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the recent build issues have shown, gutenprint has optional libusb
support so ensure it is built after libusb if enabled for consistent
builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gutenprint/gutenprint.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index aebafe2..8ee2406 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -16,7 +16,8 @@ GUTENPRINT_AUTORECONF = YES
 
 GUTENPRINT_DEPENDENCIES = \
 	cups host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_PACKAGE_LIBUSB),libusb)
 
 # host-gutenprint is needed to generate XML as part of compilation
 # the program that generates the xml also links against libgutenprint
