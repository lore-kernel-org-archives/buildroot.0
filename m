Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B3E40286;
	Sun, 23 Jan 2022 10:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emXVyP0ntfa8; Sun, 23 Jan 2022 10:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F40404BF;
	Sun, 23 Jan 2022 10:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A23A1BF47D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07B1860B33
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVmjPUXwWQvF for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:56:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49FFC60B0A
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:56:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id az25so8276363wrb.6
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PnEMe75iQSvxRdzXb6if3RRpXJCNONfgc34s3rFzsng=;
 b=o6VA2tbFKJWga5M2AFi1WuyFrdEn0Rjs2cqDmwxUZRK7FRJ7H0P15n4OvWF56jk5v6
 tabrPO/bJh9wWauBCxUV5ZNJDw2w2XD7eEoczT87GEjEGDBT+7FOb/6izoC+P9uLoiI4
 594P0xq2VjkQN4i7iMWJPT4ITB+tblVBC4tvJpE6ds6shzZ5F6e4icHEo+M5a1tO2Ku0
 Ail8Plp/vS55GerzCPnWjDIlPNsiq3xqVvqwgbJp6Ekn7DZ+7st1TfHOzP1eZuL2AGit
 s4smFwdN2zVg8cUMNneXJLg/aquPYQLHA7bnLT4cBH2LWhIocU8YiRk99XN7E3pTrse5
 05lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PnEMe75iQSvxRdzXb6if3RRpXJCNONfgc34s3rFzsng=;
 b=BdHxxeuDc/MXSRT71Gztcjrz4Z9kLk2LwQupY+2M48fuKFnI29htzJoYTGeSdP6VE3
 XyW33kxIrcoA/VRNLnba9lOpSHxFCjFEnL+ucEspBqCiIRKCbqa9JPeiZJ0LIEkXLoJC
 Ih588NEW+zgHZ7WxrSgZILnPoEVSp78ec/yMDch9phRb/+tMYEQ20N/J7mGPPh4MaCZy
 l7KiB3C/V3AMP/jM0TVyzlwgT1NxiFF/TnRzupL2bqMun9xXNBOnMAiNtCJdy0TkNC6d
 s8XNyHQOet3cO1WMpowyUEud4TAvwqGlIPtWf22Eye83ir2NaF3/JmCPxa6TKgqgiv0C
 Zv6w==
X-Gm-Message-State: AOAM533Oe6DQhJjav6ZTKbH66In1aH/lAItmsAHlBPyM6qep7XxyzBCr
 QNoiJ0SXcmNt2IT2E5/R4+VwEOXtVzk=
X-Google-Smtp-Source: ABdhPJwXPspgBjAkyUpj7ZGpZWaqmiuWWk4Ki9Boi249DtlRPAExcbytWdN2jsmnV1n/jBvxNTeyjw==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr10504990wro.422.1642935404451; 
 Sun, 23 Jan 2022 02:56:44 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 14sm4761561wrz.100.2022.01.23.02.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 02:56:43 -0800 (PST)
Message-ID: <bde7ae07-e97b-592a-1680-da61af531fe8@gmail.com>
Date: Sun, 23 Jan 2022 11:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220122153714.26991-1-peter@korsgaard.com>
 <20220122153714.26991-3-peter@korsgaard.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220122153714.26991-3-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 3/3] configs/qemu_aarch64_virt_defconfig:
 bump Linux kernel to 5.15.16
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsIEFsbAoKTGUgMjIvMDEvMjAyMiDDoCAxNjozNywgUGV0ZXIgS29yc2dhYXJk
IGEgw6ljcml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPgo+IC0tLQo+ICBjb25maWdzL3FlbXVfYWFyY2g2NF92aXJ0X2RlZmNvbmZpZyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3ZpcnRfZGVmY29uZmlnIGIvY29u
Zmlncy9xZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcKPiBpbmRleCAwY2FmMzgxMTJkLi45ZmJm
MjkzMzExIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3ZpcnRfZGVmY29uZmln
Cj4gKysrIGIvY29uZmlncy9xZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcKPiBAQCAtMjAsNyAr
MjAsNyBAQCBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTU9eQo+ICAj
IEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
VkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUi
Cj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUuMTYiCgpXaHkg
anVzdCBvbmx5IHRha2luZyBjYXJlIG9mIHRoaXMgZGVmY29uZmlnID8KTW9zdCBxZW11IGRlZmNv
bmZpZyBhcmUgdXNpbmcgdGhlIHNhbWUga2VybmVsIHZlcnNpb24gKDUuMTUpLiBVc3VhbGx5IHdl
IHRyeSB0bwprZWVwIGFsbCBvZiB0aGVtIGluIHN5bmMuCgpTaW5jZSBRZW11IGRlZmNvbmZpZ3Mg
YXJlIHJ1bnRpbWUgdGVzdGVkIGVhY2ggd2VlayBpbiBHaXRMYWItQ0kgbWF5YmUgd2UgY2FuCnNh
ZmVseSBzd2l0Y2ggdG8gQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVSU0lPTiBpbnN0ZWFkID8K
QnV0IHdlIGhhdmUgdG8gY2hlY2sgcWVtdSBkZWZjb25maWdzIHVzaW5nIGEgbG9jYWwga2VybmVs
IHBhdGNoLCBjdXJyZW50bHkKcHBjLW1wYzg1NDRkcyBhbmQgYXJtLXZlcnNhdGlsZSBvciBrZWVw
aW5nIGtlcm5lbCBjdXN0b20gdmVyc2lvbiBmb3IgdGhlbS4KCkFsc28gQlIyX0xJTlVYX0tFUk5F
TF9MQVRFU1RfVkVSU0lPTiByZWZlciB0byB0aGUgbGF0ZXN0IHN0YWJsZSBrZXJuZWwgdmVyc2lv
biwKbm90IHRoZSBsYXRlc3QgbHRzIHZlcnNpb24uCgpUaG91Z2h0cz8KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKPiAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cj4gIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9s
aW51eC5jb25maWciCj4gIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
