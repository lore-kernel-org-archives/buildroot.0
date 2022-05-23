Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08463C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 10:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3DC8415D2;
	Mon, 23 May 2022 10:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xr0nklowxa6P; Mon, 23 May 2022 10:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3FB4169B;
	Mon, 23 May 2022 10:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDC8D1BF30A
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB061416D1
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG2ewZp0zfbB for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 10:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18EA84195B
 for <buildroot@buildroot.org>; Mon, 23 May 2022 10:13:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k30so20597181wrd.5
 for <buildroot@buildroot.org>; Mon, 23 May 2022 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p8cTPQJmiAhOs60Fpr1pVdpv6aZLjD7mZBGkZNA7tPI=;
 b=dAXS8AWnRqa0bl53qDoZp3imYaEOQmtMptMo89TK7pFQ2LQiLEBVZ1zMlx/iByW1ZW
 KYzgbbry+xGJw7PbAhA/LcEdrDgwQgl4tDqhocfABoT8ffr67xMJVligAYiHwaZgbgV3
 zrS5P+WkcgMlGFOZcNpvSQ4dPmACWeeuPTvHzYrFhs+cR6DZmUIhjiXHEBZgv8xcpLAM
 RYjGNLD90+DEqUqn02imvd/R0JUiVg98H3Y53PklMQRylwDhq8029rtubhSuYI+K0DgG
 Z05M+5AupHPquYTAfhFXKuAm2TWFV5SbU8SpqWCRjg80HseMvjlq7mifQn5slE8hVbZg
 O+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p8cTPQJmiAhOs60Fpr1pVdpv6aZLjD7mZBGkZNA7tPI=;
 b=eS+6kSkrm2pJRdy83LO47nbKQfNJXcCFulPgtG8SSDRJdZQ7f64gBoDukPGGprmYqC
 Vm5KetsY2lwDupZT1FrWWE3uaaIZdFNliY5Vs27qj1u6dcoFZdaVnfEhc5z0KZ4hdMh5
 jWKF0NsvznAx8jWjwO7GKcA7ZZTI3lnbBH4AmIim5GZ9gjYrTNiAR9Zq5dSLE9KRZnvl
 MUtLXvPnHHbV4K3pl1I+iMLwgTwII7SKk0Dr4KRP3pwaHW7Wgb70OTifP+M1i8paxAqm
 VWXVELwRzyQbEb/Qdvos8ia9ve5NnnCCvbQq4yb54cVuN1TJOWHWgrtDwuGEIBX0SEKL
 Gs0g==
X-Gm-Message-State: AOAM53375Lka/GnlZegqDxYspegUikAkzwl4qJKdnxXbYoOgQksIhmpe
 9+Q7DW0P4Du2LEWqQ1Td+CQexpb/TpBiEA==
X-Google-Smtp-Source: ABdhPJweKM5ra2Pz5NmwoGlDtUWM8FV0HelrPtQ8fssX56NfOH0Vy8KdxVuQlsdlhzOwKXaEEMO7oQ==
X-Received: by 2002:a5d:5641:0:b0:20d:c15:1b33 with SMTP id
 j1-20020a5d5641000000b0020d0c151b33mr17854504wrw.66.1653300781258; 
 Mon, 23 May 2022 03:13:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c338400b003949dbc3790sm9144422wmp.18.2022.05.23.03.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 03:13:00 -0700 (PDT)
Message-ID: <adbf3b21-b5c7-29d0-3a7b-2288c0c249fa@smile.fr>
Date: Mon, 23 May 2022 12:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
References: <20220519140453.1546982-1-nicolas.tran@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220519140453.1546982-1-nicolas.tran@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-coreutils: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmljb2xhcywKCkxlIDE5LzA1LzIwMjIgw6AgMTY6MDQsIE5pY29sYXMgVHJhbiBhIMOp
Y3JpdMKgOgo+IHJ1c3QtY29yZXV0aWxzIGlzIGEgcGFja2FnZSBmcm9tIHRoZSBHaXRodWIgcHJv
amVjdAo+IHV1dGlscy9jb3JldXRpbHMgY29udGFpbmluZyB0aGUgZXF1aXZhbGVudCBvZgo+IHRo
ZSBHTlUgY29yZXV0aWxzIGJhc2ljIHNoZWxsIGNvbW1hbmRzIGludGVncmF0ZWQKPiBpbiBSdXN0
IGxhbmd1YWdlLgoKSXMgcnVzdC1jb3JldXRpbHMgcGFja2FnZSBpcyBhIGNvbXBsZXRlIHJlcGxh
Y2VtZW50IGZvciB0aGUgR05VIGNvcmV1dGlscyA/Cgo+IEl0IGNhbiBiZSBjb252aW5pZW50IGZv
ciBwdXJwb3NlcyBvZiBSdXN0LXdyaXR0ZW4gc3lzdGVtcyBhcwo+IGl0IHJ1bnMgaW4gYSBzdGFi
bGUgdmVyc2lvbiBvZiBSdXN0Lgo+IAo+IFRoZSBwYWNrYWdlIGhhcyBiZWVuIGNoZWNrZWQgd2l0
aCBjb3JyZWN0IGZvcm1hdHRpbmcgYW5kCj4gd2l0aG91dCB0eXBvczoKPiAkIC4vdXRpbHMvY2hl
Y2stcGFja2FnZSBwYWNrYWdlL3J1c3QtY29yZXV0aWxzLyoKPiAKPiBUZXN0cyBoYXZlIGJlZW4g
cnVuIHRvIGVuc3VyZSB0b29sY2hhaW4gY29tcGF0aWJpbGl0aWVzOgo+ICQgLi91dGlscy90ZXN0
LXBrZyBwYWNrYWdlL3J1c3QtY29yZXV0aWxzCj4gICBib290bGluLWFybXY1LXVjbGliYyBbMS82
XTogU0tJUFBFRAo+ICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IE9LCj4gIGJvb3RsaW4t
YXJtdjdtLXVjbGliYyBbMy82XTogU0tJUFBFRAo+ICAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzQv
Nl06IE9LCj4gICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogU0tJUFBFRAo+ICAgICAgICAg
ICBzb3VyY2VyeS1hcm0gWzYvNl06IE9LCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBUcmFu
IDxuaWNvbGFzLnRyYW5Ac21pbGUuZnI+Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvcnVzdC1jb3JldXRpbHMvQ29u
ZmlnLmluICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvcnVzdC1j
b3JldXRpbHMvcnVzdC1jb3JldXRpbHMuaGFzaCB8ICAzICsrKwo+ICBwYWNrYWdlL3J1c3QtY29y
ZXV0aWxzL3J1c3QtY29yZXV0aWxzLm1rICAgfCAxMiArKysrKysrKysrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3J1c3QtY29yZXV0aWxzL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9ydXN0LWNvcmV1dGlscy9ydXN0LWNvcmV1dGlscy5oYXNoCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLm1rCgpCdXN5
Ym94IHBhY2thZ2Ugc2hvdWxkIGRlcGVuZCBvbiBydXN0LWNvcmV1dGlscyBpZiBib3RoIHBhY2th
Z2VzIGFyZSBzZWxlY3RlZCBpbgp0aGUgY29uZmlndXJhdGlvbi4KClNlZSBub2Nsb2JiZXIgaW5z
dGFsbCBpbiBidXN5Ym94Lm1rCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2Nv
bW1pdC8/aWQ9NTBkYzM1MGM2NWY0YjE2NjJiYTk4NmQ2ZWIyNWIyNGE3MGM0MzEyOAoKQWxzbywg
d2hhdCBhYm91dCB0aGUgY29uZmxpY3Qgd2l0aCAoR05VKSBjb3JldXRpbHMgcGFja2FnZSBpdHNl
bGYgPwoKRG8gd2Ugd2FudCB0byBjb252ZXJ0IGNvcmV1dGlscyB0byBhIHZpcnR1YWwgcGFja2Fn
ZSBbMV0uCldlIG1heSBoYXZlIHRoZSBzYW1lIGlzc3VlIGZvciBlYWNoIHBhY2thZ2VzIHJlY29k
ZWQgaW50byBhbm90aGVyIGxhbmd1YWdlLgoKCgpbMV0gaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9v
dC5vcmcvbWFudWFsLmh0bWwjX2luZnJhc3RydWN0dXJlX2Zvcl92aXJ0dWFsX3BhY2thZ2VzCgo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4g
aW5kZXggODg5MjEzNDEzMy4uOTRmOTJiMzViNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTEsNSArMSw0IEBACj4gIG1lbnUg
IlRhcmdldCBwYWNrYWdlcyIKPiAtCj4gIAlzb3VyY2UgInBhY2thZ2UvYnVzeWJveC9Db25maWcu
aW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uvc2tlbGV0b24vQ29uZmlnLmluIgo+ICAJc291cmNlICJw
YWNrYWdlL3NrZWxldG9uLWN1c3RvbS9Db25maWcuaW4iCj4gQEAgLTI1NzksNiArMjU3OCw3IEBA
IG1lbnUgIlN5c3RlbSB0b29scyIKPiAgCXNvdXJjZSAicGFja2FnZS9yYXVjL0NvbmZpZy5pbiIK
PiAgCXNvdXJjZSAicGFja2FnZS9yc3lzbG9nL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2Fn
ZS9ydW5jL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9ydXN0LWNvcmV1dGlscy9Db25m
aWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvczM5MC10b29scy9Db25maWcuaW4iCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvczYvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3M2LWxpbnV4LWlu
aXQvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hZjZlODcwNzA5Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxNyBAQAo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcnVzdC1jb3JldXRpbHMKPiArIwo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX1JVU1Rf
Q09SRVVUSUxTCj4gKwlib29sICJydXN0LWNvcmV1dGlscyIKPiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUwoKImRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyIgaXMgbWlzc2luZwoKSWYgY29yZXV0aWxzIGlzIG5v
dCBjb252ZXJ0ZWQgdG8gYSB2aXJ0dWFsIHBhY2thZ2UsICJkZXBlbmRzIG9uCiFCUjJfUEFDS0FH
RV9DT1JFVVRJTFMiIHNob3VsZCBiZSB1c2VkIGhlcmUuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQwo+ICsJaGVscAo+ICsJICBydXN0LWNv
cmV1dGlscyBpcyBhIHBhY2thZ2UgZnJvbSB0aGUgR2l0aHViIHByb2plY3QKPiArCSAgdXV0aWxz
L2NvcmV1dGlscyBjb250YWluaW5nIHRoZSBlcXVpdmFsZW50IG9mCj4gKwkgIHRoZSBHTlUgY29y
ZXV0aWxzIGJhc2ljIHNoZWxsIGNvbW1hbmRzIGludGVncmF0ZWQKPiArCSAgaW4gUnVzdCBsYW5n
dWFnZS4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS91dXRpbHMvY29yZXV0aWxzCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMuaGFzaCBiL3Bh
Y2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMuaGFzaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMDY1ZGUwZWVjNQo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLmhhc2gKPiBAQCAtMCww
ICsxLDMgQEAKPiArIyBMb2NhbGx5IGdlbmVyYXRlZAo+ICtzaGEyNTYgIDdjZDA1ZWJkZTEzMDJh
MjdlN2EyNjQzMGVmYzdkNTIyYjg2ZTNkOGYyMmFkNjA2Mjc1YTFhOTY0ODU0MjRlNDYgIHJ1c3Qt
Y29yZXV0aWxzLTAuMC4xMy50YXIuZ3oKPiArc2hhMjU2ICBhODM2ZWIzMzYwZDBlODBmNmExNjIw
NDk1NTQzYWQyYTRlMjBlNGNmNzJhZjg5ZmY1MjhmY2NmOWU2M2JlODFlICBMSUNFTlNFCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMubWsgYi9wYWNr
YWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xMjk2ZGIwZmYyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMubWsKPiBAQCAtMCwwICsxLDEy
IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBydXN0LWNvcmV1dGlscwo+
ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtSVVNUX0NPUkVVVElMU19WRVJT
SU9OID0gMC4wLjEzCj4gK1JVU1RfQ09SRVVUSUxTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHV1dGls
cyxjb3JldXRpbHMsJChSVVNUX0NPUkVVVElMU19WRVJTSU9OKSkKPiArUlVTVF9DT1JFVVRJTFNf
TElDRU5TRSA9IE1JVAo+ICtSVVNUX0NPUkVVVElMU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+
ICsKPiArJChldmFsICQoY2FyZ28tcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
