Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C491405AB;
	Sat,  8 Jun 2024 18:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPMRWEoq9GXl; Sat,  8 Jun 2024 18:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF594067F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF594067F;
	Sat,  8 Jun 2024 18:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7F01BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B34404067F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvKdW4RHpth1 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6543E405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6543E405AB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6543E405AB
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:22:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D52F0FF803;
 Sat,  8 Jun 2024 18:22:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0hy-002I7o-0b;
 Sat, 08 Jun 2024 20:22:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20240603160935.26618-1-sebastien.szymanski@armadeus.com>
Date: Sat, 08 Jun 2024 20:22:30 +0200
In-Reply-To: <20240603160935.26618-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 3 Jun 2024
 18:09:35 +0200")
Message-ID: <87v82juwex.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1]
 board/freescale/common/imx/imx8-bootloader-prepare.sh: fix FIT external
 position
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
Cc: Martin Whitaker <buildroot@martin-whitaker.me.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gRnJvbTogTWFydGluIFdoaXRha2VyIDxi
dWlsZHJvb3RAbWFydGluLXdoaXRha2VyLm1lLnVrPgogPiBXaGVuIHVzaW5nIGlteC1ta2ltYWdl
IDYuMS4zNl8yLjEuMCBvciBsYXRlciwgYW4gYWRkaXRpb25hbCBkYXRhIHN0cnVjdHVyZQogPiBp
cyBpbnNlcnRlZCBpbiB0aGUgZ2VuZXJhdGVkIGltYWdlLiBUaGUgRklUIGV4dGVybmFsIGRhdGEg
cG9zaXRpb24gcGFzc2VkCiA+IHRvIHRoZSB1Ym9vdCBta2ltYWdlIHByb2dyYW0gbmVlZHMgdG8g
YmUgYWRqdXN0ZWQgYWNjb3JkaW5nbHkuCgogPiBGaXhlczogaHR0cHM6Ly9idWdzLmJ1c3lib3gu
bmV0L3Nob3dfYnVnLmNnaT9pZD0xNTk3MwogPiBGaXhlczogNzJkZTc4OTAyMzMwICgicGFja2Fn
ZS9pbXgtbWtpbWFnZTogYnVtcCB2ZXJzaW9uIHRvIGxmLTYuMS4zNi0yLjEuMCIpCiA+IFRlc3Rl
ZC1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgogPiBbU8OpYmFzdGllbjogVGVzdGVkIG9uIGkuTVg4TU0gRVZLIGFuZCBpLk1YOE1QIEVW
S10KID4gW1PDqWJhc3RpZW46CiA+ICAtIGZpeCBzdWJqZWN0CiA+ICAtIGFkZCBUZXN0ZWQtYnkg
dGFnCiA+ICAtIGZpeCBGaXhlcyB0YWdzCiA+IF0KID4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGll
biBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgogPiAtLS0KCiA+
IFRoZSBwYXRoIGNvbWVzIGZyb20gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNn
aT9pZD0xNTk3MyBhbmQKID4gaXRzIGF1dGhvciBpcyBNYXJ0aW4gV2hpdGFrZXIgPGJ1aWxkcm9v
dEBtYXJ0aW4td2hpdGFrZXIubWUudWs+LgogPiBJIHdhc24ndCBzdXJlIGlmIEkgc2hvdWxkIGhh
dmUgYWRkIGhpcyBTaWduZWQtb2ZmLWJ5IHRhZy4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRo
YW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
