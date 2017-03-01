From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:37:51 +0100
Subject: [Buildroot] [git commit] glibc: add version 2.25
Message-ID: <20170301213831.94BB782234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde6634a29db52d535311afa9f04e263e2fd2ed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in  | 7 ++++++-
 package/glibc/glibc.hash | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 0442626..f92cdf3 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -24,7 +24,11 @@ config BR2_GLIBC_VERSION_2_24
 	# See: https://sourceware.org/ml/libc-alpha/2016-08/msg00212.html
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
-comment "glibc-2.24 needs kernel headers >= 3.2"
+config BR2_GLIBC_VERSION_2_25
+	bool "2.25"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+comment "glibc-2.24+ needs kernel headers >= 3.2"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 endchoice
@@ -36,3 +40,4 @@ config BR2_GLIBC_VERSION_STRING
 	default "2.22" if BR2_GLIBC_VERSION_2_22
 	default "2.23" if BR2_GLIBC_VERSION_2_23
 	default "2.24" if BR2_GLIBC_VERSION_2_24
+	default "2.25" if BR2_GLIBC_VERSION_2_25
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index befe80c..863c9b4 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -2,3 +2,4 @@
 sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
 sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
 sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.24.tar.xz
+sha256	067bd9bb3390e79aa45911537d13c3721f1d9d3769931a30c2681bfee66f23a0	glibc-2.25.tar.xz
