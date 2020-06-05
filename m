From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:59:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/openssh: Depend on libaudit if
 available
Message-ID: <20200605225905.14082-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/openssh/openssh.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 515eec2c03..55b917e20a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -39,6 +39,11 @@ else
 OPENSSH_CONF_OPTS += --without-ssl-engine
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+OPENSSH_DEPENDENCIES += audit
+OPENSSH_CONF_OPTS += --with-audit=linux
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define OPENSSH_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
-- 
2.26.2
