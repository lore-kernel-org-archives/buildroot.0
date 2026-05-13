Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF45CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633236156B;
	Fri, 15 May 2026 13:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7y9sptXSsgN; Fri, 15 May 2026 13:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AC661561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851722;
	bh=ur6K7DG1ED3OGHgLEUxhgYAMTbkHO9HZGf8tpQBDsag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rWe4goPGNwnwRIlKmcdbXQ2lL11qLttWWP8PbhNXWOzUNFxn1nB5wT7Y/n9XtSbsp
	 LkmhFG0dXnvYqUyHZsju4c5kjJ6yPrKduELcGad1+8/Vd1GuWpQ2BiYRGuCVqeM+Bt
	 ys/CRlJ57NQs29OEOaZ6zkp8qEf0hpUDdFpyT/Zg6uFWy0HrZd+3xg2iZaJiukDW4z
	 e50ez5+RyXmOUKxaWxR+FUfffHMjGJl/uehPNHKRlTKUq2V7E5szqMrDuWCYT0FbCD
	 /qaM0Ns2zWyAnVnB1/v9xZxPuPOLksvcKDarYPfbitRUNZov08HCMoq9vId8+tXhPF
	 aeRVilaRiC2lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AC661561;
	Fri, 15 May 2026 13:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0214D36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEB16155B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QEH9aIiwAZ9 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293456155D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293456155D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB0E86354; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ac354d5f3270accc5b84fea472d2eff38e50f49
X-Git-Newrev: 0fd2b111a2d05debace18b069b231436d828a6d5
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.7CB0E86354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Giulio
 Benetti to wireshark
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0fd2b111a2d05debace18b069b231436d828a6d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d230af8bba84bbff2615fbfe402a30e710c8f535)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f6bb93c1da..4569d03e2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,7 @@ F:	package/udisks/
 F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
+F:	package/wireshark/
 F:	package/zlib-ng/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
