From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:49:41 +0100
Subject: [Buildroot] [git commit] proftpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.9405E8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e3dc0872f2a63902c805b88a20377bbc81bf2eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also use a complete destination path for the $(INSTALL) command.

[Peter: use install -D as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index ce735bd..ce66a3f 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -52,7 +52,10 @@ define PROFTPD_INSTALL_TARGET_CMDS
 		$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
 		$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
 	fi
-	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
+endef
+
+define PROFTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
 endef
 
 $(eval $(autotools-package))
