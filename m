Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B133C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AFC840B5B;
	Fri, 12 Jul 2024 09:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoO8Gr0TRnwU; Fri, 12 Jul 2024 09:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA8E9417ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA8E9417ED;
	Fri, 12 Jul 2024 09:47:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF8CF1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE3260654
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sc5LRcoZ3lGY for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7A1660643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A1660643
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7A1660643
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1safkM2cmN-006wrv; Fri, 12
 Jul 2024 11:47:45 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:11 +0200
Message-ID: <20240712094717.2539892-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:TRKb844rlceHcizdrBHYN2QOzipBkBQLp4A1tsXW8iAWZQsN5N2
 /zDcXMwkC+oQeY4ntNy/HB3YVk984/L4TJhuwtdRhjYIbw562A+Y4mPWa91FGuXY8I2vhkZ
 XZRxbjhN4d5tsyabR1sGBJchchTwkduRSWJ3gGXpNDtQL0pe3UbIOcaET5ZrGhE9UIfy55D
 q6qoGrauyi6ZJ4j/YJimQ==
UI-OutboundReport: notjunk:1;M01:P0:ogujG1fD73w=;d4+2Aw1mbF5JPG8k8bpZ1LGz7FK
 P3P0g5oHcQRpPf2wrc7IvwQu33pneh3IRs5bVPB3DuGBlBqcaxw/hEufJEqaJav4XMd3g3AiX
 uENOdmQ/qzHzqnL9Ld/Zx6MAxD26mqsr5p68jSBQVyBD95GYMtj7dyNOaDoqkMA8CmL+cKwgA
 HYlB8LWswR/zOPacWZw3Mn5cuy34kzjIsqJ8OOHFHKACjs2bmHZ7MNtP71lxkLltma2HCVyMk
 cYIA/2u42PppdgK8XvDjHY+VP9+evEwQio8Ch04brZAiZuM1nxnJZIqIkso4Ds284XUKjxOdu
 fj9hiAf+L8qoZ+PoWrwxI4EYDeGKeu/2nKsNhPGZUpJB4CjAeogxOCJGh4TpaZwGLYeihifW5
 Sl+lIVLAIYRsinJ2p9hblBmexG9U/ivD29TgH/Ss5x5civMKBAg51XfKhAsDKNeQWDlbKra2n
 9GQIlachUmvmNjL9wo+kxuIzBOSTh13x9PuBFotpBM3QbZVmf8pBZJCkiOxlWE7h/9em7b5c+
 bTbIql2x+F6n+m288AbQkLbk6xSkQfdAEr+/yzlJu/Qc7RQriIqhrbGuao+elgxmwmQqr6SST
 oa/W3tjdlrrj4NBagj9VIs9gDPOTzQtXHAlZyMVSLtpDQ6JSNCU250yHMRbGrMlYijpGf9eQZ
 4OMKVRMPaGUFVv4tgygn/vhGdGYl2tjBwGYj8UOB0sD9KryjUmdm3bAj0w3Z0gNsvtO7LPmmo
 TuTxqlIjfD2DIIXaDje1pqPOcm5VrgjSIlE8nFvB/bSpNxHRpFOZwa8kA6kLkvIbYvbQ5YdTE
 SyZZ41Yf+94mPtewehBs55pg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777665; x=1721382465; i=fiona.klute@gmx.de;
 bh=MhEOkcN8mXHPX8ZklTMJrWMmXoj4qADFt7/vhYVeKfU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YHf+mf0QK3YJxhs9c2RnyrZ7pHNrzt1yC8n6hq+8OVZZQ4/hHjWJJjbGdHCygmK6
 de3B2G39AO39T+agtYh3I9JZ40I90Eupw+4Q1MAaeogzxho9EYuTYw0P1MB+9/Dyb
 NeimA+PhWhEki1xpIa2jsM0e4OYEF9Tp97RkdfpSVZKHiN+Ph2dF9mHp3duXsCppT
 IYeHHZleCSiFwBUlBAPW11IzLAi8HcT8eO7vybB/12JqFzH6FoItglahN6avSoJbR
 UkTbqfAHtNY80x/qBBJCRdkPNkAMZz9c7MUrGtVABPipiK+TZz3o4NClLE1LJ6NOE
 FQHzjRF8bDwlB8nFxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YHf+mf0Q
Subject: [Buildroot] [PATCH 0/6] Update init script style
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

As discussed on the mailing list [1] init scripts may rely on the
default Buildroot options for Busybox and other base components being
enabled. This allows using long form options to start-stop-daemon in
init scripts for readability, among other things.

This series:

* Documents reliance on Buildroot defaults in the manual (patch 1)

* Updates the reference S01syslogd script to follow this and other
  good practices (patch 2 & 3)

* Updates a few other scripts I've had to do with recently to follow
  the same style.

[1] https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/

Fiona Klute (WIWA) (6):
  docs/manual: describe relying on default options
  package/busybox: tidy up S01syslogd init script
  docs/manual: include S01syslogd from source
  package/openssh: tidy up init script
  package/dnsmasq: tidy up init script
  package/network-manager: rewrite init script

 .checkpackageignore                        |  1 -
 docs/manual/adding-packages-directory.adoc | 57 +-----------------
 docs/manual/integration-principles.adoc    | 20 +++++++
 docs/manual/integration.adoc               |  2 +
 docs/manual/manual.mk                      |  5 ++
 package/busybox/S01syslogd                 | 18 ++++--
 package/dnsmasq/S80dnsmasq                 | 63 +++++++++++++-------
 package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++
 package/network-manager/S45network-manager | 41 -------------
 package/network-manager/network-manager.mk |  2 +-
 package/openssh/S50sshd                    | 12 ++--
 11 files changed, 158 insertions(+), 131 deletions(-)
 create mode 100644 docs/manual/integration-principles.adoc
 create mode 100644 package/network-manager/S45NetworkManager
 delete mode 100644 package/network-manager/S45network-manager

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
