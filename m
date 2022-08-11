Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4239C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4354040217;
	Thu, 11 Aug 2022 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4354040217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNt81i_8lUxA; Thu, 11 Aug 2022 20:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC5D4013D;
	Thu, 11 Aug 2022 20:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC5D4013D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF2461BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 956FA41822
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956FA41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7C2l8xUBy0i for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:25:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170C041820
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 170C041820
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:25:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 049B760002;
 Thu, 11 Aug 2022 20:25:13 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:25:13 +0200
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20220811222513.7ef2b670@windsurf>
In-Reply-To: <20220811185448.1122716-1-titouanchristophe@gmail.com>
References: <20220811185448.1122716-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXq9PWHFbANvVX2j9df1io/3nxQzBmq5wygQVw0CZjQ=;
 b=ovU2N3x8x3RSJlf1gCjoHyCUB3ca2PqAh96n2RjW4aRW5DhtMXL2GL9ZWeqMAQL71vVfBE
 lMTT/1xQH1VVrKfvSHXGlybcEJ912r8olvGfYzWJOB3hFBsii7A4A19M6beAFmLr9NNkSx
 JRApH//vk1eysvRyeibdqkWHu1qZBBtio97nuBLF4C+UheN/oSpwkVcXuhpozqIT4VQrAu
 LHuPesyfhONuTSH64b/XJi1jIIF5yEiTP6+jS8yTDijL/PzkVCXK2Z9q8BZdap+ehL9XJS
 TnCscDPZ3rk/3boDLjmzQira5H3jNuq1qhEmh95j9jgyby47YK91Wj2i7egkJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ovU2N3x8
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Aug 2022 20:54:48 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> 
> ================================================================================
> Redis 7.0.4 Released Monday Jul 18 12:00:00 IST 2022
> ================================================================================
> 
> Upgrade urgency: SECURITY, contains fixes to security issues.
> 
> Security Fixes:
> * (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
>   key in a specific state may result with heap overflow, and potentially
>   remote code execution. The problem affects Redis versions 7.0.0 or newer.
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
