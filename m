Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B06CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 17:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 789E6418E8;
	Wed,  4 May 2022 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uinz03-N6Eyw; Wed,  4 May 2022 17:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB2A416BC;
	Wed,  4 May 2022 17:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08D7A1BF215
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 065E383F49
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65F_hIkbyVmF for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 17:19:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E64A883F4B
 for <buildroot@buildroot.org>; Wed,  4 May 2022 17:19:15 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id x18so1993039plg.6
 for <buildroot@buildroot.org>; Wed, 04 May 2022 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YI7NaXPbDEqSa+lJMi3FZS0hLVNdRUm0KfrUG/dCsP8=;
 b=hGMeqjwfXuJ+KSZDhwZpuqRspX3H2Pyvp3ZUMQfKOZ2rATyQN4gHbpUSMa1by/F2GH
 TUb3VE14r/aUzQPBXH0cCBORRJ2pjs+TgohXOj/hmQ4tfJHKP2ObFnDHddE7itnQAvHi
 og1lN/7josTO3xTtNCGc5r+GQeg/MW9Q5Vj8TYEUtD+MhkqXX9tp+PmJZfezTFItp5BL
 I4Funa+jl9wAHu2f0WAkynDp/K2RtQZKBz0P4N+12i7kzDskqA4q4S4Ig43RM+YFhgHm
 tabbsnewLbKsUz+WYTcCIIWTIOYqzJows3m0lrEJaxQHDRrhZM6YkJNqy4aeMCn+aupp
 Uwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YI7NaXPbDEqSa+lJMi3FZS0hLVNdRUm0KfrUG/dCsP8=;
 b=Dpulkzxlyth1c3OG3fzKglifmZMZkSwCr6+8nTgpQnSunmh9g0f8PNSrlsX0ZDwqhd
 nVbP4F+2nPfLxpFkGIqfMa5tG/g0OH9nuPHgrEzQ3xEwv7HoAGJZ8X6Da2rYfpM880k+
 6RQ5ZQn7IBIURK4C23ATOStE0Kgf+Un8blRt6+P+Xx9eEnsLqYyeVCFw/v9161AnqA0S
 cUQKi9e1PUnLC6kfFKFxUDb8y4cAdSvE6k0W6y73w5rWAF31UiZi0RallPvrp8pjd2CK
 LbpNYpc0gjxgPpgFvJB6JuacK7gGpaZhAAgNvuizfYN8UxOTqVgujg6s+EsrU9VLilqw
 Qb0w==
X-Gm-Message-State: AOAM530kQnfcKOW8iB1qCA/Krv+fsT+RKJE4p7yUrJBCRGxpz5dIbujZ
 gTzJ79rheYcGTe+HEhInQHJwGR8JMzM=
X-Google-Smtp-Source: ABdhPJz1ljYvf015LGQO/k/wVZnxcLgeuQrsxbi5DHv9Lyl/+PJtLtCzBvf364x0Oq60hfxI7udu3g==
X-Received: by 2002:a17:903:2288:b0:15e:8da2:fcc0 with SMTP id
 b8-20020a170903228800b0015e8da2fcc0mr22337012plh.125.1651684755267; 
 Wed, 04 May 2022 10:19:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 n5-20020a170903110500b0015e8d4eb252sm8749724plh.156.2022.05.04.10.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 10:19:14 -0700 (PDT)
Message-ID: <24981261-e478-294f-948a-519735ce79be@gmail.com>
Date: Wed, 4 May 2022 10:19:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220504025732.1788544-1-f.fainelli@gmail.com>
 <87czgt3h8d.fsf@dell.be.48ers.dk>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <87czgt3h8d.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH] package: Add cpulimit
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNS80LzIyIDAwOjEwLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiRmxvcmlhbiIg
PT0gRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+IHdyaXRlczoKPiAKPiAg
ID4gQ3B1bGltaXQgaXMgYSB0b29sIHdoaWNoIGxpbWl0cyB0aGUgQ1BVIHVzYWdlIG9mIGEgcHJv
Y2VzcyAoZXhwcmVzc2VkIGluCj4gICA+IHBlcmNlbnRhZ2UsIG5vdCBpbiBDUFUgdGltZSkuIEl0
IGlzIHVzZWZ1bCB0byBjb250cm9sIGJhdGNoIGpvYnMsIHdoZW4KPiAgID4geW91IGRvbid0IHdh
bnQgdGhlbSB0byBlYXQgdG9vIG1hbnkgQ1BVIGN5Y2xlcy4KPiAKPiAgID4gU2lnbmVkLW9mZi1i
eTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4gCj4gVGhhbmtzLCBh
IGZldyBjb21tZW50czoKPiAKPj4gLS0tCj4gICA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICAgIHwgIDEgKwo+ICAgPiAgcGFja2FnZS9jcHVsaW1pdC9Db25maWcuaW4gICB8ICA3ICsrKysr
KysKPiAgID4gIHBhY2thZ2UvY3B1bGltaXQvY3B1bGltaXQubWsgfCAyMyArKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gICA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcHVsaW1pdC9Db25maWcuaW4KPiAgID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NwdWxpbWl0L2NwdWxpbWl0Lm1rCj4gCj4gWW91IGFy
ZSBtaXNzaW5nIGEgY3B1bGltaXQuaGFzaCB3aXRoIHRoZSB0YXJiYWxsIGFuZCBsaWNlbnNlIGZp
bGUKPiBoYXNoZXM6Cj4gCj4gaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI2FkZGluZy1w
YWNrYWdlcy1oYXNoCj4gCj4gQW5kIGFuIGVudHJ5IGluIERFVkVMT1BFUlM6Cj4gCj4gaHR0cHM6
Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI0RFVkVMT1BFUlMKCldpbGwgdXBkYXRlLCB0aGFua3Mh
Cgo+IAo+ICAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZp
Zy5pbgo+ICAgPiBpbmRleCA0MzM5NDFkYzAxYjguLmY1NmE4ZmUyNTk0ZCAxMDA2NDQKPiAgID4g
LS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiAgID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiAg
ID4gQEAgLTI1MjQsNiArMjUyNCw3IEBAIG1lbnUgIlN5c3RlbSB0b29scyIKPiAgID4gIAlzb3Vy
Y2UgInBhY2thZ2UvY2lyY3VzL0NvbmZpZy5pbiIKPiAgID4gIAlzb3VyY2UgInBhY2thZ2UvY29u
dGFpbmVyZC9Db25maWcuaW4iCj4gICA+ICAJc291cmNlICJwYWNrYWdlL2NvcmV1dGlscy9Db25m
aWcuaW4iCj4gICA+ICsJc291cmNlICJwYWNrYWdlL2NwdWxpbWl0L0NvbmZpZy5pbiIKPiAgID4g
IAlzb3VyY2UgInBhY2thZ2UvY3B1bG9hZC9Db25maWcuaW4iCj4gICA+ICAJc291cmNlICJwYWNr
YWdlL2RhZW1vbi9Db25maWcuaW4iCj4gICA+ICAJc291cmNlICJwYWNrYWdlL2RjM2RkL0NvbmZp
Zy5pbiIKPiAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3B1bGltaXQvQ29uZmlnLmluIGIvcGFj
a2FnZS9jcHVsaW1pdC9Db25maWcuaW4KPiAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgID4g
aW5kZXggMDAwMDAwMDAwMDAwLi40OGY5ZmFkOTcyZGUKPiAgID4gLS0tIC9kZXYvbnVsbAo+ICAg
PiArKysgYi9wYWNrYWdlL2NwdWxpbWl0L0NvbmZpZy5pbgo+ICAgPiBAQCAtMCwwICsxLDcgQEAK
PiAgID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9DUFVMSU1JVAo+ICAgPiArCWJvb2wgImNwdWxpbWl0
Igo+ICAgPiArCWhlbHAKPiAgID4gKwkgIENwdWxpbWl0IGlzIGEgdG9vbCB3aGljaCBsaW1pdHMg
dGhlIENQVSB1c2FnZSBvZiBhIHByb2Nlc3MgKGV4cHJlc3NlZAo+ICAgPiArCSAgaW4gcGVyY2Vu
dGFnZSwgbm90IGluIENQVSB0aW1lKQo+IAo+IC4vdXRpbHMvY2hlY2stcGFja2FnZSBjb21wbGFp
bnMgYWJvdXQgdGhlIGxpbmUgbGVuZ3RoIGhlcmU6Cj4gCj4gcGFja2FnZS9jcHVsaW1pdC9Db25m
aWcuaW46NDogaGVscCB0ZXh0OiA8dGFiPjwyIHNwYWNlcz48NjIgY2hhcnM+IChodHRwOi8vbmln
aHRseS5idWlsZHJvb3Qub3JnLyN3cml0aW5nLXJ1bGVzLWNvbmZpZy1pbikKPiAKPiAgID4gKwo+
ICAgPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL29wc2VuZ2luZS9jcHVsaW1pdAo+ICAgPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9jcHVsaW1pdC9jcHVsaW1pdC5tayBiL3BhY2thZ2UvY3B1bGltaXQv
Y3B1bGltaXQubWsKPiAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgID4gaW5kZXggMDAwMDAw
MDAwMDAwLi42M2IxNDQ2Y2MwOGIKPiAgID4gLS0tIC9kZXYvbnVsbAo+ICAgPiArKysgYi9wYWNr
YWdlL2NwdWxpbWl0L2NwdWxpbWl0Lm1rCj4gICA+IEBAIC0wLDAgKzEsMjMgQEAKPiAgID4gKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICA+ICsjCj4gICA+ICsjIGNwdWxpbWl0Cj4gICA+ICsj
Cj4gICA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgPiArCj4gICA+ICtDUFVMSU1JVF9W
RVJTSU9OID0gdjAuMgo+ICAgPiArQ1BVTElNSVRfU09VUkNFID0gJChDUFVMSU1JVF9WRVJTSU9O
KS50YXIuZ3oKPiAgID4gK0NQVUxJTUlUX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3BzZW5n
aW5lL2NwdWxpbWl0L2FyY2hpdmUvcmVmcy90YWdzLyQoQ1BVTElNSVRfVkVSU0lPTikKPiAKPiBX
ZSBoYXZlIGEgZ2l0aHViIGhlbHBlciwgc28geW91IGNhbiBqdXN0IGRvOgo+IAo+IENQVUxJTUlU
X1ZFUlNJT04gPSAwLjIKPiBDUFVMSU1JVF9TSVRFID0gJChjYWxsIGdpdGh1YixvcHNlbmdpbmUs
Y3B1bGltaXQsdiQoQ1BVTElNSVRfVkVSU0lPTikpCj4gCj4gSSBkaWQgYSB0ZXN0IGJ1aWxkIGhl
cmUgYW5kIGl0IGZhaWxzIHRvIGJ1aWxkIHdpdGggZ2xpYmMsIGFzIGl0IHVzZXMKPiBzeXMvc3lz
Y3RsLmggKHdoaWNoIHdhcyByZW1vdmVkIGluIGdsaWJjIDIuMzIpOgo+IAo+ICogVGhlIGRlcHJl
Y2F0ZWQgPHN5cy9zeXNjdGwuaD4gaGVhZGVyIGFuZCB0aGUgc3lzY3RsIGZ1bmN0aW9uIGhhdmUg
YmVlbgo+ICAgIHJlbW92ZWQuICBUbyBzdXBwb3J0IG9sZCBiaW5hcmllcywgdGhlIHN5c2N0bCBm
dW5jdGlvbiBjb250aW51ZXMgdG8KPiAgICBleGlzdCBhcyBhIGNvbXBhdGliaWxpdHkgc3ltYm9s
IChvbiB0aG9zZSBhcmNoaXRlY3R1cmVzIHdoaWNoIGhhZCBpdCksCj4gICAgYnV0IGFsd2F5cyBm
YWlscyB3aXRoIEVOT1NZUy4gIFRoaXMgcmVmbGVjdHMgdGhlIHJlbW92YWwgb2YgdGhlIHN5c3Rl
bQo+ICAgIGNhbGwgZnJvbSBhbGwgYXJjaGl0ZWN0dXJlcywgc3RhcnRpbmcgd2l0aCBMaW51eCA1
LjUuCj4gCj4gRG9lcyB0aGlzIHV0aWxpdHkgd29yayB3aXRoIDUuNSsga2VybmVscz8gTXVzbCBh
ZmFpayBhbHNvIGRvZXNuJ3QgaGF2ZQo+IHN5cy9zeXNjdGwuaC4KCkl0IGRvZXMgd29yayB3aXRo
IDUuMTAsIGJ1dCBpdCB3YXMgYnVpbHQgd2l0aCBhIHRvb2xjaGFpbiB0aGF0IHVzZWQgNC4xIApr
ZXJuZWwgaGVhZGVycyBhbmQgZ2xpYmMgMi4yNywgc28gSSBkaWQgbm90IHNlZSB0aGF0LgoKPiAK
PiBwcm9jZXNzX2dyb3VwLmM6IEluIGZ1bmN0aW9uIOKAmGZpbmRfcHJvY2Vzc19ieV9uYW1l4oCZ
Ogo+IHByb2Nlc3NfZ3JvdXAuYzo2NDoxNTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4gICAgIDY0IHwgICBpZiAoc3RybmNtcChiYXNlbmFtZShwcm9jLmNvbW1hbmQpLCBwcm9j
ZXNzX25hbWUsIHN0cmxlbihwcm9jZXNzX25hbWUpKT09MCAmJiBraWxsKHBpZCxTSUdDT05UKT09
MCkgewo+ICAgICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+fn4KPiBwcm9jZXNzX2dyb3VwLmM6
NjQ6MTU6IHdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhzdHJuY21w4oCZIG1ha2Vz
IHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQo+
ICAgICA2NCB8ICAgaWYgKHN0cm5jbXAoYmFzZW5hbWUocHJvYy5jb21tYW5kKSwgcHJvY2Vzc19u
YW1lLCBzdHJsZW4ocHJvY2Vzc19uYW1lKSk9PTAgJiYga2lsbChwaWQsU0lHQ09OVCk9PTApIHsK
PiAgICAgICAgfCAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAg
fCAgICAgICAgICAgICAgIHwKPiAgICAgICAgfCAgICAgICAgICAgICAgIGludAo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBwcm9jZXNzX2dyb3VwLmM6MjI6Cj4gL2hvbWUvcGVrby9zb3VyY2UvYnVp
bGRyb290L291dHB1dC9ob3N0L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vz
ci9pbmNsdWRlL3N0cmluZy5oOjE0MzozMzogbm90ZTogZXhwZWN0ZWQg4oCYY29uc3QgY2hhciAq
4oCZIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmGludOKAmQo+ICAgIDE0MyB8IGV4dGVybiBp
bnQgc3RybmNtcCAoY29uc3QgY2hhciAqX19zMSwgY29uc3QgY2hhciAqX19zMiwgc2l6ZV90IF9f
bikKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fl5+fn4KPiAvaG9t
ZS9wZWtvL3NvdXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FhcmNoNjQtbm9uZS1saW51
eC1nbnUtZ2NjIC1vIGNwdWxpbWl0IGNwdWxpbWl0LmMgbGlzdC5vIHByb2Nlc3NfaXRlcmF0b3Iu
byBwcm9jZXNzX2dyb3VwLm8gLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VS
Q0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAgLU9zIC1nMCAtRF9GT1JUSUZZX1NPVVJDRT0xCj4g
Y3B1bGltaXQuYzo0MToxMDogZmF0YWwgZXJyb3I6IHN5cy9zeXNjdGwuaDogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQo+ICAgICA0MSB8ICNpbmNsdWRlIDxzeXMvc3lzY3RsLmg+Cj4gICAgICAg
IHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+
IAo+IEkgZGlkbid0IGxvb2sgYXQgdGhlIGNvZGUsIGJ1dCBpdCB3b3VsZCBiZSBnb29kIHRvIG1h
a2UgaXQgd29yayBvbgo+IG1vZGVybiBzeXN0ZW1zLiBBbHRlcm5hdGl2ZWx5IHlvdSB3aWxsIG5l
ZWQgdG8gbWFrZSBpdCBkZXBlbmQgb24gdUNsaWJjLgo+IAoKRm9yIHN1cmUsIEkgd2lsbCBzdWJt
aXQgYSB2MiBhZnRlciBnb2luZyB0aHJvdWdoIHRoZSB2YXJpb3VzIHB1bGwgCnJlcXVlc3RzIGFu
ZCBpc3N1ZXMgdG8gc2VlIGlmIHRob3NlIGFyZSBub3QgYWxyZWFkeSBmaXhlZC4KClRoYW5rcyBQ
ZXRlciEKLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
