Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381F8C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD363838F0;
	Mon, 13 Jan 2025 17:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX0d5OcUh_3b; Mon, 13 Jan 2025 17:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350258385D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350258385D;
	Mon, 13 Jan 2025 17:06:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A33E95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16BB8412A5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKlsk9BVCrfV for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 17:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB6C041297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB6C041297
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB6C041297
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:06:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1t0nIy1yAt-00kD7B; Mon, 13
 Jan 2025 18:06:47 +0100
Message-ID: <166c5128-8138-4919-ae80-900f66baaacf@gmx.de>
Date: Mon, 13 Jan 2025 18:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
References: <20241206121237.612068-1-sairon@sairon.cz>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241206121237.612068-1-sairon@sairon.cz>
X-Provags-ID: V03:K1:cYGZFvbPitil3oYf2tAEh8ohLRIZ6sN5YRdMyhVFHlg/nZcyFNK
 +ynvJY9fQT9pC5iUBowpBkqbPpPvOXa4r5S0DCS+XL0FBuEYzTSk54ZHJUdl1Udnxogf7/w
 i4raswjK8itAhMxgKNJu40lekawilxoPzKPx3mjXvZ9q6/x6xoy2giasLBmxgZpqJoKN76i
 gS/E4+tGYxfgiI3ab5GMA==
UI-OutboundReport: notjunk:1;M01:P0:WWRbiBSjMYk=;CXSxd9+3K87MlCC6NA4bwl+YerG
 ac2Uzlplw+QdHjtCWvgrkZJs+uQGkTkkfsV36O4wVr1LfvjALMM8YxvbR2/m0RO7nz18OcXoD
 hFlljDHXyUBVieHNnnnV2VzxRdgd+er9QbDxGPpKEgwVCCo8zNF7Bv4qjoHKA6jQvHnfWvAub
 le9IImhRlrJYwXmbb5nAaea5epuY6pifvTiNDUPPSmePlUpdn7Qx6c27FDkG9bTTe379nD6Sg
 qcAVr6Mqaj6vOfGSg6BIPNVWvkxRyo5oFLZofX03meUMqqppBeSx+e0raXlP7WsYhgK7mMTvf
 3TXc6TlyoNnmUzU1GM7dgWez0byguEfXVIdL9RJTdoKJT+91EX3l9udPsSlFURudNB5ZJDDV+
 JNaN9w3essASadNvz+53Xki7hDJY+RN9z2BocxwvgMLeBw5L0BMOUQ2MR/FHxAj7gQn/is5C/
 ini7gIWeIEtT+h9nYAFITTYkiYxc93404UiAFNCss2NXr3QsC7KtGaoJbZ4WRwIlOgidZ7E52
 47rj38NMjTkclCPqvrW+VUw7UHIJXISuDGXLNeanl5OK6mguhDhmRvcgEgD7FFON1muxZuYOv
 5wXuw8z1PUydOtjxb6LivUXikFVrGHrxJ5EJwKFQ0N7j7L1gwSZ1KO9Nzxx7KJ0y+/c6FO2fC
 eeAMCzH/Gd8LxHnr2F87RWM5On1a/frXwTL45j79/f/9L02NLaLH+ndFJurEWk8ou5GfDl3OU
 98lJcSfqKTfK9/9yv51IGKBVE9+tGNlQ32VFuTtCK8LAyFwJb56PqO68RlL+KkD37rOt/4GHN
 SgY0kLRdI3R96148eX8e4Iyl1Fm61TldCMNkv9Nz+ic2g7LvB6Hvu7avOk6SbDmTaFixG7JQL
 SZI//eJ1cQM11sFobOQRxArbMU4QmBVHE6jmn1aZP9ecnfNZYu+U7tTRfQsQEIiLvnGJNoQZl
 skbHuEg1ydP9m++QQCJ8iDUYZDTy5INHsVfMjlWTSiyi8hom3e3RIqj0HpBF2LZlmp/Gfnrr9
 95qRe74N5mTjEaq1YWgq5wCXaV0ni7x6/LI+BI8n6bCNsufk3ZhJ84Ue2lWMo0nsmWUU17tdb
 NeLhtBxXUGROYs4H8Ns4zc+EVqZNucpIH6crjUypgGLa0NyfKZMS0oYcm4Wuk4jD6WT+FVzCc
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736788007; x=1737392807; i=fiona.klute@gmx.de;
 bh=wZGlPcJex+vOv57Y+JYNa1zYLAKW1aP+unW64cHIsM8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aOkLirmBdtE011DqEmUijh5Pzr3r1YDitwk0b1lydUI/U/PezzR26b4BKZUzJSxR
 6eusVPWqR+mWqsgrrLIr2+KQv0/ts0u1MdhUXAhzok59X/zbKZvDoKZRomFuKa6ZM
 6wrhFR44ABvix8p73Y4EXs4baAnkimQHwV9PEy+VLpBZQ34G3rQaZv6fHPf1qcHbK
 +k34C/R0za3JvLfW4Yyh+WNOs7bCf34uhjHJ/pXSMg2m6GKbPfporsU/Jz8nBqxxu
 BajSDwMLFocvQ8mBxBt9Vt2CoKGBLmQtZbthrU2QxnfGZNLC6kGJA6NHIepDnvJcQ
 hVRfQ0mDi3V/kvRwiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aOkLirmB
Subject: Re: [Buildroot] [PATCH] package/brcmfmac_sdio-firmware-rpi: bump
 version to 4c1789e
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDYuMTIuMjQgdW0gMTM6MTIgc2NocmllYiBKYW4gxIxlcm3DoWs6Cj4gQnVtcCB2ZXJzaW9u
IHRvIHRoZSBsYXRlc3Qgc3luY2VkIHZlcnNpb24gZnJvbSBSUGkgT1MgdGhhdCBhZGRzIGZpcm13
YXJlIGZvcgo+IG5ldyBjaGlwc2V0cyBhbmQgdXBkYXRlcyBCQ000MzQ1NSBTRElPIGZpcm13YXJl
LiBUaGUgb2xkIGZpcm13YXJlIGhhcyBzb21lCj4gZmVhdHVyZXMgbWlzc2luZyB3aGljaCBjYW4g
cmVzdWx0IGluIHRoZSBkcml2ZXIgcmV0dXJuaW5nIGVycm9ycyBsaWtlOgo+Cj4gYnJjbWZfc2V0
X2NoYW5uZWw6IHNldCBjaGFuc3BlYyAweGQwOTkgZmFpbCwgcmVhc29uIC01Mgo+Cj4gVGhpcyB3
YXMgdHJhY2tlZCBkb3duIFsxXSB0byB1c2FnZSBvZiBEVU1QX09CU1MgZmVhdHVyZSwgYW5kIHdo
aWxlIGRpc2FibGluZwo+IHRoaXMgZmVhdHVyZSBpcyBhIHBvdGVudGlhbCB3b3JrYXJvdW5kLCB1
cGRhdGluZyB0aGUgZmlybXdhcmUgaXMgYWN0dWFsbHkgdGhlCj4gY29ycmVjdCBzb2x1dGlvbiB0
byB0aGUgcHJvYmxlbS4KPgo+IEJ1aWxkcm9vdCBpcyB1c2luZyBkb3duc3RyZWFtIGtlcm5lbCA2
LjYgYWxyZWFkeSBzaW5jZSA1MWI0NDIxLCBzbyB0aGUgZmlybXdhcmUKPiBzaG91bGQgYmUgYnVt
cGVkIHRvIHdoYXQgUlBpIE9TIHVzZXMgYXQgdGhpcyBwb2ludCB0b28uCj4KPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2lzc3Vlcy82MDQ5I2lzc3VlY29tbWVudC0y
NDg1NDMxMTA0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24u
Y3o+CgpJJ20gc3RpbGwgc2VlaW5nIHRob3NlIGVycm9yIG1lc3NhZ2VzIHdoZW4gZGVhY3RpdmF0
aW5nIGFuIGludGVyZmFjZQp3aXRoIG1haW5saW5lIGtlcm5lbCA2LjEyLjksIGJ1dCB0aGUgd2lm
aSBpbnRlcmZhY2Ugd29ya3MgYXMgd2VsbCBhcwpiZWZvcmUuIFRlc3RlZCBzdGF0aW9uIGFuZCBB
UCBtb2RlcyBvbiBDTTQgKFJldlBpIENvbm5lY3QgNCB3aXRoCmV4dGVybmFsIGFudGVubmEpLgoK
VGVzdGVkLWJ5OiBGaW9uYSBLbHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KCj4gLS0t
Cj4gICAuLi4vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2Fy
ZS1ycGkuaGFzaCAgfCAyICstCj4gICAuLi4vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJj
bWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsgICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLmhh
c2ggYi9wYWNrYWdlL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmly
bXdhcmUtcnBpLmhhc2gKPiBpbmRleCBjMjBhYmZjMjZjLi5kYjVjOWM0MjExIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJt
d2FyZS1ycGkuaGFzaAo+ICsrKyBiL3BhY2thZ2UvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkv
YnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICAyZjA5MTdiMTA0NzM5NDU1ZGQ0ODhkZDhmNWFm
MmVlNDQzMDgwMWE3YWM4ZmU4ZDk4NjZlNzRiZmJiMTg1MzU2ICBicmNtZm1hY19zZGlvLWZpcm13
YXJlLXJwaS0yNmZmMjA1YjQ1ZGMxMDliNDk4YTcwYWFmMTgyODA0YWQ5ZGJmZWE1LnRhci5nego+
ICtzaGEyNTYgIDAyODA5ZGFkMjA2ZGUxMDUxMjI2YTU4ZDFmYjE1ZjkzMGJjMmYxOTU0NGJiMjg2
NTg5MzcxMjI1MDc2MDA2N2UgIGJyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLTRjMTc4OWViODcw
NTMzNmI5NTZiM2JmMWEzZTZlMzM1OWMwNTU1ZTQudGFyLmd6Cj4gICBzaGEyNTYgIGVhOGI3Yjdi
NmNmYzZmZDMwNTg3ZWQ5NzcxMDBmNmE1NDI3MzRjZTUzMjE4YjViNjNkZTE2MTgwYWNkZGQ1OTkg
IExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJw
aS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS5tayBiL3BhY2thZ2UvYnJjbWZtYWNfc2Rpby1m
aXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsKPiBpbmRleCA5NTcwNzQ4
N2E5Li5jM2I5ZmE3ZWI4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYnJjbWZtYWNfc2Rpby1maXJt
d2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsKPiArKysgYi9wYWNrYWdlL2Jy
Y21mbWFjX3NkaW8tZmlybXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLUJS
Q01GTUFDX1NESU9fRklSTVdBUkVfUlBJX1ZFUlNJT04gPSAyNmZmMjA1YjQ1ZGMxMDliNDk4YTcw
YWFmMTgyODA0YWQ5ZGJmZWE1Cj4gK0JSQ01GTUFDX1NESU9fRklSTVdBUkVfUlBJX1ZFUlNJT04g
PSA0YzE3ODllYjg3MDUzMzZiOTU2YjNiZjFhM2U2ZTMzNTljMDU1NWU0Cj4gICBCUkNNRk1BQ19T
RElPX0ZJUk1XQVJFX1JQSV9TSVRFID0gJChjYWxsIGdpdGh1YixMaWJyZUVMRUMsYnJjbWZtYWNf
c2Rpby1maXJtd2FyZS1ycGksJChCUkNNRk1BQ19TRElPX0ZJUk1XQVJFX1JQSV9WRVJTSU9OKSkK
PiAgIEJSQ01GTUFDX1NESU9fRklSTVdBUkVfUlBJX0xJQ0VOU0UgPSBQUk9QUklFVEFSWQo+ICAg
QlJDTUZNQUNfU0RJT19GSVJNV0FSRV9SUElfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
