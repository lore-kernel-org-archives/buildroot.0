From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 08:01:16 +0200
Subject: [Buildroot] [git commit branch/next] systemd: fix -Dlibidn2 option
 when libidn2 is not available
Message-ID: <20180523060010.5F5F0821C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c75955baff986e61d320693edffb6a735d4aedcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 4ded5d6af4f0198036183f00de190569d7578bc3 ("systemd: add
optional dependency on libidn2") contained a mistake: -Dlibidn2=true
was passed even when neither libidn nor libidn2 are
available. Obviously it should be -Dlibidn2=false.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1e4b257731..8f7a9fa93c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -83,7 +83,7 @@ else ifeq ($(BR2_PACKAGE_LIBIDN),y)
 SYSTEMD_DEPENDENCIES += libidn
 SYSTEMD_CONF_OPTS += -Dlibidn=true -Dlibidn2=false
 else
-SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=true
+SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
