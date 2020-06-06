From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:26:38 +0200
Subject: [Buildroot] [git commit] package/openssh: add optional dependency
 on audit
Message-ID: <20200606202604.CFFA283DA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f10a7e0fb82cb44d98cc79fcda7260175de30b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 515eec2c03..64ac22181b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -39,6 +39,13 @@ else
 OPENSSH_CONF_OPTS += --without-ssl-engine
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+OPENSSH_DEPENDENCIES += audit
+OPENSSH_CONF_OPTS += --with-audit=linux
+else
+OPENSSH_CONF_OPTS += --without-audit
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define OPENSSH_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
