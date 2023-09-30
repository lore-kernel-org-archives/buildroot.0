Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E5E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3FE6421E1;
	Sat, 30 Sep 2023 16:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FE6421E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0sj3W8LzFtc; Sat, 30 Sep 2023 16:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC4342238;
	Sat, 30 Sep 2023 16:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC4342238
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43EB21BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23666421E1
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23666421E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4junVFlRz-gy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:09:10 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97EED42238
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97EED42238
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so14464222f8f.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696090147; x=1696694947;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ymHhE/fOAg5EHrarRnjc0bIB++vb2676zBusalIfjSk=;
 b=sE1RWTEa/EdGQsTCJtTTkjczgjHDK5+qFfDLSegtXnCHRD64xFBw71v4VqoE086OFk
 PLk0QYtpZSxRtKeeMZHXKaBleOZScOc5NEF677DBAmtpbx5oKzKsSuiOJ0NAwNnPDpRG
 BXbzosS6cs4WWTJx/TX9fu2r2my+9Mi7zXVg+uHPI6/SgkFy6PZUA+RcHKECgc4PPU/a
 xg08PicJMfLxIDc7qdbDtSNB/lVcfspKKIpgDlJ1uyuCiLymspEh/Wny6jbsTsQN1h0T
 bs7jsu4b2Hin2WlH3r9jL90al4X3xuPaeCYkn+Nl6eDE+n2EL3bN9Gqw5H68XzhgFTWV
 amzA==
X-Gm-Message-State: AOJu0Yx+eCEcMLt84qAxg5AF4jNG/fXyhQdVzhZPqKEYB1BZzvSLz9ZX
 p4q0R9SQcwu/MNAhOPb9eRUFiAy/IOjR1yOEpfH44g==
X-Google-Smtp-Source: AGHT+IGgZBCdxc4sdfSPK/JGNordrZPw6SnKztDSye1NY304rtVrTKOE/IwhjI1TFnDd4HRK1D/cZg==
X-Received: by 2002:adf:ce0c:0:b0:323:30bb:f19c with SMTP id
 p12-20020adfce0c000000b0032330bbf19cmr6593333wrn.10.1696090147495; 
 Sat, 30 Sep 2023 09:09:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 n3-20020adff083000000b003143867d2ebsm23935354wro.63.2023.09.30.09.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 09:09:06 -0700 (PDT)
Message-ID: <6e20a037-edad-e7c8-642a-05e4b262c5cd@mind.be>
Date: Sat, 30 Sep 2023 18:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
 <63b848ff-3ec5-b4ed-d381-2c30f8ded8a7@mind.be>
In-Reply-To: <63b848ff-3ec5-b4ed-d381-2c30f8ded8a7@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696090147; x=1696694947; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ymHhE/fOAg5EHrarRnjc0bIB++vb2676zBusalIfjSk=;
 b=Z4lnWtwT/YZCyUvovz7QS0ljnZZ1VS6r+WoyGFXygqNACJWq+peCi90dL0fB8KZ80k
 Q08LO1XmgCQFC8ytOY0hiuzubZDeAUZn3JW1m26fog8Beftw4Yunx5fDUxsrhr1z1PdT
 02hSZhbKEYk4GSsNx+ANagh9o2zXoqj4Rg91yWfZim0eFvH8Yu6/EX5L3H8sEhlSmMhc
 xWNi/pOKS43eFY53FsekXa3q5fZj1OpztYCAtsyljCShtD3RopY1MBf/HbW1yT+a7CIK
 DDSr36fNQHjDwNjPdWTxCynpNqtUWA4NpQvj/8Vod/uTc3V/xyiWYroFGNfhwoW0ZLFl
 bE/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z4lnWtwT
Subject: Re: [Buildroot] [PATCH v4 0/5] Configure default wifi through
 kconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDMwLzA5LzIwMjMgMTg6MDYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNC8xMC8yMDIyIDEzOjA0LCBBbmdlbG8gQ29tcGFnbnVjY2kgd3JvdGU6Cj4+IFRoaXMgc2Vy
aWVzIHdhcyBib3JuIHdoaWxlIGFkZGluZyBzdXBwb3J0IGZvciBhIGJvYXJkIGFuZCBmZWVsaW5n
IHRoZQo+PiBuZWNlc3NpdHkgdG8gaGF2ZSB0aGUgbmV0d29ya2luZyBvcHRpb25zIGF2YWlsYWJs
ZSBpbiAuY29uZmlnLgo+PiBJIHVuZGVyc3RhbmQgdGhhdCBzb21ldGhpbmcgbGlrZSB0aGF0IGNv
dWxkIGJlIGRvbmUgYnkgYWRkaW5nIGFuCj4+IG92ZXJsYXksIGJ1dCBpdCByZXF1aXJlcyBhIGxv
dCBvZiBib2lsZXJwbGF0ZSBvbmx5IHRvIGJlIGFibGUgdG8gY29ubmVjdAo+PiB0byBhIHdpZmkg
bmV0d29yay4KPgo+IMKgQXMgeW91IHNheSwgaXQncyBzb21ldGhpbmcgdGhhdCBjYW4gZWFzaWx5
IGJlIGFkZGVkIGluIGFuIG92ZXJsYXkuIEluIAo+IGFkZGl0aW9uLCBpdCdzIHNvbWV0aGluZyB0
aGF0IGlzIG9ubHkgdXNlZnVsIGluIGEgdmVyeSBzcGVjaWZpYywgdmVyeSBzbWFsbCAKPiB1c2Ug
Y2FzZTogd2hlbiB5b3UncmUgZGVtb25zdHJhdGluZyBhIGJvYXJkIG9mIHdoaWNoIHlvdSB1c2Ug
b25seSBpbiBhIHNpbmdsZSAKPiBwbGFjZSBhbmQgYXJlbid0IHBsYW5uaW5nIHRvIG1vdmUgYW55
d2hlcmUgZWxzZSwgYW5kIHdoZW4geW91IGRvbid0IHdhbnQgb3QgCj4gc3BlbmQgdGltZSBwcmVw
YXJpbmcgYSBwcm9wZXIgb3ZlcmxheSBmb3IgaXQuCj4KPiDCoFNvLCBJJ20gZ29pbmcgdG8gbWFy
ayB0aGlzIHNlcmllcyBhcyByZWplY3RlZC4KPgo+IMKgVGhhdCBzYWlkLCB0aGVyZSBhcmUgc29t
ZSB1c2VmdWwgYml0cyBpbiBpdCwgd2hpY2ggSSdsbCBjb21tZW50IG9uIGluZGl2aWR1YWxseS4K
CiDCoEluIGEgZGlzY3Vzc2lvbiB0aHJlYWQgb24gdjMsIHlvdSB3cm90ZSB0aGF0IGN1cnJlbnRs
eSB0aGlzIGlzIHlvdXIgZG9jdW1lbnRhdGlvbjoKCiDCoCMgd3BhX3Bhc3NwaHJhc2UgQUNDRVNT
UE9JTlROQU1FID4+IC9ldGMvd3BhX3N1cHBsaWNhbnQuY29uZgogwqAgwqAodHlwZSBwYXNzd29y
ZCBhbmQgZW50ZXIpCiDCoCMgd3BhX3N1cHBsaWNhbnQgLWkgd2xhbjAgLWMgL2V0Yy93cGFfc3Vw
cGxpY2FudC5jb25mIC1CCiDCoCMgdWRoY3BjIC1pIHdsYW4wCgoKIMKgQmFzaWNhbGx5LCByZW1v
dmluZyB0aGUgbmVlZCBmb3IgdGhlIGxhdHRlciB0d28gc3RlcHMgaXMgd29ydGh3aGlsZSwgYnV0
IHRoZSAKZmlyc3Qgc3RlcCBpcyBvbmx5IHJlYXNvbmFibGUgdG8gZG8gb24gdGhlIGRldmljZSBp
dHNlbGYuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0
Cj4KPj4KPj4gQW5nZWxvIENvbXBhZ251Y2NpICg1KToKPj4gwqDCoCBzeXN0ZW06IGFkZGluZyBv
cHRpb25zIGZvciBjb25maWd1cmluZyB3aWZpCj4+IMKgwqAgcGFja2FnZS93cGFfc3VwcGxpY2Fu
dDogY29uZmlndXJlIHdpZmkgb24gc3lzdGVtdiB3aGVuIGVuYWJsZWQKPj4gwqDCoCBwYWNrYWdl
L3dwYV9zdXBwbGljYW50OiBjb25maWd1cmUgd2lmaSBvbiBzeXN0ZW1kIHdoZW4gZW5hYmxlZAo+
PiDCoMKgIHBhY2thZ2UvaWZ1cGRvd24tc2NyaXB0czogYWRkIHdpZmkgY29uZmlndXJhdGlvbiB3
aGVuIGVuYWJsZWQKPj4gwqDCoCBwYWNrYWdlL2luaXRzY3JpcHRzOiBhZGQgc2VydmljZSB0byBs
b2FkIGtlcm5lbCBtb2R1bGVzIGF0IGJvb3QKPj4KPj4gwqAgcGFja2FnZS9pZnVwZG93bi1zY3Jp
cHRzL2lmdXBkb3duLXNjcmlwdHMubWsgfMKgIDIgKwo+PiDCoCBwYWNrYWdlL2luaXRzY3JpcHRz
L2luaXQuZC9TMTFtb2R1bGVzwqDCoMKgwqDCoMKgwqAgfCA1OSArKysrKysrKysrKysrKysrKysr
Kwo+PiDCoCBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rwqDCoMKgwqAg
fCAyNCArKysrKysrKwo+PiDCoCBzeXN0ZW0vQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArKysrKwo+PiDCoCA0IGZp
bGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2luaXRzY3JpcHRzL2luaXQuZC9TMTFtb2R1bGVzCj4+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
