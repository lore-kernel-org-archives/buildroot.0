Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC6CEFD10
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D6114092B;
	Tue,  6 Jan 2026 21:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEBh5ytsRxsd; Tue,  6 Jan 2026 21:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017A740901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767733938;
	bh=HK8d9fdGBpxxNeIqUqV8vEaDDht6za1TUrgErfmOfzg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lioPDl0y5Bq3ZPPQu1jNzhosdAhBeODW8txjQO0klHzdn7pUIbKIDjwf2G0Lug//A
	 BkCbFPgIVcqnpQ9gRjIY8f+9eQwnXOBXCtMC27xfCnxGBnzgNAFjmyPJE3wH+MLECZ
	 RAmVBGfPlPUc8VEbowZCvebVy2YIj8BYhsb6CYX6w0iOmPYqVY8Ljx6kK4fzv9w64P
	 rikpldHuI6OQU0TPJCOYO8rX49kgbmihh7f/qpgbID/6nBUBL1Yi4LmQD4WawwUcuV
	 /6N5D6zrnsRoNvjjDx5nCg5yyfmRX5l8et4Aps0QOEf6EwCDa6M5JE6K5zGDfCnY/L
	 PoxrMALoFCdaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017A740901;
	Tue,  6 Jan 2026 21:12:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 934B170B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8613C40901
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DguR_WUsk5ez for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB647408FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB647408FF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB647408FF
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:12:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4F92F1A26A5
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:12:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1BF6D60739;
 Tue,  6 Jan 2026 21:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1380E103C85F8; Tue,  6 Jan 2026 22:12:11 +0100 (CET)
Date: Tue, 6 Jan 2026 22:12:10 +0100
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20260106221210.206df8d0@windsurf>
In-Reply-To: <20250805000352.4062434-2-Mr.Bossman075@gmail.com>
References: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
 <20250805000352.4062434-2-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767733932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ehm3QJcUC70e5xoit/iIsx1Bf/P/VCYVU15BzF3kun0=;
 b=K7s1QKOhRNKQVtLcZ8d+syL/7RKWrbRPeuuWZ+0n+kx8RwbJ3qMW8xzeFpXWRKCFWMKvxE
 XOCuDprDr5mtBgjR45fPmarkidomtrOR/5YNYMySeYlWyMKC9Jw3jM/L75deou8Nse130w
 wkM2oztRALvBxzPWHW/7TK8A3dL+0LS55qsGW7Yhe8hvb+L9dElaju/4CK7mlwT8wnnGFH
 Be/ZLEuXbDbcBNuqsmrLXsAQMrE1cGeUES5jWCcGLa6k5FANUvjh1/FZy9VhUwkNqQymN0
 NC5Gn88lmKj0bR4eJm09rQZTLJqzDVKxW5pnj0kz1rzMdZKtEtpYnJMpI3DdbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=K7s1QKOh
Subject: Re: [Buildroot] [PATCH 2/2] package/pico-sdk: Clone submodules for
 picotool
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

On Mon,  4 Aug 2025 20:03:52 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> picotool needs mbedtls for --hash --sign and --offset.
> Clone submodules in pico-sdk to provide the nessasaary files for

                                              ^^^^^^^^^^ typo

> picotool to build and link mbedtls and other optional libraries.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

But then does that mean that your PATCH 1/2, without PATCH 2/2, breaks
the build of picotool?

If that's the case, then you should do this change to use submodules
directly in PATCH 1/2, as part of the bump, so that the build works
between every patch we apply.


> -PICO_SDK_VERSION = 2.1.1
> -PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
> +PICO_SDK_VERSION = refs/tags/2.1.1

Just "2.1.1" should be fine here

> +PICO_SDK_SITE = https://git@github.com/raspberrypi/pico-sdk.git

Should be just https://github.com/raspberrypi/pico-sdk.git

Has anyone reported to upstream that their release tarball should
contain the submodules?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
