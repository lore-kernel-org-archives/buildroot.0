Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72255C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1162160A9E;
	Sat,  8 Jan 2022 10:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtUVAFYKp1_v; Sat,  8 Jan 2022 10:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E5060B0A;
	Sat,  8 Jan 2022 10:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190221BF306
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0719681401
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABlYJcUjs4wZ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:49:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 048BC813ED
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 10:49:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a5so12149952wrh.5
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9llgj95o+/0zSwWpETr20C8MuPcSl50S3rwKiQeEHKU=;
 b=AwN82qvhIJqwY713Kanj8QGjYlBald+mAbmOKbl/XWff2FWzDQYWTOTKVC98ZjrHFG
 QRL5BtHFopP1R1WDiL6330TL7SaGzrlpMXETbIEfFYt20Bo0MCGyI3sSbgGj+iIx/MDP
 t6CVWepGPO2iNGLXfW8SmkLHbDifw/3WQPrViSbsu/MM8fPoJAzwlJkno/i0qFLt34NS
 jwR7DMfUccojzWvQOmz62KC4Sw0rCD+v3Lk2Tjq8ad7iNcYKSGQmuwyPGPW/TBvxrbOp
 gLbRztOARZW8wv8CjRJt/elHxnRGLI/5upgEz/qtMxIRI1hG5N+OwIl6Du3sOJQQ6YLr
 DafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9llgj95o+/0zSwWpETr20C8MuPcSl50S3rwKiQeEHKU=;
 b=x/Z5Vgxt5dnelZU43TMuAxu7Pik0ggH5R88NtFW9Si/bO/2mbN7d4p8cOqoOgjCOqR
 kMuQgGonMuEMRIFUaLZyAGm/YDqkT8kJf6mFJDkN0zesGlnZTh104CwImJMq+jTz/jar
 Xh0PDE7sC1KvP7M1b+0aJCJP0nFQuUnZUekOyViV4SAzrNc+M93wWMtIDIMWYmQ0e0Rk
 S+RggToHlBZLc8h2bwkaciaS8gu1hiyTfZyPGdCCTOkzjMNoObpsdcgupA61uzy3kYwQ
 khw9x7Mb22liYTsaLSpAtbwnoT3fdPn+Afi3/VFXAgk+AmuJ1rcjd3DlsY2MjwCrN1MR
 gqnw==
X-Gm-Message-State: AOAM530qDyTf+QqlEyzutP9GtS1ud2cpIYRYsf9SXfbh6BH7FZq3GYw9
 8dWMsJwfHVn+I34dNmFVZ5JAfQ==
X-Google-Smtp-Source: ABdhPJy8b2p5PJtvaFQ9BQvl++tqPAlaPSodqo28JUJyNufdI/iKZJwU9qbvnI2FxeM9PhjfnQXxxA==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr57583994wry.447.1641638961667; 
 Sat, 08 Jan 2022 02:49:21 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id c14sm1268201wrp.38.2022.01.08.02.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 02:49:21 -0800 (PST)
Message-ID: <0652aacd-46ea-6d4d-0e0b-ee9c6c6ba399@mind.be>
Date: Sat, 8 Jan 2022 11:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer>
 <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <7605fae5-42db-115c-e87a-0dbc3597a99a@mind.be>
 <b6cec89f-8d87-e2ee-eb42-221134575645@ideasonboard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <b6cec89f-8d87-e2ee-eb42-221134575645@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMS8yMDIyIDExOjA5LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAwNy8wMS8y
MDIyIDIzOjQ5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4KPj4KPj4gT24gMDMvMDEv
MjAyMiAwOToyNCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAwNi8x
Mi8yMDIxIDIzOjU3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+Pj4KPj4+PiBTbyBJIHRoaW5rIHdl
IHJlYWxseSwgcmVhbGx5IG5lZWQgYSBwYWNrYWdlIChsaWtlIHNjaXB5KSB0aGF0IGFjdHVhbGx5
Cj4+Pj4gbWFrZXMgdXNlIG9mIHB5YmluZCwgc28gd2UgY2FuIHNlZSBob3cgaXQgd29ya3MsIGFu
ZCB0byBmaXggaXQuLi4KPj4+Cj4+PiBKZnlpLCB0aGVyZSBhcmUgdHdvIHJlbGF0aXZlbHkgc2lt
cGxlIHBhY2thZ2VzIGluIGJ1aWxkcm9vdCB0aGF0IGNhbiB1c2UgCj4+PiBweWJpbmQ6IGttc3h4
IGFuZCByd21lbS4gQm90aCB1c2UgbWVzb24gZm9yIGJ1aWxkaW5nLgo+Pj4KPj4+IEkgY2FuIHRl
c3QgdGhlIG5leHQgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyB3aXRoIHRob3NlIHBhY2thZ2VzLgo+
Pgo+PiDCoMKgSSB0cmllZCB0byBkbyB0aGF0LiBVbmZvcnR1bmF0ZWx5LCBpdCB0dXJucyBvdXQg
dGhhdCBib3RoIG9mIHRob3NlIHBhY2thZ2VzIAo+PiB1c2UgdGhlIENNYWtlIHdheSBvZiBmaW5k
aW5nIHRoZSBweWJpbmQxMSBkZXBlbmRlbmN5LCBhbmQgYXBwYXJlbnRseSBvdXIgCj4+IGNyb3Nz
LWNvbXBpbGF0aW9uLmNvbmYgZG9lc24ndCBzdXBwb3J0IGNtYWtlIHlldC4uLiBTbyBpdCdzIG5v
dCB0aGF0IHRyaXZpYWwuCj4gCj4gWWVzLCBJIGhhZCBhIGxvb2sgYXQgdGhpcyBhbHNvLiBrbXN4
eCBhbmQgcndtZW0gdXNlIHRoZSBwbGFpbiBtZXNvbiBkZXBlbmRlbmN5KCkgCj4gdG8gZmluZCB0
aGUgcGFja2FnZS4gV29ya3Mgb24gVWJ1bnR1LCBhcyBVYnVudHUncyBweWJpbmQxMSBpbnN0YWxs
cyB0aGUgY21ha2UgCj4gZmlsZXMuCgogIEkgYWxzbyBtYWRlIHN1cmUgdGhhdCBweXRob24tcHli
aW5kIGluc3RhbGxzIHRoZSBjbWFrZSBmaWxlcy4gSSBqdXN0IGhhdmVuJ3QgCnRlc3RlZCBpZiB0
aGV5IGFjdHVhbGx5IHdvcmsuIEkgYWxyZWFkeSBub3RpY2VkIHRoYXQgdGhlcmUncyBvbmUgb2Yg
dGhlIGZpbGVzIAp0aGF0IGlzIG5vdCBjcm9zcy1jb21waWxlIGZyaWVuZGx5IGJlY2F1c2UgaXQg
Zm91bmQgL3Vzci9iaW4vcHl0aG9uLiBCdXQgbWF5YmUgCnRoYXQgb25lIGlzbid0IGFjdHVhbGx5
IHVzZWQgaW4gcHJhY3RpY2UuCgo+IEkgc3RhcnRlZCB0ZXN0aW5nIHdpdGggYSBtb3JlIG1hbnVh
bCBhcHByb2FjaCB0byBmaW5kaW5nIHB5YmluZDExLCBidXQgZGlkbid0IAo+IGdldCBpdCB3b3Jr
aW5nIHlldC4KCiAgTm8sIHRoZSBjbWFrZSBhcHByb2FjaCBzaG91bGQgYmUgZmluZS4gV2UganVz
dCBoYXZlIHRvIHVwZGF0ZSB0aGUgbWVzb24gCmNyb3NzLWNvbXBpbGF0aW9uLmNvbmYgc28gaXQg
cG9pbnRzIHRvIFNUQUdJTkdfRElSL3Vzci9zaGFyZS9jbWFrZS4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
