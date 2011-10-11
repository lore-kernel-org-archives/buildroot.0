From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 09:55:31 +0200
Subject: [Buildroot] [git commit] neon: default to xml support if
	dependencies are available
Message-ID: <20111011075632.463438E2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da653dd4ea233aeaf314f8784c5312b6472a2a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use expat support if expat package is enabled, libxml2 if enabled and
otherwise noxml.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 5ebd64d..53cc8f5 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -21,7 +21,6 @@ config BR2_PACKAGE_NEON_SSL
 
 choice
 	prompt "XML Support"
-	default BR2_PACKAGE_NEON_NOXML
 	depends on BR2_PACKAGE_NEON
 	help
 	  Select which XML library to use...
