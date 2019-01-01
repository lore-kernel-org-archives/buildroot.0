From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 22:56:16 +0100
Subject: [Buildroot] [git commit] toolchain: add necessary options to
 support 4.20 kernel headers
Message-ID: <20190101215421.A10BF88CD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=649883d2c9957b7a7fcf81c4475f848ad8865ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf8ed5bf5b..baf192c936 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -370,10 +370,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
