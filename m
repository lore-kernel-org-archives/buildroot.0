Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26836CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF2E615C0;
	Fri, 15 May 2026 13:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3wfqJ9RObfS; Fri, 15 May 2026 13:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE1B661575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851745;
	bh=LUUfThcOiY4hGJld8WtTZgwCs50ydyFfghU+yrHa5Ps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=chXUvfjzy8KaPGzlNEBXykrfYJUvaPXtPOtitJV5zk+gc51hISMn97IicbU9YaXPQ
	 sl8WM/Zdoscv3OnK5ccWLjP9oAnjZKNj0R9ctKu9B3o9JzlvL1gKU56SJew1ubUfxI
	 DL0Z8/Vmw2mGuIejkFxo729AEfXniR4P7Yh6ex+z2+qTwPocN1nBL0vsTnsRdS4QEW
	 1Tyn9hAlMdkCkOZzwRBTfwXcSsboftBCD2qDLmPP9MlhtHe3gPradaieXeWRiVRtFM
	 AwqrN0bugm6PMB6rBZXloZ+CJaSa/JfOKRbsEMJ3W6y6ias/zO//9p8Kqc7NtNgERu
	 /Be4pvlNH33TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1B661575;
	Fri, 15 May 2026 13:29:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 130D436E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33BC26155E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoEi6m1OQ1gs for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DBF46155C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DBF46155C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70BC08634F; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:56:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7e63acb7783c2c3d499dcf2c347f23ffd01400a
X-Git-Newrev: 3ac354d5f3270accc5b84fea472d2eff38e50f49
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.70BC08634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/thrift: security
 bump version to 0.23.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ac354d5f3270accc5b84fea472d2eff38e50f49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/apache/thrift/blob/v0.23.0/CHANGES.md

Fixes the following CVEs:

CVE-2026-41636: https://seclists.org/oss-sec/2026/q2/236
CVE-2026-41607: https://seclists.org/oss-sec/2026/q2/237
CVE-2026-41606: https://seclists.org/oss-sec/2026/q2/238
CVE-2026-41605: https://seclists.org/oss-sec/2026/q2/239
CVE-2026-41604: https://seclists.org/oss-sec/2026/q2/240
CVE-2026-41602: https://seclists.org/oss-sec/2026/q2/241
CVE-2026-41603: https://seclists.org/oss-sec/2026/q2/242
CVE-2025-48431: https://seclists.org/oss-sec/2026/q2/243

This commit also adds "Public Domain" in THRIFT_LICENSE, after
upstream commit [1] added a new sha256 implementation with that
license. The LICENSE file hash is also updated accordingly.

[1] https://github.com/apache/thrift/commit/1e5fa4b9b35ad6bfeb238d19897ace7826eda057

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6935bc74121967ab6a01950d55c3bb9a14f0f833)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/thrift/thrift.hash | 6 +++---
 package/thrift/thrift.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index a517900c82..406c65fd25 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
-sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
+# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
+sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
 # License files, locally calculated
-sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
+sha256  89aa7b27868669299bd8a6c53b72ec4beadce42dad6c8336797cc26e1e8df98d  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 177b75903b..34f4671239 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.22.0
+THRIFT_VERSION = 0.23.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
-THRIFT_LICENSE = Apache-2.0
+THRIFT_LICENSE = Apache-2.0, Public Domain (sha256.h)
 THRIFT_LICENSE_FILES = LICENSE
 THRIFT_CPE_ID_VENDOR = apache
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
