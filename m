From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 20:50:52 +0200
Subject: [Buildroot] [git commit] cryptopp: use HOST_CRYPTOPP_DL_DIR instead
 of CRYPTOPP_DL_DIR
Message-ID: <20180402185204.975768104C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ce411c452d8afc41a05f76d241ed6443bc91e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure only provides HOST_CRYPTOPP_DL_DIR, because this
package is host only. Ideally the infra should provide CRYPTOPP_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 6da39b09f2..b4997aba9d 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -12,7 +12,7 @@ CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
 
 define HOST_CRYPTOPP_EXTRACT_CMDS
-	$(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+	$(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
 endef
 
 HOST_CRYPTOPP_MAKE_OPTS = \
