Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379EC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDEF340CE7;
	Tue,  9 Jul 2024 10:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4FRQ-R6Bkca; Tue,  9 Jul 2024 10:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A435640711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A435640711;
	Tue,  9 Jul 2024 10:19:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1DA61BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F98E6084A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfG2ZtdplDxD for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE91360661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE91360661
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE91360661
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:18:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1sLbgY3vLJ-00v9mQ; Tue, 09
 Jul 2024 12:18:56 +0200
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 12:18:37 +0200
Message-ID: <20240709101841.1145134-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:mFDXDwgKe9AzYKdBU3lEFfJsGEHXumu8PDWv4jt779UB4R5Qch9
 1cDsryGWAFaHATwsMSTZdQ4gCut6gpjuZt/0S4VDj9zNCUfanxhKgPqoV8LmgIKTXbtjA6G
 TK679ut1nR0EVNeEE/ldBFFoa6hyWTb/Lsy7OfzmBnXike3JEBMnQbCuYNXGlB40VWTFy13
 lQDtzJOGO4AWd3+/SXLsg==
UI-OutboundReport: notjunk:1;M01:P0:4q3MAJpqzuE=;lRkaf2aaia2nBePklW0GPPc3Slj
 yZK0mGlMur9lhcCaILwBt2aCW8L31OTP667JzVRX83f/9UrnUuEUDKMgyij+CxeMapEPIfKBa
 A7L/R1STvnSvfpdard+pnVYIfGpxr+PFPiyLYYuAIhZLrGtXruucJ2XIrtBMZnIyO7D6n0wrw
 XAmdmXbSkSSi1oKfSTfjKNDlftXjzbxpb811Ii3gxgy4jOVGJxR2SLPjAaSqHq/ukxmJQK8BJ
 QGtteDIPazBN8gkEZ0fDBmccNd4oohy79EKOt76jvn59IsSf0vlpty43QhiY7X4gi+NZCmAb4
 Zg0EB6KUf0UPlq/S29WBeKnRRPrViXJVyOFWhFT3cCycZjBNZVgqdimYGk0z31IFUDpXF2Rfz
 LfaVu6EiM8w6gbDOhVvVDxOSK7Bv9lthH82XsMPOGLdl867nuzcPrCCyawsJUtJXAvsK21wTN
 b9vl11Qcg67PBbin39OJuGXiPL3KU8ezec/DTZ5qUlZ25md0keSRxC+epf+ts4i/83XnUwUX1
 acper9zn1aew8btnIJ0c7fHTMFXLsaROBlTYba41LYrd75//3phIwq4o/BoBmvs7FcQ/bnOHM
 vsjId7O8rGNwjw/4L2VPp441pzBaIuBwr0zRspVQL5sy81DnvV5brlPJjfZHmMdIg37X/n/8u
 PwsqfBVpJ1ULag2ZcEfuwsOFBJbXCaXqYZhhGQl1i6F1Qh3MM0CBTpA/mP/ApSWuBZY5wSKit
 Rfmek8GsfcO04s1ZmF92VFV+nT97naztVt1gHWPAdfzIp+irK/Gus9Q0wYpSd3At3c68SB6vN
 h8AYkv6MRT7z7YNCWSDYWczXgGtGYzT5uqhoLuOhjgG+Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520336; x=1721125136; i=fiona.klute@gmx.de;
 bh=E5kfK1rZvNRtZoELiJNwY1egK1xuffEELXBNZlSvqmY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Q4kCrpWvUB/obU6e9gU5HkE1Z6CuB1HyswoQEkgRXpU3akxNqtOG+HSTlGkqjHuJ
 Q97GVzDsDKLUdTMpvUtXktASGCOZkd4fSKAJgebwHAKBYZcXe+PwNPyWNApS+4I90
 bBtL/Mxeek4rpE8JFzgiPbE/niBm14wNAfOrit5tBLS78ceKdySdESoCyN1qdY/20
 srjf89fE8TeMy+cgush6tuIGD8kvrFFFOhE+u5s9pYHv8dXy/xYQpOnExWrvEEjtL
 95Jnr3tRJzk7X6bIU+A34R+mUjXMNc6IvR2FbiWFTf2jcQMkJ6XvZ4cYBYwGBAGpp
 qeKXi6wgsh/2cB3Z5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Q4kCrpWv
Subject: [Buildroot] [PATCH v3 0/4] Update fail2ban to 1.1.0,
 add dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This patch series (unfortunately still not merged) by Angelo
Compagnucci fixed the fail2ban 1.0.2 build:
https://patchwork.ozlabs.org/project/buildroot/list/?series=403756

However it broke again with Python 3.12 due to incompatibilities in
upstream code. The 1.1.0 release fixes those, unfortunately it still
requires ported asyncore and asynchat modules. This series builds on
Angelo's (must be merged after) and updates fail2ban to 1.1.0 after
adding the required compatibility packages.

I hope the combined fixes (Angelo's and mine) can be merged soon. The
fail2ban build has been broken at least since April,
http://autobuild.buildroot.net/results/470/4709367a39a8ceb41b58454fc9638441a40624e0//
is the oldest example I can find in the autobuild output. I could add
a Fixes tag, but I'm not sure if that'd be appropriate here because
it's only correct when combined with Angelo's patches.

Changes v2 -> v3:
* Add "# runtime" comment for pyasynchat dependency, drop
  FAIL2BAN_DEPENDENCIES in fail2ban.mk

Changes v1 -> v2:
* Add patch 4 to fix the sshd filter with OpenSSH 9.8

Fiona Klute (WIWA) (4):
  package/python-pyasyncore: new package
  package/python-pyasynchat: new package
  package/fail2ban: bump version to 1.1.0
  package/fail2ban: fix sshd filter with OpenSSH 9.8

 package/Config.in                             |  2 ++
 ...lter-for-openssh-9.8-new-daemon-name.patch | 24 +++++++++++++++++++
 ...shd.conf-ungroup-unneeded-for-daemon.patch | 24 +++++++++++++++++++
 package/fail2ban/Config.in                    |  1 +
 package/fail2ban/fail2ban.hash                |  2 +-
 package/fail2ban/fail2ban.mk                  | 14 +++++------
 package/python-pyasynchat/Config.in           | 11 +++++++++
 .../python-pyasynchat/python-pyasynchat.hash  |  5 ++++
 .../python-pyasynchat/python-pyasynchat.mk    | 15 ++++++++++++
 package/python-pyasyncore/Config.in           | 10 ++++++++
 .../python-pyasyncore/python-pyasyncore.hash  |  5 ++++
 .../python-pyasyncore/python-pyasyncore.mk    | 14 +++++++++++
 12 files changed, 119 insertions(+), 8 deletions(-)
 create mode 100644 package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
 create mode 100644 package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
 create mode 100644 package/python-pyasynchat/Config.in
 create mode 100644 package/python-pyasynchat/python-pyasynchat.hash
 create mode 100644 package/python-pyasynchat/python-pyasynchat.mk
 create mode 100644 package/python-pyasyncore/Config.in
 create mode 100644 package/python-pyasyncore/python-pyasyncore.hash
 create mode 100644 package/python-pyasyncore/python-pyasyncore.mk

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
