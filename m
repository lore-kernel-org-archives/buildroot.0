Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5299BC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBDEA401C9;
	Sun,  7 Aug 2022 12:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBDEA401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nF6CDNQPfZH; Sun,  7 Aug 2022 12:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A81940119;
	Sun,  7 Aug 2022 12:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A81940119
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B545B1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 836A782779
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 836A782779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvaeaYEokzXc for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E8E82741
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E8E82741
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:51:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50A7B240002;
 Sun,  7 Aug 2022 12:51:31 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:51:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807145130.64896f73@windsurf>
In-Reply-To: <20220807124104.3750685-1-fontaine.fabrice@gmail.com>
References: <20220807124104.3750685-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArjYqGt/Wxr5luineayhPe4NKKJiQ8U+EzWbKwhBSzY=;
 b=btTGYWnC45sbE5O44lkZyrEm192y9bpSgXyrUTIogAfll2MDqsvXCJsarQYGg01p6A9GgM
 koE8gbSl5/8RZ5JhHTeyAO1XRl6gxKihb3kW8wVx/HJPjE95Ou6VFxyw2nB+Tezuo+4DKO
 JQCDtyhqgD9MHElaweLeHf8EbQ+RMwqmydd9q/Iq9lvx/MM4248zbZWU5tZtzQxTLml/4J
 GX3UqSjGFzm7PyxMrtRV1iEoaKPMoAwiuuoYZJ+gOw3FZM4jhY3pZgJcIfqNTzxlsmTt+z
 Y3EGDQusFFXD8qknBgc90jAHYK2Y3aMw4WJf/KHoIfLj5kA/MBnu9jpM22MXSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=btTGYWnC
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: bump to
 version 3.2.0
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 14:41:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/freeradius-server.hash | 4 ++--
>  package/freeradius-server/freeradius-server.mk   | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
