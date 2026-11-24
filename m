Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EF2606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 20:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n81ofzop
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960C2605F0;
	Tue, 24 Nov 2026 20:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MI5hYjQBYIhM; Tue, 24 Nov 2026 20:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A594B60699
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795550400;
	b=NiExWmumBH0rLBV4kFeCgSWPwEH+L9AILdgJDgSt3zhKmyz/Cw+zHbxgdRywvTLcGzer
	 xPbQVwa7kF3puZyiqcPo8Yjs+Srz+9UUijEpKt+d8AJMl08INqGpLbFX6JePy7BttMR1G
	 /a2ST8S/aNSKS0bP4DvF6fjzynZFF+BdPbu7jojKKGpU5+HER0jOx3xFDkgdUi3h20YIF
	 KnopPsruIf5trbZhfBQ9NjjhdkJYZKymncDZy5nFK/+Dn7/VyF6TayuxcZ/h23gpSgPHX
	 k65QFm0ROD8Y3OkCNdXjRORp5dk6rttFJZdlGM/0jdS9jKwoFTIMiK+2xvlYYgx2UbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795550400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fazQuPC7Xzm6QM2js/1OQ+vIaUZftvf6IY4pFOa7gCY=;
	b=EN2svVsWJEqXeTM/hPmjlDE6ktpgp/f2aqKa1IOlGMEQy3ACaHnGiO3vTIJ1290TnRt7
	 i3bo0GfFNeQIIJYHsMh6jjPunZhwb1AB+L652wh8BgPNzK+iuUusWOyKpRJRDk/qA5LbH
	 k/jwthONnp6x4gvQGdjC1aCeBTCBohJw/1/VCjAGOCHsOw/w92NWO2Y7P2RtLR9nqyIeZ
	 aTuz4WPxHgD/C1L81qqt7OQAbRdC9TkMEl8GeZ81R3IyFJqsDaavpHna3jcntzRVBlXRq
	 5nAkvQAkGe18rPyV3jq9iOnGAqP9a8IiInTqAt5VcY3WXfkpnXYvLVn1gZxccMvBk8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795550400;
	bh=fazQuPC7Xzm6QM2js/1OQ+vIaUZftvf6IY4pFOa7gCY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n81ofzop7UE0/pSvoX2W5SW4qNHdfYDxxQnobJ/wYIzGFwXjTkKBQm7/w8QEyswFu
	 9HC0fsKC991SH6SV7SfvvnDwksbfSDvArVSekZue3/ElYL8+uOCZmXwbdGnyrXckWp
	 bdVoiHJyCFlYpZ3zWIM0/BKcdhQXHb1fdr6t06a+N3Bo3w58yhwuCX3RScteRU6fqA
	 9clhex/mHZTHSgPzTIHqjpZrAIgXsvAXf8m8geHubwHB5sNMgQ21NRhRxAXdkWt4Z3
	 lE0fvN01jxo2JHF8fZoPVuKB/aI4NMUsM8hnV8OCt6PKnjsen8CxNM2SvNGzfP9zED
	 ikP8TFJCvTWmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A594B60699;
	Tue, 24 Nov 2026 20:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79DBE10B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD0840573
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjZ9iPAnLR53 for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 19:59:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5581C40572
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5581C40572
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:59:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C632C7803A2;
 Tue, 24 Nov 2026 20:59:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 20:59:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 20:59:48 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Gregory Dymarek <gregd72002@gmail.com>, Joseph
 Kogut <joseph.kogut@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <85f2856a44d51d39836c38b1b475affd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1 01/11] package/at-spi2-core: bump to
 version 2.62.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On 23/11/2026 10:53, Thomas Devoogdt wrote:
> Release notes:
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.62.1/NEWS
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/at-spi2-core/at-spi2-core.hash | 4 ++--
>  package/at-spi2-core/at-spi2-core.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/at-spi2-core/at-spi2-core.hash 
> b/package/at-spi2-core/at-spi2-core.hash
> index 4257ba03a7f..5704d0d8783 100644
> --- a/package/at-spi2-core/at-spi2-core.hash
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
> -sha256  
> e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  
> at-spi2-core-2.50.0.tar.xz
> +# From 
> https://download.gnome.org/sources/at-spi2-core/2.62/at-spi2-core-2.62.1.sha256sum
> +sha256  
> cca6b6a86e4389d89b370288761ce2385ddeceb10c4412da78689bc30c88af2d  
> at-spi2-core-2.62.1.tar.xz
> 
>  # locally calculated
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/at-spi2-core/at-spi2-core.mk 
> b/package/at-spi2-core/at-spi2-core.mk
> index 828280de1ad..a1e17a6e5f5 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -AT_SPI2_CORE_VERSION_MAJOR = 2.50
> -AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> +AT_SPI2_CORE_VERSION_MAJOR = 2.62
> +AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1

This patch series does not apply cleanly, because Buildroot is at
at-spi2-core version 2.58.2. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/2feaeed29e0ed0f522898a5943d977e18bfa6b53

Could you rebase on branch next and send a v2, please?

>  AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
>  AT_SPI2_CORE_SITE = 
> https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
>  AT_SPI2_CORE_LICENSE = LGPL-2.1+
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
