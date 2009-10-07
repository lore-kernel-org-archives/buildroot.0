From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Oct 2009 22:59:49 +0200
Subject: [Buildroot] [git commit master] enable config.cache per default
Message-ID: <20091007210623.C127877784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c45cd1fdbbceb4d3db7a129aa4bcc541ac3d10ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It speeds up configuration considerably.
  If a package breaks due to wrong cache-entries, then the broken
  other package has to be fixed, not the innocent bystander!

  Put short: There is absolutely _no_ need to ever turn the cache off
  unless you hack on autotools itself and goof.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 86e50ac..6967d25 100644
--- a/Config.in
+++ b/Config.in
@@ -160,6 +160,7 @@ config BR2_RECENT
 
 config BR2_CONFIG_CACHE
 	bool "Use a central configure cache file"
+	default y
 	help
 	  This determines if a central config cache is used by
 	  packages, reducing the configure time for packages as each
-- 
1.6.3.3
