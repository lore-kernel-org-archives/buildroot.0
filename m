From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Apr 2011 15:12:19 +0200
Subject: [Buildroot] [git commit] target-generic-hostname: add /etc/hosts
	entry as well
Message-ID: <20110422132109.1C6D682973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=983158e225c2947010e078bcd2f62205d9ee6911
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some applications (like proftpd) tries to resolve hostname at startup,
so add it to /etc/hosts.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Makefile.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 3a750c3..ba6e4b0 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -6,6 +6,8 @@ TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	$(SED) '$$a \127.0.1.1\t$(TARGET_GENERIC_HOSTNAME)' \
+		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
 
 target-generic-issue:
 	mkdir -p $(TARGET_DIR)/etc
-- 
1.7.3.4
