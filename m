Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9610ED0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70490822B7;
	Wed,  7 Jan 2026 17:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MG2GXlAHoq9N; Wed,  7 Jan 2026 17:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E89822B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808121;
	bh=ZfPUaZocT/1zrv0F59ipWlLR7bCgjSJiomV8owtcoQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JJs3FCkRvaSTwn9vxYiStjN1uGGv3vET6fPwzGZWHhYMr9kYs/+X4WCm/K2/+FYHi
	 uWQSud985guJkfw7QnOux5lhHm/3r9WKZOBAO/IQOWcwg8Q6CHNUY5Run3GWpmiNPO
	 Ln/nzAr5e0AlNu/1+aiUhLex9fCq4kMbr8whsPAn8MmGRGSyRKVUCOgXc0h/l3hhiV
	 UezB0aEAWu/EU0Y4nU9Z9QbHbZoW/awqWb2MQHY2UEdbF4AwI0IRjg02ZcZDJvc2Vs
	 AK2YgPBL41vq2VTWI/+rtPOlcHQlUwtf8K4jevKLiqxPy7tZMsbw3dvU1EO7FX5nJ0
	 cyk3SXDDKSfig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E89822B8;
	Wed,  7 Jan 2026 17:48:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74BBB25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C874A6083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4FwrswXkK7t for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5563A60891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5563A60891
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 552EF81917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 86215951ee3b359375d9d8733ed62177ff674bbc
X-Git-Newrev: 3f3185e0608c7848dcbae902a05858365ee48677
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.552EF81917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tinyxml: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f3185e0608c7848dcbae902a05858365ee48677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b8c58ae03f87e047c14585b16de19c66b8344c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 1 -
 .../tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch  | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1658005ef1..e5fe7400bd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1103,7 +1103,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
-package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
index ea0f6476c8..1da613c205 100644
--- a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -8,8 +8,8 @@ by two non-zero bytes. In case of malformed input (0xef should be
 the start byte of a three byte character) this leads to an infinite
 loop. (CVE-2021-42260)
 
-[Retrieved (and backported) from:
-https://sourceforge.net/p/tinyxml/git/merge-requests/1]
+CVE: CVE-2021-42260
+Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tinyxmlparser.cpp | 6 ++++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
