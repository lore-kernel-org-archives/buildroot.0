Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A4C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 15:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC38418FF;
	Thu,  1 Dec 2022 15:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC38418FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcNr-py6IGqO; Thu,  1 Dec 2022 15:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A19418DC;
	Thu,  1 Dec 2022 15:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A19418DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 179A11BF83E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 15:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D109240949
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 15:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D109240949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLK-Fcls0vAa for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 15:51:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33116404EC
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33116404EC
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 15:51:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23F06100010;
 Thu,  1 Dec 2022 15:51:51 +0000 (UTC)
Date: Thu, 1 Dec 2022 16:51:50 +0100
To: Leonid Yuriev <leo@yuriev.ru>
Message-ID: <20221201165150.4746c32e@windsurf>
In-Reply-To: <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
References: <20221201104313.25K7I8a6@myt5-1a3effcffc39.qloud-c.yandex.net>
 <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669909913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRL8+d58xtRQQ5F0v5/cIySSOetcxJxKLC/TUDJUm7s=;
 b=RWfPUnQuu6OUAVBYfc7rZ6kws4VGkyFr56jgsNVxs2PL9PDL+4gw9D3KBAIH9xaVmsSYoX
 w88L8rZohTgnxMEKIFxha8pw04YTf83CUs1f1fAreYQxWj8REaHpa6Wl9UZnPjrD8zvL36
 ylK5pcPQNiWZZ1FDMUar8ln7Qvt7XLIvUXmQQcs1vKsDYnBK4xJuhLMP14uYiIJqxJTzlm
 76BqAJLgO+sqMftQVtqxg8jUHU3Asc6L8dcF763BMymQgevXHk4JS0YkiYF43HXUA0XPuN
 /pDl5Mm2oKO23JbHGyvnQoAPv5KgDHf+kmOApNmlnp9n97WhyLVWqyQgdV4KPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RWfPUnQu
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-30
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

SGVsbG8gTGVvbmlkLAoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLiBDb3VsZCB5b3UgcHJvdmlk
ZSBtb3JlIHNwZWNpZmljLCBzdWNoIGFzCndoaWNoIHNwZWNpZmljIHZlcnNpb24gYnVtcCBmaXhl
ZCB0aGlzIGlzc3VlPwoKQmVzdCByZWdhcmRzLAoKVGhvbWFzIFBldGF6em9uaQoKT24gVGh1LCAx
IERlYyAyMDIyIDE4OjM3OjAyICswMzAwCkxlb25pZCBZdXJpZXYgPGxlb0B5dXJpZXYucnU+IHdy
b3RlOgoKPiBIaSwKPiAKPiBKdXN0IGluIGNhc2UsIEkgZGVjaWRlZCB0byBub3RpZnkgdGhhdCB0
aGUgcHJvYmxlbSBoYXMgYmVlbiBmaXhlZCBpbiB0aGUgCj4gbGF0ZXN0IHZlcnNpb24uCj4gSS5l
LiBpdCBpcyBlbm91Z2ggdG8gYmFja3BvcnQgYSBsaWJtZGJ4JyBwYWNrYWdlIHBhdGNoZXMgZnJv
bSB0aGUgbWFzdGVyIAo+IGJyYW5jaC4KPiAKPiBSZWdhcmRzLAo+IExlb25pZC4KPiAKPiAwMS4x
Mi4yMDIyIDEwOjQzLCBUaG9tYXMgUGV0YXp6b25pINC/0LjRiNC10YI6Cj4gPiBIZWxsbywKPiA+
Cj4gPiBBdXRvYnVpbGRlciBmYWlsdXJlcwo+ID4gPT09PT09PT09PT09PT09PT09PT0KPiA+Cj4g
PiBCZWxvdyBpcyBhIGxpc3Qgb2YgYnVpbGQgZmFpbHVyZXMgcmVwb3J0ZWQgYnkgdGhlIEJ1aWxk
cm9vdCBhdXRvYnVpbGRlcnMKPiA+IGluIHJlbGF0aW9uIHRvIHBhY2thZ2VzIG9yIENQVSBhcmNo
aXRlY3R1cmVzIHlvdSBhcmUgaW4gY2hhcmdlIG9mLgo+ID4gUGxlYXNlIGhlbHAgdXMgaW1wcm92
aW5nIHRoZSBxdWFsaXR5IG9mIEJ1aWxkcm9vdCBieSBpbnZlc3RpZ2F0aW5nIHRob3NlCj4gPiBi
dWlsZCBmYWlsdXJlcyBhbmQgc2VuZGluZyBwYXRjaGVzIHRvIGZpeCB0aGVtLgo+ID4KPiA+IFJl
c3VsdHMgZm9yIHRoZSAnbWFzdGVyJyBicmFuY2gKPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+Cj4gPiBCdWlsZCBmYWlsdXJlcyByZWxhdGVkIHRvIHlvdXIgcGFja2FnZXM6
Cj4gPgo+ID4gICAgICBhcmNoICAgICB8ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXJsCj4gPiAtLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gICBtaWNyb2JsYXplICB8ICAgICAgICBsaWJtZGJ4LTAuMTEuMTIgICAgICAgICB8
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzA2ZDlmM2M1YWQ2YTQ0MTU2
ODVkZWE2YzVmYjJmN2FlZDkxMGFhNmUKPiA+Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIGNvbnRy
aWJ1dGlvbiB0byBCdWlsZHJvb3QhCj4gPiAgCgoKCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
