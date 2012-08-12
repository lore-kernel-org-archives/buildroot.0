From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 12 Aug 2012 13:01:15 -0400
Subject: [Buildroot] [PATCH 1/2] openssh: add linux-pam support
Message-ID: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/openssh/openssh.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0878fce..815ed33 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,6 +12,11 @@ OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENSSH_DEPENDENCIES += linux-pam
+OPENSSH_CONF_OPT += --with-pam
+endif
+
 define OPENSSH_INSTALL_INITSCRIPT
 	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
 endef
-- 
1.7.9.5
