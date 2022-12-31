Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDBCC3DA7A
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 13:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BD880BB8;
	Sat, 31 Dec 2022 13:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98BD880BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD12aI_TtYsJ; Sat, 31 Dec 2022 13:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0577480B7F;
	Sat, 31 Dec 2022 13:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0577480B7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81C421BF2EF
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4775580B7F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 13:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4775580B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j01ymvoer_2s for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 13:23:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B2C480B3E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B2C480B3E
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 13:23:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F081620004;
 Sat, 31 Dec 2022 13:23:43 +0000 (UTC)
Date: Sat, 31 Dec 2022 14:23:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221231142342.1189ede4@windsurf>
In-Reply-To: <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
References: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
 <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672493024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pufdBXiiqyfxNzRzODLF1lSrHB5BaIyb1ATLqZvuqw=;
 b=adYUoXScFno2epP/nf6Rdxpo1Nhy0aeCBzMevBC8Z7LojPRWbJS7AIFilYLCeM1J5bMPQv
 dW/Y19iKvi4So8uDsZkTUgCNx0me02y+02folW8viH5jyazqz9LtiOJgbRYJrXFzGMpl2w
 DcdiR1li4mpE+lYkUox379nq16BTPTqLQE4wniqDkW4oRniDTXMXZtAtkXmSR0O0m3XtzF
 ynQGlSzuehEiusFxVSS+LdAPAI26ID5gxzjl0vYR4A1ymt/v2lXGCg9/JF3ImrqmQULLOx
 vf8wI4grYAFCPBDOtbYSjeKsEB2BUlSdHJGCNMTn8cmZ965sv+NYoub4fXlJew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=adYUoXSc
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyOSBEZWMgMjAyMiAyMzowNjo1NSArMDEwMApHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+ID4gSG93IGNhbiBJIHBv
aW50IG15IGZpeGVzPyBEbyB5b3UgdGhpbmsgaXTigJlzIGVub3VnaCB0byBvcGVuIGFuIElzc3Vl
IGluIGxpbnV4LWF0OTEgR2l0SHViPyAgCj4gCj4gVGhleSBkb27igJl0IGhhdmUgdGhlIElzc3Vl
IGF2YWlsYWJsZSBpbiBHaXRIdWIsIEkgc2VuZCBhbiBlbWFpbCB0byB0aGUgbWFpbnRhaW5lciB0
aGVuLgoKT3BlbiBhIHB1bGwgcmVxdWVzdC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
