Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5201CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 16:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00E842207;
	Sat, 18 Dec 2021 16:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmj3fcOtfGSJ; Sat, 18 Dec 2021 16:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0196C421E0;
	Sat, 18 Dec 2021 16:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 854AC1BF2BE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 16:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71F9840239
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 16:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7jaxljXZocx for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 16:07:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5C524011D
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 16:07:47 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 620FC1C0006
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639843664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPuKAFnNRzUSrEudWxf+EtE5WLlBYcsBJUraswHJlfQ=;
 b=e6IajcDOlo6LTU+ZHBcM6Nzhf5JzUdyQpQM7ZKCDuh71cq+OMddiJ40lryX2qppPWafTJY
 usd6lBPa3W1E7jt60UdwSN0dL+Dg7rp57jYY+h9Kc7HpNCUhxiVmZx1QRvgDbS6rRyy8oA
 6nrYilTfVY+3ecGU1YbWRked6MQ4Dv79F3r3sbV0wRR5KhE3nvIjNYEn4a9Y7ZUi53KrCS
 57MvheqFuY8ek+uFKURjQmKYV0OBfG04j3lpYEmv/dajK/egpm4yF4IDWxDcoa6HcjCdzw
 QPPZJ61aFsyw86GS7MUZAqon1aajpCyGvSxMuXbF5BOCKMZyTymR6hynY3kXrw==
To: buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
 <32989bcc-4244-07fb-f544-cdc382dfc4c3@linatsea.fr>
 <20211218132258.GK2603@scaer>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <5900f579-94b8-7bb3-4eb5-86c686bfa27f@linatsea.fr>
Date: Sat, 18 Dec 2021 17:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218132258.GK2603@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxOC8xMi8yMDIxIMOgIDE0OjIyLCBZYW5uIEUuIE1PUklOIGEgw6ljcml0wqA6Cj4gVGhp
ZXJyeSwgQWxsLApIaSBZYW5uLApOaWNlIHRvIGhlYXIgZnJvbSB5b3UgYWdhaW4KPgo+IE9uIDIw
MjEtMTItMTcgMjI6NTAgKzAxMDAsIFRoaWVycnkgQnVsdGVsIHNwYWtlIHRodXNseToKPj4gR29v
ZCBpZGVhLiBCdXQgZHJhY3V0IGdlbmVyYXRlcyBhIGd6aXBwZWQgY3BpbyBpbWFnZS4KPiBUaGF0
IHRoZSBjcGlvIGlzIGd6aXBwZWQgaXMgdW5mb3J0dWFudGUsIGJlY2F1c2UgdGhlIGtlcm5lbCB3
aWxsIGFnYWluCj4gY29tcHJlc3MgaXQgYXMgcGFydCBvZiBpdHMgb3duIGNvbXByZXNzaW9uICh3
aGVtIGl0IGlzIHVzZWQgYXMgYW4KPiBpbml0cmFtZnMsIElJUkMpLgpZZXMsIGl0IGlzIG5vdCBh
aW1lZCB0byBiZSB1c2VkIGxpa2UgdGhhdC4KCkNsZWFybHksIHRoZSBvcmlnaW4gb2YgZHJhY3V0
IGlzIHRoZSBkZXNrdG9wIHdvcmxkICh3aGVyZSB0aGUgaW5pdHJkIGlzIApzZXBhcmF0ZWQpCgpC
dXQgSSByZWFsbHkgZm91bmQgaXQgY29udmVuaWVudCAoYXMgSSBzYXkgaW4gdGhlIGNvbW1pdCBk
ZXNjcmlwdGlvbikgCmZvciB0aGUgZW1iZWRkZWQKd29ybGQsIHR5cGljYWxseSB0byBidWlsZCBh
IHJlY292ZXJ5IHN5c3RlbSAodGhpcyBpcyBteSB1c2UgY2FzZSkKSW4gYWRkaXRpb24gdG8gdGhl
IGRyYWN1dCBmZWF0dXJlcyB5b3UgbWVudGlvbiBpbiB5b3VyIG90aGVyIG1haWwsIHRoZXJlIAph
cmUgYWxzbwp0aGUgaGFuZGxpbmcgb2YgZGVwZW5kZW5jaWVzIHRvIGZpcm13YXJlcyAocHJvdmlk
ZWQgdGhhdCB0aGUga2VybmVsIAptb2R1bGVzIGRlY2xhcmUgaXQKYnkgdGhlIE1PRFVMRV9GSVJN
V0FSRSBtYWNybywgYW5kIHRoYXQgaXMgbm90IHRoZSBjYXNlIG9mIGFsbCBvZiB0aGVtLCBJCmVu
Y291bnRlcmVkIHNvbWUgc3RhZ2luZyBkcml2ZXJzIHRoYXQgZG8gbm90KQphbmQgdGhlIHJlc3Bl
Y3Qgb2Ygc3ltbGlua3MuClRoZSBjb25jZXB0IG9mIGRyYWN1dCBtb2R1bGVzIGlzIG5pY2UsIHRv
by4KPgo+PiBNYXliZSwgaW5zdGVhZCwgdGhlCj4+ICJjcGlvIiBhbmQgImRyYWN1dCIgb3B0aW9u
cyAoZXhjbHVzaXZlcykgY291bGQgYmUgYnV0IGluIGEgIkluaXRpYWwgUkFNCj4+IGZpbGVzeXN0
ZW0iIG1lbnUuCj4gV2UgYWxyZWFkeSBoYXZlIHN1Y2ggYSBmaWxlc3lzdGVtOgo+ICAgICAgZnMv
aW5pdHJhbWZzLwo+ICAgICAgICAgICJpbml0aWFsIFJBTSBmaWxlc3lzdGVtIGxpbmtlZCBpbnRv
IGxpbnV4IGtlcm5lbCIKPgo+IEFuZCB0aGlzIG9uZSBpcyB0cmlja3ksIGJlY2F1c2UgaXQgaG9v
a3MgaW50byBsaW51eC9saW51eC5tayB3aXRoIG1hbnVhbAo+IGFuZCBjdXN0b20gZGVwZW5kZW5j
aWVzIChzZWUgbGludXgvbGludXgubWtANTcxKS4gSSBhbSBub3QgMTAwJSBoYXBweSBvbgo+IGhv
dyB0aGlzIGlzIGRvbmUsIGJ1dCB3ZSBjYW4ndCByZWFsbHkgaGF2ZSBiZXR0ZXIuLi4KPgo+IFNv
LCBJIHRoaW5rIHRoYXQgaGF2aW5nIGRyYWN1dCBiZSBhbiBvcHRpb24gb2YgY3BpbyBpcyB0aGUg
ZWFzaWVzdCB3YXkKPiB0byBnby4uLgoKVGhhbmtzIFlhbm4sIEkgYWdyZWUsIGFuZCBJIGFtIGFi
b3V0IHRvIHNlbmQgYSBwYXRjaCBzZXQgdGhhdCBkb2VzIHRoZSAKdHJpY2sgbGlrZSB0aGF0LgpS
ZWdhcmRzLApUaGllcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
