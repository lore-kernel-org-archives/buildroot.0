From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 22:57:21 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external-custom:
 support Linux 4.20 kernel headers
Message-ID: <20190101215421.B512E88CD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f53b0588a905eb0c868e02ccd777cc1fd4203c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 288fc3f3e0..08a79ee4d9 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,6 +123,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
+	bool "4.20.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19
 	bool "4.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
