From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 23 Aug 2018 14:15:50 +0100
Subject: [Buildroot] [PATCH 2/3] linux: add hash file.
In-Reply-To: <20180823131551.10903-1-mark.corbin@embecosm.com>
References: <20180823131551.10903-1-mark.corbin@embecosm.com>
Message-ID: <20180823131551.10903-2-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added a hash file for the Linux kernel. The tarballs were downloaded
from kernel.org and verified using gpg before generating sha512
hashes. This file is also shared with the linux-headers package via
a symbolic link.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 linux/linux.hash                         | 13 +++++++++++++
 package/linux-headers/linux-headers.hash |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 linux/linux.hash
 create mode 120000 package/linux-headers/linux-headers.hash

diff --git a/linux/linux.hash b/linux/linux.hash
new file mode 100644
index 0000000000..7fc2a55001
--- /dev/null
+++ b/linux/linux.hash
@@ -0,0 +1,13 @@
+# Locally calculated after checking pgp signatures
+sha512 211f72ce038b3f17355569527170bf02b3eb84b1cddc9866e800e1a87dda15b57a8a3ccd97a737f670cef3af6ecb62354831787918ba5c514987a3b32c4e6d6b  linux-4.17.18.tar.xz
+sha512 8fee4164ff5bb9f9561a15d0df5d9d8f4890189bc923c9ca1ce5fb78e8d286a68f9b975ea2ea9f49cad1c6bbf2fd2ec3ec1042ec5fa2ad95249bc2f2a23aef6a  linux-4.16.18.tar.xz
+sha512 d0f6819ef6cf809769ceb717419c57b422bea611da23db63d7d0de15545278bafc9a3de04491dfe2f669eb5f62a718c000bebbe8e7b508796b9c461794d3deec  linux-4.15.18.tar.xz
+sha512 e4980fcb8fba5bd64ce8e2447ce4c847ec41ca4e86dc29bbd6f706ba883852eaec950680ba67a222c237eb5abc01d58cf66e04fe93a666cbd0be9d6d51f690d7  linux-4.14.66.tar.xz
+sha512 8dcdfd6529635b45493f64236a9d4704c4c73554f97ee99cc8ee330a7921e00c37e6652daf30bda4c526893f3665c183e5b64998593769ec1d947ee74fc0833a  linux-4.13.16.tar.xz
+sha512 3c8217092d31c8030ca3a669ae76c23dbb0e2f4b392144930d1685fa1b8e1b7178a261da845349791f36265338a5f5cd9132b666f8994c8e80514a607f811445  linux-4.12.14.tar.xz
+sha512 92a40984e2706e18c392dcd9b8d64261c138a228de335fe63501ceae3d89adaff7d211e3fd849f859ce3869292ff7bffc935aefe40e1abaf457d2e3210b4f4ef  linux-4.11.12.tar.xz
+sha512 c4dbd0863454f7794caf3203d9326dffe370f1250a94d0644f3e1b399c368ae6ddd3479a3fb8a893b0372181f736f0e4a72c4efe338698423598b9577ded3e21  linux-4.10.17.tar.xz
+sha512 4d1a8b5741be2fa46e0a7c40d54cc7df42e891cd397274bd31152dd6d2d0a642e92808aa7f110d37aec849e8d38ed16fce65aec436f83fafef3f67f312b6c696  linux-4.9.123.tar.xz
+sha512 504fdeb22320be391e680f5e2d0fc80b6d1ef5d6001012ecf5955983b4b42f9a26797ee7f663705d1e6b3a74fe6efee5a9df11957a2b3e40fc8433602e925d7c  linux-4.4.151.tar.xz
+sha512 c74843faa40700cbbe8d1d1be90b80fe09cd8ba449e44eedb43ffb87032aa2000303e9a701c3fc18fe4f3f3f76ec184c8c1193602e8cdc84cce5fc08b559c782  linux-4.1.52.tar.xz
+sha512 760197283a98c58db40deffdac847d8d274206cd5ef30a3454fca6affc863f0bf579795a170ba195e3090b33f3cd3b22cdcbb7c60daf119b9760bb09595868ba  linux-3.2.102.tar.xz
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
