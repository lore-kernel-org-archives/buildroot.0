Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB32BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D9B40A87;
	Mon,  7 Mar 2022 22:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYIz1fhzhaBT; Mon,  7 Mar 2022 22:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D5EC408DA;
	Mon,  7 Mar 2022 22:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8331BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CC9D60B1B
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tc2OIcWgXe1y for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9AEF6070A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:27:30 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id q17so22003292edd.4
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=i7VpSYfYZGyhi68yLxNuhZmG/evtYQ8usFpl6SnEdtQ=;
 b=XzmKVM9j18fc8/iwJfQmT9r9ioPmJqPMQ6ynklMenprPADT/luoAmS/KuWpcGhqSpH
 sEHLXnSKU8+XdgdiaknRR9bFzfjBm/BQ/yByT8JJmjs9VlWRNTlXeAMY5LNYz00eiye8
 qvFcP3WEfAcyt9DU5kH+kjnNFTyReQWOXS+JWbTwUAUe7JUSmesxAdf1oPVzgcOfFimW
 /t5Os/fTxfCGRuJtuBbOEcmUkh+7TedyZGD9Jo5VgS3OF8ceD0wltwzBu7uI5fyAEMtd
 IQzJgQroR0GmOILtwXp57HA2IswUCUjZ55YMFliT4BCpFNkI2cfJKFR7tJ3v/faPUCCg
 Zn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i7VpSYfYZGyhi68yLxNuhZmG/evtYQ8usFpl6SnEdtQ=;
 b=m6i1GHXHafu1XZJ6uTk1QbJTrQutk55qx+XqZeoq5XYIJZNOgIlPkl65qE5pzAlccj
 uAX32pWU4mgEIJpR2HP14w6ADkjod5FDKGdu29kZ9wAP92eHnqEgwR50k9YJxvO7gdjT
 vvwF95DpOYatlr0Iyx0+nBVFY4SDCSQF15sRDfScC/78s/N6vUq8uI9f2UIIHUKKVAgM
 gV7Cwicz5OeBdJ3UJratW7xNROHJMY1Fp/FeJILYTeFaeOTC5CG4M81P6dtKHln9wd+u
 JzI971dew8t4BIY4ngQLUE/fvny4bCoTySwKjCzGBVRUT91cuCpgEvMV1SeuE9GbOkG6
 b7Qw==
X-Gm-Message-State: AOAM530qPkCTfVt2zOWRtYOVxK1OY0bRb2JPwK0Ix+VwDSm1a5Voe32Z
 MXLW6wVPJdQotbHuA2kuqeLArA==
X-Google-Smtp-Source: ABdhPJzWHzSF4bREG1c+8M+dXRf6e5xoJmLQra+ovctT3Uvj8s+mnKfkWkUkG0Iilipq2LIRAfwVog==
X-Received: by 2002:a05:6402:26c2:b0:416:4839:3df7 with SMTP id
 x2-20020a05640226c200b0041648393df7mr6853484edd.210.1646692049086; 
 Mon, 07 Mar 2022 14:27:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056402060400b00415a1f9a4dasm6772574edv.91.2022.03.07.14.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:27:28 -0800 (PST)
Message-ID: <a95699be-4244-8aeb-b995-abb4111189cd@mind.be>
Date: Mon, 7 Mar 2022 23:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220224113735.4088631-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224113735.4088631-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 5.10.100-cip2
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

Ck9uIDI0LzAyLzIwMjIgMTI6MzcsIEFuZ2VsbyBDb21wYWdudWNjaSB3cm90ZToKPiBTaWduZWQt
b2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsb0BhbWFydWxhc29sdXRpb25zLmNvbT4K
CiDCoEJvdGggYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCgogwqBSZWdhcmRzLAogwqBBcm5v
dXQKCj4gLS0tCj4gICBsaW51eC9Db25maWcuaW4gIHwgNCArKy0tCj4gICBsaW51eC9saW51eC5o
YXNoIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGludXgvQ29uZmlnLmluIGIvbGludXgvQ29uZmlnLmlu
Cj4gaW5kZXggMTNkOTliZDA5ZC4uYzQ1NGE4OWZiYSAxMDA2NDQKPiAtLS0gYS9saW51eC9Db25m
aWcuaW4KPiArKysgYi9saW51eC9Db25maWcuaW4KPiBAQCAtMzEsNyArMzEsNyBAQCBjb25maWcg
QlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVSU0lPTgo+ICAgCWJvb2wgIkxhdGVzdCB2ZXJzaW9u
ICg1LjE1KSIKPiAgIAo+ICAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfTEFURVNUX0NJUF9WRVJT
SU9OCj4gLQlib29sICJMYXRlc3QgQ0lQIFNMVFMgdmVyc2lvbiAoNS4xMC44My1jaXAxKSIKPiAr
CWJvb2wgIkxhdGVzdCBDSVAgU0xUUyB2ZXJzaW9uICg1LjEwLjEwMC1jaXAyKSIKPiAgIAloZWxw
Cj4gICAJICBDSVAgbGF1bmNoZWQgaW4gdGhlIHNwcmluZyBvZiAyMDE2IHRvIGFkZHJlc3MgdGhl
IG5lZWRzIG9mCj4gICAJICBvcmdhbml6YXRpb25zIGluIGluZHVzdHJpZXMgc3VjaCBhcyBwb3dl
ciBnZW5lcmF0aW9uIGFuZAo+IEBAIC0xMjYsNyArMTI2LDcgQEAgZW5kaWYKPiAgIGNvbmZpZyBC
UjJfTElOVVhfS0VSTkVMX1ZFUlNJT04KPiAgIAlzdHJpbmcKPiAgIAlkZWZhdWx0ICI1LjE1LjEz
IiBpZiBCUjJfTElOVVhfS0VSTkVMX0xBVEVTVF9WRVJTSU9OCj4gLQlkZWZhdWx0ICI1LjEwLjgz
LWNpcDEiIGlmIEJSMl9MSU5VWF9LRVJORUxfTEFURVNUX0NJUF9WRVJTSU9OCj4gKwlkZWZhdWx0
ICI1LjEwLjEwMC1jaXAyIiBpZiBCUjJfTElOVVhfS0VSTkVMX0xBVEVTVF9DSVBfVkVSU0lPTgo+
ICAgCWRlZmF1bHQgIjUuMTAuODMtY2lwMS1ydDEiIGlmIEJSMl9MSU5VWF9LRVJORUxfTEFURVNU
X0NJUF9SVF9WRVJTSU9OCj4gICAJZGVmYXVsdCBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFIFwKPiAgIAkJaWYgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTgo+IGRp
ZmYgLS1naXQgYS9saW51eC9saW51eC5oYXNoIGIvbGludXgvbGludXguaGFzaAo+IGluZGV4IGQw
ODEzZTVkYjQuLjhiNjg5ZjEyMmIgMTAwNjQ0Cj4gLS0tIGEvbGludXgvbGludXguaGFzaAo+ICsr
KyBiL2xpbnV4L2xpbnV4Lmhhc2gKPiBAQCAtOSw3ICs5LDcgQEAgc2hhMjU2ICBmZDRiZGJjOGJl
MzQ3MmQ2MzI0ZmEwZjVmNTdhMTdmNWMzZjUwOWQ1ZjViNGZhNGYxYTk3OTdkOTgyZDBiY2E4ICBs
aW51eC0KPiAgIHNoYTI1NiAgYmZmYWFhNGM5M2FiNGVkMWRlNjFmODA0YzI2YzkyYjgyZGQ4MGY5
Mjc5M2UyMDE5NGI2MjQ5N2Q3YjhiNDcyMyAgbGludXgtNC4xNC4yNjEudGFyLnh6Cj4gICBzaGEy
NTYgIDAxY2NmYzM0MTNjM2JiMzA1NjUzY2ViMGFhNTI4YWJhMGNhYTYxYjMyNmU0MzcwOWJmMWY4
YjYyNGYyMTEwMzEgIGxpbnV4LTQuMTkuMjI0LnRhci54ego+ICAgIyBMb2NhbGx5IGNvbXB1dGVk
Cj4gLXNoYTI1NiAgNTczOGRjZjAyMGZmNzVmYjZlNDNkNmQxYThiNTcyZDJmMWZlNThjMDhiMzFm
ODIyZWI0MmZiOTFkNmJkYzk4ZiAgbGludXgtY2lwLTUuMTAuODMtY2lwMS50YXIuZ3oKPiArc2hh
MjU2ICBlOTBlODEwMGJmNDRjZGQ2NzE0YmNhM2I5YjFmNzg2OTRjOTliZmE5YmRmZjc2MWRlMDZi
MTkyZGZiMjMwODMxICBsaW51eC1jaXAtNS4xMC4xMDAtY2lwMi50YXIuZ3oKPiAgIHNoYTI1NiAg
MjM5NTQ0M2M1Zjk2MGU1YzYzNDNmNzA0ODAyMDlkMjUzMGRhMjdhYTZmMDI5OTQxMmUwZjRiNzEy
OGZjY2I3YyAgbGludXgtY2lwLTUuMTAuODMtY2lwMS1ydDEudGFyLmd6Cj4gICAKPiAgICMgTGlj
ZW5zZXMgaGFzaGVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
