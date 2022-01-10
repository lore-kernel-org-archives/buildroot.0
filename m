Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B785AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 13:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B6EC8175E;
	Mon, 10 Jan 2022 13:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3z9s1C7Vshv; Mon, 10 Jan 2022 13:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71093812C9;
	Mon, 10 Jan 2022 13:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA8D1BF3EA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DF5C60DF9
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QinkmP9YVGIX for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 13:26:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 121CE60B31
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 13:26:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so5078092wmb.1
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:content-language:from:to
 :subject:organization:content-transfer-encoding;
 bh=aSTt44HDB0z6GBikqTLEOE2kzZMd4MD2VXo2MijHCw4=;
 b=GXsVGybcmdy0WiUwa3lvM6yVa7Saq9M0RJCevAJ7uS59oJ8NRPmNMNpcBwjTY814go
 tuasTh1A2THJzb8BHgiU6H2Ifgc72QLbXq/SkCY79KKoAFv6HKMJdcHhLweUV7zN2pMl
 cbs3SB8OtlbwwHT4n7CACBEoztB7GfFXj1bD9/zcTbSJ5VsNefImBpgEfcJzf6RZXqJo
 VYkRwiXm79naT/Ss9JzHrO5MkFQIPEMyKdHJLRqGM4aqjq6epkfE6HzYdPOVsgjWTzdJ
 DpAXf38tiySCMBzy3JvKYNjtjmKpCDaOM4doMoVDGK2Aj7hbrNj4NI/M/qsQqNx1T1A+
 7LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:subject:organization
 :content-transfer-encoding;
 bh=aSTt44HDB0z6GBikqTLEOE2kzZMd4MD2VXo2MijHCw4=;
 b=Dyugr2dtHsu8f7TpWrVWivNZw97L6iCtmx5FkgQNgQoAcHV5UILd/TQsM1ae3jQPg4
 gghr5TP3omer3pPnYH30tpP4detjsCWzB1YOeglumjso9h8LGUX7CqSGlshZhqYRMbq6
 kw+nfRNckJbKJqjPEcK+ULovPt33wH7x4J35Koea2xY7cxJzKYdDGjvk4LIAgV6dI4jR
 JEDQUmiuLKGxrefksaaJpq0bP8c8oQ9pi0zmcQbL2dHdwHjloEDbMUVLOjx+YKuB+arU
 gFzisBubndz5cmsXNOaOndX3Ng24DQYH+5KqWAUaK3OaA7tnJfk4FD3HSb9/rRjuJ7ji
 Ie8A==
X-Gm-Message-State: AOAM533RkisZSmmbYuZuT+Zr+HbC6iMYNUqTW/Nb29hjfj/TqQeX6d63
 paDcWTecs8y3d0ydjPhVDTCuYFIPftj+CPnf
X-Google-Smtp-Source: ABdhPJx/UnHZ65YfYAcKAX0Xi7asphIUwJPUSggAfLUJNHAJfQh57Zql/U8URhA6XlqiPtKVdjcOFg==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr7727517wml.3.1641821183237;
 Mon, 10 Jan 2022 05:26:23 -0800 (PST)
Received: from [10.39.5.212] ([109.190.253.16])
 by smtp.gmail.com with ESMTPSA id l13sm7466246wrs.73.2022.01.10.05.26.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:26:22 -0800 (PST)
Message-ID: <c87e3a78-61c1-1f26-a755-82d2477d8c36@mind.be>
Date: Mon, 10 Jan 2022 14:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
X-Priority: 2 (High)
To: Buildroot Mailing List <buildroot@buildroot.org>
Organization: Essensium/Mind
Subject: [Buildroot] Buildroot hackaton and how to help
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

IMKgSGkgYWxsLAoKIMKgT3ZlciB0aGUgcGFzdCB0d28geWVhcnMsIHRoZSBiYWNrbG9nIG9mIG5v
dC15ZXQtYXBwbGllZCBwYXRjaGVzIGhhcwphY2N1bXVsYXRlZCB2ZXJ5IGJhZGx5LCB0byB0aGUg
bGV2ZWwgdGhhdCB3ZSByZWFjaGVkIG1vcmUgdGhhbiA1MDAKIk5ldyIgcGF0Y2hlcyBpbiBwYXRj
aHdvcmsgYnkgbWlkLURlY2VtYmVyIDIwMjEuIFdvcnNlIHN0aWxsLCB0aGVyZSB3ZXJlCmFib3V0
IDE1MCBwYXRjaGVzIG9mIG1vcmUgdGhhbiBhIHllYXIgb2xkLiBPbmUgaW1wb3J0YW50IHJlYXNv
biBmb3IgdGhpcwppcyB0aGF0IHRoZSBtYWludGFpbmVycyBoYXZlbid0IGJlZW4gYWJsZSB0byBt
ZWV0IGZhY2UtdG8tZmFjZSBkdXJpbmcKYWxsIHRoYXQgdGltZS4gVGhpcyBtYWtlcyBpdCBkaWZm
aWN1bHQgdG8gaGFuZGxlIGNvbnRyaWJ1dGlvbnMgdGhhdCBhcmUKbm90IGNvbXBsZXRlbHkgcmVh
ZHkgeWV0LCBvciBub3QgcGVyZmVjdGx5IGFsaWduZWQgd2l0aCB0aGUgQnVpbGRyb290CnBoaWxv
c29waHkuCgogwqBPdmVyIHRoZSBwYXN0IGZvdXIgZGF5cywgd2UgaGF2ZSBmaW5hbGx5IGJlZW4g
YWJsZSB0byB0byBnZXQgdG9nZXRoZXIKYWdhaW4uIFdlIGhhZCBkZWRpY2F0ZWQgdGltZSB0byBs
b29rIGF0IGNvbXBsaWNhdGVkIHNpdHVhdGlvbnMsIGFuZCB3ZQpoYWQgdGhlIG9wcG9ydHVuaXR5
IHRvIGRpc2N1c3MgaW5kaXZpZHVhbCBwYXRjaGVzIGFuZCBjb21lIHRvIGRlY2lzaW9ucy4KV2Ug
YWxzbyBoYWQgR2l1bGlvIGFuZCBSb21haW4gaGVscGluZyBvdXQgcmVtb3RlbHkuIFRoaXMgaGFz
IGFsbG93ZWQgdXMKdG8gcmVkdWNlIHRoZSBiYWNrbG9nIGZyb20gYWJvdXQgMzUwIG9uIFdlZG5l
c2RheSBkb3duIHRvIG9ubHkgMTI4IHRoaXMKbW9ybmluZy4gSW4gdGhpcyB0aW1lLCB3ZSd2ZSBh
cHBsaWVkIDI5MyBwYXRjaGVzLgoKIMKgVEhlIHBpY3R1cmUgaXMgYSBiaXQgbGVzcyByb3N5IHRo
YW4gaXQgc2VlbXMsIGhvd2V2ZXIuIE9mIHRoZSAxMjgKcmVtYWluaW5nIHBhdGNoZXMsIG1vcmUg
dGhhbiBoYWxmICg3OCkgYXJlIG1vcmUgdGhhbiAyIG1vbnRocyBvbGQsIGFuZApvbmUgdGhpcmQg
KDQyKSBhcmUgbW9yZSB0aGFuIDYgbW9udGhzIG9sZC4gT2xkZXIgcGF0Y2hlcyBhcmUgYWx3YXlz
IG1vcmUKZGlmZmljdWx0IHRvIHRyZWF0IGJlY2F1c2UgaXQgaXNuJ3QgZmFpciB0byBhc2sgdGhl
IG9yaWdpbmFsIHN1Ym1pdHRlcgpmb3Igc29tZSB0cml2aWFsIGNoYW5nZXMgYWZ0ZXIgc3VjaCBh
IGxvbmcgdGltZS4KCiDCoFRoZSBnb29kIG5ld3MsIG9uIHRoZSBvdGhlciBoYW5kLCBpcyB0aGF0
IHdlIGFyZSBmYWlybHkgZ29vZCB3aXRoCmFwcGx5aW5nIHRyaXZpYWwgcGF0Y2hlcyBhbmQgcGF0
Y2hlcyB0aGF0IGhhdmUgYmVlbiByZXZpZXdlZC4gSXQgY2FuCnRha2UgYSB3ZWVrLCBzb21ldGlt
ZXMgdHdvLCBidXQgdGhleSBkb24ndCBsaW5nZXIgZm9yIG1vbnRocyBpbgpwYXRjaHdvcmsuIFRy
aXZpYWwgcGF0Y2hlcyBhcmU6IHZlcnNpb24gYnVtcHMsIGRvY3VtZW50YXRpb24sIHNwZWxsaW5n
CmFuZCB3aGl0ZXNwYWNlIGZpeGVzLCBERVZFTE9QRVJTIGVudHJpZXMsIHNpbXBsZSBmaXhlcyB0
aGF0IGVpdGhlciBhZGQKdG9vbGNoYWluIGV4Y2x1c2lvbnMgb3IgdGFrZSBhbiB1cHN0cmVhbSBw
YXRjaCwgc2ltcGxlIG5ldyBwYWNrYWdlcwoocHl0aG9uIHBhY2thZ2VzIGZvciBleGFtcGxlKSwg
ZXRjLgoKIMKgVGhlcmUgaXMgYSBsb3QgdGhhdCB5b3UgY2FuIGRvIHRvIGltcHJvdmUgdGhlIHNp
dHVhdGlvbiBmb3IgdGhlCm5vbi10cml2aWFsIHBhdGNoZXMgdGhhdCBzdGlsbCBzdGF5IGJlaGlu
ZCBpbiBwYXRjaHdvcmsgZm9yIGEgbG9uZyB0aW1lLgoKLSBSZXZpZXcgcGF0Y2hlcy4gRXZlbiBp
ZiB5b3UgZG9uJ3QgZmVlbCBjb21mb3J0YWJsZSB0byBhc3NlcnQgdGhhdCBhCnBhdGNoIGlzIGVu
dGlyZWx5IHBlcmZlY3QsIHlvdSBjYW4gc3RpbGwgZG8gYSByZXZpZXcgYW5kIGNhdGNoIHNvbWUg
b2YKdGhlIG9idmlvdXMgcHJvYmxlbXMsIGFuZCBpdCdzIG9uZSBsZXNzIHRoaW5nIGZvciB0aGUg
bWFpbnRhaW5lcnMgdG8KaGF2ZSB0byBmaXguCgotIEFkZCB5b3VyIFJldmlld2VkLWJ5LCBBY2tl
ZC1ieSBvciBUZXN0ZWQtYnkgdGFnIGlmIHlvdSB0aGluayB0aGUgcGF0Y2gKaXMgZ29vZCBlbm91
Z2guIFRoZSBtYWludGFpbmVycyB3aWxsIHN0aWxsIHRha2UgYSBsb29rIGF0IGl0LCBzbyBkb24n
dAp3b3JyeSBpZiB5b3UgZG9uJ3QgZmVlbCBleHBlcmllbmNlZCBlbm91Z2ggdG8gYXBwcm92ZSBw
YXRjaGVzLCBqdXN0IGdvCmFoZWFkIGFuZCBkbyBpdC4gVGhlc2UgdGFncyBoZWxwIGJlY2F1c2Ug
dGhleSBtYWtlIGEgcGF0Y2ggc3RhbmQgb3V0IGluCnBhdGNod29yay4gVG8gbWFrZSBzdXJlIGl0
IHN0YW5kcyBvdXQsIHBsZWFzZSByZXBseSB0byBlYWNoIGluZGl2aWR1YWwKcGF0Y2ggb2YgdGhl
IHNlcmllcywgb3IgYXQgbGVhc3QgdGhlIGZpcnN0IG9uZXMuCgotIEFkb3B0IGEgcGF0Y2guIFdo
ZW4gcmV2aWV3aW5nLCBpdCBpcyBvZnRlbiBlYXNpZXIgdG8gZml4IHRoZSBpc3N1ZXMKdGhhbiB0
byBleHBsYWluIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSBpbiBhIHJlcGx5LiBZb3UgY2FuIGVhc2ls
eSBnZXQgYW5kCmFwcGx5IGEgcGF0Y2ggd2l0aCBwd2NsaWVudCAocGlwIGluc3RhbGwgcHdjbGll
bnQgdG8gZ2V0IGl0KS4gTWFrZSB0aGUKZml4ZXMsIHNlbmQgdGhlIG5ldyB2ZXJzaW9uIChtYWtl
IHN1cmUgeW91IGtlZXAgdGhlIG9yaWdpbmFsIGF1dGhvcnNoaXAKaW5mb3JtYXRpb24gYW5kIFNp
Z25lZC1vZmYtYnksIGFuZCBhZGQgeW91ciBvd24pLCBhbmQgbGV0IHNvbWVvbmUgb24gSVJDCmtu
b3cgdGhhdCB0aGUgb2xkIG9uZSBpcyB0byBiZSBtYXJrZWQgYXMgU3VwZXJzZWRlZCAodGFsayB0
byB5X21vcmluLApLdWJ1LCBqYWNtZXQsIGtvc190b20gYW5kL29yIGFybm91dCkuCgotIFdoZW4g
c3VibWl0dGluZyBwYXRjaGVzLCB0YWtlIGludG8gYWNjb3VudCB0aGUgc3VibWlzc2lvbiBwb2xp
Y2llcy4KVGhpcyByZWR1Y2VzIHRoZSB3b3JrIGZvciBtYWludGFpbmVycyB0byBwcm9jZXNzIHlv
dXIgcGF0Y2guCgogwqAgKiBXcml0ZSBhIGdvb2QgY29tbWl0IG1lc3NhZ2UgdGhhdCBkZXNjcmli
ZXMgdGhlIHByb2JsZW0gYW5kIHdoeSB0aGlzCiDCoMKgwqAgcGFydGljdWxhciBzb2x1dGlvbiBp
cyBjaG9zZW4uCiDCoCAqIFJ1biBjaGVjay1wYWNrYWdlIGFuZCAoaWYgbmVjZXNzYXJ5KSBmbGFr
ZTguCiDCoCAqIFB1dCBwZW9wbGUgd2hvIG1pZ2h0IGJlIGludGVyZXN0ZWQgaW4gQ2MuIFVzZSBn
ZXQtZGV2ZWxvcGVycywKIMKgwqDCoCBwb3NzaWJseSBhbHNvIGdpdCBsb2cuCiDCoCAqIFdoZW4g
cmUtc3VibWl0dGluZzoKIMKgwqDCoCAtIEFkZCBwZW9wbGUgd2hvIHByZXZpb3VzbHkgcmV2aWV3
ZWQgaXQgaW4gQ2MuCiDCoMKgwqAgLSBLZWVwIFJldmlld2VkL1Rlc3RlZC9BY2tlZC1ieSB0YWdz
IHRoYXQgcGVvcGxlIHByZXZpb3VzbHkgZ2F2ZSBpdC4KIMKgwqDCoCAtIE1hcmsgdGhlIHByZXZp
b3VzIG9uZSBhcyBTdXBlcnNlZGVkIGluIHBhdGNod29yay4KIMKgwqDCoCAtIEluY2x1ZGUgYSB2
ZXJzaW9uIG51bWJlciAoYW5kIGluY3JlbWVudCBpdCwgb2J2aW91c2x5KS4KIMKgwqDCoCAtIElu
Y2x1ZGUgYSBwYXRjaCBjaGFuZ2Vsb2cuCiDCoMKgwqAgLSBXaGVuIGl0J3MgcGFydCBvZiBhIHNl
cmllcywgcmVzdWJtaXQgdGhlIGVudGlyZSBzZXJpZXMsIGluY2x1ZGluZwogwqDCoMKgwqDCoCBw
YXRjaGVzIHRoYXQgaGF2ZW4ndCBjaGFuZ2VkLgoKLSBBZGQgdGVzdHMuIFRoZXkgbWFrZSBpdCBl
YXNpZXIgdG8gZmVlbCBzYWZlIGFib3V0IG1ha2luZwpjaGFuZ2VzLgoKLSBBbGwgb2YgdGhlIGFi
b3ZlIHNob3VsZCBvZiBjb3Vyc2UgYmUgaW4gb3VyIG1hbnVhbC4gTW9zdCBvZiBpdCBhbHJlYWR5
CmlzLCBidXQgeW91IGNvdWxkIGhlbHAgYnkgbG9va2luZyBhdCBkb2NzL21hbnVhbC9jb250cmli
dXRlLnR4dCBhbmQKZXh0ZW5kIHdoZXJlIG5lZWRlZC4KCiDCoE1vc3QgaW1wb3J0YW50bHkgaG93
ZXZlcjogdGhhbmsgeW91IGV2ZXJ5Ym9keSBmb3IgeW91ciBjb250aW51ZWQKY29udHJpYnV0aW9u
cy4gSXQgaXMgdGhhbmtzIHRvIGFsbCBvZiB5b3UgdGhhdCBCdWlsZHJvb3QgaXMgc3VjaCBhIGdy
ZWF0CnByb2plY3QhCgpZYW5uLCBUaG9tYXMsIFBldGVyIGFuZCBBcm5vdXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
