Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBA5C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 411584018B;
	Sat, 25 Feb 2023 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411584018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1OLNgnP_XpX; Sat, 25 Feb 2023 21:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7808E40156;
	Sat, 25 Feb 2023 21:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7808E40156
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7FC1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408BB415F6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408BB415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6g56aZUTC5CE for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E284156E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E284156E
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF02B240003;
 Sat, 25 Feb 2023 21:02:22 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:21 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220221.47b9f651@windsurf>
In-Reply-To: <20230225105715.1265130-1-fontaine.fabrice@gmail.com>
References: <20230225105715.1265130-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOqQaLtjAAlxy7Sl75OozR/dLC9YJyEe6qpm2AWYcGg=;
 b=Y1AAmTEdk+6W1ecsxm951sgxGa20HECgFNFd9u+6tK052kvUWqK1EqM3RJRuTfyocYdxKu
 6C965RuhO8AQD38okQvtCCZRuWJLFK+p12zBYyrbsx9GpVyNM7+cbLdZoFUfBmtRhYKo4k
 bcHhmzLtYCkS7+bwQjKeXR39KwDZjiNAJ+lxe+caEy1gYHzmYj79lPmu+5I4LDGF1PZWqe
 LgRX62rMjJ97CUb2cfItKwuGxU2dOXfrS2UDFxkjQszYQXjydid5CYTQo6Dt1ME3eHnDGa
 /tf089HL1EBNOC3WAD3AS220jqtD3XnAiIGPmebHSBCZbhBklq6zQPU4ZI06Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y1AAmTEd
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix second patch
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Feb 2023 11:57:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix patch added by commit 7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd:
> 
> 0x300000fL -> 0x3050000fL
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zabbix/0002-fix-build-with-libressl-3.5.0.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
