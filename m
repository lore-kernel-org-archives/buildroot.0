From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:55:56 -0000
Subject: [Buildroot] [git commit branch/next] expedite: fix dependencies
	comment logic
Message-ID: <20150808105555.73DC1818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ec088dceccee0c090fe77b53e62d415b738b8ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/expedite/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index ddbf020..1e12108 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -12,5 +12,4 @@ config BR2_PACKAGE_EXPEDITE
 	  reproduce real world usage cases.
 
 comment "expedite needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
