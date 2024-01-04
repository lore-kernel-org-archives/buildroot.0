Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01DBC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9799461AE9;
	Thu,  4 Jan 2024 21:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9799461AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBePb9lv74R9; Thu,  4 Jan 2024 21:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D586F4D2;
	Thu,  4 Jan 2024 21:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D586F4D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1772D1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB6243825
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB6243825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTlnLDDArhhh for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:31:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F8C5400D6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8C5400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE8AF240003;
 Thu,  4 Jan 2024 21:31:07 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:31:07 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104223107.472ad7b9@windsurf>
In-Reply-To: <20240103192311.909037-1-fontaine.fabrice@gmail.com>
References: <20240103192311.909037-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhN+RDOYnMizEJ/SP1Z3ymqWziF9k6MIXU0reMukMhk=;
 b=PCIDyBzcrzPxDZo+hGfsgy0qlRW23NoQB/F9wUcliH6AeqjAuzkbK5CnpVRcWGiK32sPC3
 NcAdERtm5q75ysMZMe1Bbub7kXQLUFXgXUFmNdBSZh4Evi2rooV8iZqUmBU7/T80DtDUtq
 sTbnBTp2wolFiiD6JZHEPT7PjYAfT4YX8FSCmLYeX3MKlZsGlEZL9yrTOryPEBb26ZfbTq
 ptIpA1J2f2zHEVE96es1Amrm5sRNOstNWeKAFrZDhJRCpe8TWb0IdmtKFgx0BaNkXx1PHw
 WWpcF/aN73LKvU0kmmbhRu6ceZAdYbQadOLRWhyt0uxJEWx5dQ3r9J625FrFRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PCIDyBzc
Subject: Re: [Buildroot] [PATCH 1/1] package/stress: bump to version 1.0.7
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

On Wed,  3 Jan 2024 20:23:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use official tarball and so drop autoreconf
> 
> https://github.com/resurrecting-open-source-projects/stress/blob/1.0.7/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stress/stress.hash | 2 +-
>  package/stress/stress.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
