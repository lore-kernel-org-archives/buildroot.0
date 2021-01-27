From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 22:36:53 +0100
Subject: [Buildroot] [git commit] package/libiec61850: drop
 BUILD_EXAMPLES=OFF
Message-ID: <20210127211741.1A18B815ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f961ace37962ccef1d5152dd84c019abcad7fea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BUILD_EXAMPLES=OFF is already passed by cmake-infrastructure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libiec61850/libiec61850.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 6413073805..c102feeac1 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -9,8 +9,7 @@ LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSIO
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
-LIBIEC61850_CONF_OPTS = -DBUILD_EXAMPLES=OFF \
-	-DBUILD_PYTHON_BINDINGS=OFF
+LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 
 # 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
 LIBIEC61850_IGNORE_CVES += CVE-2020-15158
