From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 21:57:07 +0100
Subject: [Buildroot] [git commit] package/bearssl: needs -fPIC
Message-ID: <20200322204402.C368B84C8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75edc0b0c75a6dd05d6e8d31360ce0f7217008b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/e677519c7536447062bf15fb7aa73eded19a6cf6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bearssl/bearssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
index e85626153c..ff5f4e87b7 100644
--- a/package/bearssl/bearssl.mk
+++ b/package/bearssl/bearssl.mk
@@ -16,6 +16,7 @@ BEARSSL_MAKE_OPTS = \
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 BEARSSL_TARGETS += dll
+BEARSSL_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
