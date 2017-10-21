From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] hostapd: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.7854481110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42b5fb05713d480b16917095d1ec0ff13fc6bae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hostapd will not build with LibreSSL without patches, so let's support
only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index e4ca72d..3f94c8c 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -38,8 +38,8 @@ HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
 # Try to use openssl if it's already available
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HOSTAPD_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+HOSTAPD_DEPENDENCIES += libopenssl
 HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
