Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8234EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 03:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE555400D2;
	Sun,  2 Oct 2022 03:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE555400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4RCHQ8ZubnF; Sun,  2 Oct 2022 03:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E804040106;
	Sun,  2 Oct 2022 03:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E804040106
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FED01BF2B4
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 03:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B05960AF2
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 03:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B05960AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8dao7EcEo7T for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 03:38:19 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63AD606A0
Received: from wrqvxttq.outbound-mail.sendgrid.net
 (wrqvxttq.outbound-mail.sendgrid.net [149.72.167.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C63AD606A0
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 03:38:18 +0000 (UTC)
Received: by filterdrecv-canary-57bf98f445-wwgvq with SMTP id
 filterdrecv-canary-57bf98f445-wwgvq-1-63390675-F
 2022-10-02 03:33:09.734703586 +0000 UTC m=+366307.402410453
Received: from athaariq.my.id (unknown) by geopod-ismtpd-2-1 (SG) with ESMTP
 id KIOt9LuJS1qKzXxAm8Awfg Sun, 02 Oct 2022 03:33:09.217 +0000 (UTC)
Received: from mail.athaariq.my.id (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by athaariq.my.id (Postfix) with ESMTPSA id 51D0B10568B;
 Sun,  2 Oct 2022 10:26:42 +0700 (WIB)
MIME-Version: 1.0
Date: Sun, 02 Oct 2022 03:33:09 +0000 (UTC)
From: buildroot@athaariq.my.id
In-Reply-To: <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
 <20221001155615.GA30794@scaer>
 <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
Message-ID: <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
X-Sender: buildroot@athaariq.my.id
X-SG-EID: =?us-ascii?Q?cuHA57UmN3h37Du2RZTUuZwgCKztG1NrS6GYeDL2RtYN3aQvhxKzyA29y8QJ=2FO?=
 =?us-ascii?Q?eL0oLlcy9TF68JPLTaNYrKXUgXT742bEYqEeADg?=
 =?us-ascii?Q?hzijod6y1UkQm4oGmHvCWvChRPbEtTURNjOBTze?=
 =?us-ascii?Q?XdpmFwoyqygouLa463h8+AKbsk=2FRcZoktfhCwkh?=
 =?us-ascii?Q?48FgAXry3HwMomJW5=2FXKODNjqaN3uFFZ6c72n6W?=
 =?us-ascii?Q?brctoI2LvC=2F3tAcRc=3D?=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Entity-ID: 8hTT1BSDhM31GKM3tJ7/LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=athaariq.my.id; 
 h=mime-version:from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=s1; bh=dJp8bixw5WbAwwyNP5h5Rp7eCc2MQ0HuYpzwMRfPMcU=;
 b=ZonSI8jEqDHdacRIBt0YZ4u627XguYf5xXzoDtKYu9t3JWR2Qj6F86IRGnzo7HGbNSx/
 WdWVjfjiZh/GF18qFpNpEFg+TiKzkLDWbMu7IDffUU/cOX3FLHEJFivOh7mNsB54vSGKzK
 ms7H06qXeuY55IpyMIC3WHgxCGNYcF7kPMs8VjcGqtvXckiG+YpxsnXFQcUsyNQgRuqlXc
 J/wjwnCJQUa2qPT/h2wxlc0Z+hbsRXNLa9hiuagJOHnM7HCdiR77VYR+GBmxzU6xmpN2By
 6kFxkrBYsRtEP9ttYASF4LawByV4WHWbSbLY1BgmNc5BaYk2rzGaf2FCLGP8WFdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=s1 header.b=ZonSI8jE
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTXIuIE1vcnJpbiwKCj4gVGhpcyBpc3N1ZSBpcyByZWFsbHkgd2VpcmQsIGJlY2F1c2Ug
dGhlIGdsaWJjIGNvbW1pdCB3ZSBhcmUgdXNpbmcgaXMKPiBzdXBwb3NlZCB0byBjb250YWluIHRo
ZSByZWxhdGVkIGZpeGVzCgpQYXJkb24gbWUgZm9yIGJlaW5nIHNvIHdlaXJkLiBXaGF0IEknbSB0
cnlpbmcgdG8gZml4IGlzIHRoaXMgZXJyb3I6CgpgYGAKL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290
L3Vzci9pbmNsdWRlL2xpbnV4L21vdW50Lmg6OTI6NjogCmVycm9yOiBtdWx0aXBsZSBkZWZpbml0
aW9uIG9mIOKAmGVudW0gZnNjb25maWdfY29tbWFuZOKAmQogICAgOTIgfCBlbnVtIGZzY29uZmln
X2NvbW1hbmQgewogICAgICAgfCAgICAgIF5+fn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIAouLi8uLi8uLi8uLi9saWJzYW5pdGl6ZXIvc2FuaXRpemVyX2NvbW1vbi9zYW5pdGl6
ZXJfcGxhdGZvcm1fbGltaXRzX3Bvc2l4LmNwcDo2MjoKL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1aWxkL2djYy9pbmNs
dWRlLWZpeGVkL3N5cy9tb3VudC5oOjI0OTo2OiAKbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBo
ZXJlCiAgIDI0OSB8IGVudW0gZnNjb25maWdfY29tbWFuZAogICAgICAgfCAgICAgIF5+fn5+fn5+
fn5+fn5+fn4KYGBgCgpJIGRpZCBzcGVudCBlbnRpcmUgbW9ybmluZyBsYXN0IHR3byBkYXlzIGFn
byBhbmQgSSBmaWd1cmVkIG91dCB0aGF0IG5vIAptYXR0ZXIgaG93IGRvIEkgZGV0ZWN0IGxpbnV4
L21vdW50LmggcHJlc2VuY2UgaW4gInN5cy9tb3VudC5oIiwgKiplbnVtIApmc2NvbmZpZ19jb21t
YW5kKiogc3RpbGwgaW4gY2xhc2ggYmV0d2VlbiBsaW51eC1oZWFkZXJzIGFuZCBnbGliYy4gCkhv
d2V2ZXIsIHRoZSBwcm9ibGVtIG9ubHkgZXhpc3QgaW4gZ2xpYmMgdjIuMzYgd2hlcmVhcyBubyBl
ZmZlY3Qgd2hlbiBJIApjaGFuZ2VkIGxpbnV4IHZlcnNpb24uIFRodXMsIGxpbnV4LWhlYWRlcnMg
c2VlbXMgdG8gYmUgZGVjbGFyZWQgYWZ0ZXIgCmdsaWJjLgoKPiBIb3cgaXMgdGhpcyBhIGJ1aWxk
cm9vdC1zcGVjaWZpYyBidWc/IENhbiB5b3UgZWxhYm9yYXRlIG9uIHRoYXQgcGFydD8gCj4gSWYK
PiBpdCBpcyByZWFsbHkgYSBidWlsZHJvb3QtcmVsYXRlZCBidWcsIHRoZW4gd2Ugd2FudCB0byB1
bmRlcnN0YW5kIGl0LCAKPiBhbmQKPiBmaXggaXQsIG5vdCB3b3JrIGFyb3VuZCBpdC4KCkJlY2F1
c2UgaXQgc3VjY2Vzc2Z1bGx5IGNvbXBpbGVkIGluIEdlbnRvbyBidXQgZmFpbGVkIHdoZW4gY29t
cGlsZSAKQnVpbGRyb290IGZvciBSYXNwYmVycnkgUGkgNCBhbmQgUmFzcGJlcnJ5IFBpIDMsIHdp
dGggZGVmYXVsdCAKY29uZmlndXJhdGlvbi4gVGhlIHJlYXNvbiB3aHkgSSBhc2tlZCAiSXMgdGhp
cyBwb3NzaWJsZSBvbiBCdWlsZHJvb3Q/IiAKaXMgdG8gZ2l2ZSB5b3UgdHdvIG9wdGlvbnM6CjEu
IElmIHBvc3NpYmxlLCBsZXQncyBtYWtlIHN1cmUgbGludXgtaGVhZGVycyBpbnN0YWxsZWQgYmVm
b3JlIGdsaWJjCjIuIElmIG5vdCwgbGV0J3Mgd29ya2Fyb3VuZCBmb3IgYSB3aGlsZSB1bnRpbCB0
aGVyZSdzIGEgcmV2ZWxhdGlvbiBmcm9tIAp1cHN0cmVhbQoKPiBUaGlzIGlzIGV4YWN0bHkgd2hh
dCB3ZSBhcmUgZG9pbmcgYWxyZWFkeSwgYW5kIGZvciBhcyBsb25nIGFzIEJ1aWxkcm9vdAo+IGhh
cyBzdXBwb3J0ZWQgYnVpbGRpbmcgYSBnbGliYy1hc2VkIHRvb2xjaGFpbiwgYXMgdGhlIGtlcm5l
bCBoZWFkZXJzIAo+IGFyZQo+IHJlcXVpcmVkIHRvIGJ1aWxkIGdsaWJjOyBzZWUgcGFja2FnZS9n
bGliYy9nbGliYy5ta0AyODoKCldlbGwgdGhhdCdzIGludGVyZXN0aW5nLiBXb25kZXIgd2h5IHRo
YXQgZW51bSByZWRlY2xhcmF0aW9uIGVycm9yIGV4aXN0IAphbmQgbXkgbGFzdCBwYXRjaCBhY3R1
YWxseSB3b3Jrcy4KCj4gVG8gYmUgbm90ZWQsIGFuZCBhcyBUaG9tYXMgbm90aWNlZCwgT3BlbkVt
YmVkZWQgaXMgYWxzbyB1c2luZyBhIGdsaWJjCj4gMi4zNiBjb21taXQsIGFuZCBldmVuIG9uZSBv
bGRlciB0aGFuIG91cnMsIGJ1dCB0aGV5IGRvIG5vdCBzZWVtIHRvIGhhdmUKPiBpc3N1ZXMuCgpI
b25lc3RseSwgSSBvbmx5IHRlc3RlZCBpdCBvbiBteSBSYXNwYmVycnkgUGkgNCBhbmQgbXkgZnJp
ZW5kJ3MgClJhc3BiZXJyeSBQaSAzIHdpdGggbGF0ZXN0IG9yaWdpbi9tYXN0ZXIgYW5kIGRlZmF1
bHQgY29uZmlndXJhdGlvbi4gClllc3RlcmRheSwgSSByZWFsaXplZCB0aGF0IGFsbCByYXNwYmVy
cnkgYm9hcmRzIGFyZSBzeW1saW5rZWQgaW50byBvbmUgCmRpcmVjdG9yeSBhZnRlciBjaGVja2Vk
IGF1dG9idWlsZC4gUGVyaGFwcywgYm9hcmQgc3BlY2lmaWMgaXNzdWU/IElmIApjb3JyZWN0LCBJ
J20gZ29pbmcgdG8gcGF0Y2ggdGhlIGN1c3RvbSBrZXJuZWwgaW5zdGVhZCwgcGx1cyBidW1wIGl0
LgoKSSBhbHNvIG5vdGljZWQgUmFzcGJlcnJ5IFBpIGJvYXJkcyBhcmUgbWFya2VkIE9SUEggYXQg
YXV0b2J1aWxkLiBJcyB0aGF0IAptZWFucyBvcnBoYW4/IElmIHllcywgSSB3b3VsZCBnbGFkbHkg
Y29udHJpYnV0ZSBhcyBib2FyZCBtYWludGFpbmVyLiAKVGhhbmsgeW91IGZvciB5b3VyIGNvb3Bl
cmF0aW9uLgoKUmVnYXJkcywKQXRoYWFyaXEgQXJkaGlhbnN5YWgKCk5COiBNeSBuaWNrbmFtZSBp
cyBFcmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
