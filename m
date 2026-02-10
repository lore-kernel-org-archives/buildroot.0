Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9BAEA3F18
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 22:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CB941161;
	Tue, 10 Feb 2026 22:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfSnqDJrdIT1; Tue, 10 Feb 2026 22:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3CE40ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770763845;
	bh=AAETQYjHuw7/Os5ssQpPdi6JkdqdY40ltgDnAYonM/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oIO4MDTd33V6xlmlTB4k6NJ2AcunADObyucj7x77Z+4obaUHKUozPVwcfnpezKMhp
	 ZZuBTPbGJoJaKZAAihSZtZr6WlQO9dwVGdY10gRt2IPP1s5EQicdCAik66un2HMJBq
	 lfxmATeY46Cuqdq3HOPJp/+Rg3rXvBgKMkgXo56ietQ3TL59P8MWikmSWPl3Hv6Wzg
	 NbcU6aV0FrsfVNmOn9s7QtNGl/DLsEMk0CwSexNXSjgQujQ7qTgSsvdtLja1SLB9Rq
	 3Ph+NoYbKWIf1Mt52VXxzlTMoHuQZfRqR8ZbPYb9Vuumoaqs9/KZgFoSkILSBglt7B
	 UFc7ZajyV9rBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3CE40ABE;
	Tue, 10 Feb 2026 22:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 888F3341
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D12660B89
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSYPEUTcaivo for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FA160886
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41FA160886
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1414C86BD1; Tue, 10 Feb 2026 22:50:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 23:49:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555
X-Git-Newrev: d8e3c0513230c1ea7210b000f210bf9ac59c4a5f
X-Patchwork-Hint: ignore
Message-Id: <20260210225042.1414C86BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add missing final slash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0535870365923827826=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0535870365923827826==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8e3c0513230c1ea7210b000f210bf9ac59c4a5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes: 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a ("package/python-scp: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63744f3f14..6478cdad0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -156,7 +156,7 @@ F:	package/zabbix/
 
 N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
 F:	package/libxmlsec1/
-F: 	package/python-scp
+F: 	package/python-scp/
 
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/

--===============0535870365923827826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0535870365923827826==--
