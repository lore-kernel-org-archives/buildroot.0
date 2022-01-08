Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94444C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 218EF4018A;
	Sat,  8 Jan 2022 10:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBZwoqafKkrf; Sat,  8 Jan 2022 10:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14AF040158;
	Sat,  8 Jan 2022 10:32:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F35D1BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19B4607AA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TcPzhZmV1wS for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E044160797
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:31:55 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h10so5880927wrb.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 02:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QJLEBRLWpXYcavR1C97bLgxz+On+bjJ4/o0t3EI9tqA=;
 b=PokuO1vvBV0djpGtbb28ac0qJRclBW6Wi9VX/VBfBTyBtaoTVtdhQgMrI/nqpvbG6J
 Xuw4LLrEFJHLY3zgyps9rylp2akcp2sVBeuuewUK3mCbDXR0Vhuzch9ud5dZAUcrvkfZ
 v55hHcpbVsK+cotPnVJE9BbaOBGSJpIQFApJw2CJWyR93MQ0aJLk+iUZVVagrvrCfdDt
 /4/O72PWdSnNLVf8cgjDRBrs/n/wUecitJtG3Z8pFyDUxnzwe2GUT7v/8Cr1rqV/LPOF
 ZCz0fLEH3T2JFT8gctpZ725P6oGZseJVlYdEif3Il9mQHfMQl929nyfRxPJ0XKCZndHA
 IhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJLEBRLWpXYcavR1C97bLgxz+On+bjJ4/o0t3EI9tqA=;
 b=Vj9xcRL4NkPwS/qN0NSvr+uzo17laMTGpBVI8u2/fa1V5PttITragaQ04QR0MV4qew
 tFuYNihawp248qGEL113Wnl7eLOIFSB55IkF+Fstc8TwK/IuWZeE+HADufzhPCe1+v6u
 1q0+6aS7lk0R7NjAwy+7dOiMGPkL7QCaZlGnRrRF4JXp/dry1GpX1QWAE6mjVkQBotbw
 N8FRfAO3fsWnvcE0jMgbij6FES+S6PRRtVylNF0A5RdyMV6V8N2cwakvScoKzq+JE7oI
 CjkP8HxTah9E/KDoIzTGlie59pcqXx0Et9B5Vs5Y/QTGGoO3xrA+eEtX4Bn5Kx96ovFY
 5Gjg==
X-Gm-Message-State: AOAM5329yYDZcZWMz6cvw0nABFEVBwn7P5kXU8E6mhd742Uw4by/pPUo
 RJaIhrVYRZY9QKJoQuFho4ERSQ==
X-Google-Smtp-Source: ABdhPJw0Tybidiyr7Zh6vK2crTGNO+ncFZj08ISDXQi1riIk1MtWFosVtdOzZTi/2DAD59Zh8G2MdQ==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr29508044wru.128.1641637913738; 
 Sat, 08 Jan 2022 02:31:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id a3sm1262049wrm.52.2022.01.08.02.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 02:31:53 -0800 (PST)
Message-ID: <ce48c262-8138-df64-fa94-e23bb0018400@smile.fr>
Date: Sat, 8 Jan 2022 11:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: marc.chalain@mailoo.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <ea-mime-61d89dcf-4dd2-23b57646@www-7.net-c.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ea-mime-61d89dcf-4dd2-23b57646@www-7.net-c.com>
Subject: Re: [Buildroot] package/aravis: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marc Chalain <marc.chalain@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFyYywKCkxlIDA3LzAxLzIwMjIgw6AgMjE6MDgsIG1hcmMuY2hhbGFpbkBtYWlsb28u
b3JnIGEgw6ljcml0wqA6Cj4gVGhhbmsgZm9yIGFsbCwKPiAKPiBJIHdpbGwgc2VuZCBhIG5ldyB2
ZXJzaW9uIHF1aWNrbHksIGJ1dCBzb21lIHF1ZXN0aW9ucyBmaXJzdDoKPiAKPiAKPiAKPj4gK0FS
QVZJU19WRVJTSU9OID0gMC44LjE2Cj4gCj4gQXJhdmlzIHByb2plY3QgaXMgbW92aW5nIGZhc3Qs
IHRoZXJlIGlzIGEgbmV3IHZlcnNpb24gMC44LjIwIGFscmVhZHkuCj4gSSdtIGZpbmUgd2l0aCB0
aGlzIHZlcnNpb24gc2luY2UgaXQgd2FzIHJlbGVhc2VkIHJlY2VudGx5Ogo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9BcmF2aXNQcm9qZWN0L2FyYXZpcy9yZWxlYXNlcy90YWcvMC44LjE2Cj4gCj4gCj4g
VGhlIDAuOC4xNiBpcyBhdmFpbGFibGUgZnJvbSBKdW5lIDIwMjEuIEkgaGFkIGNsZWFybHkgd2Vs
bCB0ZXN0ZWQgdGhpcyB2ZXJzaW9uIHdpdGggc2V2ZXJhbCBrZXJuZWwgY29uZmlndXJhdGlvbi4g
V2hhdCBpcyBpdCBiZXR0ZXIgPyB0aGUgbGFzdCB2ZXJzaW9uIG9yIHRoZSBtb3N0IHRlc3RlZCB2
ZXJzaW9uID8KPiAKPiBUbyBzZW5kIDAuOC4yMCBJIHdpbGwgbmVlZCBmZXcgd2Vla3MsIHRvIHRl
c3QuCgpVc2luZyBhIHZlcnNpb24geW91IGFyZSBjb25maWRlbnQgd2l0aCBpcyBPSy4gTWF5YmUg
YWRkIGEgY29tbWVudCBpbiB0aGUgY29tbWl0CmxvZyBhYm91dCB5b3VyIGNob2ljZSB0byB1c2Ug
YSBwcmV2aW91cyB2ZXJzaW9uIHRoYW4gdGhlIGxhdGVzdCBvbmUuCgo+IAo+IAo+IAo+PiArQVJB
VklTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLEFyYXZpc1Byb2plY3QsYXJhdmlzLCQoQVJBVklTX1ZF
UlNJT04pKQo+PiArQVJBVklTX0RFUEVOREVOQ0lFUyA9IFwKPj4gK8KgwqDCoCBob3N0LXBrZ2Nv
bmYgXAo+PiArwqDCoMKgIGxpYmdsaWIyIFwKPj4gK8KgwqDCoCBsaWJ4bWwyCj4gCj4gVGhlcmUg
aXMgYSBsaXN0IG9mIGRlcGVuZGVuY2llcyBpbiB0aGUgUmVhZG1lOgo+IAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9BcmF2aXNQcm9qZWN0L2FyYXZpcy9ibG9iL21haW4vUkVBRE1FLm1kI2luc3RhbGwt
ZGVwZW5kZW5jaWVzLW9uLXVidW50dS0yMDA0Cj4gCj4gZXNwZWNpYWxseSBnc3RyZWFtZXIgYW5k
IHBsdWdpbnMgZXRjLi4KPiAKPiAKPiBUaGlzIHJ1bGVzIGlzIGp1c3QgZm9yIEdpZ0UgQ2FtZXJh
IGFuZCBub3QgVVNCM1Zpc2lvbi4gSSBoYXZlbid0IHRlc3RlZCB0aGlzIGZlYXR1cmUuIFRoZSBn
c3RyZWFtZXIgaXMgbm90IG1hbmRhdG9yLCBpdCBpcyBvbmx5IGZvciB0aGUgdmlld2VyLiBJIGFt
IGZvY3VzZWQgb24gRW1iZWRlZCBzeXN0ZW0gd2l0aG91dCBhbnkga2luZCBvZiBkaXNwbGF5Lgo+
IAo+IElmIHRoZSBnc3RyZWFtZXIgb3IgbGlidXNiMyBhcmUgYXZhaWxhYmxlcywgbWVzb24gaXMg
YWJsZSB0byBkZXRlY3QgYW5kIGFkZCB0aGVtIGR1cmluZyB0aGUgY29uZmlndXJhdGlvbiBwcm9j
ZXNzLgo+IAo+IFRvIGFkZCBhcyBkZXBlbmRlbmNpZXMsIGZvcmNlcyB0byBidWlsZCB0aGUgb3B0
aW9uYWxzIGZlYXR1cmVzLgo+IAo+IFdoYXQncyB0aGUgYmVzdCA/CgpJZiB5b3UgZG9uJ3QgdXNl
IGFuIG9wdGlvbmFsIGRlcGVuZGVuY3ksIHdlIHJlY29tbWVuZCB0byBkaXNhYmxlIGl0IGV4cGxp
Y2l0bHkuCkxldHRpbmcgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeSBhdXRvIGRldGVjdGVkIGJ5IGEg
cGFja2FnZSB3aXRob3V0IGFueSBoYW5kbGluZwppbiB0aGUgQnVpbGRyb290IHBhY2thZ2UgaXMg
YSBwcm9ibGVtIGZvciB0aGUgYnVpbGQgcmVwcm9kdWNpYmlsaXR5LgoKQmVzdCByZWdhcmRzLApS
b21haW4KCj4gCj4gCj4gCj4gVGhhbmsgeW91LiwgYmVzdCByZWdhcmRzLAo+IAo+IE1hcmMuCj4g
Cj4gCj4gCj4gCj4gCj4gCj4gCj4gRGUgOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPgo+IMOAIDogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnI+Cj4gU3VqZXQgOiBSZTogW0J1aWxkcm9vdF0gcGFja2FnZS9hcmF2aXM6IG5ldyBwYWNrYWdl
Cj4gRGF0ZSA6IDA2LzAxLzIwMjIgMTA6Mzc6NTkgRXVyb3BlL1BhcmlzCj4gQ29waWUgw6AgOiBt
YXJjLmNoYWxhaW5AbWFpbG9vLm9yZzsKPiDCoMKgwqBidWlsZHJvb3RAYnVpbGRyb290Lm9yZzsK
PiDCoMKgwqBFcmljIExlIEJpaGFuIDxlcmljLmxlLmJpaGFuLmRldkBmcmVlLmZyPjsKPiDCoMKg
wqBNYXJjIENoYWxhaW4gPG1hcmMuY2hhbGFpbkBnbWFpbC5jb20+Cj4gCj4gSGVsbG8sCj4gCj4g
T24gVGh1LCA2IEphbiAyMDIyIDEwOjI0OjUzICswMTAwCj4gUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IAo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXJhdmlz
L0NvbmZpZy5pbiBiL3BhY2thZ2UvYXJhdmlzL0NvbmZpZy5pbgo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLjAyYzcxYzQ0ZGEKPj4+IC0tLSAvZGV2L251bGwK
Pj4+ICsrKyBiL3BhY2thZ2UvYXJhdmlzL0NvbmZpZy5pbgo+Pj4gQEAgLTAsMCArMSwxNiBAQAo+
Pj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9BUkFWSVMKPj4+ICvCoMKgwqAgYm9vbCAiYXJhdmlzIC0g
R2lnRSBDYW1lcmEiCj4gCj4gSnVzdDoKPiAKPiBib29sICJhcmF2aXMiCj4gCj4+PiArwqDCoMKg
IGRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUgo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fSEFTX1RIUkVBRFNfTlBUTAo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1BDUkVfMTYKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QQ1JFXzMyCj4gCj4g
UGxlYXNlIHVzZSAic2VsZWN0IiBmb3IgcGNyZS4KPiAKPj4+ICtBUkFWSVNfTElDRU5TRV9GSUxF
UyA9IENPUFlJTkcKPj4+ICtBUkFWSVNfTERGTEFHUyA9ICQoVEFSR0VUX0xERkxBR1MpICQoVEFS
R0VUX05MU19MSUJTKSAKPj4KPj4gSXMgZ2V0dGV4dCBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5ID8K
Pj4gQXQgbGVhc3QgZ2V0dGV4dCBzaG91bGQgYmUgaW4gQVJBVklTX0RFUEVOREVOQ0lFUyB3aGVu
IE5MUyBzdXBwb3J0IGlzIGVuYWJsZWQuCj4gCj4gTm8sIGRvbid0IGFkZCBnZXR0ZXh0IGRpcmVj
dGx5LCB1c2UgJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUyksIHdoaWNoCj4gd2lsbCBhdXRvbWF0
aWNhbGx5IGFkZCAob3Igbm90KSBob3N0LWdldHRleHQgYW5kL29yIGdldHRleHQgdG8gdGhlCj4g
ZGVwZW5kZW5jaWVzLCBkZXBlbmRpbmcgb24gd2hlbiBpdCdzIG5lZWRlZCBvciBub3QuCj4gCj4g
VGhvbWFzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
