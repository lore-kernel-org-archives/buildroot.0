Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683C1CD1284
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 08:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E4DD409C8;
	Thu, 11 Apr 2024 08:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIgdosgsOpfu; Thu, 11 Apr 2024 08:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6644182B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E6644182B;
	Thu, 11 Apr 2024 08:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74DB51BF5B4
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 08:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E6B74154B
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 08:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNF4lpT9K6Cj for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 08:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E43FB41498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43FB41498
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E43FB41498
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 08:52:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B6072C66AB
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 08:49:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B987DFF80B;
 Thu, 11 Apr 2024 08:49:17 +0000 (UTC)
Message-ID: <82048c8b-4f00-4201-9fc3-ade35a6b4270@bootlin.com>
Date: Thu, 11 Apr 2024 10:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
References: <20240329143138.214780-1-alexis.lothore@bootlin.com>
 <20240410232020.623f20ed@windsurf>
Content-Language: en-US
In-Reply-To: <20240410232020.623f20ed@windsurf>
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712825358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VddqKrQMOkh5eR4OZ5T90Vyg8ltEUDMXi0adHlJiOok=;
 b=WkT78tf74+DLfYnNKDaRKH2USODjKPWIEhDYjuFWozQ202nOoIdrjVALh1Rfel8jxnbsSv
 xo/CYzKB2PpsM2Q/fYp+TPI53qvhwNuxHXCMewUzqq0tR/uhR0dy+SJo+a9HgOkaCn9Riu
 5YIL1cxtMTOxCDZ+sfoksQJxTCT5LX8XAv1HKx7ODjwIfqk839xcDgGRuk4sZdiOE3hACz
 3EsE6H/3/B2OOX9rse2c+GtjMnEv6ABqRkbpXcC93eIzEOEDcndfQR1foBUveMc2lFf3MS
 4zfTw7Ivsvgw0K+H5V2k3T4EHzd1I1NiObPK3ZM6yhzkvRA3Es/dmFywSG5dkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WkT78tf7
Subject: Re: [Buildroot] [PATCH 0/3] package/pppd: fix pppd startup with
 upstream patches
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gNC8xMC8yNCAyMzoyMCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiBUaGFua3MgZm9yIHRoaXMgc2V0IG9mIHBhdGNoZXMuIEhvd2V2ZXIsIHRoZSB3YXkgeW91IGZv
cm1hdHRlZCB0aGUKPiBwYXRjaGVzIGlzIG5vdCBxdWl0ZSB3aGF0IHdlIGV4cGVjdC4KPiAKPiBX
ZSBleHBlY3QgeW91IHRvOgo+IAo+ICAoMSkgZ2l0IGNoZXJyeS1waWNrIHRoZSBjb21taXRzCj4g
Cj4gICgyKSBBZGQgYW4gVXBzdHJlYW06IHRhZyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQgbWVz
c2FnZSwgZm9sbG93aW5nCj4gICAgICBieSB5b3VyIFNpZ25lZC1vZmYtYnkgbGluZQo+IAo+ICAo
MykgVXNlICJnaXQgZm9ybWF0LXBhdGNoIC1OIiB0byBmb3JtYXQgdGhlIDMgcGF0Y2hlcwo+IAo+
IFJpZ2h0IG5vdyB5b3UgaGF2ZSBtb3JlIG9yIGxlc3MgIndyYXBwZWQiIHRoZSBwYXRjaGVzIGlu
dG8gY29tbWl0cyB5b3UKPiBhcmUgdGhlIGF1dGhvciBvZiwgYW5kIHlvdXIgU2lnbmVkLW9mZi1i
eSBsaW5lIGlzIG1pc3NpbmcuCj4gCj4gTG9vayBhdCBwYWNrYWdlL3dheWxhbmRwcC8wMDAxLWFk
ZC1taXNzaW5nLWNzdGRpbnQtaW5jbHVkZS5wYXRjaCBmb3IgYW4KPiBleGFtcGxlIG9mIGEgcHJv
cGVybHkgZm9ybWF0dGVkIHBhdGNoLiBTZXJnZWkgVHJvZmltb3ZpY2ggaXMgdGhlCj4gb3JpZ2lu
YWwgYXV0aG9yLCBCZXJuZCBLdWhscyBpcyB0aGUgcGVyc29uIHdobyBicm91Z2h0IHRoZSBwYXRj
aCBpbnRvCj4gQnVpbGRyb290LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgYW5kIGV4YW1wbGUs
IGFuZCBzb3JyeSBmb3IgdGhlIG1lc3MsIEkgd2lsbCB1cGRhdGUKYWNjb3JkaW5nbHkgYW5kIHNl
bmQgYSB2Mi4KCkFsZXhpcwo+IAo+IENvdWxkIHlvdSByZXdvcmsgeW91ciBwYXRjaCBzZXJpZXMg
YWNjb3JkaW5nbHk/Cj4gCj4gVGhhbmtzIGEgbG90IQo+IAo+IFRob21hcwoKLS0gCkFsZXhpcyBM
b3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
