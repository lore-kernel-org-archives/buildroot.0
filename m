Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A638C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A49D541489;
	Mon,  4 Mar 2024 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7cRG4RWzWu6; Mon,  4 Mar 2024 15:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C37640474
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C37640474;
	Mon,  4 Mar 2024 15:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D81801BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A2360BC5
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKE2rPTaFnmf for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3085260A3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3085260A3D
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3085260A3D
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:33:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d28051376eso61527791fa.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566378; x=1710171178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+3rtnYhb0JqSqfKWh1SEw26g5i0apYth2ZtQ4GXgPU=;
 b=d/VN6QzyVbPPJyFu7qBQoUnyEuuypi1eO04ZlLKk631hzMnB9JwGccULMKnX6Aogry
 a35oPUbdEP+o+NhG5Pq5/SRqZtZE6SuQ/z5MV9ap5E7Rs2l8U9wWqBmICghEzU/y7+mK
 x5sY+YyQJAO7+HQ8mWbUVjNQd3tLenmg+0XKu7HDmzI1OmC7oJJMFI7bJ6updUvAo/KQ
 bX6u1Sk6Ldju6vP+6AIIhMk7Ml/dQTi236pAaS9Y7hMBhAkTqML+TsRc8BFJ0f1qjyHa
 KpWz2juJhn75mlEyc/r3+b8Nfjr9MzwhieNH6LVwDhkibIleJKzTUXaY3zwFwSyM/IgJ
 QFaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9n/EXHESjoLlh7jjFiT/ZgoDxFN56acAIj3dLcsDg5yVCfR+uqTI+arDZQ7R+o0Ak68mUCgp3BeOVPZ6ik3SlcuoPp9/euQ==
X-Gm-Message-State: AOJu0YztZMURo6dh5UF+6iz8D5y03RiiY9GLAt8P8GQbgo/ay17T6V6T
 zNzLNfg51fQgMGje4T/ZvX4JmtrszcKATpn9SQXs3wvqU6NxzDHRi8GjU/3NlZpU7yTEvAno+B8
 ibThLxQkX7FtIJ+t4C8jejYgOx0A=
X-Google-Smtp-Source: AGHT+IEnmM79pSDc53xYB8HsA5EBvLeSmK07lCzCWI99W/+gYJudYnfkE6qo/igiM5/PNL06jL68Rc3ucF2/cuBOBn0=
X-Received: by 2002:a2e:804d:0:b0:2d2:9121:52f5 with SMTP id
 p13-20020a2e804d000000b002d2912152f5mr6631806ljg.42.1709566377684; Mon, 04
 Mar 2024 07:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
 <20240303231700.55fe7c0b@windsurf>
 <CAPi7W80PD21cWRc6Gu=5YDSnCd9mB7h2oqALzSrfxoLRfe_aOw@mail.gmail.com>
 <CACXRmJikOqij+4GWfJRxpY_FvmNReHoirAjawshojbArFwm7aA@mail.gmail.com>
In-Reply-To: <CACXRmJikOqij+4GWfJRxpY_FvmNReHoirAjawshojbArFwm7aA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 4 Mar 2024 16:32:46 +0100
Message-ID: <CAPi7W83PKZ97mJfhwGiDfac15Wmc1CKOYx_34jVU5APhoFn=tg@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709566378; x=1710171178; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+3rtnYhb0JqSqfKWh1SEw26g5i0apYth2ZtQ4GXgPU=;
 b=gu/+rdvut+4xtDQlZX44LNQ2FpCESLhzZiYvD0pr68RIfT06aZR/vuPJBK0X4w0hpr
 TY92x6sE3da+SZwWzv9cZSmkx6yzQa7vDwI6upfJhg3j5SVhHrfBoIdY/H9L+D0pZvFA
 oJgeHr8+OjpfnXzE1qXiH6/dCyRjKyuKx2sTG4wrB/uc0yQtamlg7DJxvRziDvDx/6G/
 7xEj6RpKhVIxr8DWiFWdu0sH8iAA5q86nirtHWECrQs8AhcDmRCllFzjYZ08TjO8Rzve
 VPx2PlocRMH7bSKEyE0oRQEjufcUqbYojv+6KzjcW5shfhkaRZG5CtUVBsodvn/OPg1/
 Eg8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gu/+rdvu
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 BR2_TIME_BITS_64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiA0IG1hcnMgMjAyNCDDoCAxMTo1NSwgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2
b29nZHQuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBhbGwsCj4KPiBPcCB6byAzIG1ydCAyMDI0IG9t
IDIzOjM0IHNjaHJlZWYgRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20+Ogo+ID4KPiA+IExlIGRpbS4gMyBtYXJzIDIwMjQgw6AgMjM6MTcsIFRob21hcyBQZXRhenpv
bmkKPiA+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4gPiA+Cj4g
PiA+IE9uIFN1biwgIDMgTWFyIDIwMjQgMjI6MjQ6MTEgKzAxMDAKPiA+ID4gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IElu
ZGVlZCwgdGhpcyBMRlMgd29ya2Fyb3VuZCB3YXMgcHJlc2VudCBzaW5jZSB0aGUgYWRkaXRpb24g
b2YgdGhlCj4gPiA+ID4gcGFja2FnZSBpbiBjb21taXQgNmEwZjdjMzliY2I0OGZjMTNhYTJjZTNm
YzQ5OTZiYWYxYmU2NjQ4MyBhbmQgaXMKPiA+ID4gPiBwcm9iYWJseSBub3QgbmVlZGVkIGFueW1v
cmUKPiA+ID4KPiA+ID4gVGhpcyBwYWNrYWdlIHdhcyBhZGRlZCBqdXN0IGEgeWVhciBhZ28sIHNv
IEkgYmVsaWV2ZSAicHJvYmFibHkgbm90Cj4gPiA+IG5lZWRlZCBhbnltb3JlIiBpcyBtb3N0IGxp
a2VseSBub3Qgc3VmZmljaWVudGx5IGFzc2VydGl2ZS4gQ2FuIHdlIGdldAo+ID4gPiBzb21lIG1v
cmUgY2xhcml0eSBvbiB0aGlzLCBieSByZXByb2R1Y2luZyB0aGUgb3JpZ2luYWwgaXNzdWUgdGhh
dCBsZWFkCj4gPiA+IHRvIHRoaXMgRkxVRU5UX0JJVF9DRkxBR1MgKz0gLVVfRklMRV9PRkZTRVRf
QklUUyBtYWdpYywgYW5kIHRoZW4gZmlndXJlCj4gPiA+IG91dCBob3cgaXQgZ290IHJlc29sdmVk
LCBpZiBpdCBkaWQ/Cj4gPgo+ID4gQ29tbWVudCBhYm92ZSB0aGlzICJtYWdpYyIgaXMgcG9pbnRp
bmcgdG8gYSBwb2xpY3ljb3JldXRpbHMgZGVmZWN0Cj4gPiBvcGVuZWQgMTQgeWVhcnMgYWdvIGlu
IDIwMTAuCj4gPiBJIGFzc3VtZSB0aGF0IGl0IGNvdWxkIGJlIGxpbmtlZCB0byBnbGliYyA8IDIu
MjMgYXMgZm9yIHRoZSBvdGhlciBwYWNrYWdlcy4KPiA+IEhvd2V2ZXIsIEknbGwgbGV0IFRob21h
cyBhbnN3ZXJzIG9uIHdoeSB0aGlzICJtYWdpYyIgd2FzIG5lZWRlZC4KPgo+IEkgYWRkZWQgdGhp
cyAibWFnaWMiIGluIG15IHdheSBvZiBnZXR0aW5nIGZsdWVudC1iaXQgY29tcGlsZWQgZm9yIGFs
bAo+IHRoZSBidWlsZHJvb3QgdGFyZ2V0cy4KPiBUaGUgdHlwaWNhbCAnLi91dGlscy90ZXN0LXBr
ZyAtcCBmbHVlbnQtYml0IC1hJyBzY3JpcHQgZXhwb3NlZCB0aGF0Cj4gcHJvYmxlbS4gQnV0IEkg
Zm9yZ290IHRoZQo+IHRhcmdldC9hcmNoaXRlY3R1cmUgdGhhdCBuZWVkZWQgdGhpcyBoYWNrLiBT
byBpZiBhbGwgYXJjaGl0ZWN0dXJlcyBkbwo+IGNvbXBpbGUgbm93LCB0aGVuIEkKPiBndWVzcyB0
aGF0IHdlIGNhbiBqdXN0IGRyb3AgaXQuIChUbyBiZSBjaGVja2VkLikKCkFmdGVyIHJ1bm5pbmcg
Li91dGlscy90ZXN0LXBrZyAtcCBmbHVlbnQtYml0IC1hLCBJIGdvdCBvbmx5IDMgYnVpbGQKZmFp
bHVyZXMgcmFpc2VkIGJ5IHNvdXJjZXJ5LWFybSB0b29sY2hhaW46Cgogc291cmNlcnktYXJtLWFy
bXY0dCBbNDAvNDVdOiBGQUlMRUQKIHNvdXJjZXJ5LWFybSBbNDEvNDVdOiBGQUlMRUQKIHNvdXJj
ZXJ5LWFybS10aHVtYjIgWzQyLzQ1XTogRkFJTEVECgpTbywgdGhpcyBpcyB0aGUgc2FtZSBpc3N1
ZSB0aGFuIGxpYnNlbGludXggYW5kIGFsbCB0aGUgb3RoZXIgcGFja2FnZXMuCkknbGwgc2VuZCBh
IHYyIHVwZGF0aW5nIHRoZSBjb21taXQgbG9nIGFuZCBhbm90aGVyIHBhdGNoIHRvIGRyb3AgdGhp
cwpvbGQgdG9vbGNoYWluLgoKCj4KPiBUaG9tYXMKPgo+ID4gPgo+ID4gPiBUaG9tYXMKPiA+ID4g
LS0KPiA+ID4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+ID4g
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+ID4g
PiBodHRwczovL2Jvb3RsaW4uY29tCj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4KPiA+IEZhYnJp
Y2UKPiA+CgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
