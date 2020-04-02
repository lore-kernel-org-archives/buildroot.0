From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 20:51:47 +0200
Subject: [Buildroot] [git commit] toolchain/Config.in: move
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
Message-ID: <20200402185238.0BC447FBE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cce8ed1b98b935a0a454cd7095573e66e2814dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Config option was placed at the wrong position.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 24bb982e9b..a34436d16b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -468,6 +468,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -477,10 +481,6 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 config BR2_TOOLCHAIN_HEADERS_LATEST
 	bool
 
-config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
-	bool
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
