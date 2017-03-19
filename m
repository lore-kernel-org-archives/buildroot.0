From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:46:52 +0100
Subject: [Buildroot] [git commit] package/gnupg2: add optional support for
	gnutls
Message-ID: <20170319204703.E38F381E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e71413b73b73715626eaa810d87fa7085701b2dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d7f277c..5815e70 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -35,6 +35,13 @@ else
 GNUPG2_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+GNUPG2_CONF_OPTS += --enable-gnutls
+GNUPG2_DEPENDENCIES += gnutls
+else
+GNUPG2_CONF_OPTS += --disable-gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 GNUPG2_CONF_OPTS += --enable-ccid-driver
 GNUPG2_DEPENDENCIES += libusb-compat
