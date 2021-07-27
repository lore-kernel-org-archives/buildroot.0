Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C3BC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD66610A1
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BD66610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67458605A1;
	Tue, 27 Jul 2021 08:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id te-8uvuQMwym; Tue, 27 Jul 2021 08:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C188C605A3;
	Tue, 27 Jul 2021 08:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9BBE1BF293
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99791605A3
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPdjVgN_t2Sd for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 08:03:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7760A605A1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 08:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 493A418287F; Tue, 27 Jul 2021 10:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627373022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MRSsgEloipT9y8ubcfvMOjfk6brQCZQSyOBLaqIHjLE=;
 b=WavcgOSRAUXXSqatd5MhFoaqRlHiCJWZve17TuaAIPXHxCxwDoV/NTc6VEEdu0jbhB7tNO
 BSisZNOZZUKwuXF1FMuVbAJpb0I+WxwK8JA942p3uinMDXD4pgG7Z+723785ZcXQkPi5Pu
 ePS2XJQB8EexJR6ptPwulE5Oio2mpkc=
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210727072523.2273052-1-fontaine.fabrice@gmail.com>
Message-ID: <9ace95d9-e182-7abe-0213-e30105562da0@heine.tech>
Date: Tue, 27 Jul 2021 10:03:41 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727072523.2273052-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: make a single
 option for avrcp and a2dp
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgpPbiAyNy4wNy4yMSAwOToyNSwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiBTbyBtYWtl
IGEgc2luZ2xlIGF1ZGlvIG9wdGlvbiBmb3IgYTJkcCBhbmQgYXZyY3AKClRoYXQgbWFrZXMgc2Vu
c2UuCgo+IC1jb25maWcgQlIyX1BBQ0tBR0VfQkxVRVo1X1VUSUxTX1BMVUdJTlNfQVZSQ1AKPiAt
CWJvb2wgImJ1aWxkIGF2cmNwIHBsdWdpbiIKPiAtCWRlZmF1bHQgeQo+IC0JaGVscAo+IC0JICBC
dWlsZCBwbHVnaW4gZm9yIEFWUkNQIChhdWRpbykgcHJvZmlsZXMuCj4gKwkgIEJ1aWxkIGF1ZGlv
IHBsdWdpbiBwcm9maWxlcyAoZm9yIEEyRFAgYW5kIEFWUkNQKS4KCmZvciBjb25zaXN0ZW5jeSB3
aXRoIHRoZSBvdGhlciBvcHRpb25zIEkgd291bGQgcmVwaHJhc2UgdGhhdCB0bzoKCiDCoEJ1aWxk
IHBsdWdpbnMgZm9yIGF1ZGlvIHByb2ZpbGVzIChBMkRQIGFuZCBBVlJDUCkuCgoKUmV2aWV3ZWQt
Ynk6IE1pY2hhZWwgTm9zdGhvZmYgPGJ1aWxkcm9vdEBoZWluZS50ZWNoPgoKClJlZ2FyZHMsCgpN
aWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMu
YnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
