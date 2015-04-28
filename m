From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:39:58 +0200
Subject: [Buildroot] [PATCH 1/7] boot/gummiboot: switch to http for git clone
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <41ff4e16c3f2084214227c2ab90b8b6caee97d40.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git:// protocol may not go through conservative corporate firewalls.
Use http, that goes out through about anything.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/gummiboot/gummiboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 72f9c53..02ad28b 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GUMMIBOOT_SITE = git://anongit.freedesktop.org/gummiboot
+GUMMIBOOT_SITE = http://cgit.freedesktop.org/gummiboot
+GUMMIBOOT_SITE_METHOD = git
 GUMMIBOOT_VERSION = 43
 GUMMIBOOT_LICENSE = LGPLv2.1+
 GUMMIBOOT_LICENSE_FILES = LICENSE
-- 
1.9.1
