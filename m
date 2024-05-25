Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8187C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 16:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F45E600D4;
	Sat, 25 May 2024 16:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2IZybadvQQZ; Sat, 25 May 2024 16:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40EF605C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40EF605C4;
	Sat, 25 May 2024 16:35:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6561D070B
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38920605C4
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SS4ttEzzy0p1 for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 16:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8F50600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F50600D4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8F50600D4
 for <buildroot@buildroot.org>; Sat, 25 May 2024 16:35:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B20EFF805;
 Sat, 25 May 2024 16:35:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAuMt-001oXJ-1g;
 Sat, 25 May 2024 18:35:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240525061244.8014-1-fontaine.fabrice@gmail.com>
Date: Sat, 25 May 2024 18:35:39 +0200
In-Reply-To: <20240525061244.8014-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 25 May 2024 08:12:44 +0200")
Message-ID: <87zfsdhmsk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: fix build with
 kernel >= 6.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGgg
a2VybmVsID49IDYuNzoKID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0wL291
dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0xLjEzLy4vY3J5cHRsaWIuYzogSW4gZnVuY3Rp
b24g4oCYY3J5cHRvZGV2X2hhc2hfaW5pdOKAmToKID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWls
ZC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0xLjEzLy4vY3J5cHRs
aWIuYzozODQ6Mjg6CiA+IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhjcnlwdG9fYWhhc2hfYWxpZ25tYXNr4oCZOyBkaWQKID4geW91IG1lYW4g4oCYY3J5cHRvX2Fl
YWRfYWxpZ25tYXNr4oCZPwogPiBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KID4gICAzODQgfCAgICAgICAgIGhkYXRhLT5hbGlnbm1hc2sgPSBjcnlwdG9fYWhhc2hfYWxp
Z25tYXNrKGhkYXRhLT5hc3luYy5zKTsKID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY3J5cHRvX2FlYWRfYWxpZ25tYXNrCgogPiBGaXhlczoKID4gIC0gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDY2MzYwYzdiYWVjMmVkZjQyZGM2ZjBhZDlh
OGQ3NTdkZDQ3MWM4OAoKID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
