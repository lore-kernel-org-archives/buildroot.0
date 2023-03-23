Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80710C6FD1C
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 13:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEC9541E57;
	Thu, 23 Mar 2023 13:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEC9541E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9vkXsPnV3gc; Thu, 23 Mar 2023 13:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 979EE41E85;
	Thu, 23 Mar 2023 13:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 979EE41E85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81AE91BF291
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 13:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49B4F61573
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 13:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B4F61573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwHmP1QcHpie for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 13:15:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1496860B10
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1496860B10
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 13:15:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E089610000E;
 Thu, 23 Mar 2023 13:15:19 +0000 (UTC)
Date: Thu, 23 Mar 2023 14:15:18 +0100
To: Simon Rowe <simon.rowe@nutanix.com>
Message-ID: <20230323141518.7a5cde5f@windsurf>
In-Reply-To: <DM8PR02MB81213985E6D21FD5B0B318ED93879@DM8PR02MB8121.namprd02.prod.outlook.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230319172554.0d5ea60c@windsurf>
 <DM8PR02MB81219477CD31D864F078BC8493819@DM8PR02MB8121.namprd02.prod.outlook.com>
 <20230321145455.7dce4271@windsurf>
 <DM8PR02MB81213985E6D21FD5B0B318ED93879@DM8PR02MB8121.namprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679577320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpgHbtmcUWpcAKX8a92OlPXmegFJgtJ67PvANrM9hpA=;
 b=bNaBFNeLMR2h7pPvVaPVOAzoCuYUnZdWYGAJKZLSzsWl9zAeF2VMsTqw4AfKX6ksCtDpup
 xsIk5DfnNIWcc4oyXXKLOr3WjTu0JDFjty5fnl4v/xp5Cy3aes8Pltx0MdJfXzswjR5dPH
 6MQ8ezxmwxll3ddBPJ6IJMxrDv/IrYh4Cg7GGjaJ+3qcNP1a0OULLzE3sqLfnLDQ+SG1Z4
 y53aD448U/lkyoHl+8wR0PlYJBZU0UMnDlEsFhCBlBYne5W+BSBEGJ1pnj9V9iZxcIczKs
 7dqMowgnb3gg2N4hI0UlhuS1xNrAPWyTSIay76176PZtOZr/c3PLgg+4e0EK9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bNaBFNeL
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMyBNYXIgMjAyMyAxMjozNjo1NCArMDAwMApTaW1vbiBSb3dlIDxzaW1vbi5yb3dl
QG51dGFuaXguY29tPiB3cm90ZToKCj4gPiBJdCdzIGJlZW4gYSB3aGlsZSBhZ28uIFBlcmhhcHMg
dGltZSB0byBkbyBhbm90aGVyIGF0dGVtcHQgYXQKPiA+IHVwc3RyZWFtaW5nIHRob3NlIHBhdGNo
ZXM/ICAKPiAKPiBBZnRlciBhIGxpdHRsZSBtb3JlIHJlc2VhcmNoIEnigJl2ZSBkaXNjb3ZlcmVk
IHRoYXQgc29tZSBvZiB0aGUgZml4ZXMKPiBhcmUgY292ZXJlZCBieSBjaGFuZ2VzZXRzIHByZXNl
bnQgaW4gdGhlIHVwc3RyZWFtIG1hc3Rlci4gSeKAmWxsCj4gcmVwbGFjZSBteSBwYXRjaGVzIHdp
dGggdGhvc2UgYW5kIHRyeSB0byB1cHN0cmVhbSB0aGUgcmVtYWluZGVyLgo+IAo+IEnigJl2ZSBj
b25maXJtZWQgdGhhdCBtdWx0aXBhdGgtdG9vbHMgYnVpbGRzIHdpdGggbXVzbCBzbyBJ4oCZbGwg
aW5jbHVkZQo+IGEgcGF0Y2ggZm9yIHRoaXMuIEnigJl2ZSBub3QgdGVzdGVkIGlmIHRoZSByZXN1
bHRpbmcgYmluYXJ5IHdvcmtzCj4gdGhvdWdoLgoKVGhpcyBpcyBhbGwgZ3JlYXQgbmV3cy4gVGhh
bmtzIGEgbG90IGZvciB0aGUgZXh0cmEgd29yaywgbG9va2luZwpmb3J3YXJkIHRvIHNlZWluZyB0
aGUgcGF0Y2hlcyEKCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
