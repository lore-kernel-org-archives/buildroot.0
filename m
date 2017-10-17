From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 21:39:54 +0200
Subject: [Buildroot] [git commit] hostapd: add upstream security fixes
Message-ID: <20171017193430.80D53801B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5259c5c8058aa2c9608fd202c35477015a41c326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-13082

http://lists.infradead.org/pipermail/hostap/2017-October/037989.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.hash | 2 ++
 package/hostapd/hostapd.mk   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index fb89147..b20c89b 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
+sha256  529113cc81256c6178f3c1cf25dd8d3f33e6d770e4a180bd31c6ab7e4917f40b  rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
+sha256  147c8abe07606905d16404fb2d2c8849796ca7c85ed8673c09bb50038bcdeb9e  rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 9745d1f..e4ca72d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -6,6 +6,9 @@
 
 HOSTAPD_VERSION = 2.6
 HOSTAPD_SITE = http://w1.fi/releases
+HOSTAPD_PATCH = \
+	http://w1.fi/security/2017-1/rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch \
+	http://w1.fi/security/2017-1/rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = host-pkgconf libnl
