Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A2CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC5060F7E;
	Sun, 31 May 2026 06:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWWWaUgh-fNP; Sun, 31 May 2026 06:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E0060F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780207788;
	bh=BO4O1w8ANvJ7mCsxM+KjPkHvVxeretH6Y0y7whYr6BE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cYEbT7yn36WGKEvbvAQRlWW9iPdvQLR9r8uRxZ7rU/HSopjoNO5J+1YxQh6rc4NZB
	 8Rgd0mI5pogjMZ+bkJMI+nYQFD/inBBwArct2pWHrjAx+TP3ZKsadte60ayuAZRJeL
	 akdbtCRZazjv+zPtrMmloKiu1a0u7ex5uEZmj5ZTMXZafJ7nk9WKe30W17WqeV35ma
	 5gm6ylH22ctg3G9G4s/sPbs5/0UfdteSXVVZtGd2XlGEwIDjyEvIzlFQX3t2+S9tJb
	 vXgn6DhgVwEY06WxdmnSr4bjawUBHPEChu+Aeo5iwRL0kBuVpVKuvfGtqDcGp9QQ1G
	 tt8qq9zfWGLJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E0060F7D;
	Sun, 31 May 2026 06:09:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF81257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01EBC403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lQroLDhxaoy for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10918402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10918402BC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10918402BC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:09:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 018051A3764
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:09:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B407D604EC;
 Sun, 31 May 2026 06:09:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D394110888CC7; 
 Sun, 31 May 2026 08:09:43 +0200 (CEST)
Date: Sun, 31 May 2026 08:09:43 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahvQc8ZxTUgP4HvY@windsurf>
References: <20260311092713.17598-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311092713.17598-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780207784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=PbCBO8uKJa9/8n2aAAtMNHsoyXCB9cngQhP4ffoMLnE=;
 b=Za6eb/tcxu4N7BcenWak1Jw99q5UOoJwDG5D7nXe5O4lUdtlm889vK+AOiD3Q1+AaYSQef
 JBJxGdrbkZiwsjiL3bAyL1kljNKSG+DBc0ubPh4qeBglGlCKQWHVO5B4L8y7gN/pptv5Ri
 A7g8I9XpClg20I0loOTPW1nMLLH+7YbjIpfTLnROUvuTNIJi0h9EMyRGTPB5Hq2xk5872t
 epbnrXs70svJgd1H42hLJlk99b3F25jFk6Xuly2mJY8rysgsuwvQcHgu+bXjcAeyAEA31H
 /5uTJYN0iCIjrxHUuBtzgDYh2siKsmlOyiAO4cBd8WHb8QzGqqfGY43rJEh1jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Za6eb/tc
Subject: Re: [Buildroot] [PATCH v4] package/which: fix getopt prototype for
 GCC 15
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

On Wed, Mar 11, 2026 at 02:57:13PM +0530, Shubham Chakraborty wrote:
> Older C standards allowed empty parentheses in function declarations,
> but GCC 15 enforces C23 semantics where extern int getopt() is
> equivalent to extern int getopt(void), which conflicts with the
> typed prototype provided by system headers (e.g. musl's unistd.h).
> 
> Fix by providing the full prototype in the non-GNU fallback branch,
> matching the standard getopt() signature.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Which configuration fails to build? We have no failures in our
autobuilders, and I could not reproduce.

> ---
>  ...hich-fix-getopt-prototype-for-GCC-15.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch
> 
> diff --git a/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch b/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch
> new file mode 100644
> index 0000000000..afae321ce7
> --- /dev/null
> +++ b/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch
> @@ -0,0 +1,34 @@
> +From f1d07e5630628a7d218936b3ac3292daf6a7ba77 Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Mon, 9 Mar 2026 21:43:58 +0530
> +Subject: [PATCH] package/which: fix getopt prototype for GCC 15
> +
> +Older C standards allowed empty parentheses in function declarations,
> +but GCC 15 enforces C23 semantics where extern int getopt() is
> +equivalent to extern int getopt(void), which conflicts with the
> +typed prototype provided by system headers (e.g. musl's unistd.h).
> +
> +Fix by providing the full prototype in the non-GNU fallback branch,
> +matching the standard getopt() signature.
> +
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

We only accept patches that are submitted upstream and therefore carry
and Upstream: tag pointing to the upstream submission.

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
