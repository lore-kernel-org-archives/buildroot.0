Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A16C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B8F4048F;
	Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IrZFWFO8ikl; Wed, 12 Jun 2024 18:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7506D40469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7506D40469;
	Wed, 12 Jun 2024 18:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 503B71BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C94740469
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWxAhqdOWFiu for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DDFE403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDFE403D8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DDFE403D8
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:32:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1sjLT71jra-00i4O6; Wed, 12
 Jun 2024 20:31:59 +0200
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 20:31:31 +0200
Message-ID: <20240612183136.2145705-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:l6CD8DtCWcYpiylN9FuIRiJW0baC7n4zOxijmXZ0ZdJf16vP69n
 QvyCEZqf0bMe4RKUG+4Bhjg7XuZXUTX7jlq2BPa02Ad0eaDILWxwZE2Pf7dUQ75882nrIkf
 3ZkcxVd1pNK9AlTgQ3TxBAM4OH4cpkWmDw69XKkdZ+G7Ksw291sApx7UKmZnTPrd+1Aw+es
 pP5bsKvh9mLGU68njnRbA==
UI-OutboundReport: notjunk:1;M01:P0:PMcWmm538RA=;nzT0uiOD7+8JWVGtFySCjmFewyw
 0YFH79Md1MAIRwvaks7dvrT8iD1qoG7CbOlRf5FRjWVh/tAXC0V3glW6sAw+Bg2EIhm3Yxcyv
 kDlcVqqal8MbsP/CSAE72DQHUqh9reExrRcyT9E3BhEEyPHGB7ydnrBACw8lAn2Zttl6v+aVV
 jvPrAXG0CrnJYGdi1BFvtXQF16imAJ70gKtLQ3ho2LuGUjWCM6pb6FeqsvOZEZpAM+vyQIBZb
 GbHydwMWxsHGM9N9Mzkv329TzR2EuYLMlk+jVi/H6k0D8TC/Hmb6RMSkZ+yDS291wuBBo4rx5
 plb2cSVZpseMAubtUyzSYRSGKsW/aczx5cZCWKpuECa30Pc6JVZU7SGLA2OXSzG3ekOJCavti
 ut9q434vs9E0s+o06NaJx1RTFJULjIrP+YNjEjYAcwsHOTgMlMJbXycht+ZCZ5aSQrwYv/W9n
 6yUxNwmTDfPVQLL6naNVr8XtY/l0KB3c3VOWw3x+3qzIs3008j9+LeuR1eFLs0X7VLrdQo/E1
 knTPS/fDh6PZnmpGmK3RBjDKscb+jsCQ7racVehuEadQdO5X0t9pyZRis9Q7n7q8Abo5rZjCC
 85/Co5gYw8xv3SCJe0npBvR2j1Lrjok2RrJD2Je2DL7tl5EOtRwhzDJFRwRqI+KGdCMooGUGy
 EijOI6JNhXz+058JiSXRFvXNOhXhlw9irR862dzwDg2BmZeM/EccP+beAJOKtyDDHKaEhnmjB
 HkOmgQb9NRq2n66wM6b1S9aOhqy9JeQ4h+BiK0B1X+OvfoBJXQ7qMnZMYoif9NVJVcrEfX+5c
 OmT7mVD049t/RfOvl0QtQbhCfPMUf4oCqJ6+by3Pgsa9Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718217119; x=1718821919; i=fiona.klute@gmx.de;
 bh=ypFoWbtgcHUXgjzcdqRmBbtp5WVwiJJGWnu9MPvFP64=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
 message-id:mime-version:reply-to:subject:to;
 b=rchOAvViIKJqPMpjLYqlsnSy057erkYlGWi5hIPOSdLMtloV53MSHcnlcwlxyePh
 rmMJ4/lo+EGNEgjP856shLEYIyqmSfJqyndRzbW5PryqPnX5DM/zPpA66Jc+MJ8u1
 FSo41vFkZnJyQTew8076XgGLrUrduMK7q/W+STS5R1a6ay3zQmqPddyf56lB8c01C
 vsSse8sMdeuxIFbElonuaoBOZsadwNL0JRNlPRxUXoMXyXdsksfnZfInW9GSyzj5Z
 gVEze4NdJUtoSgsMyFftuTS17wVMuzpXjfwpfsaTemOEwvWn94wRLBriFmdzLxTux
 O2kpBWY+5wRqwC0AuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rchOAvVi
Subject: [Buildroot] [PATCH 0/4] Refactor OpenSSH init.d script
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is the result of running "/etc/init.d/S50sshd restart"
over an SSH connection and finding that not only it destroyed my SSH
session, the SSH server also did not come back up. The main issue
there was the use of "killall sshd" instead of stopping only the
listening server (patch 1). I assume restarting the SSH server on a
Buildroot-created system is not a common use case, I need a reload to
reset its state during automated tests.

I took the opportunity to make some more improvements: style cleanup
(patch 2), implementing "reload" using SIGHUP (patch 3), and checking
for a running instance before starting a new one (patch 4).

The added checks for a currently running service before start/stop is
a slight change in behavior, there will be a non-zero exit code when
trying to start when sshd is already running, or stop when it's not. I
consider this useful to find errors in scripts instead of masking
them, but I don't mind removing that if it's considered a problem.

It'd be easy enough to remove the checkpatch error about
DAEMON/PIDFILE variables, too, but I'm not sure if that would make
sense: While the PIDFILE matches the required pattern it's not set by
the init script, it's the sshd default.

Fiona Klute (4):
  package/openssh: don't kill open sessions on restart
  package/openssh: fix init script indentation
  package/openssh: implement "reload" using SIGHUP
  package/openssh: check running instance on "start"

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 61 ++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 17 deletions(-)

--
2.45.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
