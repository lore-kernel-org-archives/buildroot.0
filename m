From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 23 Aug 2018 17:19:29 +0100
Subject: [Buildroot] [PATCH v2 2/3] linux: add hash file
In-Reply-To: <20180823161930.18461-1-mark.corbin@embecosm.com>
References: <20180823161930.18461-1-mark.corbin@embecosm.com>
Message-ID: <20180823161930.18461-2-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added a hash file for the Linux kernel. Hashes have been copied
from the appropriate sha256sums.asc files on kernel.org.
The Linux hash file is also shared with the linux-headers package
via a symbolic link.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
Changes v1 -> v2:
  - use sha256 hashes from kernel.org instead of calculating values
    locally (Baruch)
---
 linux/linux.hash                         | 14 ++++++++++++++
 package/linux-headers/linux-headers.hash |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 linux/linux.hash
 create mode 120000 package/linux-headers/linux-headers.hash

diff --git a/linux/linux.hash b/linux/linux.hash
new file mode 100644
index 0000000000..5691d7f8af
--- /dev/null
+++ b/linux/linux.hash
@@ -0,0 +1,14 @@
+# From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 4d8b5e3772771b60c9c6d875af8e59fbcd34d4291827c110501611da09b79b0f  linux-4.17.18.tar.xz
+sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
+sha256 3f89cd717e0d497ba4818e145a33002f4c15032e355c1ad6d3d7f31f122caf41  linux-4.15.18.tar.xz
+sha256 a38061ca4c864d11a72beb3dc5918a99f13372fe9ee35508d004fdfabd460413  linux-4.14.66.tar.xz
+sha256 b025f3fc40801aff1a2d3438d50be56502eb5bf51a7094e85b5205fa71bec731  linux-4.13.16.tar.xz
+sha256 86ab3f45b1aff5f8a9ec72c232bccf5a314edb2a09fb8664c5902b03edacfd27  linux-4.12.14.tar.xz
+sha256 2e37d4e18094f66b8bd632cac0a3c08a39a14a1ada4a1c78a5e336c4d3036192  linux-4.11.12.tar.xz
+sha256 1ae7056b5b6a3fb653b065503afeb514afc870e103b0f857d0d13a6d06fd66ee  linux-4.10.17.tar.xz
+sha256 8d12ceab9f8cbfd0555c881b35ed4384cf3ea8e223d894c030b04786005e5071  linux-4.9.123.tar.xz
+sha256 5fea8c318626de61e99869eb6dde77e8af2419c5cf6f346280da4be1ab8089e8  linux-4.4.151.tar.xz
+sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
+sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/linux-headers.hash b/package/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..04970e97c1
--- /dev/null
+++ b/package/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../../linux/linux.hash
\ No newline at end of file
-- 
2.17.1
