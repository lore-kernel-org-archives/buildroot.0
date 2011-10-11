From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 16:09:51 +0200
Subject: [Buildroot] [git commit] cvs: show it in config menu when toolchain
	lacks wchar
Message-ID: <20111011142357.E31748E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea28972734663094a76a08126f707d2f8133dfbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cvs/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 2e61834..f9d5955 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -12,3 +12,6 @@ config BR2_PACKAGE_CVS_SERVER
 	depends on BR2_PACKAGE_CVS
 	help
 	  Enable cvs server code
+
+comment "cvs requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
