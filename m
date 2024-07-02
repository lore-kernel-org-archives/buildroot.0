Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53BEC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704724148A;
	Tue,  2 Jul 2024 16:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gsw4Z4mLb6jR; Tue,  2 Jul 2024 16:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F27E410E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F27E410E4;
	Tue,  2 Jul 2024 16:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 415781BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4A160645
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37DvlxiYjvFz for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D58F260627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58F260627
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D58F260627
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:57:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lcJ-1sPW1q2qTz-002PFI; Tue, 02
 Jul 2024 18:57:13 +0200
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:57:04 +0200
Message-ID: <20240702165708.3796162-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:iveleYTTm/2WdBaEYvBOwjX6IlEjPeGrM3H2lLszHgoyz6NRJrv
 9dUZlExRejHUsmy7jiNM+A6WM3vZ+Qsrry1ReuALeB3dAME20VARcNmM0kRZY9KvbmUiLN4
 XX4Nl7yX4mBRBf1E9bQf4HKhhOK5LT8L9UVMDJYWVjNbr4mMtCvbORtHjpXogF1J/t7pJPQ
 Pj3tFOlp8AcJ1Yx/NlKRA==
UI-OutboundReport: notjunk:1;M01:P0:eN5O66UPbOE=;AN4sTfXPeFmL0/HLM4rAbLU+XHT
 d6j0bJZFW//ftzVVItIgoUfOr17T6lUQD6ph/ahDlCHlOJEIJ2cHN4FQIUwRxyhDN1QM/jpN+
 l97Eo9ykii6OgZLRHlsYbnTBA9qpiaYrlcMmNhqTHvjZ4UGcTQ00Owj9r3GetsH0hldcssVPp
 eFLmyfOmgXSWXbYUJxev8vnYudSQBHjDQc7ucLoGJ+e2nCu7TojQv2MZIjgdROSvjKo4GvqiD
 6qLQng0CySQ6lLVZoZ4oh24S4P/08NQEv3hECcP+rGDk0JN17FUzTGzHd9El9xdBK/wEdxMR4
 AKvOsOQpx5XvVWqdmABV0zTK87LD1NUOLA6AnnRAJI3e73fNSj86DTHFFoGpJUpQgSE/VJxjM
 rDSM+X9qBpDft011zkl2TS9g2mS//OfXszJW3FF1oLJQbEsNU76HUb6FdMJPA0TDFlWE1xxRY
 blpynww4ZYeQZ5TFBgCgJhBpfPUMjZLHSE9DA29YFMVwocVHiifZDF1/7gnAr29RJ4WH0d742
 z2AkUPr0bWFuH1WMmEu5uHGb5hW56yI7nQPwJ7sGO2Iifvs1+nJZf8VC7RW8sUNXTIa9Ov8j1
 OK5XJKp41AGvtORPgkbG6kOIPPVNkr1xFvZ3YB75FD1DOFCbGo50MQhL9UWRHmad1+Fx/BRfn
 3kaFdB9U4nmZGnAbjoX5ajmAC2pJOmgHhMBO0o3A40ia2RFc3sjyyeEyD+svUsdia8i9bGDlK
 kyl+zXkG12Cf81O/tYxV0THjYZPJQb0D++31BtXhtso8g7Y54Il/RNUu4Qca+zgd51BXeHiS/
 FzJ7uqVhek1gD+wGeNG1h72kBSIkG8qrSU30QgUhPZVCY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719939433; x=1720544233; i=fiona.klute@gmx.de;
 bh=S8G+r+7iqTESq0K7/VDU4DyVHo75dWoeZ5/w385NaH0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pZFyr5v0CBpsRlDyfZG6ZGMneagzR0ats9zdpOpuvqCEjeU+aN/phnunSuWWgtzc
 13mguYAEBWqyj6gtvbEWGRx8xFyL0fNRlLnbxRaGmX1OObbax9lC8OPSmWZB15GBK
 hY42jU+vnkLoDcqyeaN27yXkedTWeflcdrt8afB2gdJ5g7coxEjLe0c9c7RkAdsJz
 AdCQOM+BIDqHpepRTdHztPetGUZZcIPJuVN0XVYALGFpfG/SfAHYE5dDLOq8OI5dz
 XVgkjoIejT2Oms95omnE1vtmkKM9Pnp1ai3kK+Few4sY8hjhWZFfyZg72kUiPZ/dF
 +3znkLVviCuxZsrLKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pZFyr5v0
Subject: [Buildroot] [PATCH v2 0/4] Refactor OpenSSH init.d script
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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

I took the opportunity to make some more improvements: style cleanup
(patch 2), implementing "reload" using SIGHUP (patch 3), and checking
for errors during service start (patch 4).

The added checks for a currently running service before start/stop is
a slight change in behavior, there will be a non-zero exit code when
trying to start when sshd is already running, or stop when it's not. I
consider this useful to find errors in scripts instead of masking
them, but I don't mind removing that if it's considered a problem.

It'd be easy enough to remove the checkpatch error about
DAEMON/PIDFILE variables, too, but I'm not sure if that would make
sense: While the PIDFILE matches the required pattern it's not set by
the init script, it's the sshd default.

Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message (patch 1)
* Check sshd exit code on service start (patch 4)

Fiona Klute (WIWA) (4):
  package/openssh: don't kill open sessions on restart
  package/openssh: fix init script indentation
  package/openssh: implement "reload" using SIGHUP
  package/openssh: check error conditions on "start"

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 69 ++++++++++++++++++++++++++++++-----------
 2 files changed, 52 insertions(+), 19 deletions(-)

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
