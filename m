From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 11:16:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wireshark: add
 zstd optional dependency
Message-ID: <20201103100407.4C21082DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed28e24083d2305a4a9c6f93ed41d2834e0817f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

zstd is available since version 3.1.1 and is enabled by default:
https://github.com/wireshark/wireshark/commit/ad94c4d459d243c0cbbb9b222d5f7cdf8189ab86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 105004f72acb56e86a778deb9c33eced3173db14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0bcb97606a..0d4fedb3f0 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -155,6 +155,13 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
+WIRESHARK_DEPENDENCIES += zstd
+else
+WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=OFF
+endif
+
 # Disable plugins as some of them (like l16mono) can't be built
 # statically. ENABLE_STATIC=ON actually means "disable shared library"
 # and ENABLE_STATIC=OFF means "enable shared library". So for the
