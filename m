Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234A7C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B612F417A7;
	Sun, 12 Mar 2023 22:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B612F417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zBlbqtUJRwx; Sun, 12 Mar 2023 22:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C74416D7;
	Sun, 12 Mar 2023 22:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1C74416D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703DA1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A64560D51
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A64560D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1o6JsOBMP7m for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:14:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3233160BFE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3233160BFE
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:14:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99B32240003;
 Sun, 12 Mar 2023 22:14:42 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:14:41 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312231441.4b237595@windsurf>
In-Reply-To: <20230312215945.168367-1-ju.o@free.fr>
References: <20230301220159.161476-2-ju.o@free.fr>
 <20230312215945.168367-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+sqxypTlOy/NQeKTmorFWtJTwqmnWAV3oRpBzdSUI0=;
 b=ISind2lb06A61suLR5XNSpkTYePTcNlxl7ngMvKyhkrZeg3lQDx1wkehODNap1EftKBFJ0
 fa5SDbq+2w9yA/I8kVgt5wiB0UbXp0Eafmjg9oq/In1ULBdyrfMtIuT2OTB0TLOxgI0BwN
 KrazZ+vdAJNQEVtHU/oXfYKPIS6jjd0LN2lDKWRbpKTGrkLV7ckr8ml7f4BBJ4CAQorVWK
 Ir9sCTStZDfxzH75T3gahiZQ0e2e4ozg0jIshtwZH0uU5y7cBv1ejphjCwLhQxTWFsriel
 l1zIKrf4vhFecpSgHpdA3BasTMxgXm5tti1kY3P0t3m7ZaFVbkxUToEb88rU9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ISind2lb
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kexec: add
 KEXEC_CPE_ID_{PRODUCT, VENDOR}
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 Mar 2023 22:59:45 +0100
Julien Olivain <ju.o@free.fr> wrote:

> cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier
> for this package:
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akexec-tools_project%3Akexec-tools
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Add the missing "KEXEC_CPE_ID_PRODUCT = kexec-tools"
>   as reported by Thomas.
> ---
>  package/kexec/kexec.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
