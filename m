From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:05 +0200
Subject: [Buildroot] [git commit] iputils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.8865881F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e62d6cf9c93f5ce05051c0fe3b156ac4d0c707fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 0a89120..21f5dcb 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -62,7 +62,7 @@ IPUTILS_MAKE_OPTS += USE_CRYPTO=no
 endif
 
 define IPUTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
 endef
 
 define IPUTILS_INSTALL_TARGET_CMDS
