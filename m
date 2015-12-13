From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 15:43:36 +0100
Subject: [Buildroot] [git commit] pkg-perl: avoid insertion of host-perl in
	shebang of scripts
Message-ID: <20151213145615.945A7817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90cf8d87abc1715ad0475c0d817a164303e1ad0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index a06c068..a027810 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -140,6 +140,7 @@ define $(2)_BUILD_CMDS
 	else \
 		$$(MAKE1) \
 			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
+			FIXIN=: \
 			$$($(2)_BUILD_OPTS) pure_all; \
 	fi
 endef
