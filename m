Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66144606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjUwSbTt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DEB81082;
	Thu, 29 Oct 2026 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKD3clja4T7b; Thu, 29 Oct 2026 21:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E52A8107C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310773;
	b=gXaLGwmc7jo7BgEp4I1iUFBqbmoJlTpTdpa+gF1RUdn1Eults60oFYmPP5hROrxgM4nE
	 rXWx0sloZr/dfDZygzEOSh8k4gYEgFRejXxYcWdSDMz3ZgfnuzYINhNFrjoIdC2t6Adtk
	 LNPSs10iVuxbQkr1nTjgifJF4AHBwnveTFyRhGPncBcWo5VGnOq+9jNxRxFTeRkrGi4Zs
	 KF+cAcbDv+tf56DlR5wokPaYQqyEmitnpCIcojLno3pDaqGtQzsBxBCU8aqNQ6f4DlaWX
	 aPHcRXSUW//jeyELL5sn0iN+XIC8cw20aO78xkTZxJeaXRzCOzQLZdrHgS75W+PZSpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Cc:References:
	 Content-Language:To:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kZ6TMfPTs5ZaymzoJ09jE8DyIJuPK4jMYAL8a+rHgas=;
	b=slZ8hewYhqiapd9D8PKkiBqLBOTeNJGp9KJxnq7r44Xzdgjswm/N2T+D2Vv+/F8ANLui
	 n2nvOcFmztspzi2QbK9rkUOV6nUsjSgonZ+aA/5lAtrvowO+FXF0gnal5MQgjF/ltTM91
	 0AL+rpuSke4NRN/I5qCYqG5bI2wSlxU7Reyi69NpflDc7lzYp2s+otAgVCZ/TQ5mIbeeH
	 l2x/8WxNYcb3G33HhJj1J0+BUROfAVKYqbM1D3iB0mXOCS4FYA0ld7wrb1tPeDNDXKJcH
	 7NZbMs2b4hxV1zbtqtdhV8yIV2jDV+yEontP8DCc5VHdufce7rLV9aiWCqcUzwjk86w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310773;
	bh=kZ6TMfPTs5ZaymzoJ09jE8DyIJuPK4jMYAL8a+rHgas=;
	h=Date:Cc:References:To:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bjUwSbTttOqeXI5IyKjwkN5NNOFWmq5R5Lpe8juuEn2y1vq8ADpYTCQS+nyyN8RWQ
	 E65HagQhcRhQqW+1Np8Ffysca/zgM3FaDE03YaojcmDFyK31flC5dSh0PhfQi8bEn2
	 ptjYQeIAPyPWrG+m5yLvfDrjWrbl2tBQDFIxwFwHVkqX7P5M8KGLz8gL/ub/24GUtU
	 x6a8q6rnTbDeODm+Y1EWfpp62vndsFL/c1tCSqYt1MlM5XNtsiRxhelfSeezeGvVcu
	 ePy1wjV8g9kQNfx4htBGfVm7E58ZMrjFWZjjYNF0R5WmRD5gtpjJAdRtfbl33lIRMP
	 GU4U1pFhWkzOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E52A8107C;
	Thu, 29 Oct 2026 21:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C39022E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5AAA40A67
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfqpwxDqvd7k for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CBCC940A6B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310771;
 b=BMDCR5CpXEE77d0HGf4tczWn29MUdn90E2lH8dmldAxdjoc6LOR5oOBB0Ye1QSewx8U3
 RB3WBEZg7kB8tlWQl2yrE+cq221FGXXml4q99AzqnUWd4tJrg2g0q13dXcr9cEEpWbctl
 /OsO76KPIRsekB++aYnL629G+aqVaSfprPox5eMtSFBdfNIZZex+JJfO3tV+W//oOhmfb
 TPbS9AyWAJ3VEUVseaeBWyyBaSM5SoAV4vkUy3cjhs3LvvSGuQo/oSjfDihtjjbnXWaNy
 yw3FEj3mXT88KFMe8qXu+G1pG4VaRfsA5W1XvR0AwG5p49ITR44c02tlO/pkWe4mPqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310771;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:From:Cc:References:Content-Language:
 To:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=jhEXQR7vdMuJoaW9zIfsLbVfIpIoogu8Re5py3Hy50E=;
 b=nueO+WVKc9JWeGRArENxJKTDNOMYemg/SFJtLf96+smUKBvwZgK8ntOZjPQLbuDStl1+
 UNUK3LD70/2at9mVk20u4FWynee8MGXeCQwu5sjBy9snnDvdXTZWRthCeHfmxH/4sEwmJ
 0RwqLBwKBgSK0pVnHPkm+tWwMHJNoftpGdqvTDFcNwg6ZTKScuj+NIl9GRcHr6c7pAWrI
 pkGYYkKKZ4PIGG/wwpChiKKa6Uiq2nj8AVhZ87EBf8+lsu0JD0sZIQrvhLPe3pxqc0LuO
 o/nopmta1yRcR+z0GviswNO98Zw3byUYio6Zfyhi4IOvkIb+TWfNFiT+02MV6XWNdPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dsyBjkz5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBCC940A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:52:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so313695e9.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793310769; x=1793915569;
 h=content-transfer-encoding:content-type:in-reply-to:to
 :content-language:references:cc:from:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jhEXQR7vdMuJoaW9zIfsLbVfIpIoogu8Re5py3Hy50E=;
 b=OpRjSYrrrXkUZzJQvSoT6T8YPqI/xQBYpVzqbPmhupyMz3rKmKZdqKa7XOJtaaf355
 zYqmQQd5Xv9tGru3wbe+YLhp9+89tgZeoqTdKH+avu8rG82tNvi5/+bUOG/BTDLcq9Td
 7gaKTlNRUHsQm4wVlCw/GmBkDhDWi5oySBpksD1EarB7FvX8Uo5oVQgm4yad7VIUUGmg
 Z1vULg1XzAtoh0IDfV5fEqHEDn7m77Vxm1gA1wSZB1zRQU6KxFkV7PXk0wfqz2/daExT
 PACBuo44Oz91Us1gMyt0PrH+3VjxAWxZnUfOyfl1zvp+aNbkKRRzp/SSlXj2pYuPyqN3
 w3QQ==
X-Gm-Message-State: AFq9FYI19Hk/vbXe0C0vLPFvE5NOqZeemwz9dgm3jwHy8EIdGDbocrfB
 LXKNQHwsayYIXXhDOvJIn2UdIgB4REVsHnmiHKalcIB2ebjm5uk4KnzhX65GkBx36a8k/4LVahe
 tREwGYzDdZA==
X-Gm-Gg: AYBFou1MZXefGe280QVRFRE79sqH2DKBdCmEat58Kaq7WUuWthoy1en5sUMzVqYO56r
 VOVsmSXzmzltiyhYEIr0COmMSHwDr5tVPi3gUHDeKSRLEXFEoqDdzVJfo/IW6oCIhq5OgFn8+1z
 7fbBuX6GhRfLmpsT/i9mWsZQ0+n/voUkfhVe/GikmC7G1o9kWHh7iN7edNkO53dcO8TucqZ9v2u
 TG8oWCHoff7vKDlDGG+GdSsx6Fuqq/nS2cENzEhksFTcaJDVxfH+YaSFZiUFFegUzSNo6RZLgg6
 BVftuEp/J0vjLYP9aESlRzyAfVHoH2npRVNtPrAG/wjgQlt2jFYJ6ogtMMGm5RIzkhNwWxNh7v9
 07nmvAwEUt9/qSzwmxLx+wJTugtbkMlRpcr4I+8Si/mMGnSaS8+AP9kDC2ZS8EBtRTug+JC1PNs
 V0mjJCKRexIjIkd7Q9HMMmnMDUkkY0AjHRZB4YktUgnce5N6DTYoNLP1/fE14/8Sw/FOeyCNR5c
 6rG/rTKo88m/J6zsalZ+EKa8YTrrCG8LnhwTuRDfI6U0r23Q6BwH0Txx3U24aT3QBX9wdgIwNtu
 oje8TrdLNQFy1POD94hs8Z5vZjyHovLmPxG0SgR5+EtnLtp00FQcLvax0hs=
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id
 5b1f17b1804b1-4ac17b2ce84mr6104735e9.6.1793310769040; 
 Thu, 29 Oct 2026 14:52:49 -0700 (PDT)
Received: from [192.168.178.32] ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aab10sm13331775e9.9.2026.10.29.14.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 14:52:48 -0700 (PDT)
Message-ID: <516ac571-8da2-4a49-925d-18363fc031d9@mind.be>
Date: Thu, 29 Oct 2026 22:52:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be> <asJzHhtAaiN13HMS@windsurf>
 <bf405ebf-ba9f-4033-8150-a5069ad151bb@mind.be> <asPHCM2j8FJcUQgn@windsurf>
 <ca01f386-0df1-4b18-ad11-c6091c354d82@mind.be>
Content-Language: en-US
To: buildroot <buildroot@buildroot.org>
In-Reply-To: <ca01f386-0df1-4b18-ad11-c6091c354d82@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgYWxsLAoKT24gMTAvNy8yNiAxMjo0NiBQTSwgUmFwaGHDq2wgTcOpbG90dGUgd3JvdGU6Cj4g
SGkgVGhvbWFzLAo+IAo+IE9uIDEwLzUvMjYgNTo1MCBQTSwgVGhvbWFzIFBldGF6em9uaSB3cm90
ZToKPj4KPj4gQW5kIGlzIGl0IHBvc3NpYmxlIHRvIGJhY2twb3J0IGp1c3QgdGhlIHNlY3VyaXR5
IGZpeGVzPyBPdGhlcndpc2Ugb3VyCj4+IExUUyBtYWludGFpbmVycyB3aWxsIGhhdmUgbm8gY2hv
aWNlIGJ1dCB0byBidW1wIHRoZSB2ZXJzaW9uLCBidXQgeW91Cj4+IHNhaWQgeW91cnNlbGYgdGhh
dCB0aGlzIHNob3VsZCBiZSBjb25zaWRlcmVkIHZlcnkgY2FyZWZ1bGx5Lgo+Pgo+IAo+IFRoYXQg
d291bGQgYmUgaWRlYWwgeWVzLgo+IEkgbmVlZCB0byBjaGVjayBmb3IgZWFjaCBvZiB0aGVtIGhv
dyBlYXNpbHkgdGhleSBjYW4gYmUgYXBwbGllZC9iYWNrcG9ydGVkLgoKSSBzZW50IGJhY2twb3J0
ZWQgcGF0Y2hlcyBmb3IgQ1ZFLTIwMjUtNDYyMDYsIENWRS0yMDI1LTcxMzgyIGFuZCAKQ1ZFLTIw
MjYtNDA1MDU6IApodHRwczovL3BhdGNod29yay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRy
b290L2xpc3QvP3Nlcmllcz0xNjM0CgpDVkUtMjAyNi03MjMzIHR1cm5lZCBvdXQgdG8gYmUgYSBm
YWxzZSBwb3NpdGl2ZSwgMS4yMy45IGlzIG5vdCBhZmZlY3RlZC4KClJhcGhhw6tsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
