From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ca-certificates: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132037.AC0D77F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0261d3368f009c5c2a076e0a205c67d86460b39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 393c8cd..f26be64 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -22,7 +22,7 @@ endef
 define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
-	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
 
 	# Remove any existing certificates under /etc/ssl/certs
