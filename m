From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2020 09:17:44 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/openssh: add
 optional dependency on audit
Message-ID: <20200712201459.4FE20812F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ebcde457bc2470b43239608c5b4414d4be1e892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f10a7e0fb82cb44d98cc79fcda7260175de30b7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0411133bdc..9720fcdb0e 100644
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
