Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F21DC54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F435817AE;
	Sun, 17 Mar 2024 14:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KFpS8WzbIyT; Sun, 17 Mar 2024 14:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9060481D9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9060481D9F;
	Sun, 17 Mar 2024 14:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B94F1BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6395C60606
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlV6p1Mnujfm for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 837F06065D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 837F06065D
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C138827B3; Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 13:59:25 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5b8c60fb71917f6111bd44b639fa43a77b7f8439
X-Git-Newrev: 5b8e420b697012a0610012f33ac6ff3af6af2f51
X-Patchwork-Hint: ignore
Message-Id: <20240317143733.6C138827B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/nodejs: security
 bump to version 20.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b8e420b697012a0610012f33ac6ff3af6af2f51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

- Fix CVE-2024-21892, CVE-2024-22019, CVE-2024-21896, CVE-2024-22017,
  CVE-2023-46809, CVE-2024-21891, CVE-2024-21890 and CVE-2024-22025

- LICENSE hash changed due to two things:
  * c-ares vendored dependency license got updated [1]. This is unused
    by buildroot though anyway
  * base64 vendored library license updated copyright years and sorted
    contributor names [2], [3]

- This bump will fix the following build failure raised since bump of
  python to version 3.12.1 in commit 36e635d2d5c0166476858aa239ccbe78e8f2af14
  thanks to
  https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6
  https://github.com/nodejs/node/commit/6557c1c9b1206a85bb7d8e7450e8c3a4cff7c84b:

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-2/output-1/build/host-nodejs-src-20.9.0/configure.py", line 17, in <module>
    from distutils.version import StrictVersion
ModuleNotFoundError: No module named 'distutils'

https://github.com/nodejs/node/blob/v20.11.1/CHANGELOG.md

[1] https://github.com/c-ares/c-ares/pull/556
[2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
[3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 - http://autobuild.buildroot.org/results/8b38bc4b7879a0349c1305e2fcb458a0cfd04a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-By: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02ecb096ad874a1fecfc3a87ca7d547befb16d8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2d60437a7c..ddab345e0a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.9.0/SHASUMS256.txt.asc
-sha256  ced3ecece4b7c3a664bca3d9e34a0e3b9a31078525283a6fdb7ea2de8ca5683b  node-v20.9.0-linux-arm64.tar.xz
-sha256  64099d7e62bdbb8efd52c216a6759b3cdd77c38aa993096fdee9f875d95b2d8e  node-v20.9.0-linux-armv7l.tar.xz
-sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v20.9.0-linux-ppc64le.tar.xz
-sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
-sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
+# From https://nodejs.org/dist/v20.11.1/SHASUMS256.txt.asc
+sha256  c957f29eb4e341903520caf362534f0acd1db7be79c502ae8e283994eed07fe1  node-v20.11.1-linux-arm64.tar.xz
+sha256  28e0120d2d150a8f41717899d33167b8b32053778665583d49ff971bfd188d1b  node-v20.11.1-linux-armv7l.tar.xz
+sha256  51343cacf5cdf5c4b5e93e919d19dd373d6ef43d5f2c666eae299f26e31d08b5  node-v20.11.1-linux-ppc64le.tar.xz
+sha256  d8dab549b09672b03356aa2257699f3de3b58c96e74eb26a8b495fbdc9cf6fbe  node-v20.11.1-linux-x64.tar.xz
+sha256  77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138c7538a3c0ca5209e  node-v20.11.1.tar.xz
 # Locally calculated
-sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
+sha256  7b0bbdca72f925bd78b764914651244a4432a753c7325d061a565cd7eac1193d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9806a64d38..858c6a86f5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.9.0
+NODEJS_COMMON_VERSION = 20.11.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
