Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81548C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391344192A;
	Mon,  5 Feb 2024 15:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391344192A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDtZvANwC4pm; Mon,  5 Feb 2024 15:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 962AD4190B;
	Mon,  5 Feb 2024 15:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 962AD4190B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 393891BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D0781E4D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D0781E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgxmPdacyTB4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:09:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE32A81E36
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE32A81E36
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1511820002;
 Mon,  5 Feb 2024 15:09:31 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:09:30 +0100
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240205160930.0c2fb755@windsurf>
In-Reply-To: <20240117135713.36729-1-wdouglass@carnegierobotics.com>
References: <20240117135713.36729-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707145771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfYDKOFFYTS1GmF1FZEGhCaFxL3A8HFYN6+3whdN4jg=;
 b=dZWryIpDYf0rHPy+qOIdnQKsXM7Mz3pvz4fJIdKgUclXzgkM0/2XWyvSFixJICP5QfA3Dy
 4rNUn57iIwYcN56BaKYbJDSeL2F7kkbOJMYwiRfUB2tIuphXa2nWww251mKmR+YuqhxLmo
 FGFflKJw06dNMEXiTsxdwVIivj07OztnOqKjGS5DraJzEggfhRSp2zXKOmgexOPasD6BeT
 xkfJBHwRyz+G6UhFek2WClSA055T3Ao7xbcLtFkGQGGUtnXh9dUPLXJ3W9px2kXLpO4gva
 gQ58t84qLG+Z8DK5Nn5WKuMxhhAw71g3h0prxxwuZXZVB1/OYwUVScZlNN/bjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dZWryIpD
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.9.0
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Jan 2024 08:57:13 -0500
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/opencv/opencv/wiki/ChangeLog#version490
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/opencv4-contrib/opencv4-contrib.hash | 2 +-
>  package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
>  package/opencv4/opencv4.hash                 | 2 +-
>  package/opencv4/opencv4.mk                   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

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
