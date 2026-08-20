Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2697DC5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA5E812FE;
	Fri, 21 Aug 2026 15:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_DFecB3mp1H; Fri, 21 Aug 2026 15:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325082;
	bh=oHYlrLRbqa8snHN+r4HhCwxIKDVYT6l2/Pw9D9UTfbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PbwhAf170YwrmxjiDlxcDaarpXVTsx4SmVKgfvDY5u1pNj1Xh/3jMJZmK+krFpLh9
	 8MLW44mRVVfQeGrHl6+MEtboD7O41OkYQs6Q2WeTIIJInib92vJIsrZs8cGT23xREF
	 HbaYTZVaQPgO5o/9nYDYtwcAdJ5/beGIcn2+1FRDJukJ/6ubcq+xYjjNfnAJZWQtxe
	 TZQI5IHuU2dA1NImTtgzDZyC5RFN9kAoO9DzvwEUn7/DYN6BO6dOiQA+cqNBz40ap5
	 /WOgk7usTz5lLVQYFNQt7WCJ0/ssX/AM+Hec4PzV4GvdluOvJVB/zM4CKX/yn5/BGP
	 kDUuniIFbcPww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC28812D4;
	Fri, 21 Aug 2026 15:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48EBB1F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B75A81140
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytkYNio-z-kD for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B1E8110C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE1BD8E127; Fri, 21 Aug 2026 15:10:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 10:57:28 +0200
Subject: [git commit branch/2026.05.x] DEVELOPERS: add Alexis Lothoré for libldns and python_scp tests
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 31bdf1643d9e4aad864451f3b366f306e418fb6c
X-Git-Newrev: 6b8e25393a538f329684a300ad7442bbdea2edf7
X-Patchwork-Hint: ignore
Message-Id: <20260821151015.EE1BD8E127@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4405743043386532478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4405743043386532478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b8e25393a538f329684a300ad7442bbdea2edf7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

When adding the libldns and python_scp, the corresponding tests were not
added to DEVELOPERS, preventing correct notifications in case of tests
failures.

Add the missing entries to enable proper author notifications in case of
failing tests.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1209f3f7a1daf68cdf1846af9a014d769d1e0a68)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d3f3c8f9d..e114be1677 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,6 +158,8 @@ N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
 F:	package/libxmlsec1/
 F:	package/openscap/
 F: 	package/python-scp/
+F:	support/testing/tests/package/test_libldns.py
+F:	support/testing/tests/package/test_python_scp.py
 
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/

--===============4405743043386532478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4405743043386532478==--
