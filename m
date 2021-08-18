Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07A1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6079061053
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6079061053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBDD80D1D;
	Wed, 18 Aug 2021 13:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjvyQnATPrDt; Wed, 18 Aug 2021 13:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7482080D83;
	Wed, 18 Aug 2021 13:13:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCBAE1BF287
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93CB80D83
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aX4f0CCIqzEA for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 13:13:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 980F180D1D
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 13:13:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31C771814BC; Wed, 18 Aug 2021 15:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1629292406; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XPvTw+fOunWkX0yI1X+is43LLs8lDkgR+9E0RYuFlJw=;
 b=uO49QjY7E+VkSNVeG96nb46G3kAxN0DHbIM5LFO5D4sOXmd+1f0NhK1n3UYozZwBtMweOv
 eRt1S+71tlY0JXk80p335sQ7CWFIsMp/Zzj/uN3l/gMWzWNJ5qbD3CBU1sX6zrArwBiJQf
 uIETUffgNBZzU+kt4FK52bYoMiw2k00=
To: =?UTF-8?Q?Honor=c3=a9_Julien_Abijuru?= <abijul001@gmail.com>,
 buildroot@busybox.net
References: <CAMF_Hqkdoregortj-vDGDUoDThEQemdUcXn36x9z1oweUvbyUA@mail.gmail.com>
Message-ID: <09721949-64a8-969d-db9b-c9b66e991dd0@heine.tech>
Date: Wed, 18 Aug 2021 15:13:24 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMF_Hqkdoregortj-vDGDUoDThEQemdUcXn36x9z1oweUvbyUA@mail.gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [Bluez] Bluez5 utils/tools not found
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgpPbiAxOC4wOC4yMSAxNTowNSwgSG9ub3LDqSBKdWxpZW4gQWJpanVydSB3cm90ZToKPgo+
IEhlbGxvLAo+Cj4gSSdtIHVzaW5nIGJ1aWxkcm9vdCB0byBkZXZlbG9wIGFuIGVtYmVkZGVkIHN5
c3RlbSB0aGF0IHVzZXMgYmx1ZXRvb3RoIAo+IGFuZCBmb3IgdGhhdCBJIGVuYWJsZWQgYmx1ZXo1
LXRvb2xzIGFuZCBibHVlejUtdXRpbHMuIEkgZ290IHRoZSBpbWFnZXMgCj4gZm9yIG15IHRhcmdl
dCBidXQgd2hlbiBJIHRlc3QgdGhlbSBJIGhhdmUgYW55IGJsdWVaIHV0aWwvdG9vbC4gCj4gRXNw
ZWNpYWxseSBJIHdhbnQgdGhlIGJsdWV0b290aGN0bCBjb21tYW5kIGxpbmUgdG9vbC4KPgp0aGUg
b3B0aW9uIEJSMl9QQUNLQUdFX0JMVUVaNV9VVElMU19UT09MUyBpbnN0YWxscwpibHVlbW9vbiwg
YnRhdHRhY2gsIGhleDJoY2QsIGwydGVzdCwgbDJwaW5nLCBtcHJpcy1wcm94eSwgcmN0ZXN0CgoK
SWYgeW91IG5lZWQgYmx1ZXRvb3RoY3RsIHlvdSBoYXZlIHRvIHNlbGVjdCAKQlIyX1BBQ0tBR0Vf
QkxVRVo1X1VUSUxTX0NMSUVOVCAoImJ1aWxkIENMSSBjbGllbnQiKS4KCgpSZWdhcmRzLAoKTWlj
aGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
