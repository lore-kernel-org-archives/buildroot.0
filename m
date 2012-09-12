From: Dmitry <golubovsky@gmail.com>
Date: Wed, 12 Sep 2012 05:27:31 -0400
Subject: [Buildroot] [PATCH] Disable database support in linux-pam
Message-ID: <1347442051-24329-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the conflicts with default Berkeley DB configuration, disable
database support in linux-pam: pam_userdb is not built.

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/linux-pam/linux-pam.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 48cb073..08b5cf9 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -12,6 +12,7 @@ LINUX_PAM_CONF_OPT = \
 	--disable-prelude \
 	--disable-isadir \
 	--disable-nis \
+	--disable-db \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-- 
1.7.2.5
