Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3021AC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 17:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2FDF607A1;
	Sat, 13 Jul 2024 17:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQaebFqLMf0b; Sat, 13 Jul 2024 17:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1DA60767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD1DA60767;
	Sat, 13 Jul 2024 17:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3A51BF403
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05F8F401B2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf5Z7TQKHBr2 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 17:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA5CB401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5CB401AD
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA5CB401AD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 17:48:11 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-80fa1509989so1591481241.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 10:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720892890; x=1721497690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EGl5Gq2CeJl126dLgy4hH5opyhjp5p4+s89GbW0AqrI=;
 b=Wc2y3SpbNxWnNLFOANL5ISmyKIy/wwVJu4baTQ2ZE5HwQTMXPKhIwmsuIVbjomJKAV
 yN4tvhm9Or3NJTvnTtSTDU3rjmmtoDP1nz4AnaBRshaJW0dKjoJ29hK2FPeQ33Vw53U+
 J8HvjNm0eojAFSI2FsOHdxEu1ftJLHXF2dyvzhm4Hb5VZfRDjqReTVpVaA3YTtYKaZLN
 /4wOzejDqQ18qdi7WRT83ZGakL1hqDsjG7S5M5+Jwzzdc3U2mDnC/9fvaIaPDAw1vcbr
 aLkdkPdtJVnakinqegadTfnn2l+TPxRw+GRQN/2qqPTYyr0+qMc2Thx508rV7eNwINDv
 T2LQ==
X-Gm-Message-State: AOJu0YzS5LKqPOX3nBhDlBZwikcoPrg3ynuKGYV+i+lZu3yaZDAJfysO
 73w/x/CrUlOgdd+K+rWSTlTe11GYgnDR9fy/4GjPBWyCv8odxEADBuVw8zbmOUOy1fpqgKhuFNG
 PMS1l9BKGEIZ1JFR2ValvGjj/PzRu32e8
X-Google-Smtp-Source: AGHT+IHteeIQQmP8B0fBbYy0rLgkWkbUmVVumXWccL+IB5YgqS6MkjN0BIS1MmyvqqZ8SMKR5GmmW7U59m58dMhCxn8=
X-Received: by 2002:a05:6102:1483:b0:48f:361:9fe9 with SMTP id
 ada2fe7eead31-49119a4deeemr4286827137.3.1720892888851; Sat, 13 Jul 2024
 10:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240712201943.457747-1-james.hilliard1@gmail.com>
 <20240713141529.66e77cea@windsurf>
In-Reply-To: <20240713141529.66e77cea@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 13 Jul 2024 11:47:57 -0600
Message-ID: <CADvTj4rnf4WUO0+7n9M3WdSvV-QBpca=ivOugcr7tLL4iPvZtw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720892890; x=1721497690; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EGl5Gq2CeJl126dLgy4hH5opyhjp5p4+s89GbW0AqrI=;
 b=edCOb9A0SHRVE1Ga/6vKsbQI2YzL2o/+3pROPNGEpPMsXw3GTnehxEczrJqtgwUIql
 7ZkKPBj/X9boK7ZAsGtudOK+vhCpPblv+d/C6vtbVPOUJbCWhmdUSV2FhqgOBTd7H5bV
 TRHUSTOHHtabLY2YboeY7sYagCbWShENorKHVfe93WbvVL4TPkREx0WHKl2p8enuwh7Q
 ccQq1yzX1motjXhPRmg2TF60wcOYIpp9rPPvvvPwhgd8nCZ8kNxRoA7Q1vowakJHXrag
 2sSybxvXywkVw7W4KDBJoTIgTJ8pEuAU/Xy15XDsRYHwlSe6m/FZ0hE6UgX+/7QE/c/U
 pRUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=edCOb9A0
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBKdWwgMTMsIDIwMjQgYXQgNjoxNeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBG
cmksIDEyIEp1bCAyMDI0IDE0OjE5OjQzIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IEl0IHdvdWxkIGhhdmUgYmVlbiAq
cmVhbGx5KiBuaWNlIGlmIHlvdSBjb3VsZCBoYXZlIHBvaW50ZWQgb3V0IHRoYXQKPiB0aGlzIGNv
bW1pdCBmaXhlcyBhIGJ1aWxkIGlzc3VlIHRoYXQgd2FzIG9jY3VycmluZyBpbiB0aGUgYXV0b2J1
aWxkZXIuCj4gVGhlIG9ubHkgY29tbWl0IGJyb3VnaHQgYnkgeW91ciB2ZXJzaW9uIGJ1bXAgaXMg
YW4gdXBzdHJlYW0gY29tbWl0IG9mCj4geW91IHRvIGZpeCB0aGUgYnVpbGQgaXNzdWUsIGJ1dCB5
b3UgZGlkIG5vdCBldmVuIG1lbnRpb24gaXQgaGVyZS4KPgo+IFRoaXMgZml4ZXM6Cj4KPiAgIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2UwZjQ2OTgzZGFmZGM3ZDMwOWU2
Y2RmZGVkYTI2OGM1ODJhMDMxNTYvYnVpbGQtZW5kLmxvZwo+Cj4gd2hpY2ggd2FzIG9jY3Vycmlu
ZyB3aXRoIHZlcnNpb24KPiA0NDBjMDA1OWEyMWYwNmI1NTc3NDk5YTgwYjU1NDgyY2I5OWQ2ZDFj
Lgo+Cj4gQnV0IGFsc28gZml4ZXM6Cj4KPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzL2E5ZGU0ODkwZmQyNDk5ODQyYTI2YWJjOGY1OTVmNDMyMDZlNGJkYzEvYnVpbGQt
ZW5kLmxvZwo+Cj4gd2hpY2ggd2FzIG9jY3VycmluZyB3aXRoIHRoZSBwcmV2aW91cyB2ZXJzaW9u
LAo+IGE4NTNhNWQ3MTVkODRlZWM5M2FhNjhlOGYyZGYyNmI3ZDg2MGY1YjIuCgpXZWxsLCBpdCBw
cm9iYWJseSB3b3VsZCBoYXBwZW4gd2l0aCBhbGwgcHJldmlvdXMgdmVyc2lvbnMsIG5vdGUgdGhl
IGlzc3VlCndhcyBkdWUgdG8gYSBtYWpvciBjb21waWxlciB2ZXJzaW9uIHVwZGF0ZSBpbiBteSBh
dXRvYnVpbGRlcnMgYW5kIGRvZXMKbm90IGFmZmVjdCBzeXN0ZW1zIHJ1bm5pbmcgb2xkZXIgR0ND
IHZlcnNpb25zLgoKSSBnZW5lcmFsbHkgbG9jayBteSBhcmNoIGF1dG9idWlsZGVycyB0byBtYXN0
ZXIgYnJhbmNoIHNpbmNlIHRoZXJlIHRlbmRzCnRvIGJlIGEgdG9uIG9mIGJyZWFrYWdlIG9uIExU
UyBicmFuY2hlcyBmb3IgdGhlbSB3aGljaCBjcmVhdGVzIGEgbG90IG9mCm5vaXNlIGR1ZSB0byBs
b3RzIG9mIGJ1aWxkIGZhaWx1cmVzLgoKPgo+IFBldGVyOiBpdCBtZWFucyB0aGlzIHZlcnNpb24g
YnVtcCBpcyBhY3R1YWxseSBmaXhpbmcgYW4gaXNzdWUgdGhhdAo+IG9jY3VycyBvbiAyMDI0LjAy
LCBzbyB0aGlzIHZlcnNpb24gYnVtcCBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBvdXIgTFRTCj4g
YnJhbmNoLgo+Cj4gSmFtZXM6IHRoaXMgaXMgd2h5IHdlIGFzayBmb3IgbW9yZSBleHBsYW5hdGlv
bnMsIHNvIHRoYXQgd2UgY2FuIGZpZ3VyZQo+IG91dCB3aGV0aGVyIGEgY2VydGFpbiBjb21taXQg
aXMgcmVsZXZhbnQgb3Igbm90IGZvciBvdXIgTFRTIGJyYW5jaC4KCkRvIHdlIGJhY2twb3J0IGJ1
aWxkIGhvc3QgbWFqb3IgY29tcGlsZXIgdmVyc2lvbiB1cGRhdGUgZml4ZXMgdG8gTFRTCmJyYW5j
aGVzPwoKPgo+IFRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24hCj4KPiBUaG9tYXMKPiAtLQo+
IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
