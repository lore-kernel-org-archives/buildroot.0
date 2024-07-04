Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D42C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F66405AD;
	Thu,  4 Jul 2024 12:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBBaK8Vx4XHl; Thu,  4 Jul 2024 12:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E6E640510
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E6E640510;
	Thu,  4 Jul 2024 12:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9CF21BF2C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D53E780EA7
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9FwMbTkM33e for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33C4E80EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C4E80EDA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C4E80EDA
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:14:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1rrfHt2gKQ-00cc20; Thu, 04
 Jul 2024 14:14:03 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 14:13:48 +0200
Message-ID: <20240704121352.1915154-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:gOgZ3V3/XxC96GaKWW27Uz/L8Nna/BGvbvJM9sgMEo8DKgL9lNE
 +QB8RA9A8J0XLPpWP0e1X1idNWzefKsUqIdd3gwzyIbo4diU7+rU4oOybztYEqtwaBevhuy
 akDvlAvubkyX6TNwaajszVuGbSUU+wqnirOgZniO4lPlUBOLXmfmxFre8Xu9OcEiGrtmP/j
 MVAB0V0nvN2qRGJgr2Mjg==
UI-OutboundReport: notjunk:1;M01:P0:y7c4B8ufjFw=;WAX27WEQILQcUJgz5vubTEuqvIS
 av99/MLCqexYlKzXeGfELqre2XDhao33X2mMKQQNJZC36gOUbbbt0RJ/1URSs5kS02T4Yg64D
 0rplIKNZdsZEj4wdK/Jr8NIAdL01CNMWN6Go7nbrkWZByuCtgVcj4HLJ5sJTN1CU6em5GOBLN
 nzS9kLcXwgqo4CZXfve1RVEfVsVyKxf6I8OW628ldSbJ7Ai5iS/IwYusVRZrVaU1Kff4b+HwT
 YIGtg5edSa3jUHzwhdlbAYOmXD3TRznALQwVzKz4DHkiTKpTen1hVafaSChuloe50rDMA8YjI
 5a3vSi+ibcvkVCD/7pYThWi4clvs/IAEbJjn/zWcCEHCGNjnGRvm1qVkTODB64scsMEG8oIBU
 BDpLyyjZf73ySszhHrXa051vvV6lgIbhUg9WRC0i7CK4ZznKPHgbR7fjY8yGuo2rKvkWYH1HH
 XPy4BU6iY2QZr1xXT0LpdfLXBgjw4mCzcwL6Hdy5LOp2nj6UTUJfYir638aFgvgQCZ9HsRm9E
 4Jj/gfGOtEvlsD4f/TkD0dGJe44xcokxr1aayRq+H0I34RPVolR/oDsdPhQ0lwznbr3U5a0GL
 HfpJVVydrUNZUXpU5ftG+mIRa83BrJKPqygSvcnAWcBph11v6zi3OA0UpVoRsOlBIMdl2Cgjb
 2k1PvHPZsoh0a+oHJPb8CefP9ptD2cQZbyU43Q8CVgLu4yC1rG1rjnTBj2sAGu7XncD8cJExv
 3Ny7xcxunf1PHDCK9HGfp5pWZCSNmWwDn+Zgg+zUeI14ss4XH5+wrNkVe6Akn777P3wZFnfKz
 wsEVGxc+AmnKnNiRYAFzriLsD+fZpb6Rl7Nl73dXQRpeg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720095243; x=1720700043; i=fiona.klute@gmx.de;
 bh=YVkEEH3uJCGiehWCKvrXCLZVx77z6StbZFgtvR9tpvM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rMLmmc7OlGVjuJ//VVbJXm4lj7h46N3M9+GI+2oDuUfFlyq2Bw1V1rhkzHrzR7Ct
 kbCt8AiCUYPOESZb77e62NpJatftglzUGOv2sQP1sL8QJFkqWTDw7Tc/SJlmjDXfW
 BAV4L/4QAT9kWwl5amdJk7zXhg3W17vqBbpicI1iw1kl2U8YUlRKoOetvhfOjghuJ
 32jXSRDmRm5+bGNylDkp9L3rtGVaY7P/QWpwKXgT4kanAY9D+yMhEMWyG943oIS67
 JJj8n0t/nmkXwpaseyysRT6SNzKXTzWsjznULQr0d3Ld1+eWkQ2PUbcbSJjNsUxZx
 MxsTOW/PEgSV5LsKQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rMLmmc7O
Subject: [Buildroot] [PATCH v2 0/4] Update fail2ban to 1.1.0,
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
 package/fail2ban/fail2ban.mk                  | 15 ++++++------
 package/python-pyasynchat/Config.in           | 11 +++++++++
 .../python-pyasynchat/python-pyasynchat.hash  |  5 ++++
 .../python-pyasynchat/python-pyasynchat.mk    | 15 ++++++++++++
 package/python-pyasyncore/Config.in           | 10 ++++++++
 .../python-pyasyncore/python-pyasyncore.hash  |  5 ++++
 .../python-pyasyncore/python-pyasyncore.mk    | 14 +++++++++++
 12 files changed, 120 insertions(+), 8 deletions(-)
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
