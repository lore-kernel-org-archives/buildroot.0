Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7AFC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED5D60D65;
	Mon,  1 Jan 2024 20:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED5D60D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0ZNweL7CIMu; Mon,  1 Jan 2024 20:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E8460D5F;
	Mon,  1 Jan 2024 20:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E8460D5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DBB11BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 757AB405AE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 757AB405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-T_PQ9lOie7 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:11:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9D31405AA
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D31405AA
Received: by mail.gandi.net (Postfix) with ESMTPSA id A46C7C0002;
 Mon,  1 Jan 2024 20:11:09 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:11:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101211109.7cabb4b1@windsurf>
In-Reply-To: <20231228172031.29164-1-fontaine.fabrice@gmail.com>
References: <20231228172031.29164-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704139869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPHCKmX5dUPRnQYSJi0YxyM8Y7w2+oO7k2Cv2iJSHCM=;
 b=Clxjg4gKx0ljBFBvfcTsFmpMC9EzIgSzxQ8NxCDqWK/szFU+dMZilMmeowq3djjrJoJORz
 BF695zDD8KuoQbLg42ikwYuqKI+Z6tCo/zgEQSCGcfoQ6x4fPEh4RiROVrPAaDcu65kSTs
 z3Bhr6zrMyBDmAV2sbTKxl/zVij+LJLPypVRWgEwJfq748bzO2pT0IcfSetiHiLkeN0vVl
 9vsWCfRuW9zGcPxhvG2Lm6inYOxGxCc2ch12U4YC13OiksiBnZNvioAsJHMPlZtdhMzc6M
 1rGfsbCcedBKS6hYnMCu+oxnlxdfiQiKNLJQL4ofngGq6NqWU1GWUcLyMEQlLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Clxjg4gK
Subject: Re: [Buildroot] [PATCH 1/1] package/libxmlpp: fix build with
 libxml2 >= 2.12
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

On Thu, 28 Dec 2023 18:20:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of libxml2 to version
> 2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:
> 
> ../libxml++/nodes/entityreference.cc: In member function 'xmlpp::ustring xmlpp::EntityReference::get_resolved_text() const':
> ../libxml++/nodes/entityreference.cc:30:35: error: invalid use of incomplete type 'struct _xmlEntity'
>    30 |       const xmlChar* pch = cEntity->content;
>       |                                   ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f3cef04950eeaa744ebe9409561d505606375787
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-it-compatible-with-libxml2--2-12-0.patch | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch

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
