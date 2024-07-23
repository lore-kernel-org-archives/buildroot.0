Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F8C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5ED960831;
	Tue, 23 Jul 2024 13:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgUWXPPJwof3; Tue, 23 Jul 2024 13:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C180606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C180606D3;
	Tue, 23 Jul 2024 13:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 952F81BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81A7E80AD1
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Bgi2SUiTdjw for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A0CD80AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0CD80AC4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A0CD80AC4
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGrE-1soQi50GHW-00MGmp; Tue, 23
 Jul 2024 15:40:11 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:42 +0200
Message-ID: <20240723133951.3542206-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:H0QH/16jEM291ELHSsdpBpHqtcfJTtUTj7sRaAmXmx4YSuJmDdr
 GHKxKwc0UibKHf+fwO2TuXDlW/FTjIGwzBMzuGALS7ZWIhOIBIIs71Bwoc7c6PeJKXc7970
 fONYLjDUuZN2SRu+27SUmfej1XSX34lC0Vp8ch97DhRMi3oGDLOb26wPxSP7+mCNq3Flg8G
 ZzDSvyLiBusyruFnY+a6g==
UI-OutboundReport: notjunk:1;M01:P0:iDqxeCxI4hM=;JXg/LxvMpmYgJ8xt8pcydeEQspY
 YZiRb/rVafp/AIItB+wcXTuhJkALOFBNi3wzYRLvl3ll+EvFB5MEvF81y2Sw8nSh4uMxUPG4k
 rqo0jM8L9ErjVJ4BU3smR/+lxHGVPZJWXGMq12elvTUuRG5HOsxd3tfR2EYngFrMZsHnZf5tn
 5M1E2xJAQkGHkrmXOoHdYs2KiSlRzauvCUSy4nhoAOCQu6MWILRUJaVq0TLtiY7UBveUis+1L
 4phtorXQOiX+FsPDgrHce528MKL2kbsJg0mHqmR21ZVQmXS32knGqwaIzQk6W9Gwo6E9q6V3D
 qqmlfhCrEVI5LU9Rfb27crYf5EjEjtIkCb8+cvV8qpZ8oW/LvxxjpymlmLsgmedhmy4DEEnAy
 de+NRMF/v2DgphYvZf73voFrR7pP24RAfsn+X1WLKKpv1agPigqOLjUHumSa6wB5VGVSwttqV
 j1Whe8PLyM+YtPX9qbAgz5vV0o6SArGTC1xmZDAkCkSA2kSu4wmZyxXI3KCXNYXMWcRcqib9Y
 PuJ+2XGTTAzyqWRmAxcGM9pTGP8bh+jjDfQNveh+WxohhvWAKZuKegYT4Pi6mzaWf1IXvyoSV
 pzSL0DLvMYsKXF16YaM74Hi885W8QoeeXVCexrizUxYc2Djp3INeVRx1j2PDMiofGx83V/EIj
 tzopCzHR+8O7ipOBYs7MhjTjrgw8IhzFzomg8rvfWVpA4NyLH8ZDDlzMihSUFRH09bsRzvRdm
 Rp1PcFSLIakzoCYDS8XUHmLEX9ZaDl3Qg0Ps4E56EREJRo9+aAYgTO73V7qQyjtv6MpzQtYDB
 ufbcdX/JSSzUEmu6qxUZneTg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742011; x=1722346811; i=fiona.klute@gmx.de;
 bh=6TZ/Tozs84Tjq8oDBt+CvsgqlAWcBfn55x/wh7+qZ9Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W0g4ypbcfY+Cd2skfSi/Oy4tOPmdi/L24jFgm0MIq/XnfuF+dSA2gV6DpVP5Zlu+
 iFkh3IDoeRn7+RZ9ncje1L1d1bVEndBVugZa6f9aGa4azagvhPFaHrM/g9dBTvzUK
 wlT4ZmbNLOSRObfUDdJv+3yWpn8ILMHpzyDa1TVbMIZLVqOqGXBJp410nSRE0FRBg
 rIW1p418Z85DmVFKr5BPP5PSJm7cHuaPRwCSXAz795p4k7pHhUFmYvum2ZBH3xF9a
 3e00Re/xQlFbecLTWPSPRJdxqG9N79oQnKEyqyDFJ+H/XOqMsowTzg3IROdR56/U7
 yJndHPdyEGNyUwdw1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=W0g4ypbc
Subject: [Buildroot] [PATCH v3 0/6] Improved nftables firewall support
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series builds on two patches I've sent previously before, with
the main goal of supporting firewall configuration through an nftables
rules file. Offering the choice of iptables-nft as the default
iptables implementation (smilar to e.g. update-alternatives on Debian)
makes it easier to integrate that with legacy applications that rely
on the iptables command (e.g. Docker).

Patches 3-6 have been added in v2.

Changes v2 -> v3:
* move change from "iptables -F" to "iptables --flush" to the correct
  patch (3/6)

Changes v1 -> v2:
* clarify comments & commit messages
* nftables init script: Warning about missing flush in ruleset on reload
* nftables init script: check for rules file only on start
* nftables init script: return nft return code from start/stop functions
* iptables init script: start only if rules file exists
* add tests for init scripts
* use long form options in init scripts
* fix typecheck warnings

Fiona Klute (WIWA) (6):
  package/nftables: add init script
  package/iptables: optionally default to nftables compat
  package/iptables: check for rules in init script
  support/testing: test for nftables init script
  support/testing: include init script in iptables test
  support/testing: fix MyPy warnings about BRConfigTest

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  1 +
 package/iptables/Config.in                    | 12 ++++
 package/iptables/S35iptables                  | 14 ++--
 package/iptables/iptables.mk                  | 10 ++-
 package/nftables/S35nftables                  | 66 +++++++++++++++++++
 package/nftables/nftables.mk                  |  5 ++
 support/testing/infra/basetest.py             |  4 +-
 .../testing/tests/package/test_iptables.py    | 18 +++++
 .../testing/tests/package/test_nftables.py    | 37 ++++++++++-
 .../rootfs-overlay/etc/nftables.conf          |  8 +++
 11 files changed, 166 insertions(+), 10 deletions(-)
 create mode 100644 package/nftables/S35nftables
 create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
