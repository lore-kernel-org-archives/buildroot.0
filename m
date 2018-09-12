From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 12 Sep 2018 11:22:51 +0100
Subject: [Buildroot] [PATCH v2 1/6] linux: add hash file
In-Reply-To: <20180912102256.3164-1-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
Message-ID: <20180912102256.3164-2-mark.corbin@embecosm.com>
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
  - update hashes for latest kernel versions
---
 linux/linux.hash                         | 9 +++++++++
 package/linux-headers/linux-headers.hash | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 linux/linux.hash
 create mode 120000 package/linux-headers/linux-headers.hash

diff --git a/linux/linux.hash b/linux/linux.hash
new file mode 100644
index 0000000000..84f5312cea
--- /dev/null
+++ b/linux/linux.hash
@@ -0,0 +1,9 @@
+# From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 f03b425e262a71e5079736706233a4e9afaf77c8462b552b4d6db2d33f5af731  linux-4.18.7.tar.xz
+sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
+sha256 61bdd5fbb0e33362d27476e7d8aade0aa1ad11ddb5959a27094c254cc03b19f0  linux-4.14.69.tar.xz
+sha256 6d6a66c757d496460fbcb443063afd989eb5194521273720102e027318985bb5  linux-4.9.126.tar.xz
+sha256 18098c4bae107d37f61474d38049a1ea7c718bcfc859f9b87382933a3a426dd9  linux-4.4.155.tar.xz
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
