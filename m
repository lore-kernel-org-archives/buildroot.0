Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CBC38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 05:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ABFA405A0;
	Thu, 27 Oct 2022 05:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ABFA405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCtVAYs5KUgy; Thu, 27 Oct 2022 05:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF6084055A;
	Thu, 27 Oct 2022 05:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF6084055A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1032A1BF376
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 05:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5EC40911
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 05:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB5EC40911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Db3AvX56KFmJ for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 05:50:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5434408EE
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5434408EE
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 05:50:39 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr20.francetelecom.fr (ESMTP service) with ESMTPS id 4MyZXY0hsRz1ym0; 
 Thu, 27 Oct 2022 07:50:37 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 27 Oct 2022 07:50:35 +0200
Date: Thu, 27 Oct 2022 07:50:35 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <6313_1666849837_635A1C2D_6313_23_1_20221027055035.GG1657509@tl-lnx-nyma7486>
References: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
 <7333_1666791084_635936AC_7333_90_1_20221026133122.GF1657509@tl-lnx-nyma7486>
 <20221026205312.3f729eb8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026205312.3f729eb8@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666849837;
 bh=OY3+6FRny5HzZ9lFExwvWC7NGTRs9xnwLrqseCvZgRU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=sYuIjMlMgVRleMvbBeFP4kKCUq0ogwPto+ReRQX2ERVcKkxGqFHLVp0psdGIHQYcy
 wyDygdjJHTrSPLx0HlHFiGlvgjeP4LtPHH1PjtdA/e373OI4xUGTsiLDHmJ2dersmL
 GP5TcblmSWsX0VFXY9Pb9Fcx2xZuKsB1I4gw/PBuZIZXBoEA/fEQF0uVbHP2Uorax8
 5azFgdDvS8A52xfsMXRfBGHRjvKgWBRbKypPmtwllS1qBH0N4KJZlKwQLJFE/4qg/j
 4sDDOFyD4nU/uLtS4gY9X/s1zqtO2ZnNO7oXkN83FRv9Dvhe2NgNtcBkqILxJ1fEDE
 /jqlE9nIj6nYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=sYuIjMlM
Subject: Re: [Buildroot] [PATCH] package/musl: fixup the dynamic loader
 symlink
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
Cc: hello.skyclo@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTEwLTI2IDIwOjUzICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBPbiBXZWQsIDI2IE9jdCAyMDIyIDE1OjMxOjIyICswMjAwCj4gPHlh
bm4ubW9yaW5Ab3JhbmdlLmNvbT4gd3JvdGU6Cj4gPiBXaGF0IGFib3V0IGV4dGVybmFsIHRvb2xj
aGFpbnM/Cj4gRXh0ZXJuYWwgdG9vbGNoYWlucyBhcmUgbm90IGFmZmVjdGVkIGJlY2F1c2Ugd2hl
biB3ZSBjb3B5IHRoZSBzeXNyb290Cj4gZnJvbSB0aGUgdG9vbGNoYWluIGludG8gU1RBR0lOR19E
SVIsIHdlIGRvIHRoaXM6ClstLVNOSVAtLV0KPiAoZnJvbSB0b29sY2hhaW4vaGVscGVycy5tazpj
b3B5X3Rvb2xjaGFpbl9zeXNyb290KQoKQWgsIHNvIHRoaXMgaXMgYWxyZWFkeSBoYW5kbGVkIGV4
cGxpY2l0bHkgYXMgYSBnZW5lcmljIGZpeHVwLsKyCgo+IERvZXMgdGhhdCB0aGlzIHNlZW0gbGlr
ZSBhIGdvb2QgZW5vdWdoIGFuc3dlciBmb3IgdGhlIGV4dGVybmFsCj4gdG9vbGNoYWluIGNhc2U/
IElmIHNvLCBJIGNhbiBzdWJtaXQgYSB2MiB3aXRoIGFuIGFtZW5kZWQgY29tbWl0IGxvZy4KClll
cywgdGhpcyBpcyBwZXJmZWN0LCB0aGFua3MhCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0g
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAg
X18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQx
MS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAg
ICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8
IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpDZSBtZXNzYWdl
IGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMg
Y29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMKcGFzIGV0
cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZv
dXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXIK
YSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRl
cy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJh
dGlvbiwKT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBh
IGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLgoKVGhpcyBtZXNzYWdlIGFu
ZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsKdGhleSBzaG91bGQgbm90
IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uCklm
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLgpBcyBl
bWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0
aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuClRoYW5rIHlvdS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
