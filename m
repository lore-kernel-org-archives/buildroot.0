Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660ACEE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 23:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B922812CE;
	Tue, 30 Dec 2025 23:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pZMbOFrupwD; Tue, 30 Dec 2025 23:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F180E8118B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767136699;
	bh=FNDUD0YemDrABYfdi1vaqToubdjswym+txnYBThWUhM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EmQYSU/wD6CNY7ZrmsvZv0iYXzIDhWz8D4fuKhBOBzlGFmscOu4PkfT1y+ryGHUbz
	 oZZvqNieiiH9CoynPNgjGKvSLizp6+pCkeVJzYrNCSq97lVbfWGcCwPLC9C3i8cVq/
	 pDuT1qv0qWhf2813g4RXnEDZj8l6TQId0rhwyiGMLE7SAgWVBxOBnPfETyA2UhXl2r
	 27dr9qr7D/uUWg+NEFUvyqUpNGKNJ7KzxVy1Lc3IwrKKeXCPnmryZLjWRC/coJwTx2
	 9ghD08fhtki7w06mo/cS0IYdnAjnXhW99sL5k3VWD4PBwxHnb7s721gN9BMiI4Tysw
	 emuzgxb3uRk3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F180E8118B;
	Tue, 30 Dec 2025 23:18:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E30277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 23:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E99CC8118B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 23:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7YM1OkWGprP for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 23:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9752080F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9752080F82
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9752080F82
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 23:18:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.107.189]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1vKyDM0hm3-00Hsf1; Wed, 31
 Dec 2025 00:18:11 +0100
Message-ID: <99b77ab9-93cd-4d45-9215-ea4b586813d0@gmx.de>
Date: Wed, 31 Dec 2025 00:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Paul Cercueil <paul@crapouillou.net>
References: <20251222172638.839720-1-buildroot@bubu1.eu>
 <20251227165702.5930b424@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251227165702.5930b424@windsurf>
X-Provags-ID: V03:K1:o2E4W/WiGDwZRyLi/V5LNXtrnJpSNJ9NkLFtTmkoj+dD28KtO4e
 NNgAnigEPlUtgu55iLFnE6Xe9d925dgLPSUJ3fc/XRjCIxpFr1Y+hQTKH5PmnRZ8MkJBIUP
 snNR2HjHx7JWGDBZ/UZjn2j1KnixcUh/O+zae/T3hkd/lbHu/8zMKYQNxCJcnRPSforpf3w
 1opaPaU+0pG54Y+AlDesw==
UI-OutboundReport: notjunk:1;M01:P0:Os5TTaMSgaI=;nR/dUqBoWzEf7uZf2IIUCSht9KJ
 dVbsz1JbYs4WhmxFcJv6hhk2zfkIpFGINEd8/znosePKO/s+XP1qlYYFsRvSAG21N9oqffyvO
 FCYNxLzxuq1sAGNPbHfkp2m2pnM3aKcny9May7O1mQnDzZE2tPtscIxAzA0VU4aFfCdWzkGec
 JEfa4ZntSgF6UoXvcCtafIxftZm+/DHL08q+ML76C22oNV8Lx5z0stZQPTWxWRnA4lk1IVD86
 Lh8pPdC9AS+pRxwDQWIhYO+i2YPSahJjfhnF6bwJv6xv1gV9Q330ysXxFZvN4v1mxmpdejoia
 gnMmtEQqLAp2Pvv/bifEQFdBzgOHIpoDQiLz8IgEJDljD1+ioJDehD64G59jq/VYo8g5b28ky
 jDFfyEMQZq6anTqjfu0a7THQp+FWFZZXm874AIsN5Lc8MrggQtWPi8ctYkvk3727dAEHW2EPZ
 PX8TvH/+5P0J5QtvX7J8O9qcxas0Y12w8e/BcA5GuVORMnXOPL+hqJuULecKcQBFEkqRzpKUD
 3pzhWc7nNLfnR1CKrlkp/TIdzdBO5eob8ZvFHY2Ljk5PWVv8bsWh17f0ruAekNgmCIF9+fO9m
 5Jc3FFsR4DVHrKieWSiQxb9nHt/7Qvmui0VvpGTbMjRWkhSlI6oEQlmsp1yHF5wAt/yfAwuV2
 ZOYAgPnxNSZTgZ+3fxd+k4FxfHuqayfw4mHTlTwfLmNjDkvEzYuX5yfbaabmnYMbv4iyaHxYX
 i7RRTuJkkb3FyxwZpV5CXkef8Ift9z3LJCaj5WxE7SVUz8YNI2O7xfqCU9xkAXuR/7GPM1xd5
 qzK4DgDU7ZlcaqJ43Bov+WrDdxKbY656Ql4nsUwSzBdo2xAmpElvOoAl51uwyFBR5JtyDk0r3
 xeNfGlvD5FsEcIR8C5JcsL9GjNb0YtGDKVv0+9c80fgLvF+g2SNPs6oUs5GpfOnbcZxNPvH6u
 kh00RcvVBvf/gsvzX3fF/HwS5dmsD3/syFqIf8qujcUg8pcTIpaxE5yZHyrtZYjYzhf7SbXYI
 C4kDydcmTuOk8cCHrt55PL8UWqsReZeutT65Jf1mbEl98ByjMBdYYW5AqHMljkStrgBuCH1vB
 W4tDWrIzWTlyfKaIxEJ2UKhvUB8nDx0LDu4Ia/uDSRme84s4tGhtvPALinb/VTrGA8Dlur+L5
 nX3ZieU6E/xUCW6KpatXwM4w/iQnBwthl4xAZNXrqlkKKCv72/+KSZ2zgKXr3O4SussfwHlYy
 K5bUAPCHok2/EjWqZiA19JSzB2udMFrIl0LHXJIb/qU+//Q0Gsc7KI+klAY6Nvq3yXuqVfM/Z
 vBj/yU3gqkGbkrRMnP9IWuOseOmFriCPDuseWPWuoEslCm5mrJmHcYa9xZ/K8Xzyh/P7h/79+
 BHtPaEGO5d0CD6FgJrUypkApPj49glN/gXtliPE5KH+3dU+gBuCewK0/GHTnqPZKulVvqEF7n
 Tuct4vXZEOotgsSQ0GxKKGXoK4ijEyjnPlSwgKdOQvGvQIeJxAFGTOV94jbVjUOTtxA2yXIJB
 5gxgu85hLYeJ9ctsZOW07FKbRVHi68Cvco0V0IDDzxN/EP8KEB5pzCF5WpSwZdX5AdIe7vfMj
 pccpI+ay+ZagN2JqIxzC3SXFX2WCs3IzJcf1nX9061edm2uW6aDBF1xI+oEdKeWv9FBf5E3r0
 xLUVAZUimSrZ9v5gEva/eKdocM5sZLqb07C+LTKJQgWGtFDRma6SgwILpJKQ7io9JzS8lrvVJ
 ZECtQE7txOgv0pc4D+V5jX+PepuUp/1NhiQGVVR7zqr1tyYJqanfOgn263EWY6RB8gBop54N8
 R3WTcQAbyg7XvEC65M+Xylc5t3rxSuxumVmlaM5mF0i+hiqNVHtguJ1NnOpvSQ9PyVvS96gpJ
 sxvQsuLSldAF3gtAOMkbNPy+Kn+NrMu+OgAfSI0cUAiOQWTwe2RRkADhMxif+TDi09XtP1NPO
 qieDS9XYWuSahme0RRRafrVeW8WEX0YuAcQYZGt3/dxtkPhnBoZbqsZVCQhpDcqR85Mzej/l0
 Pg9BDErRRTBuyDKsQA3ElNcUTK5bz1qP+kc5zVTe3aSvn4lXThK0gMXQbGZTwG5NJIr2ta4Mn
 jLJhNMIIgo224SpGzPiiXwSSprwo3Tohqe+KEQKo6HAtl7sSr+S6hwP8V1cZGvZHaWsvSffRi
 s2luzbu+IlOIQiVi50NFVXpQ6wvP2pQIqP5akwprGUtV3zfYK81vsofPZw7Z+mBjLhYN3tEn3
 yUW/3K5ogYdgcu47Ayc4M3Lx4nBr4At/B3fyMPqCT0EGWd8S1iWVpFlyqztq9wzIaW9VN5MpJ
 hYQpIhnZTy0rWVa7JLx/5VZQeU08ov6Xz6VoQK/Jvn8MN7eU57rCiINPTSbfzYMki91FO/vEd
 rFG+ObjwWyrzM8xuLUH3DXIaZm98fsl2lBHHj9EuTn8s8jexgG/9XxSMsPIW+SEXcE1YYqrsM
 5FKeCrAKqEC18U0tpjBfbYkk+pZvuIbCQpsikrJ+UQUHj66wq81e9xnkAPKXZyGUhoD43w81o
 JeJIobnwdGKATp8sYUqa7hHr8pjjqUbjI8GrGgTTYTzK25Kd799VGyppaPkKMCWVGLIXWCh4X
 Dtm1gmjS3poXLF0wsIpIneomAco5o5cVIKhkQ7aNfmVgvRBrIl3R/9Rmea7L6mfpl0PDtIhXz
 wL5Fgq5JnqvDva8PyC8vx09oPT84Ob99hgDNvPZJeLVfLycL/1CsR0CZP9YHwn9lpvbOvssB2
 n/1/WS5dns0Upkef2A5SexJ3pP5GtBiYICMlBfragyTGf1lViA0nK1qj0F+uDLkbMbwTcmakA
 BuPAqr/jMiDaF5HPL4rPdYutA+T+HAH/xERG0RHxV5Y/xZ1ecPG9Q+JC47mPINVGvBLJTUEgB
 EezdFpYBQkW/6GYp2OL68Cc4StRlP0s1Qn9rnM4ON3eJeos29UkZX0S1W9ETwZNpEw6nYSGmq
 Kpq4MIBqAruy5QB3z1OVdYmA3LEiTo++HNicGjIg6KNg6x3CTOZ22w/NyimJTZaI/AQbceasF
 ZjiEM9zlqGp2Pt3IHkdKlPVBv7SMpBlCk8lfeMpu2GOZuMt28lVR+73k01h1+dyB/0OIC1t7H
 pmmYyFfem3KuSqBqe5zWQ9hkSsQomO4gJf5aWSXcCbX9BTIx4wvm+pWtbVpY+1sFVM6Ma+HEE
 UVMihM7U7Fua27hSFQuuY0jHMTzUocYIh7NkBOMtPh/pKsk+CGF5qUqBFFcGsQJGaMZpXbnua
 vi/FitSCVNZl4MdvOBlrKyRPQgC2PHuQBjS0feBMSUPVt1zLc+fXU/schKuHnxmD4NV0ot4Cw
 xIqttYAE8a7LLpfpQR5kLVlX73PmE8n8oSILaai1Rb5JsDSb25kWLe8T/Rtf1mihshQPKu3bE
 w/mzoePqbb7cfFbX95JSk8yW68ANvigKH8JmqHQYO1grDDry2KaakG7X5dwnN+/elYElHYYHA
 z8X28o+DXEk8ayr32UbYpuLAUm3DoC5CouPiAsge2pYHykaEFGe/P7Vc/aZLGjLVsmDrjQjR/
 c6IwMpHoPy5GifdAn/Tw+zM27enUL0xwanqo8ehUmk5D395w3L9vEiJZcRGPEZt1IbpETJGrO
 Ixma1MnPJf611VddLs7pOjDRP8UjnM40E+3OFWCd4cNKLimgXqenmeXayaoOQiW7aIbYDw/x5
 kGNON/2pQVu1qCoJ4DZbJ2wQqSlfXnStjytfN7nkl4p2twt2XyqxjoHowglMjSDhll133KjaA
 5JovadueUVqD4OlmjV7Cny8k9cdtUIIaHK2ltCejoqVlu/SBcvV0QONXNWcRCGOxbmM+4dd2T
 9BaX4LuSvvFU3xRZ0ESOdaralAkuSzYLm0MY/hHgY4Fx4XWvD0Qi3ANkuiuKhu0ap101FQp5j
 M2DSVCL85D/w4Y/xPzGzaYjrzQiEfqKeu0GWkejObbSrCDxV6eejlsFJdAXbw73NnvKbO31+f
 HFqZi3nHsOIPvoyFtvS2VzaqtpPloh+8D00K/c1R3DQUYsnLYBVpjBYWhG6jfqdWvAGN6HRxN
 aI3Do9SyOT5A3qPMjQgVEstd50ytYqy4FWkrqI2l/ax732NMoxidcC+9FdV4M8Vmo/MLla2/H
 utEwa4//VvNk9IHOuFbxWgBNerRK7OQBM53t/zhxc3ktxNqasOKxnW/CNCMi6tpU5xF6UTDXe
 rfSjPvX9NBeeQXYCSMtdPx7vElN62lbhUvOu6jocELAIRjecOHVZJTlzn7LIbObspukv+h2GU
 clLaZuXwxTDKRweEzI/UwRp8jErf4bICwUXsvAtrqb2JTSulGuINXh3qZY4dWt0CJHQXMV+Pz
 4BvxFCzXW9xr/db8ayLDYyF1c+3J1thZqRilpkj+G/Qbdr5E9o6IA/aazBB0HiFBhXc1uIRO8
 8OpI7PxvXA8USj2v4K21UsS1x+A+jmFostiQ372L+HMrC6kE/fuIgLvsHImDNcpgOrajj2csW
 tsSvtDNUKFEBMLP76DxpI3Lq+ijYL+mRX5fjIM11DEVsQnT6Qww/EK30yuUtPxl4kSyvJ9cec
 An57DXbeGU1yv2hgz5DKj9Q8blCnKUaniz31nYEgOTUNXQafHYe6tIzh3oRVpZjneoG7venkn
 nWpgmWL1NjewWTAOZVbJJDY8fwMl4bEWhvRApm8dl4OWVb6Rx1fOWMhqQ9/22IscFZdo1Smfd
 pUl96pEo4WSYDvqj9eJW3wNs8UfGSMJUfYYVHCLZS17zk1Y5KbMH4LsXq220lhNYlyrhGUiTl
 X7QAJxwn3qTtuZJmqhnOcciR28ghXA4UWUufYAeF9AAmV7maHe1Mro78vHqCdJx5TByQd53BL
 HpAV4YUUR5V5armxYmCu4FsvhOA7+HFnQyK/1jlgr8lNgJdlhYJCTV7flrjNCi2diP186D+ns
 eddwLxC6DcojXHQwXxOqhg7pJUDJit+DFKcsXzqBUJLr4ORD+Ny8sTqaNiXlLEUHzJFNNysvg
 Fw6JpnvtoNgt0NSt7q4Cl4Z8389wOeBgFgda5QexYRrQdlyoCjaM+TxUfcr8aMvCXqq00pZ0d
 rKFKIRxVJhVXdPW2Ox9eyeeIU5kG4INTb/lOIZ1rmVD+foIlFWrHHOAq7LUbOYeM4pYiPWovb
 aowyeVQ18J0sgGof7O04zDAL5vIhooe8hOjOC3YYLb9woG7XW/cRyLsh2m1fgvgL1aFmaMb+z
 gc9nnqJ6d+e4JqGCb9MI6aRXwcgAannwTl/VN8qd554EY2mWyGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767136691; x=1767741491; i=fiona.klute@gmx.de;
 bh=U2TmCd3BwfhJ8VdkgN4pwKJp2iKD6OmKrZNXzyHnu6I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GOmuL+VfWdxrvnsqao5s1BtWhge3Rm6M1LTqvpMaqZuNK5Y9fThjkRz5HGSiBsKi
 7xfny2TKirxTzdXfzniL/oRfPdnHrqoIoX0SjKkYqjBkhaMbJipnu5P4noHQphsjv
 OqZPxymAUPNkFGnTNkwy8QKwrU9HptGlDHoItKjn/h7RSUnvYpMnGioXmv1BwEof0
 Ru1kHHISa7HQq83Ec31/k/mS2OEYGR3uv5NrDmkqMv6UGWUOvNKskPeyK5wmFWTs0
 nX991dwKn1+Yh02UtoiVSGS4sQ0gLByUUkKU1qjSeuvqcu0EB9YsbVlSo/JII1GzR
 3luwYkfK3TCCOF7eSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=GOmuL+Vf
Subject: Re: [Buildroot] [PATCH 1/2] package/libiio: fix python bindings
 without glibc utils
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 27.12.25 um 16:57 schrieb Thomas Petazzoni via buildroot:
> Hello Marcus,
> 
> On Mon, 22 Dec 2025 18:26:36 +0100
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> Libiio python bindings use ctypes and specifically the find_library()
>> function from there to load the libiio.so shared library. This is not
>> working unless glibc utils (specifically ldconfig) is installed to the
>> target (alternatively the target would need gcc or binutils, for objdump
>> or ld).
>>
>> The easy fix here is to just bypass the find_library() machinery
>> altogether as it's not needed on a buildroot system.
>>
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
>> ---
>>   ...-bindings-python-fix-library-loading.patch | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 package/libiio/0001-bindings-python-fix-library-loading.patch
> 
> Thanks, I have applied both patches. However I must admit that for
> PATCH 1/2, I would probably have preferred to backport the on-going PR
> on cpython, which fixes the problem for all cases, not just libiio.
> 
> Reading the discussion on the PR, I think it was improperly presented
> as being needed for "musl", and used only for musl. I would suggest to
> not present it as something musl-specific, but rather something that
> makes the lookup for the C/C++ libraries more portable (and therefore
> probably drop using ldconfig entirely). This would have addressed the
> concern raised on the PR that this is musl specific, and musl is not a
> supported platform, yadayadayada.
Unfortunately the CPython PR [1] as it is actually *is* musl specific, 
importing it would only help for musl-based systems (fine for my builds, 
but not a general solution). The current ctypes.util.find_library() 
implementation using glibc executables has issues beyond musl 
compatibility as Marcus' point about missing ldconfig shows, but that 
hasn't even been mentioned in the PR discussion.

Best regards,
Fiona


[1] https://github.com/python/cpython/pull/18380
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
