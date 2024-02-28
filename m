Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CFDC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DBDA41633;
	Wed, 28 Feb 2024 21:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5van_nBrv-V7; Wed, 28 Feb 2024 21:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68EB41697
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68EB41697;
	Wed, 28 Feb 2024 21:23:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBD71BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 296E04161C
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_Hwf3_AXcef for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 256E041554
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256E041554
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 256E041554
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:22:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B59660003;
 Wed, 28 Feb 2024 21:22:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfRNK-0031Mo-2P;
 Wed, 28 Feb 2024 22:22:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240203184637.168548-1-fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2024 22:22:02 +0100
In-Reply-To: <20240203184637.168548-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Feb 2024 19:46:37 +0100")
Message-ID: <874jdsjnd1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: update
 PYTHON_AIOHTTP_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:aiohttp_project:aiohttp has been deprecated in favor of
 > cpe:2.3:a:aiohttp:aiohttp in November 2023:

 >   <cpe-item name="cpe:/a:aiohttp_project:aiohttp:3.8.0:beta0" deprecated="true" deprecation_date="2023-11-22T17:09:16.157Z">
 >     <title xml:lang="en-US">Aiohttp Project Aiohttp 3.8.0 Beta 0</title>
 >       <reference href="https://github.com/aio-libs/aiohttp/releases">Change Log</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:aiohttp_project:aiohttp:3.8.0:beta0:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:aiohttp:aiohttp:3.8.0:beta0:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
