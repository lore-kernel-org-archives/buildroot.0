Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F1C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 07:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BEC408E0;
	Fri,  3 May 2024 07:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5Y5SsOMmLk8; Fri,  3 May 2024 07:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEBE414B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEBE414B9;
	Fri,  3 May 2024 07:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65BAC1BF2AF
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F38F401CE
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlYAA-45aYJw for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 07:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5124B40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5124B40133
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5124B40133
 for <buildroot@buildroot.org>; Fri,  3 May 2024 07:10:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D3AB1C000E;
 Fri,  3 May 2024 07:10:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2n4F-00BbJw-1r;
 Fri, 03 May 2024 09:10:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240407184152.3241588-1-fontaine.fabrice@gmail.com>
Date: Fri, 03 May 2024 09:10:51 +0200
In-Reply-To: <20240407184152.3241588-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Apr 2024 20:41:52 +0200")
Message-ID: <87zft72ww4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: fix build with gcc >=
 13
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGgg
Z2NjID49IDEzOgogPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL2Jhc2ljL21hY3JvLmg6
NDQ2LAogPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vc3JjL2Jhc2ljL2FsbG9jLXV0aWwuaDox
MCwKID4gICAgICAgICAgICAgICAgICBmcm9tIC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjEyOgog
PiAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzogSW4gZnVuY3Rpb24g4oCYaW5zdGFsbF9jaGFuZ2Vz
X2R1bXDigJk6CiA+IC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjQ0NDo2NDogZXJyb3I6IOKAmCVz
4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1d
CiA+ICAgNDQ0IHwgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbG9nX2Vycm9yX2Vycm5v
KGNoYW5nZXNbaV0udHlwZSwgIkZhaWxlZCB0byAlcyB1bml0LCB1bml0ICVzIGRvZXMgbm90IGV4
aXN0LiIsCiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KCiA+IEZpeGVzOgogPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy9lMGQ2YjdkNDFmZWZlYzUzOWExN2EzZWY1Yzg5YzE5MmNlMjlmZDA0CgogPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
