From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Oct 2009 00:11:29 +0200
Subject: [Buildroot] [git commit master] toolchain: mark
	BR2_ENABLE_LOCALE_PREGENERATED as broken
Message-ID: <20091021221240.517C477792@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89b33886f7790bed52cfbba882365c4810b022c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's still no suitable tarball available on uclibc.org, so better
hide the option for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 2a9ce24..2da5670 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -37,7 +37,7 @@ config BR2_ENABLE_LOCALE
 
 config BR2_ENABLE_LOCALE_PREGENERATED
 	bool "Use pregenerated locale data?"
-	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_SOURCE
+	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_SOURCE && BROKEN # tarball missing
 	help
 	  Instead of generating the locale data locally you can optionally
 	  download a pregenerated set of locales.
-- 
1.6.3.3
