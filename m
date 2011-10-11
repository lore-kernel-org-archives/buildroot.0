From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 16:09:33 +0200
Subject: [Buildroot] [git commit] gawk: show it in config menu when
	toolchain lacks wchar
Message-ID: <20111011142357.5D30C8E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=744070ee6495259ac2f47f24d42912d2151ea64e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 62ca860..82c970f 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_GAWK
 	  with just a few lines of code.
 
 	  http://www.gnu.org/software/gawk/
+
+comment "gawk requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
