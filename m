Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AACC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 12:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C5D81BBD;
	Sat,  8 Jun 2024 12:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfFSsJQArOji; Sat,  8 Jun 2024 12:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC0781CA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC0781CA3;
	Sat,  8 Jun 2024 12:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22FC41BF47E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 12:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CCF0401EB
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 12:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bYiSS2GHEV6 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 12:56:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AAAB400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AAAB400D8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AAAB400D8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 12:56:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEE6FE0005;
 Sat,  8 Jun 2024 12:56:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFvc1-001iGy-0W;
 Sat, 08 Jun 2024 14:56:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Ga=C3=ABl?= PORTAY <gael.portay@rtone.fr>
References: <20240218011118.1077002-1-gael.portay@rtone.fr>
Date: Sat, 08 Jun 2024 14:56:01 +0200
In-Reply-To: <20240218011118.1077002-1-gael.portay@rtone.fr>
 (=?utf-8?Q?=22Ga=C3=ABl?= PORTAY"'s
 message of "Sun, 18 Feb 2024 02:11:17 +0100")
Message-ID: <87v82j61b2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: enable on s390x
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdhw6tsIiA9PSBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPiB3cml0
ZXM6CgogPiBBZGQgczM5MHggbXVzbCBzdXBwb3J0ZWQgYXJjaHMuIFVwc3RyZWFtIG11c2wgYWxy
ZWFkeSBzdXBwb3J0cyBzMzkweFsxXS4KID4gVGVzdGVkIHdpdGggcWVtdV9zMzkwc19kZWZjb25m
aWc6CgogPiAJJCBvdXRwdXQvaG9zdC9iaW4vcWVtdS1zeXN0ZW0tczM5MHggLU0gczM5MC1jY3ct
dmlydGlvIC1jcHUgbWF4LHpwY2k9b24gLW0gNEcgLXNtcCAyIC1rZXJuZWwgb3V0cHV0L2J6SW1h
Z2UgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9yb290ZnMuZXh0MixpZj12aXJ0aW8sZm9ybWF0
PXJhdyAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIG5ldC5pZm5hbWVzPTAgYmlvc2Rl
dm5hbWU9MCIgLWRpc3BsYXkgbm9uZSAtc2VyaWFsIG1vbjpzdGRpbyAtbmV0IG5pYyxtb2RlbD12
aXJ0aW8gLW5ldCB1c2VyCiA+IAkoLi4uKQogPiAJV2VsY29tZSB0byBCdWlsZHJvb3QKID4gCWJ1
aWxkcm9vdCBsb2dpbjogcm9vdAogPiAJIyB1bmFtZSAtYQogPiAJTGludXggYnVpbGRyb290IDYu
MS40NCAjMiBTTVAgU3VuIEZlYiAxOCAwMTozMzo0MiBDRVQgMjAyNCBzMzkweCBHTlUvTGludXgK
ID4gCSMgL2xpYi9sZC1tdXNsLXMzOTB4LnNvLjEKID4gCW11c2wgbGliYyAoczM5MHgpCiA+IAlW
ZXJzaW9uIDEuMi40CiA+IAlEeW5hbWljIFByb2dyYW0gTG9hZGVyCiA+IAlVc2FnZTogL2xpYi9s
ZC1tdXNsLXMzOTB4LnNvLjEgW29wdGlvbnNdIFstLV0gcGF0aG5hbWUgW2FyZ3NdCgogPiBbMV06
IGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dpdC9tdXNsL2NvbW1pdC8/aWQ9MTUwOTQ5NDMw
NTBlYjlhNTY0ZjQwOTMyMzA3MGU1MGI0MGY3ODgxNgoKID4gU2lnbmVkLW9mZi1ieTogR2HDq2wg
UE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRo
YW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
