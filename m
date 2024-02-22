Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20853C54791
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD59740105;
	Thu, 22 Feb 2024 21:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOcXlxP8t6Xq; Thu, 22 Feb 2024 21:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7E140146
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D7E140146;
	Thu, 22 Feb 2024 21:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56BE41BF3D6
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AA8B40639
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAISX-COLIyG for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 21:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B723405E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B723405E2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B723405E2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 21:26:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4128dc0923aso1357115e9.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708637159; x=1709241959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MoYEjRdbxQ1b58LNTIxLkzb42s8ho1QVJqMsJxw/vXA=;
 b=Mqlc4MD+R85qW/EwROZ6l3uSV1PGhQlHLHB1OfX+YEthRMf6cNkKSkuFrcwbYZhaSa
 xS96RBOhQR8POSbzvZcJHEe95Rh4b28F3HG8rIFmPSw0Rj2wSz/hqFrnFTx1bjIcF164
 /hA7cosoOJdpwG0bgm1hUQDQuWrobU01YwpCvKFg7yN6nzAM3LI4dBtzPzpB7tMi/nEa
 yVWELEz3M4VhhaeQ3mj/03MDxeJKSg0/hPZW3D9yhmWsThB6i00BwffvAfqtn1U+SWym
 J9lnvDFJimLzPcAwyYYz58y+9hMLDoZgkwvKJcleXz4Xea1CzsbFH+9QLP156dbQgtFj
 iowA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIBGGwVvguPODsQphjWS+wy6av5Biv2n3x1t96rf002UnX5fl6f2PXcf0MyUk4i/BcYXrxwFZ+8X683LYrxIZIblXbwXc9wA==
X-Gm-Message-State: AOJu0YyBDt0FFA6SIFniGtAQQ+7Oir+Je72kmWv4k8QAoLmDvm7rCbsD
 WOaTSJTHYkVCqVbDa+fZkNyNjjWUWkMU0hU05l2Hs6tesfMqfFlYb0WqVkKIc4E=
X-Google-Smtp-Source: AGHT+IFsdENeofzyuPRttwTzn4XnzbyWCc1eTQdoFXawa7XVd0lv24l6FsFmCE26//nbSuTCISrpcQ==
X-Received: by 2002:a05:600c:4c99:b0:40e:a569:3555 with SMTP id
 g25-20020a05600c4c9900b0040ea5693555mr19131188wmp.35.1708637159598; 
 Thu, 22 Feb 2024 13:25:59 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 bd8-20020a05600c1f0800b00410b0ce91b1sm2473848wmb.25.2024.02.22.13.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 13:25:59 -0800 (PST)
Message-ID: <c55cef04-85be-434c-8f6e-fc8725b39ae0@smile.fr>
Date: Thu, 22 Feb 2024 22:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-2-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222101617.18422-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708637159; x=1709241959;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MoYEjRdbxQ1b58LNTIxLkzb42s8ho1QVJqMsJxw/vXA=;
 b=BgCBBR2kiL6OqA0NMaIeGB9bvp72s3pDnjhMTYRMvv5xBj7upYRwBf/tQchHxoYE49
 eRpuv48stjejQHURTHek1MUT20UHMos+lHcUX6uqMHysyLy95L+tnzVZmN5NTAeC39oD
 5rPzmrAtA8WUTMCa4arHDFImyyCmsL982Kg21KCnOfsUQZ+zcFM1jGRY2qVBgn4zv9t/
 U54kxXV9ciwt0JPthhycMd3DCJjN1jqjk8hSlLWifuXx4GcbxG7Yg2gcoLMSJyQb1+LI
 6O2U29iPAogGTnqj+ba247FHmFbQV8YyywedhUFcEmd5aLxb9F1b8yzauXfta9XbZPUW
 c/HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BgCBBR2k
Subject: Re: [Buildroot] [PATCH v5 01/16] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyMi8wMi8yMDI0IMOgIDExOjE2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENoZWNraW5nIHRoZSBvdXRwdXQgb2YgdGhlIGNvbW1hbmQgYGdpdCBncmVwIFBM
QVRGT1JNIHwgZ3JlcCBrM2AsIHdlIGNhbgo+IGZvdW5kIHRoZSBwcm9wZXIgc2V0dGluZ3MgZm9y
IHRoZSBvcHRlZS1vcyBwYWNrYWdlOgo+IAo+IC5naXRodWIvd29ya2Zsb3dzL2NpLnltbDogICAg
ICAgICAgX21ha2UgUExBVEZPUk09azMtYW02MngKPiAuZ2l0aHViL3dvcmtmbG93cy9jaS55bWw6
ICAgICAgICAgIF9tYWtlIFBMQVRGT1JNPWszLWFtNjJ4IENGR19BUk02NF9jb3JlPXkKPiAuLi4K
PiBjb3JlL2FyY2gvYXJtL3BsYXQtazMvY29uZi5tazppZm5lcSAoLCQoZmlsdGVyICR7UExBVEZP
Uk1fRkxBVk9SfSxhbTY1eCBqNzIxZSBqNzg0czQgYW02NHggYW02MngpKQoKSSBiZWxpZXZlIHRo
ZSBjb21taXQgbG9nIG5lZWRzIHRvIGV4cGxhaW4gdGhlIGlzc3VlIHdpdGggdGhlIGN1cnJlbnQg
b3B0ZWUKUExBVEZPUk0gc2V0dGluZy4KCkluZGVlZCwgdXNpbmcgUExBVEZPUk09azMgY2FuIGxl
YWRzIHRvIGEgcnVudGltZSBib290IGNyYXNoIG9uIHNvbWUgSzMgU29DCihqNzIxZSkgYmVjYXVz
ZSB0aGUgb3B0ZWUgZmxhdm9yIGlzIG1pc3NpbmcuCgpXZSBjb3VsZCB1c2UgQlIyX1RBUkdFVF9P
UFRFRV9PU19QTEFURk9STT1rMyBhbmQKQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STV9GTEFW
T1I9YW02MnggYnV0IHdlIGFjdHVhbGx5IGNhbiB1c2UKQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFU
Rk9STT1rMy1hbTYyeCBhcyBleHBsYWluZWQgaW4gdGhlIG9wdGVlLW9zIE1ha2VmaWxlIFsxXQoK
ICAjIElmICQoUExBVEZPUk0pIGlzIGRlZmluZWQgYW5kIGNvbnRhaW5zIGEgaHlwaGVuLCBwYXJz
ZSBpdCBhcwogICMgJChQTEFURk9STSktJChQTEFURk9STV9GTEFWT1IpIGZvciBjb252ZW5pZW5j
ZQoKVGhpcyBpcyBob3cgbWV0YS10aSBzZXQgdGhlIG9wdGVlLW9zIHBsYXRmb3JtOgoKICBtZXRh
LXRpXSQgZ2l0IGdyZXAgT1BURUVNQUNISU5FCiAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2Ft
NDM3eC1ocy1ldm0uY29uZjpPUFRFRU1BQ0hJTkUgPSAidGktYW00M3h4IgogIG1ldGEtdGktYnNw
L2NvbmYvbWFjaGluZS9hbTU3eHgtaHMtZXZtLmNvbmY6T1BURUVNQUNISU5FID0gInRpLWFtNTd4
eCIKICBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYmVhZ2xlcGxheS5jb25mOk9QVEVFTUFDSElO
RSA9ICJrMy1hbTYyeCIKICBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvZHJhN3h4LWhzLWV2bS5j
b25mOk9QVEVFTUFDSElORSA9ICJ0aS1kcmE3eHgiCiAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5l
L2luY2x1ZGUvYW02MmF4eC5pbmM6T1BURUVNQUNISU5FID0gImszLWFtNjJ4IgogIG1ldGEtdGkt
YnNwL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FtNjJweHguaW5jOk9QVEVFTUFDSElORSA9ICJrMy1h
bTYyeCIKICBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9hbTYyeHguaW5jOk9QVEVF
TUFDSElORSA9ICJrMy1hbTYyeCIKICBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9h
bTY0eHguaW5jOk9QVEVFTUFDSElORSA9ICJrMy1hbTY0eCIKICBtZXRhLXRpLWJzcC9jb25mL21h
Y2hpbmUvaW5jbHVkZS9hbTY1eHguaW5jOk9QVEVFTUFDSElORSA9ICJrMy1hbTY1eCIKICBtZXRh
LXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9qNzIwMC5pbmM6T1BURUVNQUNISU5FID0gImsz
LWo3MjFlIgogIG1ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9pbmNsdWRlL2o3MjFlLmluYzpPUFRF
RU1BQ0hJTkUgPSAiazMtajcyMWUiCiAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2luY2x1ZGUv
ajcyMXMyLmluYzpPUFRFRU1BQ0hJTkUgPSAiazMtajc4NHM0IgogIG1ldGEtdGktYnNwL2NvbmYv
bWFjaGluZS9pbmNsdWRlL2o3MjJzLmluYzpPUFRFRU1BQ0hJTkUgPSAiazMtYW02MngiCiAgbWV0
YS10aS1ic3AvY29uZi9tYWNoaW5lL2luY2x1ZGUvajc4NHM0LmluYzpPUFRFRU1BQ0hJTkUgPSAi
azMtajc4NHM0IgoKICBtZXRhLXRpIHVzZXMgdGhlIE9QVEVFTUFDSElORSB0byBzZXQgb3B0ZWUt
b3MgcGxhdGZvcm0gWzJdLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3Mv
YmxvYi80LjAuMC9NYWtlZmlsZSNMMzcKWzJdCmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
bWV0YS1hcm0vdHJlZS9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLW9zLmlu
Yz9oPTQuMC4zI24yMwoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU3VnZ2VzdGVkLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0t
Cj4gCj4gQ2hhbmdlcyBpbiB2NQo+IC0gRHJvcCBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JN
X0ZMQVZPUiBvcHRpb24KPiAKPiBBZGRlZCBpbiB2NAo+IAo+ICBjb25maWdzL3RpX2FtNjJ4X3Nr
X2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmln
IGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBpbmRleCBmODgyNTJhODljNjguLmMz
YWQ1NTVhODE4NCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+
ICsrKyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gQEAgLTIxLDcgKzIxLDcgQEAg
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCj4gIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JPQVJEPSJsaXRlIgo+ICBCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9eQo+ICBCUjJfVEFSR0VUX09QVEVFX09T
PXkKPiAtQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMiCj4gK0JSMl9UQVJHRVRfT1BU
RUVfT1NfUExBVEZPUk09ImszLWFtNjJ4Igo+ICBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTj15
Cj4gIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYyWD15Cj4gIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSPXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
