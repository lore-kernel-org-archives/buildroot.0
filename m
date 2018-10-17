From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 17 Oct 2018 15:55:19 +0200
Subject: [Buildroot] [PATCH] {linux,
 linux-headers}: fix linux-4.9.133.tar.xz checksum
Message-ID: <20181017135519.12202-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux tarball checksum was recently updated, including the one for
version 4.9.133. The checksum for this particular version of Linux
misses one character which lead to a build issue as the checksum does
not match:

ERROR: linux-4.9.133.tar.xz has wrong sha256 hash:
ERROR: expected: 3730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
ERROR: got     : 53730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

This patch fixes it.

Fixes: 0064c7b25125 ("{linux, linux-headers}: bump 4.{4, 9, 14, 18}.x series")
Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 5a00e786af66..46f587ef6a82 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 36c6d1360db9eab40270db6d292c259dd34d3dc06049d64afe3e4cfafb8562d3  linux-4.18.14.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
 sha256 ee3f19a4ff8a42793c193e361e1d34fcc821a5ca9b58db41befb2b4df0e482be  linux-4.14.76.tar.xz
-sha256 3730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563   linux-4.9.133.tar.xz
+sha256 53730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563  linux-4.9.133.tar.xz
 sha256 be0383d57c52a7ac6b1ca4d989a16a581f52ec9704ccf4ddf066b1b5b1313f87  linux-4.4.161.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
-- 
2.17.2
