Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4063C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7602360E85;
	Wed, 24 Aug 2022 11:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7602360E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFm9SRMPQcM4; Wed, 24 Aug 2022 11:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9937960E57;
	Wed, 24 Aug 2022 11:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9937960E57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCA751C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9358402DC
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9358402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-OzkIsAJUqX for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:34:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F662402D2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F662402D2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:34:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BB741C0011;
 Wed, 24 Aug 2022 11:34:41 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:34:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220824133440.0b9904f5@windsurf>
In-Reply-To: <20220808220603.784548-1-ju.o@free.fr>
References: <20220808220603.784548-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661340882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86AnvN870n5PtRD0EJGp29K3Idm/8cLk5mhWbmZbY8Y=;
 b=kGpuEf1gNYKJ7hRJYUpsWhmHNL28k/M907ZMlk01MLmLUGLWeAyj9VJvlk+4y8Q5ci+pah
 cXt7g+IGmk2ITXN/vGXFlLbewM1laSpGaurwo/+fYtqafA1s6tfaTC1gBcZKSeUfhIHTmc
 xJUyHetIVoZDu5fqsPPXleTXNDrcXf+MgTbJY2WUfrzwU/LyN012jNCHn5KPQmomNjJ2sW
 tr1eAfqeo5rqNqJ+VO+pALU0jqq2c937taiAMJFX+04dlbxwUirQ88qUcLlhpRpYXLoj54
 tslKXeTHv01tpOAUXRAgkn5lBv2zjsrLJnD/Io76Gt27GLXSFCLIylXQa2QXeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kGpuEf1g
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.21
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

On Tue,  9 Aug 2022 00:06:03 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v0.3.20, see:
> - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.21
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Commit tested with:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
