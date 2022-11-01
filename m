Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFECC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178428175B;
	Tue,  1 Nov 2022 20:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178428175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnFGy5f7Z6gl; Tue,  1 Nov 2022 20:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6808149C;
	Tue,  1 Nov 2022 20:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6808149C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD36D1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5EC68148A
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EC68148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYI7fmcIwc_R for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:26:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD0581402
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AD0581402
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:26:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17964240002;
 Tue,  1 Nov 2022 20:26:14 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:26:13 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221101212613.55deeba7@windsurf>
In-Reply-To: <20221101060321.1488881-1-francois.perrad@gadz.org>
References: <20221101060321.1488881-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SE8HLOmTf1/tlQVQkYK6/VwaApN2KOlkzqXx+BedxA4=;
 b=pZ56pvYEhE9oXc2EV9ZX/7R8d5LGicSl9auWmvMNJt3A5eunQpw50kI+PEjHOcjB0dxlPE
 12Jw8vWkIY2hgs2j4wEOJxFDIKS1+gNmWlxBNPNYcZq5+1crKRgS+Txy/heWQB+ZZClZhJ
 1QZD3GqCQctag7e2Y0ICJlw8q2i82i7IFholAXzbWdNtXPDpwTlaBwEZXN+ViV65WrzhTO
 G9r7RQ620hSWmB4gAg4RbCSbkXMzKVwcrv4dgdF8zFHQQK+kjzYMUOUVLYo50QdAYQPhGE
 nfm9cKOjQ+mWbF/jcb2USmd36C4bNNQBTDCt2CBkPCKEn3z1JGdfTzWeJeDzKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pZ56pvYE
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.6.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 07:03:21 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
>  package/libressl/libressl.hash                              | 2 +-
>  package/libressl/libressl.mk                                | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
