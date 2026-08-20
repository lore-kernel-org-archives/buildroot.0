Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334CC5DF96
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 310A8811B4;
	Fri, 21 Aug 2026 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqEfKWszG5_o; Fri, 21 Aug 2026 15:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325086;
	bh=wlv0ZzTR7pEeUyJXF2oc9X5NzpxChRHZnisTLLTLrmU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TV2TVwjKMosgOCI8CbgenGMAsK+3eX7i0UTXPzcRo27p1WIYqcGzrdmlgpI02L+1h
	 kdSLhlPNMc5BLLxmZsr2mtBccEDIbzdaInzNayx8orh9nIkfFDbm9TpxkR0bwkN73s
	 +wowWyh3nYY+/H3B1/mPGpm3bryFV7QslfE3sMu0+X6GUaKAfq8v0u5g8agMklezQ4
	 HMT41Yuprl8gDKti/c48JcXP1XYHYMRpRiDYWoAmsbkz5EX/7Tl64kkrbvYeuhR+jv
	 h5yNqb8e78TpADUyAMUxc3BpfBsNtoaNczmhZl6fWl2+ZInL4nlMDMp7V6NxLofC76
	 Jd/zEszwPSYGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C968135C;
	Fri, 21 Aug 2026 15:11:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 654881CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E0B6063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QiKOVmcb1GU for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4051606A6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 168F68E127; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 11:33:46 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 579c1048c3d6b8ed507cda818153afbd513dfcb8
X-Git-Newrev: a5712d326c5b8b0f983db8d4c9cb43b8459552ed
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.168F68E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/busybox:
 re-introduce IGNORE_CVES for CVE-2023-42366
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5712d326c5b8b0f983db8d4c9cb43b8459552ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix patch number in comment (s/0008/0007/)]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 092abbe0352d62af8c17167e4f48e76aeea7ce99)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
