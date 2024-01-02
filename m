Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED4BC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B2C40A97;
	Tue,  2 Jan 2024 20:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B2C40A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCywJZQ6rnYf; Tue,  2 Jan 2024 20:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA6B40AB5;
	Tue,  2 Jan 2024 20:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EA6B40AB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11A9E1BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 959D8414D1
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959D8414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBHzzOUSGTB7 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DE1541607
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DE1541607
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD70B20003;
 Tue,  2 Jan 2024 20:18:46 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:46 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211846.398c703b@windsurf>
In-Reply-To: <20240102180220.1038939-1-fontaine.fabrice@gmail.com>
References: <20240102180220.1038939-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+EGjkKRiN5hDgWud2KwUKH0XgIaXR5oy80u71aJCkw=;
 b=YXVN4I5tetzcnvYSydgPgI/+wACWY120XW9AEgvTeHAMcIW/Kfx5K1zI3Nm8mxYISlN+4/
 Mk/kqGtud7JNZ8ZHwlfpwxreeBNIJjPKrC0aigFHJ/opB/bB2V0Vc5PSJFCYSMriIKU7eP
 8dEqJXXidA8pOv1szU9dtj3CVCAF0IvvsWuGpMyeuDgXa9/OX/m9CcAu5eD9o61KmZug0r
 WINSVRcANciKHoxQszUdenAhgLKvmGWT1HA/8rVpkYWwGkItqiz0EI0wORYfGU1ywCYkn2
 vvkVQICYgpXLr8++XmFjX18ZfvrKrTPcBBsSArScjJ1lFnCctxRStmL3JGB7AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YXVN4I5t
Subject: Re: [Buildroot] [PATCH 1/1] package/matio: bump to version 1.5.26
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 19:02:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use xz tarball
> - Use https as http is translated to https due to HSTS
> - Update hash of COPYING (update in year:
>   https://github.com/tbeu/matio/commit/47a7a3340ed3bbedd3c456f8254f9c5441a11127)
> 
> https://github.com/tbeu/matio/blob/v1.5.26/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/matio/matio.hash | 6 +++---
>  package/matio/matio.mk   | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

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
