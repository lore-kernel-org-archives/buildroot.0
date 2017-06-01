From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Jun 2017 20:28:56 -0000
Subject: [Buildroot] [git commit] linux-pam: add optional support for
	cracklib
Message-ID: <20170601202850.93A378261C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8d5f3c7e017e7b82083d0e050e5a0e8ddabb97d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/linux-pam.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 3522415..fb2f99c 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -44,6 +44,13 @@ else
 LINUX_PAM_CONF_OPTS += --disable-audit
 endif
 
+ifeq ($(BR2_PACKAGE_CRACKLIB),y)
+LINUX_PAM_CONF_OPTS += --enable-cracklib
+LINUX_PAM_DEPENDENCIES += cracklib
+else
+LINUX_PAM_CONF_OPTS += --disable-cracklib
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
