Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA0C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 20:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAA06077B;
	Tue, 11 Aug 2026 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mLFZe8i8DaM; Tue, 11 Aug 2026 20:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA2B606EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786478625;
	bh=S3N3pHYLecvHT9ZcQWpI+rGhfFQDhTJxaiwIcZJ/MYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K+aZARdKE5ovb5gOXpyGcvdnL3CwTrUK+Nw7iPAuQJOKjsLMqX3BU6rdHfAAgSrNX
	 JbXaThgzlqE84KD6UC5LbaUhXpz982+DHyZAkcqMKYVj0DAxuBzwSIV1qO+eldVNrJ
	 xlR5GL4pZGfhQua00Qlqy20GCHEF5U4IFCQsaKTo+xcNFibeXC2v6R33qcztNWq+j5
	 4XLqleV+fRxLgMPUZSoU49rbPT7u3Zf0slFv61jFz70/3O6oTInePekWtoj2NY6V/a
	 Knvf6fgrdxsZLbevnGwxn6LOnal/+px9KZHAOixgfL3/sZoVX4oRz8G0uEQW4xp3uf
	 GAIm+NDVMIEBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA2B606EB;
	Tue, 11 Aug 2026 20:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A7691B8
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3168D40182
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVgpM6YjOkkE for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706A140015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 706A140015
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:03:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBCF88D3E2; Tue, 11 Aug 2026 20:02:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 21:49:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6632b05900951d66750e888da353e98f44d89f80
X-Git-Newrev: 092abbe0352d62af8c17167e4f48e76aeea7ce99
X-Patchwork-Hint: ignore
Message-Id: <20260811200254.BBCF88D3E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: re-introduce IGNORE_CVES
 for CVE-2023-42366
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/092abbe0352d62af8c17167e4f48e76aeea7ce99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix patch number in comment (s/0008/0007/)]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 32a765c6a4..681624f6dd 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale, NVD entry mentions up to version 1.36.1.
+# 0007-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
