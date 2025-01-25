Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A917C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC25605E8;
	Sat, 25 Jan 2025 23:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts7VuS8p85q3; Sat, 25 Jan 2025 23:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77BDF6062B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77BDF6062B;
	Sat, 25 Jan 2025 23:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D193F94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE0CD80C47
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsIyk4Sb13aC for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1C0380C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C0380C69
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1C0380C69
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:02:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.60]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1u2Oc41BgJ-00HqcG; Sun, 26
 Jan 2025 00:02:35 +0100
Message-ID: <43beaaf3-52cf-4635-88d7-f51110fa3136@gmx.de>
Date: Sun, 26 Jan 2025 00:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250118083837.2883279-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250118083837.2883279-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:aiiVGC+Y5VZrPxEyWIjrg7fFI/49Jkf8HUxB7xaVhZZtLoJM2Gh
 y6gIdo4DwCOzRlSLVcWZYgO9QNlmiaq5GkO/PVIHzoqDmAaHKs6HJ7QEoqB3283KdDU29R4
 MDfumlLlVtUm9rLg3s7gKjwHIvv6hAv0Y0nIBWxCe7E9Gyqvt1S5Aa9IBnve5/7uxWyWOwm
 Cm+/DCxm74A5RMxxX6bYA==
UI-OutboundReport: notjunk:1;M01:P0:1N/+QNZikUA=;+uPzeVn+qNUZsaiMhJ2Z8dTU+l/
 5ENJgj+FY05qawmd9pP+HTxpFYX9fTXPGs31iD7e/fezGLxQhytfXXUoPGSlfL1ZDEJQUy1PO
 aS04l0NCxXXitOe6huJMeuAcDFnQr++Q/ztN1pUq4io0ZBvWqQsQ5+plhnC5M5zLdSyGi4dFk
 9M20VfUuc/rw1qeajJvLcgHsdQIH/98U/dJWIyVY4XVFksjUbZXOxyQdbYpDm5GxWU10m1QbR
 yuNo9IUmxguAzwmJ59wvCn8I4IirzYVROYipifidIDVWHAjwhiJhP4D3N+wi+RqRP2tldovfF
 FkVkge55VBW6gcs4j+wRoi2YPyTSepglInnn7RA/aUruRzeg1PVQPv8K3ndGAfztvQuDr+UM+
 EsMVMqtp/YaXvY2Y9iEUiV8f0p6D/Ls2or0ZGcJLnWg63Rv600txhuVDFoIiV5mKcmNjOnmAm
 8WSe0BLnnbXn73HWOZYiK2fRbFuWhVCSiSs/99hs8/73BYW94DzVVfScK4dHAf5w0wvSOpySI
 fCK6ymShMuoWmTti68SIenPJfj5aec+HkD141+HG5mk/xhfU1JO8b5eoXMBLhbEq0bPs8Eodf
 fIRDYrU+81x9KkHDQFWw8ELKo0CK3U6b1hoWosdiCHm8YzqjHGL2GGqzuL3pRyMrc5oTB3AaW
 rFaQqMTTA0hxsnUjFuBeE7kxgXITu2ebkg9secxks/fNUxrZXlCNQBL8RZQs6XH/Goa3Xoiu/
 9bNxZibtYKKHIB24xC3kzQrwwwsJgWX5VuVFuBpzY0m7SEOFhznmAmkEmx64l2eByPULKHg61
 3dbaaPzJ8B4gHuKlPS7i448XGjPs/Xi6P3LdZq95SRJV4355yZI6Qt5XDgfhBtqFD7TPuCU/N
 458qIAgOy8bV9Hs/IG3KSlQVdmL21mZgwi9C+vh+OCTHNIc2wRGbv8HD7L1XgtsaxBbY68NMY
 ItWLvLO9veA5ECDB6HgSlFmfq80KS2QaZ+G39CTPAeNuYtASmE8+haKZ2fvS4348jftZGYDy3
 bZGaIXylEaZmQFPRyMN97L7RyAbbkjXhUv0vtDtNEVu+GSLhsQ4SU8XhlVxS3cpIc/WFSXNIv
 2m3Q4HjWSG8hisnomotH8fYHr5Bbzv5kJvvHfdc4QEjpLWAC0zFScY9/gePvqvyP2CGWX/G6i
 ty/IQ/EVCAjCbCu6e2m2LIxiDSW2M3pYH6BD3BYQsTYzIcoe1tWUW6q9yCvwndgxP9i1Lz5Kk
 HE/bjr+yRE0j3y+q7Fegt5miDi0pKvpkBlfd89qQ/XFQMep1LJnPeNHQ+lvoKOwJKQgQ18TkK
 8h6p2RStNCC7iH/qinLYs8wPXBBdRnauc/DgJonFhGGCEc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737846155; x=1738450955; i=fiona.klute@gmx.de;
 bh=SfYFNC/X+W+z4o38Klr8AeA34e06N7ne/my4mG0OF0k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nVWpsg2fZVNK8kXPD6aNS4uW2vkBSoH4ofXqsg+9VxXnLgIfQsm/F6wAyvwx7Lci
 u8RdgkN/ZHJN5uFZWgPGLu4gXR5Cl6tBHBNo+5mPOLWUdT1hXReGIR3naQpXgrEnB
 jxUKcbFML7NxX6V7RExAi0QtNhujtK06h1enUBLpACNTBmMN/oJZ/1dujCWdxQ3Xq
 M1VLAAnWCaXquowvomwh0Ko7LpxFzCUwTtyf/NeVe1UsNV+WNf8vT5YIDPeaPeqQH
 he4mU3DE+TliNb0J+8cmuSuw4hSsFKjnW79pM27Br2MSv9PtyV4w1rUTRaLMmJN4x
 mBGZSGxdrbVkAD0ORA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nVWpsg2f
Subject: Re: [Buildroot] [PATCH 1/6] package/libdrm: add host variant
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

Am 18.01.25 um 09:38 schrieb Bernd Kuhls:
> Needed for mesa3d bump to 24.1.0.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks,
Fiona

> ---
>   package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 9d463ca01e..a8a912859e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -116,4 +116,25 @@ else
>   LIBDRM_CONF_OPTS += -Dtests=false
>   endif
>
> +HOST_LIBDRM_CONF_OPTS = \
> +	-Damdgpu=disabled \
> +	-Dcairo-tests=disabled \
> +	-Detnaviv=disabled \
> +	-Dexynos=disabled \
> +	-Dfreedreno=disabled \
> +	-Dfreedreno-kgsl=false \
> +	-Dinstall-test-programs=false \
> +	-Dintel=disabled \
> +	-Dman-pages=disabled \
> +	-Dnouveau=disabled \
> +	-Domap=disabled \
> +	-Dradeon=disabled \
> +	-Dtegra=disabled \
> +	-Dvc4=disabled \
> +	-Dvmwgfx=disabled \
> +	-Dtests=false \
> +	-Dudev=false \
> +	-Dvalgrind=disabled
> +
>   $(eval $(meson-package))
> +$(eval $(host-meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
