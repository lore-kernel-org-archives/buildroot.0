Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27205CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 17:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90904012A;
	Mon,  2 Sep 2024 17:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70F6gsbEktyq; Mon,  2 Sep 2024 17:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DF7340142
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DF7340142;
	Mon,  2 Sep 2024 17:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7D91BF37E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 17:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C8D660739
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxSuC665m_W7 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 17:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21141606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21141606E7
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21141606E7
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 17:47:22 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f409c87b07so56297951fa.0
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299241; x=1725904041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSsQ9CDXA8ep44NAv2rsAhZYmwKbhy0wvVJNvcz7ukQ=;
 b=P+4D52evkPST3cbKP7PoEpDkVefVHznI6W0aCzskSDB4c8aI9T2+Bv4WwrlBg31jj+
 Xwpbhe707g9am29oA41rLQ/RyrEhQbMq0IgEWpCRYQBqWuda+8gVgKZpoiGjs4BV9zdV
 ARUFkcplpExjxgDPIXJA9Hl4X/Q/0U+1J79SckMrMgcP4u/YRZl1s1vCzyCHjaBj14tX
 klir90UWBf0mQAz2PhNX/YpNYNWZYGP1zF8OOH1oThC9c2X+Svu0AKoi1LtpkgQFXAGd
 u30rGYsO7z78EA1Uh7R2OQaqb5wsoIneiFb8bMwRxzYep1BxWW3wMxQ+nw5Kc4VWw8os
 lAAw==
X-Gm-Message-State: AOJu0YxXWGyv+ri1BqpkW6UxIxaPhTTSZ1DRMZ66aMbpxVhHoa8UCVD2
 DlkHaLQtpcRx+aafEVflV1NjVCKuo9kwb1QbDKMJdqlJ/efUtUq2
X-Google-Smtp-Source: AGHT+IHppQk9ryKGb3KrlCzHMBwq7xRDrUZ00x/sKZyTtIhWrC2Xw+fovDu4Yopzzj18NayBhTlaTQ==
X-Received: by 2002:a2e:a544:0:b0:2ef:2b06:e554 with SMTP id
 38308e7fff4ca-2f626565176mr65216471fa.15.1725299240186; 
 Mon, 02 Sep 2024 10:47:20 -0700 (PDT)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f61517190dsm18999811fa.78.2024.09.02.10.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:47:19 -0700 (PDT)
Date: Mon, 2 Sep 2024 20:47:17 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Lars Wikman <lars@underjord.io>
Message-ID: <ZtX6JflghSYtxST2@curiosity>
References: <20240902074527.2908996-1-lars@underjord.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902074527.2908996-1-lars@underjord.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725299241; x=1725904041; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QSsQ9CDXA8ep44NAv2rsAhZYmwKbhy0wvVJNvcz7ukQ=;
 b=ZsqOKrZ92AHF8NxHvh7aLN6jsmx54QtieWqka0SY9mPeZR7/vXspVwq93MX76TB47D
 aucNSiIDK3QaLeN8uLSiiXS+2rEEir35gsJZFGJnCWr1WnjtYroApk4oL1CWtr67Qsxs
 6sq3OjUI6ifiZuvHD0vzy2dhBiB9ZgS87mmSHvEFuOz3YaLtMihBUkCT3E5rNFen17yp
 yR3fGlE4Dn9n0uduLNWW8OivL/ipx1H1CwJ52nvwzZs2z7vb95XX1etDRwKoj/GoOVsE
 PrbwjIC4qz3BP5eeA8sLvrPseKnUE06flGpoUfUCTP7z+e/CK02aZS1xFSxBuSN1xOkQ
 cgew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZsqOKrZ9
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: add OpenSSL
 engine option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Lars,

On Mon, Sep 02, 2024 at 09:45:27AM +0200, Lars Wikman wrote:
> CONFIG_SMARTCARD was unconditionally disabled which has meant that
> even if OpenSSL is compiled with engine support and the supplicant
> is configured to use an engine it would warn that it was compiled
> without engine support.
> 
> This mechanism is used to enable the more secure forms of 802.1x
> networking authentication such as EAP-TLS with hardware-delegated
> cryptography and private keys protected in hardware.
> 
> It is still disabled by default in case there was an original reason.
> 
> Enabling the option will allow delegating private key access to TPM2,
> ARM TrustZone and other specialized secure hardware for establishing
> a network connection.
> 
> Signed-off-by: Lars Wikman <lars@underjord.io>
> ---
>  package/wpa_supplicant/Config.in         | 6 ++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 7 +++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 92953f69f0..5ed5828bb1 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
>  	help
>  	  Add introspection support for the DBus control interface.
>  
> +config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL_ENGINE
> +	bool "OpenSSL engine support"
> +	help
> +	  Enable the smart card support which enables OpenSSL engines
> +	  using PKCS11 and 802.1x
> +
>  endif

IIUC this option is used to enable smartcard support in wpa_supplicant,
not to select TLS engine. So suggested name looks a bit confusing in
this context. Maybe just 'BR2_PACKAGE_WPA_SUPPLICANT_SMART_CARD' or
something like that ?

Buildroot allows to use two TLS engines in wpa_supplicant: OpenSSL and
internal experimental TLSv1 implementation. Does smartcard support in
wpa_supplicant requires OpenSSL ? If so, then it should be explicitly
selected, e.g. see WPA3 or MESH_NETWORKING options in Config.in.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
