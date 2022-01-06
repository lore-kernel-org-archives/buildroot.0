Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E323BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9038441634;
	Thu,  6 Jan 2022 10:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONsPVyOM8Tkg; Thu,  6 Jan 2022 10:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B2241632;
	Thu,  6 Jan 2022 10:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBDE91BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B932882BBA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tx-VnNs-U7Li for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:38:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A0CF82B81
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:38:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o3so3853870wrh.10
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 02:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=126M1Zxx09679OlxqxvnxanJuS8/RZ8/bFDnovjq6g8=;
 b=7Y5GlEVoCUIb7LGxaqF8VYXYBZf9CZZxwjWzpFglJ0aG2jj2PX8yNV6xh0bTXkr7Al
 K19PuF4EVlq7Fe8IbZaVRpaD1W+9v+42Zi/3VsogRul/DhlA7cGBv4OUta7UV6GUsV3g
 sILTlQatp/VN1R0ONUORrHGcJf1cO6nBBiv0QoxrfCT5GsGb+F+PyD5Ro7B0QPAdq+Ie
 4uw06/EBZXCak+H+OHpy6S7Png6nSrNtkN0RmrwB5HRuEG9SmNgEuGu3xsE6hAtNalsM
 fsx01qGHGqJ6oEfqNhz65moksZWt52W0G6C0hM0pi2UsG6uiiMIAqPMvRZt/077ufgEm
 mS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=126M1Zxx09679OlxqxvnxanJuS8/RZ8/bFDnovjq6g8=;
 b=nPT9ejjFs0uAHVu/8qR4SXAcddvDhBLQiF39CfaSjBmGZZtDCOCc7poGWCqeGeJ0jq
 JsvycMiodxCivbxVX7ybenaWztNxaPtur5wMTVRCRj5GsRxpYfXgYuxTzrt3QbJ8kA6r
 dfUx/a0+21SiQii78cVE4M2J7QOi9BG7wqpyG0sLs7eBJ002iCf+nN4drBD/yvrtIO3s
 TFmGzKwbFw5fuwNN9I0lxCLhCRVpwVXBp1/vcaXtyX4J3CnjwWOCSTKwa/rnl5jeMnQ0
 P+PtIfH+jii0lMOQZ7u3Cq2LT50iPsYV1N5sB0XX4qoeOhIWFjs2Xpzya50Ws0fcVIdD
 gEow==
X-Gm-Message-State: AOAM5308LYXeok01rl4wIEwgIRV6241YjQg6EuYvd+I6K0hzXZThkzDS
 GQK3s69pX70o+Nb/36TvIy53AA==
X-Google-Smtp-Source: ABdhPJze2fL8c3+2VkQoKGmc5tmT0mLoLC0IlxVjr6L8yB7UzWeJi2CBfZ6mn+C2Gs/S9NvmuPt26g==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr51183055wrs.61.1641465519717; 
 Thu, 06 Jan 2022 02:38:39 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id o11sm5452858wmq.15.2022.01.06.02.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 02:38:39 -0800 (PST)
Message-ID: <273bf418-04c9-5e1a-b501-4324ee649a85@smile.fr>
Date: Thu, 6 Jan 2022 11:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220103165805.3697636-1-clg@kaod.org>
 <5da6fe27-bf22-7bd9-fcb5-c43551f1ed5c@gmail.com>
 <5aba2002-9e94-4683-b79d-5443f2852ffc@kaod.org>
 <d71851fe-f814-8e1f-104b-bdf5b802b083@gmail.com>
 <16687956-3831-261a-cdf1-2b02ce463602@kaod.org>
 <1b60df77-a795-f328-6651-4e3b5c4b0757@gmail.com>
 <20b2bd43-9fe6-f174-e437-7595ea5864d8@kaod.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20b2bd43-9fe6-f174-e437-7595ea5864d8@kaod.org>
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 6.2.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwNC8wMS8yMDIyIMOgIDEwOjA1LCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3Jp
dMKgOgo+IEhlbGxvLAo+IAo+IE9uIDEvMy8yMiAyMzo0MywgUm9tYWluIE5hb3VyIHdyb3RlOgo+
PiBMZSAwMy8wMS8yMDIyIMOgIDIzOjIwLCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3JpdMKgOgo+
Pj4gSGVsbG8sCj4+Pj4gVW5saWtlIGFsbCBvdGhlciBkZWZjb25maWcsIHFlbXUgZGVmY29uZmln
cyBhcmUgcnVudGltZSB0ZXN0ZWQgaW4gZ2l0bGFiLgo+Pj4+Cj4+Pj4gQ3JlYXRlIGEgdGVzdCBi
cmFuY2ggbmFtZWQ6IHFlbXUtNi4yLjAtZGVmY29uZmlncy1xZW11Cj4+Pj4KPj4+PiBXaGVyZTog
InFlbXUtNi4yLjAiIGlzIGEgcHJlZml4LCAiLWRlZmNvbmZpZ3MtIiB0cmlnZ2VyIGEgcGlwZWxp
bmUgZm9yIHRlc3RpbmcKPj4+PiBCdWlsZHJvb3QgZGVmY29uZmlzIGFuZCAicWVtdSIgaXMgYSBw
YXR0ZXJuLgo+Pj4+Cj4+Pj4gU2VlOgo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC82NWQyZjA0YzAxMmFmNDkyYTliOWRhMDRkZmEzYjNjYmQy
MDM0N2YxCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gInB1c2hpbmcgYSBicmFuY2ggY2FsbGVkICI8Zm9v
Pi1kZWZjb25maWdzLTxwYXR0ZXJuPiIgd2hpY2ggd2lsbCB0ZXN0IGFsbAo+Pj4+IGRlZmNvbmZp
Z3Mgd2hvc2UgbmFtZSBzdGFydCB3aXRoIHRoZSBwYXR0ZXJuLiIKPj4+Cj4+PiBUaGF0IGxvb2tz
IHNpbXBsZSBlbm91Z2guIFNvbWV0aGluZyBpcyBnb2luZyB3cm9uZyB0aG91Z2ggOgo+Pj4KPj4+
IMKgwqAgaHR0cHM6Ly9naXRsYWIuY29tL2xlZ29hdGVyL2J1aWxkcm9vdC8tL2pvYnMvMTkzNzc1
MjM1Mwo+Pj4KPj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmcgPwo+Pgo+PiBodW1tLCBtYXliZSB0
aGVyZSBpcyB3ZWFrbmVzcyBpbiB0aGUgc2NyaXB0IHdoZW4gZm9vIGlzICJxZW11LTYuMi4wIgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBeCj4+IFRyeSBhZ2FpbiB3aXRoIHNvbWV0aGluZyBlbHNlIGxpa2UgcWVtdV82
LjIuMC1kZWZjb25maWdzLXFlbXUKPiAKPiBZZXMuIFRoYXQgd2FzIGl0LgoKQFRob21hczogbWF5
YmUgaWdub3JlIGFsbCBjaGFyYWN0ZXJzIGJlZm9yZSAiLWRlZmNvbmZpZ3MiOgoKc2VkICdzJV4u
Ki1kZWZjb25maWdzLVwoLipcKSVcMSUnKXNlZCAncyVeLiotZGVmY29uZmlncy1cKC4qXCklXDEl
JykKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaGFua3MsCj4gCj4gQy4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
