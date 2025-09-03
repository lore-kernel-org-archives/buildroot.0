Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C8ECA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B1541FB0;
	Wed,  3 Sep 2025 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-JVP7piv-fQ; Wed,  3 Sep 2025 19:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FC741F85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9FC741F85;
	Wed,  3 Sep 2025 19:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4357C439
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3536B61673
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fTDsZD3EuBi for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 19:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3822761666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3822761666
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3822761666
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:34:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 931F74E40BFE
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:34:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 564C2606C3;
 Wed,  3 Sep 2025 19:34:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 323FA1C22CC97; 
 Wed,  3 Sep 2025 21:34:29 +0200 (CEST)
Date: Wed, 3 Sep 2025 21:34:28 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20250903213428.5740c712@windsurf>
In-Reply-To: <20250903133754.1781943-2-buildroot@heine.tech>
References: <20250903133754.1781943-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756928071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Q6crrItI7LWcvePONiFGL6yVwcpSIaJrdry4Qe+ilBg=;
 b=AMzZuttucn9R0YMz1L0Nvcj44llmHHUmojf0J+gjxKv7IEFz9hayj2c6pY0NPsf4rVPdg+
 plKlK+232CyWj+uIM+WJgTanMPAuV7GMoJoIEr55rY+SxHsufn6AztcYRvFXs/m8R7y6su
 Fc9Mz9V3wwZXHeaB2xaYK3TFHtoI6XaQo+2bBjZtdZmKt//xG2ugBUU2aZEko08oKqPYDZ
 XROF/lY/D6EhXuoGa7ywSOiTqj3QGTcGhvWJAWZh/4UL4Lp644qUTaj1oMZp4Rvzevam2u
 0mZXtGRMdG9v3H0yPWHzxDXbyPIooZU6nYaS9p9QJU3WqO+Cd/+l2/utXHHkxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AMzZuttu
Subject: Re: [Buildroot] [PATCH] package/boost: remove dependencies on
 Boost.System
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Wed,  3 Sep 2025 15:37:52 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Boost.System is a header only library since Boost 1.69.0 [0].
> 
> A Stub Library remained for backward compatibility. This
> mainly affects CMake Packages that use FindPackage and
> explicitly list 'system'.
> 
> For Boost internal modules this is not the case so remove this
> dependency.
> 
> Buildroot packages should select BR2_PACKAGE_BOOST_SYSTEM explicitly
> if needed and not rely on a proxy dependency from other boost packages.
> 
> [0] https://github.com/boostorg/system/blob/develop/doc/system/changes.adoc#changes-in-boost-169

Thanks for the patch. It's great to have someone understanding the
dependencies between the different Boost modules, because they are not
obvious, and not easy to maintain, so thanks a lot.

Since this has the potential for breaking stuff quite a bit for
packages that depend on Boost, how much testing did you do (build
testing) ? I see your patch fixes package/libcpprestsdk, but is it the
only package affected?

Note that the fix of package/libcpprestsdk and other packages could be
done as a separate, preliminary patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
