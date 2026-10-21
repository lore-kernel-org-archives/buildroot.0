Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E00606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gjeXbwlz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9688A40EB2;
	Wed, 21 Oct 2026 20:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd7g4rUSdxG1; Wed, 21 Oct 2026 20:15:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D56040E91
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613708;
	b=ah6KWdRxVxIh+5OT57bTs3SKHspDu5yb7m0MPyQ+1YgAZlzRQIMdwE+akH2g383zsmpY
	 fDjkgQaypvME3tjJNBP0bLCvU4qBa1RmecFtWPcu4Nmr/3wd1HA3cc8TyYRFc0S5tHR3J
	 1ELl9zHzMy+o8X9eZDG1jkkDWADE68l72UPsjvhol8SFqKxljk41RmcLx9cPNA42ahlh+
	 Q58Lfdd5snRa8YCQRRdn2Mb6HoFaG3gtzRHi5ekvFN45cbyIqHz5aA154Xj/QklnwN0Il
	 krmFpXqRLhAEji4CgIjVX6UdU/OPzh7CO46fk8OU63a2SWT8y6DP5LNfty395yxdbLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=9gE6TNMW3lMafTe2BBvxm3J8niHyO9VaM1QEfWEOZJk=;
	b=Mj8S3bJ8nHVSb59qIQ4WcQvwRG+jPmHMj6YQAYCy44+Va6bYWxg47rGMUBRgxX+3pBtV
	 jDFC+hOeLa8UhZuE77MLvL0qp/zQkXw7WF1hrBaMPnM3boRRjuL8uo84sEXXsX7xS2DIR
	 uivF4li76oiDOXU2gjBXHy/00ni0kV5UslgE1gd/DynKmZuEn+JPfRU+C88f5VxY8Evgi
	 8GtXY4RcIK4IL/YszGhmpxQ9QC+BX6xtVklCDmW26JgF+UVRi0wzVX8su0FiHrhPqZqFc
	 XHiTdhlYStYA6baTEOzK2Z+LNRW2enJNpGT7aLy/+nXPDvHsRMXOtuQ6O5tcudDGooA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613708;
	bh=9gE6TNMW3lMafTe2BBvxm3J8niHyO9VaM1QEfWEOZJk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gjeXbwlzTMXHRdhvJiruU6oU7Kscd9d3sVkVE6u9htBwndfr51oI20e2MHM1Dnjyg
	 +D60yOS0hb34TDzTtoLKBKZ1nrXadINaKkb9gX/Bh8wRo8bwHu6AgARu5X+7N+wziK
	 D3o78qcA3Ww5IJF4/ugcngcoKzjZSXaUC481iPxh8F8+ZcSr/5EJpHbln3Um6TS+Fb
	 A3Jy67jxwn9GpSgPbsI25AGKJnvdFLefaAQLN5YAjE10pgdEJPjlSQDrcKF9R+rj4b
	 u5qNOjCxCk8NlSeTiAhT1Qcmi9zl9dwk95kI7SeZ5pjuZXl/AdlzTemSdshhmMGZP9
	 bUfvhrZZRXzdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D56040E91;
	Wed, 21 Oct 2026 20:15:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49E5A95C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F149615B6
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4S5YP3LjS7h for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:15:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0FD4610B9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613706;
 b=fGDQF7UKjcEhWIsRFBXsWZOYtdUv9SRbTa/V8F07x7sdIkGOvms/IeE/7UoabYNBOgek
 SbF532bHeWMm2NQIHTYPQxjIgmOXySzdRcgJx4ZNNCz6gvvu9yuN54OgxIi8GXQq6YHUl
 t9ekIpbwb5aklYntshD73iR0MF8xtfLO/0Ma/MyLvcMSqsWZmvWQDKAGUZIwa2fG1trp+
 ocjn7qUDZ/EIcMEVq01CEQNd2FrXF2InLenT2vWN6cNXzMLK4ILXMTsrNiPWUgHeN1rgg
 fQdpCnISrp0FVFWVgcd4CXdKEsLfBdWv+zfMkplOg9fOc41RYF9ILl1eNuMQI86onaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613706;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=hfel9pyEmec+6ChgtfN4XAmWfetFs99TGD8ltPuKQ9w=;
 b=LpsVlCY+27PDXG6WjzQErw1Tv+EbrFT1CUbSdeamkrLFRDiTbZ5evb8EBgH0GLeCl6L8
 jeaOHqm70cAhPCXFds4K5eguHkn4Ld8ioFBi6aENq4KdwNUf4ZDUezYgucih4aoEhnkEC
 26PsyQHVdehYUnm62FrRYWeUhw9JZom4n5Tdr0O0nniPFxVR4d6WuEmnIwUOvv0HT455l
 PUNYaQB9YuHfiHSwlGRxxCjWyKwoYK35ibkhz/Pnkq94sdn18MY8L8f7O02bPsbY70hcY
 ZrOvYLb1y+penH+OEWD3d5l1E+webutvMi0ZI3rWiCGQcWikKxCqG5kTkH5QYUNa9aQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LFrC4ALw; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0FD4610B9
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:15:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63RQ-1wVF421oLY-00sd0a; Wed, 21
 Oct 2026 22:15:02 +0200
Message-ID: <435a155f-23ed-4186-978f-ee44df724620@gmx.de>
Date: Wed, 21 Oct 2026 22:15:01 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <20261015193243.3299884-9-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261015193243.3299884-9-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:Hl+58ETgBzIx/726W0U9h80yESYdP1KUW2CSilrYSu7pAiSb061
 WS2Ichn4YQIPnBOsRU6FcH05MX44Vvn2551zplaUA3HH2riKzeBHKagekZXeQONZZ+gZEnT
 2Xgj5K4WLwDCftXfX7yWz8zLlE5snf994tTDbZxicYvN2koAgzTqNtTHHOPLGGLhT623ATq
 GpBr7XuSlYFTdgnQaDp7Q==
UI-OutboundReport: notjunk:1;M01:P0:b1mJ/tPUtgg=;mpUcN34dLzlHPEhQQ40npC9RQzP
 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
Subject: Re: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 15.10.26 um 21:32 schrieb James Hilliard:
> U-Boot configurations selecting BR2_TARGET_UBOOT_NEEDS_PYTHON3 already
> depend on host-python-setuptools, which provided pkg_resources before
> its removal in setuptools 82.
> 
> Add the standalone host package under the same condition to preserve
> pkg_resources availability for older U-Boot releases and vendor trees,
> including versions whose Binman still imports it.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v1 -> v2:
>    - Tie host-python-pkg-resources to BR2_TARGET_UBOOT_NEEDS_PYTHON3
>      instead of BR2_TARGET_UBOOT_USE_BINMAN.

One thing I forgot to ask before: Why did you change this? AFAIK binman 
is the only U-Boot component that might need pkg_resources, and the 
dependency should be as narrow as possible.

Best regards,
Fiona

> ---
>   boot/uboot/uboot.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 96b8cd0d2e..daa841309c 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -268,7 +268,10 @@ UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
> -UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
> +UBOOT_DEPENDENCIES += \
> +	host-python3 \
> +	host-python-pkg-resources \
> +	host-python-setuptools
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
