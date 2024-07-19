Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4963EC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 14:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E2240FC2;
	Fri, 19 Jul 2024 14:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNo3RQPDQcoR; Fri, 19 Jul 2024 14:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE77E40FC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE77E40FC7;
	Fri, 19 Jul 2024 14:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D40051BF335
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFAB040FC7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMNzcXHa9EHX for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 14:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CB5C40FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CB5C40FC2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CB5C40FC2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:36:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9G2-1s0f283tva-00f1sb; Fri, 19
 Jul 2024 16:36:15 +0200
Date: Fri, 19 Jul 2024 16:36:14 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Zpp53mr6-TUO7rVD@probook>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
 <20240709-tipidee-v2-8-a69a8668005e@gmx.net>
 <f6fe9b7b-28e4-48e0-bac8-7aa87d787473@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6fe9b7b-28e4-48e0-bac8-7aa87d787473@mind.be>
X-Provags-ID: V03:K1:XT8OvXe170jaPH4Fmcipi4CEeRQOxJfhGdllLMKcAuw8NIktN+8
 BG6anCevkf4vM3t8m2+Dqicu1B/2TU5UvvL6o5bAVN4XOQxTAEYDa4IRGxwvvyDwCCZz4Cu
 TsgwFdP2W6tBjfcMlracHqrZ1z+yZpvjKN3WeLkNq0Gl7L0xB/qdkonYBg872A0i4Qa05NS
 hXetUd5SwDgHvSGL6k2qA==
UI-OutboundReport: notjunk:1;M01:P0:1xLpT7fq3Dw=;AcCyWQzXRHHsnW7a3tt8ZwCtoIO
 /KEwPQLLLoTYWUt/6qA178+nLIOA3V21LzF37VOLNB21+6znlssKchI/e4fVqrCBzvTpNOKUQ
 /A+O7yaOK/kaRdWqVeIQQDtHxxpZe1g62QmmE/EHtLSg/60AXGFlkjp73B67fVokJWDVisxqD
 adR+gv2jJNOgkRzsnq0SpWvXI+P0k/j9N11sWyMcgIcA/LRKlNXhH2vRK1utw0eszVutZyuZj
 hOQUQNBmyLi6D6r4bpc4ew1Y4LJzG2LNslOCo/aBc+dlYhZZEHm4eUsCbZaRKyC3Vm0s1XXtJ
 b1fy2l+Pz2aFSflX5egW8B3beOVMMCHxi6J6/SVgIcSakYzXWy9f5HEBoX29b0X/V1ld6z7ig
 VIbdQ+QQ6aeIMmUDl+xXi/krEpYdRUCEUq8ROntI3gqi0eNwgA28iNDbSTW47BtrAwQcCJV08
 M9TBe/v9JLFpBpR9NTQQCvCJxIej+Z+PsId32TnWsE30PdZsB7l4H++Hjr1I33CqgIrao4ueG
 rVVJfzPq0X2jYRSHqL7/U2LMA0whK4iSAfj8FIhjdDWVr05ZC3r/zLVoRyMmK4MPjRUjzVffe
 42eEae0l4ZFbnqfnU3Z85uJTfvsNm4QxenPb/aLjACBO4DqeHxSzuBbeNA3tulsW3l4egL1be
 smzicF0QNL8lbI65doVQQGwqx+BG7vn+pEdGKZ17kIDYDmCD2RKZeRGq9AgqEzhQgbZhIV6Iw
 yCfROzfRmAFzkdjEFRGy5NdsHzvFA6ZT+sF0EbjUczQMxO++IVPf1L7ZpSMyE2v4twMtpu3Y1
 7w352AyP+1jKwhnh4OUdEsTQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721399775; x=1722004575; i=j.neuschaefer@gmx.net;
 bh=qoR+9TXsGR4+nIK7nfna4JkoHHWpFUmCHZNrlfdnSlw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dFc0ITWOmNv7sIdnG0ywoEyuglffdDcNJbU7jMUVDfRVKX/DxdLPY0VQn7ANUfyM
 3kNoTUbkvNhzD0PSM1lGrQUsVupIx36bRIL7NemzDj+qMQenyPeDXDtQsM3+VkjkR
 eEKTYLNXNPkU9bKccdIWzmQAzERa8kGVyyEhn101JrMTk4oUxbCa6CCEYTFLTuzpH
 kJCgbpJReEyP9WiMGActMVrtKA0msSYrQHGIHL4//nh32AnSPK27iltmlcB/LhsWY
 cHfmsReK8HJvRB+a8QXWEuEdZv/748TBO9fdidCaYOZOez+ANQbmR97eBADbW279b
 UgxkC1FBhz48wMUVkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dFc0ITWO
Subject: Re: [Buildroot] [PATCH v2 8/8] tipidee: new package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdWwgMTQsIDIwMjQgYXQgMTA6MjI6MzBQTSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4KPgo+IE9uIDA5LzA3LzIwMjQgMDA6NDUsIEouIE5ldXNjaMOkZmVyIHZp
YSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5u
ZXVzY2hhZWZlckBnbXgubmV0Pgo+Cj4gIEFwcGxpZWQgc2VyaWVzIHRvIG1hc3RlciwgdGhhbmtz
LiBUaGUgcmVzdCB3ZW50IGluIHVuY2hhbmdlZCwgYnV0IGluIHRoaXMKPiBvbmUsIEkgbWFkZSBx
dWl0ZSBhIGZldyBjaGFuZ2VzOgo+Cj4gICAgICAtIFJlbW92ZSBCUjJfUEFDS0FHRV9USVBJREVF
X0NPTkZJR1VSQVRJT04sIHVzZSBlbXB0eSB2YWx1ZSBvZgo+ICAgICAgICBCUjJfUEFDS0FHRV9U
SVBJREVFX0NPTkZJR19GSUxFIHRvIGZsYWcgZmFsc2UuCj4gICAgICAtIFJlbmFtZSBCUjJfUEFD
S0FHRV9USVBJREVFX0NPTkZJR1VSQVRJT05fRklMRSB0bwo+ICAgICAgICBCUjJfUEFDS0FHRV9U
SVBJREVFX0NPTkZJR19GSUxFLgo+ICAgICAgLSBEZWZhdWx0IEJSMl9QQUNLQUdFX1RJUElERUVf
Q09ORklHX0ZJTEUgdG8gZW1wdHkuCgpVbmZvcnR1bmF0ZWx5LCB0aGlzIGFwcHJvYWNoIGNhdXNl
cyBhdXRvYnVpbGQgZmFpbHVyZXMgYmVjYXVzZQp0aXBpZGVlLWNvbmZpZyBjYW5ub3Qgd29yayB3
aXRob3V0IGEgZmlsZToKCglodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvP3JlYXNvbj10
aXBpZGVlLTAuMC41LjAKCldoYXQncyBhIGdvb2Qgd2F5IHRvIGZpeCB0aGlzPwoKLS0gam4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
