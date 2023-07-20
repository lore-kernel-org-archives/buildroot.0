Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1408AC0015E
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED0160A69;
	Thu, 20 Jul 2023 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED0160A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGvKvI4EN2Ep; Thu, 20 Jul 2023 21:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0ECE61289;
	Thu, 20 Jul 2023 21:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0ECE61289
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92C631BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF27404FE
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF27404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTF7Lq1Wr8Fv for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:29:20 +0000 (UTC)
X-Greylist: delayed 447 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Jul 2023 21:29:20 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BD44049D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60BD44049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:29:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 911B9240005;
 Thu, 20 Jul 2023 21:29:18 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:29:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720232917.4a865fbd@windsurf>
In-Reply-To: <20230719201005.1641739-1-bernd@kuhls.net>
References: <20230719201005.1641739-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeWPbWordyjlcG9JiT+3kJ+kHhSey5a8okn89UjO/9o=;
 b=GAVhF0FqbZhT/km2nmDc9+LeCE12SQkBdBIc47Vr8M0eukKIiv3dhMTRqr6oqOk7DIHPkJ
 CqM025AkqI6KEjE22FUKS6Nl0D1U8krboweKi/VggB396L7GW+MJF5Pc2+B2dQdPLOusOf
 gWe0nay/DWGkmEqp2SbdpQitXj4sOhUCmJtv7eDh7Lc/7Xqx2kMW07iUNMvOCRdlvIWECI
 5v5fBwTHiq4y6aytDQ79FsUifiZb1P0Xa47/hGpGpV+DwU5a+9I4zfooAynsSptnkoIDQz
 qqPN0pPJPUXSwZVoRyyFLoT1AyQX3d58J3HXAzq0SXgAYaMNmBsdxFjcXnHT9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAVhF0Fq
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.18.5
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

On Wed, 19 Jul 2023 22:10:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.18.5.html
> 
> Fixes the following CVEs:
> 
> o CVE-2022-2127:
> When winbind is used for NTLM authentication, a maliciously
> crafted request can trigger an out-of-bounds read in winbind
> and possibly crash it.
> https://www.samba.org/samba/security/CVE-2022-2127.html
> 
> o CVE-2023-3347:
> SMB2 packet signing is not enforced if an admin configured
> "server signing = required" or for SMB2 connections to Domain
> Controllers where SMB2 packet signing is mandatory.
> https://www.samba.org/samba/security/CVE-2023-3347.html
> 
> o CVE-2023-34966:
> An infinite loop bug in Samba's mdssvc RPC service for
> Spotlight can be triggered by an unauthenticated attacker by
> issuing a malformed RPC request.
> https://www.samba.org/samba/security/CVE-2023-34966.html
> 
> o CVE-2023-34967:
> Missing type validation in Samba's mdssvc RPC service for
> Spotlight can be used by an unauthenticated attacker to
> trigger a process crash in a shared RPC mdssvc worker process.
> https://www.samba.org/samba/security/CVE-2023-34967.html
> 
> o CVE-2023-34968:
> As part of the Spotlight protocol Samba discloses the server-
> side absolute path of shares and files and directories in
> search results.
> https://www.samba.org/samba/security/CVE-2023-34968.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
