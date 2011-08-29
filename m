From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Aug 2011 22:38:17 +0200
Subject: [Buildroot] [git commit] Fix the CodeSourcery ARM 2009q3 toolchain
	use
Message-ID: <20110829203950.438198D337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=68c344a372177bf6c1d59c593c384b799f51fdeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prefix is not set when selecting this toolchain, resulting in a
build failure.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ba74f18..ff7e8db 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -214,6 +214,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
-- 
1.7.3.4
