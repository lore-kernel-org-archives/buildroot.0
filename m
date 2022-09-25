Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F1C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB7C382FA5;
	Sun, 25 Sep 2022 07:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB7C382FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtBYC9uVBS1X; Sun, 25 Sep 2022 07:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE2C82F87;
	Sun, 25 Sep 2022 07:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE2C82F87
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 832811BF5DC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E94240283
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E94240283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6nsyZi_Fo93 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:57:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8235240191
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8235240191
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 07:57:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 887852000D;
 Sun, 25 Sep 2022 07:57:39 +0000 (UTC)
Date: Sun, 25 Sep 2022 09:57:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220925095736.28c462f5@windsurf>
In-Reply-To: <20220922133430.l6graemwo6jg2gf5@zenon.in.qult.net>
References: <20220922133430.l6graemwo6jg2gf5@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664092659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXQrrWL7VXBSEoPxKkkbA24e39exBJKkNuqEPhMu9dQ=;
 b=oKzRds+LH75kDfVuEBi2TdESGc8kZ1707A3sE1hpqU4sPoWdw1oiqHaRdAxJgIW9yVcJJC
 XvJ7x9XkH3z2XtxuQiDTEEgUPsmWVFu9KB4RN9fvAWxtEgqYPlikAorVl4lHA9e+19nPxp
 bwE9n/g2fe5Fzok5nOHiij0dIVqm3JrLadcAReUJAqY4dRkuW9nm3uINUK5znTeEAVMBLJ
 yJsXP07WKxK+8B26RXTvX1znfmWNOehDMkB9t9AGP+iJpWSVf2bhCthgcSCBVoiy9Y0DrZ
 yy+Ok+o0JEIfYjsBZotvNHsWe0Im3XFONB95NVCvPO2f6m1F7TMgE3mfAJ1TWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oKzRds+L
Subject: Re: [Buildroot] [PATCH v4] package/chartjs: bump to version 3.9.1
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

SGVsbG8gSWduYWN5LAoKT24gVGh1LCAyMiBTZXAgMjAyMiAxNTozNDozMCArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiAtQ0hBUlRKU19WRVJTSU9OID0gMi45LjQKPiAtQ0hBUlRKU19TSVRFID0gJChjYWxsIGdp
dGh1YixjaGFydGpzLENoYXJ0LmpzLHYkKENIQVJUSlNfVkVSU0lPTikpCj4gK0NIQVJUSlNfVkVS
U0lPTiA9IDMuOS4xCj4gK0NIQVJUSlNfU0lURSA9IGh0dHBzOi8vcmVnaXN0cnkubnBtanMub3Jn
L2NoYXJ0LmpzLy0KPiArQ0hBUlRKU19TT1VSQ0UgPSBjaGFydC5qcy0kKENIQVJUSlNfVkVSU0lP
TikudGd6Cj4gIENIQVJUSlNfTElDRU5TRSA9IE1JVAo+ICBDSEFSVEpTX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFLm1kCj4gIENIQVJUSlNfQ1BFX0lEX1ZFTkRPUiA9IGNoYXJ0anMKCkknbSBhZnJh
aWQgdGhpcyBicmVha3MgdGhlIGJ1aWxkOgoKICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvP3JlYXNvbj1jaGFydGpzLTMuOS4xCgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2s/CgpUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
