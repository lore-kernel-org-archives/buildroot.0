Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D78C5321D
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95BBC6063F;
	Fri, 23 Aug 2024 22:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LetPTSA9WvdE; Fri, 23 Aug 2024 22:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B464F60641
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B464F60641;
	Fri, 23 Aug 2024 22:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73F7E1BF32A
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 22:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530CC40130
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 22:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBfRr8SvX-cs for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 22:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08555400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08555400BF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08555400BF
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 22:16:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1sZTNw3img-00TWn8; Sat, 24
 Aug 2024 00:15:39 +0200
Date: Sat, 24 Aug 2024 00:15:37 +0200
To: Rich Felker <dalias@libc.org>
Message-ID: <ZskKCSueNCn3Ltg-@probook>
References: <20240811-microblaze-v1-1-2781ba343e75@gmx.net>
 <20240811215226.GK10433@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240811215226.GK10433@brightrain.aerifal.cx>
X-Provags-ID: V03:K1:tL8F7XtaymuUwsRVWAvHgy0za+FCFEAPy3LV78xd+VvCgCKJyYm
 bA9rOlBN3tDEQ+xU9MLRAGZM4qGUcf8HfXFEzmSVeafn0ECrwG2kEozbv9RyE3BRGz/w4M5
 kXHFQ4VVgBQhBfl+1Y723qt6DkC+aXSGafaYCl7N4kh7I1R49bbR3e4jxfyLcGbvlhLhzdQ
 3ymTSLMT9ydMuNd5cqUyQ==
UI-OutboundReport: notjunk:1;M01:P0:l+TDhp1UiSQ=;rYAtVOIChtUcfmzLl3j5OUIM9Gp
 KldbPaar7/lSLyMKxwoZjIRuOd3wy+gatTHGfZ0K7ga+6ZN15gF4J0KvF0hwnDGioDDngwmlx
 gvPeyLZDbiNM5vLZevUr5Di+Jq9nxPMJQzI7NkEU99GB0gGSi5SWq5rVlgq9vq2ubaP7mZVCN
 Doia2He3sSvsbXJP8fmsl8T8zoucsDM9rq+9B8DsNMMQxY0fu/RnAfFmSpSKVaMS9mnIBca/3
 dScHjwD43RL32UrMyxXFyND2S6BSsrRlaF41kdAyq4g6oh3Vyy0ln2cBk4O/u3EJhR8rDSNFW
 iFcBTHDfvtPzN9hVPQX72akQLrGJFG0+ivwmPXYoSfl1UtIh6XEYMWLzdyypgs2/PpozZ0rvD
 Q5Qlg++OHloc+vGB6Md+LyjGdbiOysVkpg/vkdWdNKdsyavriKdJ9APFkvDpyocaec06/nNKy
 N8QjjO361yek77+/CjJXcjzhf/lBY8pzqp23bo+K0+gXURma+k5jqLdwmhLNemt4qZDV1ZKXB
 6FKFk504skt0N+AKhCz0ktPEmaBoOjn+iIRL/sUlgdXJJwHBc1r+v3vIObchI+Nd94psVBUmn
 JW9RgF85BgDI/nzjRwDyH3b6F5RIkSXqzPSTs6GYy1vIlzfGIGkHu2/hlCS4h3+U/8J/NTiJf
 vfuk0mXNLCoDcDiWqppNhB/Y+97u8naa8rfYAd+GnNdonVTyG4HBsJitViGoYYOQxFcl5sIWB
 AafeDjSE9NUAUdttTVXVhMeID9YTi20AWv6gpSen38T+oDHCA9j10kUpCJgO8KC+Wk7YSyIFm
 jXZVpJxVrRydL+1RGE7z8jtXyltAmZk2lZjCi3NtlwLmkBHybpsNFvRt5tgGhSOgtG5ZtI+8X
 EQazU3fF4tcZn/w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724451339; x=1725056139; i=j.neuschaefer@gmx.net;
 bh=paGp0WKaEbasNKAaskPRDh017qz5ocTTl1naIKrlS7A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aDx8cjCc5fx5eG53DQaLhTiAqQWCPj2AFtVvZNgO/gP/SbywQHc1iR7SPf+IxsOO
 4c5umYjS4oLSdp+bO85NrUeWow6S22A9WBdiQal8y/Tp2lycFuZ8hZltV8kTlMt37
 BCLZzfM/DLCWVxADE2KSaMgg+9gXZ8oN3O4asTNbiyTBVsKWXl2eUA9/Jy6sVIrYc
 ZxPtAa+uBdTg7GUie09z3LwVo1FGmaHg+kKw0AuQ1OjGY8lmWqiU1rUwBF/OoSq28
 Ka/z8arbgAZ+58p4LPkZGqYn3KgRUaxjS42rR1MbymFPZPQBpkYmF5aiWOowftcRt
 ac8jg4HJWFaUxCw2Fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=aDx8cjCc
Subject: Re: [Buildroot] [musl] [PATCH lvm2] acinclude.m4: Link when trying
 CCFLAGS
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: buildroot@buildroot.org, musl@lists.openwall.com,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 lvm-devel@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMTEsIDIwMjQgYXQgMDU6NTI6MjlQTSAtMDQwMCwgUmljaCBGZWxrZXIgd3Jv
dGU6Cj4gT24gU3VuLCBBdWcgMTEsIDIwMjQgYXQgMTE6MDQ6MzhBTSArMDIwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBUaHJvdWdoIGEgYnVpbGQgZmFpbHVyZSBvZiBMVk0yIG9uIG11c2wt
bGliYyAxLjIuNSBpbiB0aGUgQnVpbGRyb290Cj4gPiBhdXRvYnVpbGQgc2VydmljZVsxXSwgSSBu
b3RpY2VkIHRoYXQgbXVzbC1saWJjJ3MgU2NydDEgZm9yIG1pY3JvYmxhemUKPiA+IHByb2R1Y2Vz
IGEgcmVsb2NhdGlvbiB0YXJnZXRpbmcgdGhlIC50ZXh0IHNlY3Rpb24sIHdoaWNoIHN1YnNlcXVl
bnRseQo+ID4gbGVhZHMgdG8gYSBjcmFzaCBhdCBydW4tdGltZSBiZWNhdXNlIG11c2wtbGliYyBk
b2VzIG5vdCBzdXBwb3J0Cj4gPiB0ZXh0cmVsc1syXS4gQnVpbGRyb290IHVzZXMgdGhlICIteiB0
ZXh0IiBsaW5rZXIgb3B0aW9uIHRvIGNhdGNoCj4gPiB0ZXh0cmVscyBlYXJseSwgb24gbXVzbC1s
aWJjLgo+ID4KPiA+IFRoZSBlcnJvciBjYW4gYmUgcmVkdWNlZCB0byB0aGUgZm9sbG93aW5nIHRl
c3QgY2FzZToKPiA+Cj4gPiAgICQgY2F0IGhlbGxvLmMKPiA+ICAgI2luY2x1ZGUgPHN0ZGlvLmg+
Cj4gPiAgIGludCBtYWluKHZvaWQpIHsgcHV0cygiSGVsbG8gd29ybGQhIik7IHJldHVybiAwOyB9
Cj4gPiAgICQgaG9zdC9iaW4vbWljcm9ibGF6ZS1idWlsZHJvb3QtbGludXgtbXVzbC1nY2MgaGVs
bG8uYyAteiB0ZXh0IC1waWUgLWZQSUMKPiA+ICAgbWljcm9ibGF6ZS1idWlsZHJvb3QtbGludXgt
bXVzbC9iaW4vbGQ6IG1pY3JvYmxhemUtYnVpbGRyb290LWxpbnV4LW11c2wvc3lzcm9vdC9saWIv
U2NydDEubzoKPiA+ICAgICB3YXJuaW5nOiByZWxvY2F0aW9uIGFnYWluc3QgYF9zdGFydF9jJyBp
biByZWFkLW9ubHkgc2VjdGlvbiBgLnRleHQnCj4gPiAgIG1pY3JvYmxhemUtYnVpbGRyb290LWxp
bnV4LW11c2wvYmluL2xkOiByZWFkLW9ubHkgc2VnbWVudCBoYXMgZHluYW1pYyByZWxvY2F0aW9u
cwo+ID4gICBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKWy4uLl0K
Pgo+IE5vIG9iamVjdGlvbiwgYnV0IHRoaXMgaXMgYSBidWcgaW4gdGhlIHRvb2xpbmcgKGxkKSB0
aGF0IHdlIGNvdWxkIGFsc28KPiBhdm9pZCBvbiB0aGUgbXVzbCBzaWRlLiBTbyB0aGVyZSBhcmUg
cHJvYmFibHkgMyBwbGFjZXMgdGhpbmdzIHNob3VsZAo+IGJlIGNoYW5nZWQgaGVyZS4KPgo+IFJp
Y2gKCkkgZmluYWxseSBnb3QgYXJvdW5kIHRvIHRlc3RpbmcgeW91ciBtdXNsIHBhdGNoIChodHRw
Oi8vMHgwLnN0L1hXQjkuZGlmZiAtCiJ1c2UgaGlkZGVuIHZpc2liaWxpdHkgZm9yIEMgZW50cnkg
cG9pbnQgZnVuY3Rpb24gX3N0YXJ0X2MiKS4KSXQgc29sdmVzIHRoZSBpbW1lZGlhdGUgcHJvYmxl
bSBmb3IgbWljcm9ibGF6ZShlbCkgYXMgZmFyIGFzIEkgY2FuIHNlZS4KCkknbSBub3QgZmFtaWxp
YXIgZW5vdWdoIHdpdGggbGlua2VyIGludHJpY2FjaWVzIHRvIHdyaXRlIGEgYmludXRpbHMvbGQK
YnVnIHJlcG9ydCB0aG91Z2guCgoKLS0gam4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
