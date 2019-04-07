From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 09:10:10 +0200
Subject: [Buildroot] [git commit] toolchain: add
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
Message-ID: <20190407071019.D95678A54F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2500dc581039766b0a767391317aeea13a1474c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Clement Leger <clement.leger@kalray.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 552220123f..8c5a4fb88e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -404,10 +404,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	default "5.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
