From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Oct 2014 13:25:23 +0200
Subject: [Buildroot] [git commit] toolchain: external 3.17 headers typo fix
Message-ID: <20141009112605.3D2D7B782F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8f9e5771ae953c62319dfb4164bd5842effe56b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2d312b7b61c98716535513a2743a85d4d7e8a084 had a typo
"." instead of "_" in BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17.
This made selecting 3.17 as custom external headers version
impossible.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8c94871..c74388f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -994,7 +994,7 @@ choice
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
 	bool "3.17.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
 	bool "3.16.x"
