From: tarek_el-sherbiny at waters.com <tarek_el-sherbiny@waters.com>
Date: Thu, 19 Apr 2018 09:36:59 +0100
Subject: [Buildroot] [PATCH 1/1] grub2: force -fno-stack-protector in
 CPPFLAGS
In-Reply-To: <20180419083659.22462-1-tarek_el-sherbiny@waters.com>
References: <20180419083659.22462-1-tarek_el-sherbiny@waters.com>
Message-ID: <20180419083659.22462-2-tarek_el-sherbiny@waters.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>

The last commit which implements this workaround is now broken by
commit 20a4583ebf7fe97ea22a1ea11621dd44a8114ca5
This commit will force no-stack-protector in CPPFLAGS instead of
CFLAGS to work with buildroot 2018_02

Signed-off-by: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>
---
 boot/grub2/grub2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 492cddf1a5..35aea41287 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -53,8 +53,8 @@ GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CPP="$(HOSTCC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 	NM="$(TARGET_NM)" \
 	OBJCOPY="$(TARGET_OBJCOPY)" \
-- 
2.14.1


===========================================================
The information in this email is confidential, and is intended solely for the addressee(s). 
Access to this email by anyone else is unauthorized and therefore prohibited.  If you are 
not the intended recipient you are notified that disclosing, copying, distributing or taking 
any action in reliance on the contents of this information is strictly prohibited and may be unlawful.
===========================================================
