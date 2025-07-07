Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FEDC8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426D36140A;
	Mon,  7 Jul 2025 14:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruXhXrX-Bt1U; Mon,  7 Jul 2025 14:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6019460C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6019460C27;
	Mon,  7 Jul 2025 14:05:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D367D12E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C502340DAD
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3h9y2T5xG7q for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A58B540D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A58B540D93
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A58B540D93
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:05:32 +0000 (UTC)
X-CSE-ConnectionGUID: e1nnMgRUQf+DiqavWU509A==
X-CSE-MsgGUID: WblAWSznSbSs2G+H2uIsiA==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 16:05:30 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jul 2025 16:05:29 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Mon, 7 Jul 2025 16:05:28 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 07 Jul 2025 16:05:28 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: AviJXlEZS5e4MDQ6wpHHgA==
X-CSE-MsgGUID: BXAUCdHSQ6OOdcWvRvIONw==
X-IronPort-AV: E=Sophos;i="6.16,294,1744063200"; d="scan'208";a="310669823"
Date: Mon, 7 Jul 2025 16:05:28 +0200
To: Christian Stewart <christian@aperture.us>
CC: Romain Naour <romain.naour@smile.fr>, <buildroot@buildroot.org>
Message-ID: <aGvUKCGdENQ0TUJ8@yd-6wlzhs3>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
 <CA+h8R2r9JW=D=0gmyiMvwVhZzyQaq5RhKpH=TM=Dd8t_rNaoQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2r9JW=D=0gmyiMvwVhZzyQaq5RhKpH=TM=Dd8t_rNaoQA@mail.gmail.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX108.corporate.adroot.infra.ftgroup (10.115.27.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751897133; x=1783433133;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=Nb0G+UT0ZE1uome3qxxszBQfOBjoYJ5Tori+TYQFak8=;
 b=Cnqydl/z/83mjr2nHqeQjYVb+zgFBEW2KaZ7JOskgwRtaYzECqPQPKON
 nwZhSLWSryEvYeMO2nWxuOeQtHKzkWJz+8VfqHpTmKSrjEO3NbyasECR6
 Fs1PcrjbsMTqGDMU2uYYhHHjz/bAiG4NnskLT7/ORsC5ANg3h7pc+wDDk
 V2Nd9r2sw44RbJvNW0pcmB6cJ1DXr7V0FM34OhH+19sYwAa9jS2rxQD8U
 bK6KCTrfe2DOaO1NNF1eU7j/2G+B+wt13HkWtD723286JsAmZO8p0IMGF
 XiaIN7CWQmiSHEWEglfqZcwfTE9siCyI1I+JLJrB8lKw+VpI5ND5GPk9M
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Cnqydl/z
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTA3LTA2IDE1OjA2IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gU2F0LCBKdWwgNSwgMjAyNSBhdCAxOjUx4oCvUE0gUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4gTGUgMDEvMDcvMjAy
NSDDoCAxNTo0NSwgeWFubi5tb3JpbkBvcmFuZ2UuY29tIGEgw6ljcml0IDoKWy0tU05JUC0tXQo+
ID4gPiBXZSBub3cgY29uc2lkZXIgdGhhdCBfSU5TVEFMTF9CSU5TIGlzIGFuIGludGVybmFsIGlt
cGxlbWVudGF0aW9uIGRldGFpbHMKPiA+ID4gdGhhdCBzaG91bGQgbm8gbG9uZ2VyIGJlIGV4cG9z
ZWQgdG8gdGhlIHVzZXJzLCBzbyB3ZSBkcm9wIGl0IGZyb20gdGhlCj4gPiA+IGRvY3VtZW50YXRp
b247IHdlIHJlcGhyYXNlIHRoZSBjb3JyZXNwb25kaW5nIHBhcnQgZm9yIF9CVUlMRF9UQVJHRVRT
Lgo+IElzIHRoZXJlIGFueSBjYXNlIHdoZXJlIHdlIHdvdWxkIHN0aWxsIHdhbnQgdG8gb3ZlcnJp
ZGUgdGhpcz8KClRoZSB0aGluZyBpcyB0aGF0LCBpbiB0aGUgY2FzZSBvZiBtdWx0aXBsZSBfQlVJ
TERfVEFSR0VUUywgdGhlaW5mcmEKZ2VuZXJhdGVzIGV4ZWN1dGFibGVzIGJhc2VkIG9uIHRoZSBi
YXNlbmFtZSBvZiBlYWNoIF9CVUlMRF9UQVJHRVRTOyBhcwp0aGUgZXhhbXBsZSBpbiB0aGUgZG9j
IGRlc2NyaWJlczsgZm9yIGV4YW1wbGUsIGdpdmVuOgogICAgRk9PX0JVSUxEX1RBUkdFVFMgPSBj
bWQvZG9ja2VyIGNtZC9kb2NrZXJkCgp0aGVuIHRoZSBnZW5lcmF0ZWQgZXhlY3V0YWJsZXMgYXJl
ICJkb2NrZXIiIGFuZCAiZG9ja2VyZCIuCgpTbywgaWYgd2UgYWxsb3cgc2V0dGluZyBfSU5TVEFM
TF9CSU5TIHRvIGFuIGFyYml0cmFyeSBsaXN0LCBpdCBjYW4KZWFzaWx5IGdldCBvdXQgb2Ygc3lu
YyB3aXRoIHRoZSBsaXN0IGluIF9CVUlMRF9UQVJHRVRTLiBBbmQgdGhlcmUgaXMKYWxzbyBubyB3
YXkgdG8gc2V0IHRoZSBuYW1lIG9mIHRoZSBnZW5lcmF0ZWQgZXhlY3V0YWJsZSBmb3IgZWFjaCBl
bnRyeQppbiBfQlVJTERfVEFSR0VUUy4uLgoKU28sIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8g
a2VlcCBfSU5TVEFMTF9CSU5TIHNldHRhYmxlIChzZWUgdGhlIGxhc3QKcGF0Y2ggaW4gdGhlIHNl
cmllcykuCgo+IEkgZ3Vlc3MKPiB0aGUgbG9naWMgaXMgd2Ugd291bGQgbmV2ZXIgYm90aGVyIGJ1
aWxkaW5nIGEgYmluYXJ5IGlmIHdlIGRvbid0Cj4gaW5zdGFsbCBpdC4KCkV4YWN0bHk6IGlmIHlv
dSBkb24ndCB3YW50IGl0IGluc3RhbGxlZCwgZG9uJ3QgYnVpbGQgaXQuIDstKQoKSWYgdGhlIHBh
Y2thZ2UgaGFzIG9wdGlvbmFsIGJpbmFyaWVzLCB0aGV5IGNhbiBqdXN0IGJlIGNvbmRpdGlvbmFs
bHkKYWRkZWQgdG8gX0JVSUxEX1RBUkdFVFMganVzdCBhcyB3ZSBkbyBpdCBmb3IgYW55IGtpbmQg
b2YgcGFja2FnZQppbmZyYS4KCj4gVGhpcyBtYWtlcyBzZW5zZSB0byBtZSBidXQgSSBkb24ndCB0
aGluayBvZiBhbnkgZXhjZXB0aW9ucwo+IGF0IHRoZSBtb21lbnQuIEkgaGF2ZW4ndCB0b3VjaGVk
IHRoaXMgaW4gc28gbG9uZyBzbyBJIGRvbid0IGtub3cgZm9yCj4gc3VyZS4KCkVoLCBJIGtub3cg
dGhlIGZlZWxpbmcuIDstKQoKPiBJIHdpbGwgZ28gYWhlYWQgYW5kIHRlc3QgdGhpcyBzZXJpZXMg
b24gbXkgZW5kLgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFw
ZXJ0dXJlLnVzPgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shIPCfkY0KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
X19fX19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAg
IF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAg
ICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAg
fAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAg
WCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAg
fF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdl
IGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMg
Y29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBl
dHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2
b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVy
DQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2lu
dGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRl
cmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2Fn
ZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3Nh
Z2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmls
ZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91
bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRp
b24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50
cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1l
c3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRo
YW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
