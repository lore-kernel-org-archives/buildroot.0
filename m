Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAF6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA33661872
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA33661872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A366401D2;
	Mon, 15 Nov 2021 16:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hsXFdMjx832; Mon, 15 Nov 2021 16:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BFBC40186;
	Mon, 15 Nov 2021 16:42:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF3251BF574
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A732E401D7
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KHcLjNKhytB for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 16:42:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9567401D2
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C01B48D372; Mon, 15 Nov 2021 16:38:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 17:40:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e83706aa1a02e9ba294796ba52f7bebee909ad7
X-Git-Newrev: 5f92c032369e6794f4ba97ef0d11dd521c713c44
X-Patchwork-Hint: ignore
Message-Id: <20211115163820.C01B48D372@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: remove spurious vim
 swap
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f92c032369e6794f4ba97ef0d11dd521c713c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 70440e28c8ee (package/python-pudb: bump to version 2021.1)
incorrectly included a vim swap file. Remove it.

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pudb/.Config.in.swp | Bin 1024 -> 0 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/python-pudb/.Config.in.swp b/package/python-pudb/.Config.in.swp
deleted file mode 100644
index eb0c0ba873..0000000000
Binary files a/package/python-pudb/.Config.in.swp and /dev/null differ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
