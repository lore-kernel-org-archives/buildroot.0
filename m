Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A76606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XGeeIFTs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D9060E26;
	Fri, 20 Nov 2026 09:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPb3YusrR8MG; Fri, 20 Nov 2026 09:19:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 174966068A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795166360;
	b=iOKk3Ai8calgoeI1PUUH+IRIAuxhI1TdUf0dR8ywGItzDp4ix5+M1pVNKk8nsDMeDApw
	 u6YYLPAPxZ+38gstN7oScVAG5XXZLc8+RgDhSVoWHVXyQJGUHRt0V54PmfxQrmd6rKE/M
	 /Jz1RkSvL30NY5s41mF+Av00Un3MdjTRQx3Ph5D+DYFfCdUkS2/6+XiZ07s1Sh1kZqZ+9
	 fXtTL7mEQUu+Zl/wZ/plW9E55hJ2pCTQIT8FUvXC1/4T/nVu/x4hFO0s0YmBXylBRIXnn
	 i43d8i9X4kurO76HoX95SfjcjZAMJUfYGhlk7OfhX6RsIxv/MOwEA1UTHEMgLtd6Wyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795166360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7jMCmNSYfxy9kdxH9uoBmHPLALla70+UkOh6L5GDF+4=;
	b=fcsSYkmC3E7Pafw0z5GhsOe0K4NOqXGTVJICf3DvC8witTYy7O5dNAGlwNwvM0erygC/
	 7+Q+OgEnas3oc9fahs/Fi6X8ernfg3PJMR0k1qtQLg/0ODlx/Tbs4iszFDFQRXepwchuh
	 2B2/eULCGVLkxPmf+7XEKm8Ctgx812nSoV+Hr+v6vsvG9AYBgXH2zdvPMyZGnGbIo5iIl
	 pVSCogZJf+HRCrChgqpLAl2tvP5beuuiv/A58makXycDog9QJkMEfE3NusI8Dsg+tAcyM
	 TRleZuGMqUUwDfFyIfds5ShZ01b2S0O76OOmgy0it03S1GkvJFMTBj8Hjf10f6NTWPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795166360;
	bh=7jMCmNSYfxy9kdxH9uoBmHPLALla70+UkOh6L5GDF+4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XGeeIFTs08XzbV7rGW7zcXlJli+caBcGfpiMXSUsq2Zwb2NuDoC56yU4khioYRjRa
	 iThtNBhxmfHP+iaZFE93kMYmThwrmabSX98GEz8PvY7C6DaJMEcljeZ6Jn6dpC1uWm
	 ZzYgaLqt4C58RTTKv+L6kzVV3rmTb/jBJ0rHyL+xRUevgXp1TMIm3vudwxWyhJj5PZ
	 dQdcwXDuuzhpfKd3hqaOV6hQoh5cZ+AahnhRiyVnOG/q95Fl23IKwCryaNAyLknARu
	 LmiNQ90SFQrPVhZBMLAB+s/3rWG31Dg51XVO8iAe2KfcqGtzkooksR7FMQm475fh/o
	 S+c0SjK5QQHVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174966068A;
	Fri, 20 Nov 2026 09:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD7A1C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0768156B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6K87M7jm5I7 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D9B981542
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D9B981542
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:19:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso6648175e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795166354; x=1795771154;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tI2WLSqCmD9AUbEVAsP+vh4NHGEGPY+8NvJfN2qqLfE=;
 b=u2hTK3TMrddyXBRpQUWxAkyLdQNxefXrOEoOxKfa0JepHBtdf0CoB9ONlz0zf1Dv1c
 lT8dEcLjB/PTzGd6J7au3qbWVML+j5EEHt8pL9TqAqRAGmEtCGachSEccBfps/9vRu5e
 kbjT69mIBMVEnQu7RS4QsnSDVjdSQuMoD11roN1tSuDdu+JxVMkAWP/LN2BjFb+u7W8K
 uu+G9reGo7bpN1E/XPug7/Q8wmsIrbvTm364svwYK8vO2HE5lxqKwttT6w7unPf0Ktj+
 sbENMYzgA4N+3dtZcbUs+AkxYKBXudhSgINKrsRI6WbnY1NrPH3M8wra1ugaelh8O3d6
 tM4Q==
X-Forwarded-Encrypted: i=1;
 AL+hErEJs3VAS7sk9lLrbxkb8Gh3bZUDP7I6J/jqmsaLCN2bPtFI6uxGA4LYgrWf2Ucve2NwzQEV3ZuJ2X0=@buildroot.org
X-Gm-Message-State: APuU4Z+GPT7gAZq0I3bEIHoyX8hbugW5fJjJGKwh1f+wBHvgXj9+jTcV
 exmBaF4DLOJE1mxvb/4Tr64X2O+2M6Y1iUQC1LrX9caKX7p5LY884O6HBgfhkvGm94qo3hRg+Zt
 /kf+m
X-Gm-Gg: AYBFou2JVHEglbQ7cB0b0sZLseEZggTLXMFaAhGaWtMxfMvT5C8WOoxtJmr2M0EXgij
 W+P5lAg16Ymyrb+jUWxJJXr1InzH8Bwle9hoVTrLhum3swf3paWuFwPoS8GZC+bNCSR5mEkDNLf
 1qb4KZwtVo1A5Gh1GrTa5ZkWczjT3qESc/CdcA9FDBBxKUjtXkzkj0okbmKzmN1ssJ0P+QJAAdY
 iuc2X19Sd6e4J3NAK32/Ljmgxc85pNzf7liLyK55N5n3+4vYKKCEGKflgsIPj6Ni4cjFxOFiayw
 PnEwNWXj/blmKxZdpSn7hWK4Di5SUf16TWmuz4bUpzGjPYcvuIjVYQjRksDVqSU1BniUv/VTCAa
 R39q17UeaMwZxC0TiuCF/sP1yZWvt9w3dMSzhUl5QnTTFLUqNLAUrHa8bpfQiXWou/O9k02ecFh
 rf4KW31GaVJv5wSJlcFddSO5P2xQkpb1lu0iaFOKBofQ0SAQMJLc07fbLcWtiVobPaKYo9wo2Ee
 w5qXAXh5a8Mapxr83Sgbns2p2NR5I45Kj2zFN/aaDGpePB8O9RV+SHiA3XpjbPbzfiG9kU63iYX
 a2/N79tNIb6Ww8H0/74TkVl5rR/CvPwK5FEaI/7H9STepbuumRGykBJNCEdQ/ke+xxnlvGlV4pt
 u1e42XsicjWQ=
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4bb8880cf84mr53782105e9.16.1795166354221; 
 Fri, 20 Nov 2026 01:19:14 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442995sm76675965e9.2.2026.11.20.01.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:19:13 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Nov 2026 10:19:12 +0100
Message-ID: <20261120091913.12113-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f58b0f4e-4b55-489e-b085-cef908777a9a@bubu1.eu>
References: <f58b0f4e-4b55-489e-b085-cef908777a9a@bubu1.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyY3VzLAoKVGhhbmtzIGZvciBkb3VibGUgY2hlY2tpbmcuCgpJbiByZXBseSBvZjoKPiBP
biAxMS8xOS8yNiAxNzoxNywgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4g
Rm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlbGVhc2UsIHNlZToKPiA+ICAgLSBodHRw
czovL2dpdGh1Yi5jb20vbm9kZWpzL25vZGUvcmVsZWFzZXMvdGFnL3YyMi4yMy41Cj4gPiAgIC0g
aHR0cHM6Ly9ub2RlanMub3JnL2VuL2Jsb2cvdnVsbmVyYWJpbGl0eS9ub3ZlbWJlci0yMDI2LXNl
Y3VyaXR5LXJlbGVhc2VzCj4gPiA+IEl0IGZpeGVzIHRoZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0
aWVzOgo+ID4gPiAtIENWRS0yMDI2LTEyMzg2MzogaHR0cDI6IHJlbGVhc2UgaGVhZGVycyB3aGVu
IGEgc3RyZWFtIGlzIHJlbW92ZWQgKE1hdHRlbyBDb2xsaW5hKSDigJMgSGlnaAo+ID4gLSBDVkUt
MjAyNi0xMjM4NjQ6IHRscyxodHRwOiBwcmV2ZW50IG5lc3RlZCBwYXJzZXIgZXhlY3V0aW9uIGZy
b20gZW1wdHkgd3JpdGVzIChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKPiA+IC0gQ1ZFLTIwMjYt
MTIzODY1OiBodHRwMjogZGV0ZWN0IHN0cmVhbXMgYWJhbmRvbmVkIGJ5IG5naHR0cDIgKE1hdHRl
byBDb2xsaW5hKSDigJMgSGlnaAo+ID4gLSBDVkUtMjAyNi0xMjM4NjY6IGh0dHAyOiByZXRhaW4g
YnVmZmVycyB1bnRpbCBzb2NrZXQgd3JpdGVzIGZpbmlzaCAoTWF0dGVvIENvbGxpbmEpIOKAkyBI
aWdoCj4gPiAtIENWRS0yMDI2LTEyMzg3MjogdGxzOiBkaXNhYmxlIHJlc3VtcHRpb24gZm9yIG1U
TFMgd2l0aCBubyBzZXNzaW9uIGlkIGNvbnRleHQgKFRpbSBQZXJyeSkg4oCTIEhpZ2gKPiA+IC0g
Q1ZFLTIwMjYtMTIzODcyOiB0bHM6IGRvbid0IGFsbG93IHJlbmVnb3RpYXRpb24gb3IgSFJSIHRv
IGNoYW5nZSBTTkkgKFRpbSBQZXJyeSkg4oCTIEhpZ2gKPiA+IC0gQ1ZFLTIwMjYtMTIzODcyOiB0
bHM6IGRvbid0IGFsbG93IFRMUyByZXN1bXB0aW9uIHRvIGNoYW5nZSBTTkkgKFRpbSBQZXJyeSkg
4oCTIEhpZ2gKPiA+IC0gQ1ZFLTIwMjYtMTIzODc0OiBodHRwMjogcmV0YWluIHN0cmVhbXMgZHVy
aW5nIHBlbmRpbmcgd3JpdGVzIChNYXR0ZW8gQ29sbGluYSkg4oCTIEhpZ2gKPiA+IC0gQ1ZFLTIw
MjYtMTIzODI4OiBodHRwMjogYXZvaWQgb3ZlcmZsb3dpbmcgQUxUU1ZDIGJ1ZmZlcnMgKE1hdHRl
byBDb2xsaW5hKSDigJMgTWVkaXVtCj4gPiAtIENWRS0yMDI2LTEyMzg2NzogdGxzOiBhcHBseSB0
aGUgQ0Egb2YgU05JIGNvbnRleHRzIHdpdGhvdXQgYSBjZXJ0aWZpY2F0ZSAoTWF0dGVvIENvbGxp
bmEpIOKAkyBNZWRpdW0KPiA+IC0gQ1ZFLTIwMjYtMTIzODY4OiBodHRwMjogY2hhcmdlIGluYm91
bmQgREFUQSByZXRhaW5lZCBieSBzdHJlYW1zIHRvIG1heFNlc3Npb25NZW1vcnkgKE1hdHRlbyBD
b2xsaW5hKSDigJMgTWVkaXVtCj4gPiAtIENWRS0yMDI2LTEyMzg3MTogaHR0cDogcmVkYWN0IHBy
b3h5IGNyZWRlbnRpYWxzIGluIGludmFsaWQgcHJveHkgVVJMIGVycm9ycyAoTWF0dGVvIENvbGxp
bmEpIOKAkyBNZWRpdW0KPiA+IC0gQ1ZFLTIwMjYtMTIzODc1OiBodHRwMjogZ3VhcmQgYWdhaW5z
dCBudWxsIHdyaXRlIHJlcXVlc3Qgb24gY2FuY2VsbGVkIHN0cmVhbSAoTWF0dGVvIENvbGxpbmEp
IOKAkyBNZWRpdW0KPiA+IC0gQ1ZFLTIwMjYtMTIzODc3OiBodHRwczogaXNvbGF0ZSBBZ2VudCBU
TFMgcG9saWN5IGtleXMgKE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVtCj4gPiAtIENWRS0yMDI2
LTEyMzgyOTogcGVybWlzc2lvbjogZG8gbm90IGxlYWsgZGVuaWVkIGRlc2NlbmRhbnRzIGluIHJl
Y3Vyc2l2ZSBmcy53YXRjaCAoUmFmYWVsR1NTKSDigJMgTG93Cj4gPiAtIENWRS0yMDI2LTEyMzg2
MjogemxpYjogaGFuZGxlIHBhcmFtcyBjYWxsYmFjayBhZnRlciBkZXN0cm95IChNYXR0ZW8gQ29s
bGluYSkg4oCTIExvdwo+ID4gLSBDVkUtMjAyNi0xMjM4NzM6IHBlcm1pc3Npb246IGNoZWNrIGhl
YXAgc25hcHNob3QgZGVzdGluYXRpb24gKFJhZmFlbEdTUykg4oCTIExvdwo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gPiAtLS0KPiBB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzIQo+IAo+IEkgYWRkZWQgdHdvIG1vcmUgc2VjdXJpdHkg
cmVsZXZhbnQgbm90ZXMgdG8gdGhlIGNvbW1pdCBtZXNzYWdlOgo+IAo+IFlvdSBza2lwcGVkIENW
RS0yMDI2LTEwNjA3MSwgd2hpY2ggaXMgYWxzbyBmaXhlZCBpbiB0aGlzIHBhdGNoIHJlbGVhc2Uu
IEl0J3MgbWVudGlvbmVkIGluIHRoZSBibG9nIHBvc3RzLCBidXQgbm90IGluIHRoZSBnaXRodWIg
cmVsZWFzZSBub3Rlcy4gQW5kIHRoZSBDVkUgaXMvd2FzIEkgdGhpbmsgYWxzbyB3cm9uZ2x5IHNj
b3BlZCB0byBub2RlIDI2Lnggb25seSwgZXZlbiB0aG91Z2ggdGhlIGJ1ZyBhcHBsaWVzIHRvIDI0
LnggYW5kIDIyLnggYXMgd2VsbCBhbmQgZ290IGJhY2twb3J0ZWQgY29ycmVjdGx5Lgo+IAoKR29v
ZCBjYXRjaCB0aGFua3MuCgoKPiBUaGUgb3RoZXIgdGhpbmdzIGlzIChhbmQgd2hpY2ggSSBmb3Vu
ZCBhIGJpdCBzdXJwcmlzaW5nIHRiaCkgdGhhdCB3ZSBidWlsZCBub2RlanMgYWdhaW5zdCBpdCdz
IGJ1bmRsZWQgc3FsaXRlLCB3aGljaCBnb3QgdXBkYXRlZCBoZXJlIGFuZCBmaXhlcyBhIGJ1bmNo
IG9mIHZ1bG5lcmFiaWxpdGllcyBhcyB3ZWxsLgo+IAo+IEkgaGF2ZW4ndCBsb29rZWQgaWYgdGhh
dCdzIGRlbGliZXJhdGUgb3IgYW4gb3ZlcnNpZ2h0LiBJJ2QgaGF2ZSBleHBlY3RlZCB0aGF0IHdl
IHVzZSB0aGUgYnVpbGRyb290IHBhY2thZ2VzIHNxbGl0ZSwgYnV0IHRoYXQncyBhcHBhcmVudGx5
IG5vdCB0aGUgY2Fzc2UuCgpUaGF0J3MgdHJ1ZSBpbmRlZWQgLi4uIEl0IGxvb2tzIGxpa2Ugd2Ug
c2hvdWxkIGJlIGFibGUgdG8gcGFzcyB0aGUgc2hhcmVkCmxpYnJhcnkgb3Vyc2VsZjogaHR0cHM6
Ly9naXRodWIuY29tL25vZGVqcy9ub2RlL2Jsb2IvbWFpbi9jb25maWd1cmUucHkjTDczMApJIGNh
biBnaXZlIGl0IGEgbG9vay4KCkJ1dCBmb3IgdGhlIENWRXMgc2luY2Ugd2UgYXJlIHByb3ZpZGlu
ZyBub2RlanMtYmluIGluIGFkZGl0aW9uIHRvIHRoZSBzb3VyY2UKdGhleSB3b3VsZCBiZSBidW5k
bGVkIGFueXdheS4KCkJlc3QgcmVnYXJkcywKUEVSQUxFIFRob21hcwoKPiAKPiBCZXN0LAo+IE1h
cmN1cwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
