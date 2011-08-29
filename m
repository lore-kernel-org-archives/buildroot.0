From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 29 Aug 2011 17:56:31 +0200
Subject: [Buildroot] [PATCH 1/2] Fix the CodeSourcery ARM 2009q3 toolchain
	use.
Message-ID: <1314633391-27020-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The prefix is not set when selecting this toolchain, resulting in a
build failure.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
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
1.7.4.1
