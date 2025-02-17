Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC5DC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2A682155;
	Mon, 17 Feb 2025 15:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqyNiMqmHCvt; Mon, 17 Feb 2025 15:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE478216E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE478216E;
	Mon, 17 Feb 2025 15:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45BC5DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB0440BE3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_Z1VWGjhMej for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AB1F40328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AB1F40328
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AB1F40328
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1tnqQl0B18-00NDYx; Mon, 17
 Feb 2025 16:31:45 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:21 +0100
Message-ID: <20250217153127.1363472-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ImKMWx4Tqr8+n3Wr5rTmrVUGUfST0U4Nu8lKRxICrxj3s/Gz4MF
 xVgpx1Cx01qOOMvyqwKF5nOG6mPZl1ayoweWmoQa8P5HrgG8+vy2SHL9ADGjfUJY2vSSgeI
 TnsSduaNQsuL4KrVswft2atFzGfCkQ27h4RQVuaSNhmdWXIyOO2K3/yrOK3luKd1bnEihj9
 qKfym7n8eYL0FdbiMo/qQ==
UI-OutboundReport: notjunk:1;M01:P0:LjXg8wBMbVw=;LMnVnjWHoLnH7LDq0PP2P9EWfxV
 kZZw62nEgP0iXib0zitFuL0LYUWcvO477sB07Gf0wu5o5e23lR+wFISFqv0jeRJ90MX+NqF+M
 zILdO5ZxN2htIkTOvQ7cMaNbSJg29h9nHOcWk9hLNrs9cb2v4r1EsP6JYCfoZB1ZAHI6aYBwx
 kB80JqnZaJCIsont2porsjGmUPDXSVF8nZrF/tSM2wfJJwApJpMq9YNC2U4OD9XVEibw9oZIw
 3qqTNQ9Mu47IKw2jTanE7TC3QBoE2mHhreZTJBKt8Uw/P6uLZUfs7ZPjH1RbuTxA9PCq09pI1
 T9I/OEvbxwQDBzVufUQgSCr1NCVUK3yTYgZkantNBRTW/ALmlt1I2A7ZPy6hchBluJfTjcaNS
 LdZgT0lkWMJewAzmcDsuE/RMl7z6RPpiSXtEFV5qMPskSBAhIxTtaEMU2ptsX6w+I10gwftyF
 UBIEOwwdKcSxZZaZ6ymtitMHdLAEtdA7ZDX+a9wvK9b7RPP2snaEkMGofZPD59Pra4G1uxT6d
 ADms9kcqfeCFc8SNy2r0bExOl8Oz6ZXV471NP7MZDZbYvaRRpy0zGtqJ9kcSyV/qphZGoQBp7
 V34m+Icj6knsHF3NuwACoPiD8DyMUpa1yX8oljYfbOQhxGTDauaq9ARJPcfvVa1rUSzd8SRjd
 h0gvFFkevhZqHBR7GaRTAEQzrhG4nUk6Jqfg1bXCf8RIJp5AHIWu+MNaF4lQXdGIJuDH8pRLL
 oZ3tI/OiZNW3L69PFAoHpYCI3iysyQPp+Lp8m3/XhqPMnv6LlZRen2sLV99apUjCS1sMn2X59
 GHovOqIFCv1WdCCZS3zbYsEWp7/RSJAR0UWpeP0iNfZF10FUdXySpoEfHlLglSfDNnh79LpqQ
 hdh6eQaDpnU6pVSlTm1Gxkc2ntnz1zN+Ybp6oBhAdqzgZelTqPHNZZyuawmxHhCaunL2NlzFY
 bNcfEMKj+TOEBG2B1jITaRPnvvNWllvxrMHbbKfRUYR0CfL3qaoSCPkRjVUDSXrUCkGmcQNmf
 tWY/WkoyF5jTc24nngd5JpLMy+6lVRYBjaoiR+LFqME+bXeGDBL3+YYAZatPjTxwf/Fz2ut2/
 QCTm+FYyjAD5mhiiegmRclQSCBUYCkmNNCPQuHXUn1d1c6thkPNrWubcQ4Zekb2W+vP5bg5+I
 JiVPGNrlSV+fZybJaHpOhy4k/Gsov/gZ+U49vXzxD4hJGm0JUFM/RDej7Vd9omeqwUxzS3SqB
 h+KMtE2tzNWgt64N+lyh8/Lejjsj/B9MpmBPC4W0QMTI1SRzg6TBhaKzvc/+Qg4WI61UIMZrR
 SBwXGafpwT+NFMiIMWjDBj9e9D3b2udDJ9Z8blJnZ9ZXtl4scMV9NUXxG3CZUnsRG4dhTWXux
 M5GjB1A7FFzWwhYhstIQ+nv0V9Yu6hddP4JhTHDwcrX2G4Py0dr+buPp+81aRByaPe/a+IODz
 xoMQ+sw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806305; x=1740411105; i=fiona.klute@gmx.de;
 bh=t6lyLgEe3cELZ8r4AknKe3QsRfJxsDf8cOJNv2nZnE8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IW1GfQ7shl8Cjsfl9XerZ9soMLPZhOOEyEMe7UuzDPinrS70steJhNXWmMUyyfxf
 JqvVKc8P/OHpnfUHOn1ctQcTybhZwQCJBiCa6wP0J/NetllvDAZq181+LZY13WLya
 68jm91AXP1OwMbcI97ofHkfOQFzNfzeo/u4GqCihRefnXHu6rYnYq+aZrhcN0TZMz
 opytm1Np7vM33j/YdinGGDWZne2TaNQ6io0fGIoUuqKSYpbWpnlxZryoCVR3fdRd9
 CgTqwKRhtKs5ouqVYKsoI4KYTwovaxvEU4phjkyKvSts9iyGh23NR9SothXbZ/DR3
 a766bKW4U3Pn7DC7QA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=IW1GfQ7s
Subject: [Buildroot] [PATCH v6 0/6] nftables firewall support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series adds support for firewall configuration through an
nftables rules file. Offering the choice of iptables-nft as the
default iptables implementation (smilar to e.g. update-alternatives on
Debian, but at build time) makes it easier to integrate that with
legacy applications that rely on the iptables command (e.g. Docker).

Changes v5 -> v6:
* nftables init script: fix "unreachable code" warnings from new
  shellcheck version

Changes v4 -> v5:
* nftables init script: run any target only if rules file exists
* iptables init script: run any target only if rules file exists,
  except for "save" (which may be used to create it)
* rename series to clarify that nftables firewall support is
  non-existent otherwise
* v4 for reference:
  https://patchwork.ozlabs.org/project/buildroot/list/?series=416810

Changes v3 -> v4:
* set ip6tables symlinks when selecting nftables compat

Changes v2 -> v3:
* move change from "iptables -F" to "iptables --flush" to the correct
  patch (3/6)

Changes v1 -> v2:
* add patches 3-6
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
 package/iptables/Config.in                    | 12 +++
 package/iptables/S35iptables                  | 16 ++--
 package/iptables/iptables.mk                  | 13 +++-
 package/nftables/S35nftables                  | 76 +++++++++++++++++++
 package/nftables/nftables.mk                  |  5 ++
 support/testing/infra/basetest.py             |  4 +-
 .../testing/tests/package/test_iptables.py    | 18 +++++
 .../testing/tests/package/test_nftables.py    | 37 ++++++++-
 .../rootfs-overlay/etc/nftables.conf          |  8 ++
 11 files changed, 181 insertions(+), 10 deletions(-)
 create mode 100644 package/nftables/S35nftables
 create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf

-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
