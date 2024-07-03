Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE0FC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF7C41884;
	Wed,  3 Jul 2024 15:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7Shbkilfr8D; Wed,  3 Jul 2024 15:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E9041886
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E9041886;
	Wed,  3 Jul 2024 15:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D63511BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE6C084597
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT6mealhVsWb for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F9A284590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F9A284590
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F9A284590
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:57:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.8]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1sCzcZ0MZA-00x9PK; Wed, 03
 Jul 2024 17:57:43 +0200
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:57:28 +0200
Message-ID: <20240703155731.914910-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:2KCHfqPLxXZx96fTuBuq5HA/D1lmyDBIuV+Npi95W3epgQePxZF
 cE/0qvSL6VYsDMd5fqFcqEGmhff4rxCvNVCowJ5//yGQfxmj0NjKUyNXL4AkGiIHal6GgNN
 YbY8BVxbNA7d2iPAPQY/gw+ls5vcYQ4c2pCbYKPLTqquxOXuNwfYQeT9z4y4losKdQVtQ0X
 rN2sUWgFeTeWgDhUVPOew==
UI-OutboundReport: notjunk:1;M01:P0:6YPHwq6NK6w=;MLHLBkFTNTJpRcNh/ZxAdBvXjou
 z5XzEjzTwKWoMBxX9vqUv8rvAcpOJrMytzJHaeMdg3NUHrgcZRa8WiL3wMg+X4IzlrEsueT54
 /1Y4rkkiIPjQ9imw6wxxvKRneWxziuxzBCXm5bCNRZYixu4ShQvLmpdiwclRSiXALemSjUhDU
 sm25s5+m5WR4IKI08hFRWgggmwaibnJ/X5IwTfBC1VoXwGSHDv0wT/fp3Q9RamL3+HrnjO08N
 H2NAZV61SCIRWjZ5aRqNfHjD80T8E7ass2SahbuJZNVd1zdTnMEjtH5PcFo2qXYCCMHTN5Wn8
 UH5NosvCFP5TWH+EOYNFZIlPalXD7vHAibE2xhzO5O32HgKF6f/r6gsWCImdmFd/LqVkFq376
 16m/sZH5xNqv9xvTdx2rFe7V25H9LMbLoJAqUEBp8w8v0Rpxlcj+8BezK14gY/unyjsq9Jm9u
 QvSxgTi8w6qlonp5iiC/mvyqNKpH3lfauhOYLQ2U2WnlQObgbnC9hq5hW2jCcqwm1Z5wKO9e2
 4omCwC1S5HSNcH06MFRfNU7dnPoPClAIkRGin+D8Og1s4gXB9yc4Qn0bW3R2SY76A4O1BnN/2
 1qnF1tc80m+8/7B7BAGETtyd9V/uksymoPaYqeytghyrzxErz8I5pyZ8V4q3BgTtdxrHvEvBz
 Q24ivbaZyiclO1IsqyJ9p3bo+uBTSOLFEIRG5t4mCLtDpj8iMVK3xK2pd/BOkl7URREZHWVer
 fkqqaHzW8fUbgk9DnZ9i3tElk0wfq+GodRRPNjwmmBRcy79chSLdZAJocaJ/Sdm9xzVawAlmA
 kX2pZooKc+Ddb9FaFgyeCH0dDFYljgs9VB+Q9mhrt2A+E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720022263; x=1720627063; i=fiona.klute@gmx.de;
 bh=z8Xatqk8vD+QjZCFF0Emgjwm56sMldZ/iMzKtZdFchU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LxWSo4OERd2hNQ2gO/yLsZQrwYjnCifJ1iGPckhfEKRcL3EkN5T3zCthKxL+6Jxz
 tHJkXbXaks8KQJ8/2ZnkSKhQarxrh/ZKE0kBfCVu1oe7QMTKbTHnbYnVoI05oCcrk
 7pNpo1895nQuatRo3/UewJHQ8p/pg58qIraOrHBMWb7tWIYIIzZLwfcfYT174t4/G
 9Kq4rw3viPVTwz2A1DVoOAYQlkL11eLAB17xvaTcZU53qzHOgezCi3B470bKjQMDu
 I+WmPFbIbAIpHykFBtr4Md3WnHJxnCyaBoU3Cz0TJgfNDasbDvbC7sZo6E4dXGFuf
 gJ2sAD25wtA3UQdCGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LxWSo4OE
Subject: [Buildroot] [PATCH v3 0/3] Refactor OpenSSH init.d script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series is the result of running "/etc/init.d/S50sshd restart"
over an SSH connection and finding that not only it destroyed my SSH
session (this is no longer issue with OpenSSH 9.8), the SSH server
also did not come back up. The main issue there was the use of
"killall sshd" instead of stopping only the listening server (patch
1). I assume restarting the SSH server on a Buildroot-created system
is not a common use case, I need a reload to reset its state during
automated tests.

I took the opportunity to make some more improvements: manage sshd
using start-stop-daemon, including error checks (patch 1), style
cleanup (patch 2), and implementing "reload" using SIGHUP (patch 3).

The added checks for a currently running service before
start/stop/reload bring a slight change in behavior, there will be a
non-zero exit code when trying to start when sshd is already running,
or stop/reload when it's not. I consider this useful to find errors in
scripts instead of masking them, but I don't mind removing that if
it's considered a problem.

Changes v2 -> v3:
* Manage sshd using start-stop-daemon (patches 1, 3), making patch 4
  obsolete (dropped from the series).
* Set DAEMON variable, the complete series now removes all checkpatch
  warnings for the init script (patch 1).

Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message (patch 1)
* Check sshd exit code on service start (patch 4)

Fiona Klute (WIWA) (3):
  package/openssh: manage sshd using start-stop-daemon
  package/openssh: fix init script indentation
  package/openssh: implement "reload" using SIGHUP

 .checkpackageignore     |  1 -
 package/openssh/S50sshd | 64 +++++++++++++++++++++++++++++------------
 2 files changed, 45 insertions(+), 20 deletions(-)

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
