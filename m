From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] flex: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150407.CB51890385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f009b7b93eb0bb4d766f1b0da78ba9d1bdd94bd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index df1b420..041aba8 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -14,6 +14,8 @@ FLEX_INSTALL_STAGING = YES
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBINTL),libintl)
+# we don't have a host-gettext/libintl
+HOST_FLEX_DEPENDENCIES =
 
 # lex -> flex
 define FLEX_INSTALL_LEX
