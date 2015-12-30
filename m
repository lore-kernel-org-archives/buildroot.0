From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:03:27 +0100
Subject: [Buildroot] [git commit] toolchain-external: select netbsd-queue
	for musl toolchains
Message-ID: <20151230090426.29F7282713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69e0d0e2821e759da2b6b5ab119c6c3b0dac8805
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the introduction of the check that target packages must have
their Config.in option enabled, we started to see failures related to
netbsd-queue. Yann fixed the internal toolchain case in commit
e84fd04e88bcda2771847958b3b5153e476db45f. This commit fixes the
similar issue, but for the external toolchain case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 35d8b7a..1418fc1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -583,6 +583,7 @@ config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 config BR2_TOOLCHAIN_EXTERNAL_MUSL
 	bool
 	select BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_NETBSD_QUEUE
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
