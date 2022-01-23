Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9249EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 15:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E74881251;
	Sun, 23 Jan 2022 15:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Vct8LewHD_Y; Sun, 23 Jan 2022 15:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D3E80B04;
	Sun, 23 Jan 2022 15:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDB8E1BF2F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91A56059B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 15:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn8n28Fd-DOE for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 15:48:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A12160592
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 15:48:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id v123so21321197wme.2
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 07:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lZ4sCfvSYUN2Bk5pxa/WpXl88FhpR2I0qwr7Ku63cz0=;
 b=FY9c4qlAyoD3nq8hXb0LxRDaf2y4spZVoQVo8bNfMgM2Q5M+5g+MY4ZgGlYZvqcL/g
 1Y3W1usHK+gTHI+f3xrgQobS72hcxfvu0p9rgcrHEIKPL7/dpIwQXRoMj4redy6dQ1sT
 Jh3RILqB4r1gtfH77lj690Bo2pj5pj06ZXSzWi/m5tExhETodRZ5hCmcMPqP+px61xHx
 4tzb2nOp/L2OjJ2jYjyEPztmzOUozh+/ynrcSfep68+RQHv94jXqEO2mQ44GhaaF2Mrn
 QUnuFUzjfW2GRweLFsynqFyOFGq9J2LsLmM//VQdhYFTACNhYvD5LU6rgyLEDw/O46Tl
 VhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lZ4sCfvSYUN2Bk5pxa/WpXl88FhpR2I0qwr7Ku63cz0=;
 b=XMZ4hazan75di0ZteOlHxoDeZDD0zblgCnrE3ZMLLQXsBGaGds+YCCYNkvSPZMlQnh
 ZrOWmWGzWDlgYphvTJLJ64tjdF5Isb0U7/uRXR3T+lb+gvlafuLqGUzA13dJyXlERrEC
 xJTpX5Vz5SwcQmzqqBs4duWBYTUPY6K/yHoDhvMjX/5Ow9A91NUKGbkNXW6pEES0xPF3
 dlBVSDKD612upmVi2VMVnC29OSkveXmgoWIc66DRkIkSn7jqnR8oFLFubSlR20JmRznK
 0hb/W43KLB+yZnJ9XKECWK4TRew9xlDWvXPvksx6qGyWnIALN44R8pNmx72tyPFnL0MF
 NVqw==
X-Gm-Message-State: AOAM531Bi+3XmQJ5O+PLcpdUrR9sgiWb9izSujt6f4nip2mYVbq7L74T
 kTNOsch0SLkxdAsJw+GQSBc=
X-Google-Smtp-Source: ABdhPJzX98Bm8U5am/SNOYtHQqNaBu2sRqdnmdBQTf9sk1cmGfHsTccRGYx3vw9le8Gh9nbr2TcqDQ==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr8370069wme.117.1642952903765; 
 Sun, 23 Jan 2022 07:48:23 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id o25sm2979098wms.9.2022.01.23.07.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 07:48:23 -0800 (PST)
Message-ID: <9c63c5dc-a9dd-ff60-73e5-a2a7f09746f0@gmail.com>
Date: Sun, 23 Jan 2022 16:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220122153714.26991-1-peter@korsgaard.com>
 <20220122153714.26991-3-peter@korsgaard.com>
 <bde7ae07-e97b-592a-1680-da61af531fe8@gmail.com>
 <f427a5f8-c19a-4f13-c8ce-b1c2ca75432d@korsgaard.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <f427a5f8-c19a-4f13-c8ce-b1c2ca75432d@korsgaard.com>
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

SGVsbG8gUGV0ZXIsCgpMZSAyMy8wMS8yMDIyIMOgIDE1OjQ4LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBPbiAyMy8wMS8yMDIyIDExLjU2LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gCj4+
PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNSIKPj4+ICtCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjE2Igo+Pgo+PiBXaHkganVz
dCBvbmx5IHRha2luZyBjYXJlIG9mIHRoaXMgZGVmY29uZmlnID8KPiAKPiBTaW1wbHkgYmVjYXVz
ZSBJIGRpZCBzb21lIG90aGVyIGNoYW5nZXMgdG8gaXQgKHNlZSB0aGUgb3RoZXIgcGF0Y2hlcyBp
biB0aGUKPiBzZXJpZXMpLgo+IAo+PiBNb3N0IHFlbXUgZGVmY29uZmlnIGFyZSB1c2luZyB0aGUg
c2FtZSBrZXJuZWwgdmVyc2lvbiAoNS4xNSkuIFVzdWFsbHkgd2UgdHJ5IHRvCj4+IGtlZXAgYWxs
IG9mIHRoZW0gaW4gc3luYy4KPiAKPiBPay4KClRvIHRlc3QgYWxsIHFlbXUgZGVmY29uZmlnIGlu
IGdpdGxhYiB5b3UgY2FuIHB1c2ggYSBicmFuY2ggbmFtZWQKImtlcm5lbC01LjE1LjE2LWRlZmNv
bmZpZ3MtcWVtdSIKCldoZXJlOiAia2VybmVsLTUuMTUuMTYiIGlzIGEgcHJlZml4LCAiLWRlZmNv
bmZpZ3MtIiB0cmlnZ2VyIGEgcGlwZWxpbmUgZm9yCnRlc3RpbmcgQnVpbGRyb290IGRlZmNvbmZp
cyBhbmQgInFlbXUiIGlzIGEgcGF0dGVybiB0byBtYXRjaCBhbGwgZGVmY29uZmlnIG5hbWVkCnFl
bXUqLgoKU2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9j
b21taXQvNjVkMmYwNGMwMTJhZjQ5MmE5YjlkYTA0ZGZhM2IzY2JkMjAzNDdmMQoKVGhlIGtlcm5l
bCA1LjE1IGlzIG5vdCBhcyBvbGQsIGRvIHdlIHdhbnQgdG8gZm9sbG93IGNsb3NlbHkgdGhlIGxh
dGVzdCBrZXJuZWwKdmVyc2lvbiBmb3IgUWVtdSBkZWZjb25maWdzPyBCdXQgaXQncyBhbm5veWlu
ZyB0byBtb2RpZnkgZWFjaCB0aW1lIHRoZSBrZXJuZWwKdmVyc2lvbiBpbiBzZXZlcmFsIHBsYWNl
LgoKPiAKPj4gU2luY2UgUWVtdSBkZWZjb25maWdzIGFyZSBydW50aW1lIHRlc3RlZCBlYWNoIHdl
ZWsgaW4gR2l0TGFiLUNJIG1heWJlIHdlIGNhbgo+PiBzYWZlbHkgc3dpdGNoIHRvIEJSMl9MSU5V
WF9LRVJORUxfTEFURVNUX1ZFUlNJT04gaW5zdGVhZCA/Cj4+IEJ1dCB3ZSBoYXZlIHRvIGNoZWNr
IHFlbXUgZGVmY29uZmlncyB1c2luZyBhIGxvY2FsIGtlcm5lbCBwYXRjaCwgY3VycmVudGx5Cj4+
IHBwYy1tcGM4NTQ0ZHMgYW5kIGFybS12ZXJzYXRpbGUgb3Iga2VlcGluZyBrZXJuZWwgY3VzdG9t
IHZlcnNpb24gZm9yIHRoZW0uCj4+Cj4+IEFsc28gQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVS
U0lPTiByZWZlciB0byB0aGUgbGF0ZXN0IHN0YWJsZSBrZXJuZWwgdmVyc2lvbiwKPj4gbm90IHRo
ZSBsYXRlc3QgbHRzIHZlcnNpb24uCj4gCj4gVGhhdCB3b3VsZCBtZWFuIHRoYXQgdGhleSBhcmUg
bm90IHJlYWxseSByZXByb2R1Y2libGUsIHNvIEkgZG9uJ3QgcmVhbGx5IGxpa2UgaXQuCgpGb3Ig
YSBnaXZlbiBCdWlsZHJvb3QgdmVyc2lvbiBCUjJfTElOVVhfS0VSTkVMX0xBVEVTVF9WRVJTSU9O
IGlzIHNldCB3aXRoIGEKZGVmYXVsdCBrZXJuZWwgdmVyc2lvbi4KCkFjdHVhbGx5IGRlZmNvbmZp
Z3MgYXJlIGFscmVhZHkgbm90IHJlcHJvZHVjaWJsZSBzaW5jZSB0aGUgaW50ZXJuYWwgdG9vbGNo
YWluCmNvbXBvbmVudHMgdmVyc2lvbiB1c2UgdGhlIGRlZmF1bHQgdmVyc2lvbi4KQnV0IGluZGVl
ZCwgdGhlIGtlcm5lbCB2ZXJzaW9uIGNoYW5nZSBmYXN0ZXIgdGhhbiB0aGUgdG9vbGNoYWluLgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IC0tIAo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
