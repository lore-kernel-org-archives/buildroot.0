From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:27:38 +0200
Subject: [Buildroot] [git commit] proftpd: Add ftp user creation
Message-ID: <20151010173637.CD2DF81DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd73abb9691e122fd5dafecbb6bf421c1a23df33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to remove '/home/ftp' and the ftp user from the 'skeleton'
package, we need to add the creation of the ftp users to the package so
it still work out of the box (with an anonymous user).

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/proftpd/proftpd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index dec243d..d040b8c 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -51,6 +51,10 @@ define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
 endef
 
+define PROFTPD_USERS
+	ftp -1 ftp -1 * /home/ftp - - Anonymous FTP User
+endef
+
 define PROFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
 endef
