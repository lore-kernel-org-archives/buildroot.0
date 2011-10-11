From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 16:09:37 +0200
Subject: [Buildroot] [git commit] sed: show it in config menu when toolchain
	lacks wchar
Message-ID: <20111011142357.A32B58E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3325bc627cdf262bd7d230589f03b3aee02551bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sed/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sed/Config.in b/package/sed/Config.in
index 950701c..1430915 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -6,4 +6,5 @@ config BR2_PACKAGE_SED
 
 	  http://sed.sourceforge.net/
 
-	  Most people will answer Y.
+comment "sed requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
