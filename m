Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32BC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5394090D;
	Thu, 12 Jun 2025 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkZBiJavYmkE; Thu, 12 Jun 2025 20:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3339408AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3339408AA;
	Thu, 12 Jun 2025 20:02:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D214183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 736B660DE6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQmcwR3dzcRZ for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:02:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA74160E12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA74160E12
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA74160E12
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:02:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E3281C0E09; Thu, 12 Jun 2025 22:02:01 +0200 (CEST)
Message-ID: <05b691a1-b625-4d4f-addd-94560d25c850@rnout.be>
Date: Thu, 12 Jun 2025 22:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20250522134809.169692-1-heiko.thiery@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250522134809.169692-1-heiko.thiery@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758521; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n56QWns6zKjd7gEkrKcTH5OfyoMqlnmEWLfXzod9siw=;
 b=FgR8dR9y0Ggi9fXfwm7HghscKnHNwtcmAdT9dJQCjWVKDs1qAZaVLM9gaXQPKgZuSmoXbN
 TU7vYPJa6zijUvH1GMeSHM9FoXfd7Y/UdHjkLt+5Xl11fvnI6lpuhdapO5hC4IRGn5MsOc
 tYnSsjN1gntCRNnvrxeqt7j21Reb/vTXDFWmTTJUZuiHWagGfMbv4iMNa1xdrTNaaRXP27
 +I34vF+j6vIFnfz16MjKMNR/2roRmYMK/rVj+zFgJzMKTkpRfh36eR119COlCi92kAOSUs
 U3Fytzauk2sDuNfff/GiazAfe59W81LacZHT00Q+3fuTiwZg9wMJgfgieYhpmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FgR8dR9y
Subject: Re: [Buildroot] [PATCH] package/kmsxx: fix meson build directory
 for extra tools
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2025 15:48, Heiko Thiery wrote:
> Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build directory")
> changed the build directory for meson packages to 'buildroot-build'.
> Thus accessing the build directory for installing the extra utils needs
> to be adopted to this directory. Otherwise the install will fail when
> BR2_PACKAGE_KMSXX_INSTALL_TESTS is enabled.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/kmsxx/kmsxx.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index 8ebdffaad1..f65cc668d4 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -30,7 +30,7 @@ KMSXX_EXTRA_UTILS += kmstouch
>   endif
>   define KMSXX_INSTALL_EXTRA_UTILS
>   	$(foreach t,$(KMSXX_EXTRA_UTILS),\
> -		$(INSTALL) -D -m 0755 $(@D)/build/utils/$(t) \
> +		$(INSTALL) -D -m 0755 $(@D)/buildroot-build/utils/$(t) \
>   			$(TARGET_DIR)/usr/bin/$(t)
>   	)
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
