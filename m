Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42B9C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 11:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32DA48125F;
	Wed, 14 Aug 2024 11:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOnhaTf6Ei1M; Wed, 14 Aug 2024 11:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285E681264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285E681264;
	Wed, 14 Aug 2024 11:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28B0A1BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 149C560622
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFO-BPpmtW-k for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 11:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78421605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78421605E6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78421605E6
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:11:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.114.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOA3P-1spWha0k2b-00NWem; Wed, 14
 Aug 2024 13:11:43 +0200
Message-ID: <2577e174-dcce-4da0-b95b-1a391339557b@gmx.de>
Date: Wed, 14 Aug 2024 13:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:Ez5hsq2Or4/0FhoGHKbHrMEywSCkDmWtatvcxYwoESGnG9NBP6p
 Xw3nVRyC3BpLf6LTbJ1XEaGSSAcG91uEoPNF/xwT0iK/AcQt3yRuZtgZp3hXkwzdBCfqY66
 ZF0Bey5JQFZHRxoDa0g5B+cFGbueQ4Zzmvvt48AFK0BidQ/JlaaIypLTp0sGZPDxNGibVu3
 17kc6YmR5YiKaYpQOzGnQ==
UI-OutboundReport: notjunk:1;M01:P0:XGufjBwdejE=;lwSTj70jx86KefHHaxU6f49e9E3
 vNVQDTclqhkpzDqpfEZXXrGXI2ijFJ+7yTy3C6ZGQCcpXfbC4KnbK79zLSoYbeYit2vsoc3ng
 k0JY1xQDSBgIOCS0nOK35VqCk9b/O+XFtoshF/w4RdBSkece0F+TKR/TCLe4ebsPFXjruvkc3
 i6uz5AZMrUsVaXi3QGbkCV66LErli26PJuo0Z+5DHHR/sviEl7sQkAO5DVz2EKXxNTmD3uemr
 B+KnYJsorQhP0aMk6PMXcUu6Vk087IbjtJucY9DnEDktFoZgbTyYSV3QqLA4sGEtpVj7Xwdtx
 vH/XePNY9Mc943Z89A/rqIDAHY9cd72xZFf3/dEu9ldV1qfovICAsOMSSoos1mGobJI7GyGj2
 TLibN1U+cFDBTCcZ/e7mseMOj7EOHYSnfVU8sk88cY4X8dpMPwh/pvP44ZsVjwboTwlVKPhPj
 GmqdhHsnCg2W3DUbbuPvBdB9PNAZOq/oLCYdu41ISOJeIf/yTWKxNBPfsc7I5roEJy8+4BrtG
 NZ/fg5WTSDHP/DJ6XyPRGw4prJYrwpRxt8Ih0PDE8ytf0yoG2kvcWzBk7tJm5jF7zW8XwGFer
 8lKuvWUq5iW3hJgRFR1w3vSvlwP0kZy58/bj5dRMKu7qzdDx1l7hHKhzcVXK5s7CFjC0JT5mi
 ab5kXQF9aBzRwVhYEQSyzdUal2Cx+iONOOu3HJTKKoAnYT0eMGFo4DzKfmd6siTJ8JKJGjIqE
 Zn6Ubv8C3cRs8IpBDsTrxVDrBm+XaHDhMamGpCMEDaxOq+4S50nK2QPd7+eMtgbMdfTuuoSJd
 TukRlT4H6eWfLcSM1pMv5APA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1723633903; x=1724238703; i=fiona.klute@gmx.de;
 bh=mD2ezp8oE9sRCe0I4cuQCvXY5fWoFInf8ZGXn6y33Ms=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=s+Y0udlwnKfvXSujKtRhXRmpc8OPdn9epkAg/4MviRZj1e3x3KcN2PkXOFsonfVn
 JStfz1uSko0e/UHqyhTozFwUfn9KfdEsIARYovyjBGRJuJ56fnBMkWkEZayYH+jbV
 n6A+9Cxfs0jJUhCTw3rx2KzsxP62sTJXTYJlbjtoR0N2sZganxjWTtYJBRl/CdYbU
 UDK6PBpY9KhyPTTezLUn3l6jZqNdvj3lv+Bs8C/2xpSS2q4NXmq7kl1K9gET/Euxx
 5HlwZbuZIUFVBp78wmgftHqFuR7tptgfbiESE1pBLVv3Z/4XyyLPgBeLcnvA3MON7
 LjmHATn7DlCbawyM7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=s+Y0udlw
Subject: Re: [Buildroot] [PATCH v4 0/6] Improved nftables firewall support
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

is there anything I can do to get this series into next? Patches 1 and 2
(init script for nftables and defaulting to iptables-nft) are the
critical ones for my project, the others would improve long term
maintainability in my opinion.

Best regards,
Fiona

Am 26.07.24 um 18:20 schrieb Fiona Klute:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> This series builds on two patches I've sent previously before, with
> the main goal of supporting firewall configuration through an nftables
> rules file. Offering the choice of iptables-nft as the default
> iptables implementation (smilar to e.g. update-alternatives on Debian)
> makes it easier to integrate that with legacy applications that rely
> on the iptables command (e.g. Docker).
>
> Changes v3 -> v4:
> * set ip6tables symlinks when selecting nftables compat
>
> Changes v2 -> v3:
> * move change from "iptables -F" to "iptables --flush" to the correct
>    patch (3/6)
>
> Changes v1 -> v2:
> * add patches 3-6
> * clarify comments & commit messages
> * nftables init script: Warning about missing flush in ruleset on reload
> * nftables init script: check for rules file only on start
> * nftables init script: return nft return code from start/stop functions
> * iptables init script: start only if rules file exists
> * add tests for init scripts
> * use long form options in init scripts
> * fix typecheck warnings
>
> Fiona Klute (WIWA) (6):
>    package/nftables: add init script
>    package/iptables: optionally default to nftables compat
>    package/iptables: check for rules in init script
>    support/testing: test for nftables init script
>    support/testing: include init script in iptables test
>    support/testing: fix MyPy warnings about BRConfigTest
>
>   .checkpackageignore                           |  1 -
>   DEVELOPERS                                    |  1 +
>   package/iptables/Config.in                    | 12 ++++
>   package/iptables/S35iptables                  | 14 ++--
>   package/iptables/iptables.mk                  | 13 +++-
>   package/nftables/S35nftables                  | 66 +++++++++++++++++++
>   package/nftables/nftables.mk                  |  5 ++
>   support/testing/infra/basetest.py             |  4 +-
>   .../testing/tests/package/test_iptables.py    | 18 +++++
>   .../testing/tests/package/test_nftables.py    | 37 ++++++++++-
>   .../rootfs-overlay/etc/nftables.conf          |  8 +++
>   11 files changed, 169 insertions(+), 10 deletions(-)
>   create mode 100644 package/nftables/S35nftables
>   create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf
>
> --
> 2.45.2
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
