Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EBC44502
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91538235A;
	Fri,  3 Jul 2026 14:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iYuL4C4xiIh; Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C875A82386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088832;
	bh=SXKK0qvxqgtdKzPJm2fF/N5Mudlh7ct7DMNP3sOF+gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PHkUfSTLp7Ywa1l3qFhXgbumd/ZWJd//pLkwBcVh2i3mOAU+Md/h75R730/3LqcnQ
	 fkKnoYjTELPBTIwUNpwf0lgmK82pC4sWrVvomp349tWsqIYQRhO9Wqen3wHjU3FVhz
	 944raZGGNqYB1/vQr7wR3ou68z0FZq6B3gSMhK5BD+Q9Wzu3FgmiV1n+iNawRgUGA8
	 s48WfjDOj6jOmLZ/1O2/FF10cbO8ntO6u2X9I2O7GMxMoiiA4/kQXU3BcIPGMLJi3R
	 RC+56eG3nZa8/Uk+8rrHn+1nIUsNCnfUzFYnhwcPm7se5QOzfait+viHvQCf2tny5n
	 HDDoanYaKHBNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C875A82386;
	Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1470E14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D9B60648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gZes58KIFSN for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76C260A64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A76C260A64
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49DC5883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:47:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a175b0592ce010b16bedfd0fee33fb77c1615c03
X-Git-Newrev: 0a9d437c60e8eed5a57acc58120f112ed636ede7
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.49DC5883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: bump
 to v2.40.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a9d437c60e8eed5a57acc58120f112ed636ede7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
 - https://www.kernel.org/pub/linux/utils/util-linux/v2.40/v2.40.3-ChangeLog
 - https://www.kernel.org/pub/linux/utils/util-linux/v2.40/v2.40.4-ChangeLog

Also add 0007-lib-path-avoid-double-free-for-cpusets.patch introduced
after the 2.40.4 release.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...07-lib-path-avoid-double-free-for-cpusets.patch | 30 ++++++++++++++++++++++
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch b/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch
new file mode 100644
index 0000000000..f3d9e75652
--- /dev/null
+++ b/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch
@@ -0,0 +1,30 @@
+From 27279d4ab2431e1afb3a125ae7306eb2323b86b7 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 2 Jul 2025 12:25:45 +0200
+Subject: [PATCH] lib/path: avoid double free() for cpusets
+
+Addresses: https://github.com/util-linux/util-linux/issues/3641
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream: https://github.com/util-linux/util-linux/commit/27279d4ab2431e1afb3a125ae7306eb2323b86b7
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/path.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/path.c b/lib/path.c
+index f897599fd06..29b074a959b 100644
+--- a/lib/path.c
++++ b/lib/path.c
+@@ -1053,8 +1053,10 @@ static int ul_path_cpuparse(struct path_cxt *pc, cpu_set_t **set, int maxcpus, i
+ 	rc = 0;
+ 
+ out:
+-	if (rc)
++	if (rc) {
+ 		cpuset_free(*set);
++		*set = NULL;
++	}
+ 	free(buf);
+ 	return rc;
+ }
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 317efebcbf..09f8874bf2 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
-sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
+sha256  5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79  util-linux-2.40.4.tar.xz
 # License files, locally calculated
 sha256  27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d30c26deb5..64da9ab5d5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.40
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
