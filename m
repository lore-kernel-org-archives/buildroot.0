Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69421C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163FA60E3C;
	Fri, 16 May 2025 10:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6YcLIKyobFs; Fri, 16 May 2025 10:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B3360AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B3360AF3;
	Fri, 16 May 2025 10:46:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E71341AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD74982BA1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIbTh_j8ATB4 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9F3B82A28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F3B82A28
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9F3B82A28
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:45:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5869F1C10FA; Fri, 16 May 2025 12:45:55 +0200 (CEST)
Message-ID: <5df525da-5f69-4b6c-b5ae-9b00c49a0e53@rnout.be>
Date: Fri, 16 May 2025 12:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250430080623.2391295-1-christian@klarinett.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430080623.2391295-1-christian@klarinett.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yV4jtd1JdUflN3b9JUcdaJBVWZ1GtiVl/MD782cs/og=;
 b=bHYnz5JiNjHbZc+nGso/CdTz3MBVUn4H7rhj1Z5GV3uVnkmt+HFmAG5Vi019ceRORxw1pQ
 gXmplss5YhRTB//1rIfQa8BMhtJSjT40yTcpWGLU9q9LfN/w6ybMb86EjhoRn051Uy8HyD
 BXCflxj0vPi+Tznt0iJ6cNiqhPFhangWx39I2Dc5KfTihuovMWXany52IphaajikA5sfEp
 iq4naw1VJCE5sXamw6eSuUIvg0ubiDhDQyTgjDDegyr85XtbeuVXaeZJGaLWpBnHFUrAQr
 5Qr91Czglp91dm46dQzysKhGiNxQdeJwcHQe7wb82L2YkiIZME9nZDNutCfZvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bHYnz5Ji
Subject: Re: [Buildroot] [PATCH] package/libxml2: security bump to version
 2.13.8
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



On 30/04/2025 10:06, Christian Hitz via buildroot wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Fixes the following security vulnerabilities:
> 
> [CVE-2025-32414] Buffer overflow when parsing text streams with Python API
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/889
> 
> [CVE-2025-32415] Heap-based Buffer Overflow in xmlSchemaIDCFillNodeTables
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/890
> 
> https://www.openwall.com/lists/oss-security/2025/04/17/3
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libxml2/libxml2.hash | 4 ++--
>   package/libxml2/libxml2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 88c7f5b9ff..3f53b51b33 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.6.sha256sum
> -sha256  f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96  libxml2-2.13.6.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.8.sha256sum
> +sha256  277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a  libxml2-2.13.8.tar.xz
>   # License files, locally calculated
>   sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 148fcd8762..789c6a297e 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBXML2_VERSION_MAJOR = 2.13
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).8
>   LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>   LIBXML2_SITE = \
>   	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
