From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 09:10:52 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external-custom:
 support Linux 5.1
Message-ID: <20190407071019.DF9388DF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77d79bf586d467bdca96d28a745a443d0c961bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Clement Leger <clement.leger@kalray.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 607490260f..cb7095632f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1
+	bool "5.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0
 	bool "5.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
