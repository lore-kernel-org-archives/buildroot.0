Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A86C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 10:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56800405F5;
	Thu,  4 Jul 2024 10:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwyJ9L6NZUl7; Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B107403D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B107403D6;
	Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8B151BF32E
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F92405F5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMVedgeCMT3O for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 10:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F41D540965
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41D540965
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F41D540965
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 10:17:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1sdqFj2KjN-00F7Rc; Thu, 04
 Jul 2024 12:16:58 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 12:16:28 +0200
Message-ID: <20240704101631.1860647-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:5aqHFvIHSaFlSRujcubQQqdmv2QEcFjYo9a34ROq2jUMkaMx6ws
 OXqh8og/9SkXFidQBN8usRLHKX04thWWw6nx90TCSJFTy79O3gfzsQOHXHpK73Sp4Ux+jGW
 r5B0H8Al+inVYoDXQrkanpsCnYLjoSfGKAxOec+5Glns64S2J9euLZ8FlZh/2DHlRUCCsS7
 j+AEJX+j15oeZXeV2HMww==
UI-OutboundReport: notjunk:1;M01:P0:/yooh9AFGkA=;YnKI9fwL13OYy0SFnm3UdtJQypP
 srgn7zsSmaPZ76czzuoTGGIUSz5On+hs3j/SgFjthS5sZiihXpZTFrhcZdzMxPJ6FhYLVc7uK
 T34z+Qa3IN1b60Jrz07rb4F3lLgxdfWyoa4eETQ5SBodKhbcj2FTGlqsdKoHUkxC6Re/BjC3s
 mrE3+P5YRSc3FXsNbQFrE/dUrIcrFDU3PAt/w+FoocS0ccsu40SktPJAsnPwVKPH++t7zC3G5
 u3Kfve9JfjIJ6nC3i27OEYnSyVq9Y6D0Uwc70O9UJDUzqzfqDgbWcfNeTeY+r8kaML0MJqN2k
 ljVACcWkDJNFhvn13C+j/+8xO9d10i4sR+pBntJ21WpjjvvOtEiK+7EYz1Ics/HNLAO9M76k4
 CGbMEobS6/KNw/8oq59EV99J/KcOnt8sbXGi+7XAHwSJs9Mp4nx4SsOqKCL5bKYLJzIzRA75W
 U8Q/kOraHs89UsjMebsJPycvgzrnzmD8B29adbPULddHnrAOVqaaEZL9OF6nwfU6/Vm21JOo0
 35Uk+xNI0uLe/KpMYNjDHTjMly0ztZp7vVTWnUDx247nIgvEZp/QLYrd/ovnQi9rOhhw2zNeX
 AlUx6L1aRVk9y4DPeqv2rhI7dQucAidl+3qcsP7H84/DVMFQKdbEMAfyL2m0NzZWg6WWhmYVX
 XuAfRBxR2rMAwUUYbr09aYSNNzPfVI6evZP3lapJbigWhKeAR+nx8+H+T3RpIIHK9z9cK5ZZG
 NPpGz7Sj2g9U2vgwnMZ2duVso1NYN74zc1ybjserv3/Tvo+ChWXhSfc0TqilSkD76ha0zsiq/
 P0mDh3jqyst49YvX5RTR/RMjv53ioEpS4/yGpsSbHIgQc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720088218; x=1720693018; i=fiona.klute@gmx.de;
 bh=7ne7kNc2aXwYajP2LV6nlDXba0HyqinfaadNLrOahzw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b4iSvOmPVezrVhz9f0WqPOHZdfzo/o1uWn954UU3xpY0995lzBBbVG+hP56Vgdo7
 tvj09IAMOjeOw1DSxwkVZd3/DeoF4/CERt8+SPIGaHSit6/GZUzTqtn6qmNvJJxWB
 8aEUDS1BzaegniEZLZOavIlq03NksFELd5i6nY3/JiVJeuFqlAlVpDWJIBXK+ZGSy
 pJiUZL6kxBXB19WV0Rbj9uVhD1ziALAySgpykCuTm1HQYsYRGoQ4XwsMT3LDXhJV9
 /3tXF3wRwFD36yLZal/JvlvZeZUATXUdDw7qIWykwb4RIVaB1tq+CgFFjEl1XS9Ke
 VqMnl2Il/JEDDD+9AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=b4iSvOmP
Subject: [Buildroot] [PATCH v4 0/3] Refactor OpenSSH init.d script
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

Changes v3 -> v4:
* Avoid start-stop-daemon --retry option, the Busybox implementation
  silently ignores it.

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
 package/openssh/S50sshd | 65 +++++++++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 19 deletions(-)

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
