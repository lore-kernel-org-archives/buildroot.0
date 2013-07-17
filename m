From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Jul 2013 09:37:36 +0200
Subject: [Buildroot] [git commit] pkg-autotools.mk: also use QUIET for host
	configure runs
Message-ID: <20130717073836.713119A5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f5a9deb8cd02697c542422616e0c1879a943861
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for target configure runs. For make -s invocations.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-autotools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 09deef2..b0eddde 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -136,7 +136,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
-		$$($$(PKG)_CONF_OPT) \
+		$$(QUIET) $$($$(PKG)_CONF_OPT) \
 	)
 endef
 endif
