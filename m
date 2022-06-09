Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90362C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BA4607DE;
	Thu,  9 Jun 2022 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6Kg1PgzjQxR; Thu,  9 Jun 2022 20:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69ED561116;
	Thu,  9 Jun 2022 20:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08CAC1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC5C241C32
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nalVdElW1_e2 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B6741B8A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9CDB7FF809;
 Thu,  9 Jun 2022 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUCJ5B6QaYkekp9saVPzZVSqDeT9vuYMwJoS2Eo66I8=;
 b=RVvbtuikvZTo8wzAtrC6cboNjz0gjA03MAtsteqQTxpIwLnNPCXAHWsDBSlV8uci9H/q2w
 getnVjVPowslb5UkDoTTubsqBtGDNF11mVYLl5zyNJ67kXbTcEetqfOoSLMKg1w+Svvooq
 HaSWRl+PRo5LEHJOxt5l9lUJtiyjeU0SFxDY4dYldbjDb07Gh3Batx57jduvlqyoPu4BnJ
 +cE4HBve9Rj+IWBL6RoVsHAn4CwbcoyQ7zEKbDIYxrHwsjxRINlRahNdJvE1xO/rxUpNx5
 FrzYgpDVcDeEV1esHEoVzyimPW0R7oNb6yvRMibMyVq3f+9SjUy/enMUhOj+MA==
Date: Thu, 9 Jun 2022 22:44:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224437.31cad951@windsurf>
In-Reply-To: <20220606213734.20571-1-fontaine.fabrice@gmail.com>
References: <20220606213734.20571-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/expat: bump to version 2.4.8
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

On Mon,  6 Jun 2022 23:37:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix sha256's tarball

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
