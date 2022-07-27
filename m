Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF67C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CFC60C2D;
	Wed, 27 Jul 2022 14:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CFC60C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Msjq-eQZjc_5; Wed, 27 Jul 2022 14:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1362C60BDD;
	Wed, 27 Jul 2022 14:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1362C60BDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8477A1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0EA4013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0EA4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q12vlO-P_YFl for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 672C5400DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 672C5400DD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:54:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B77D61C0008;
 Wed, 27 Jul 2022 14:53:59 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:53:58 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727165358.7feee4b8@windsurf>
In-Reply-To: <20220727131904.1316745-1-fontaine.fabrice@gmail.com>
References: <20220727131904.1316745-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2tMshMLVXvnF4qTTxYIoKu/fkgTvzKJBhr6d9KDDaM=;
 b=RiF7nDFsV8Dov7yGqlVG3XxbrD33c70NRHGbFywjKh3UClGbhLVEf2hstQGa0rLLJiMJW7
 93k/I9ViyyK4Js0XIQrw8mbCOf3W4WQpVFDJYafE+ughsTWeqtCA2TFqWmxc5/MRhdiOxs
 WV3yl3s/cwCu+H0xpMUbZK4IvFhAJVwh15K3BlooxgaMGSndryTpi450sUzYct9aODVty+
 L8a48zxVIwYYp6YTz4nlXSbW8fHdCgEZ52GCNNPyDt1UH49EaDNuq7JHGt1DqYfgOEb8Q1
 VVO0Sut4Gy+78onO+KMW6tYeHj1fFh9CMaZiJer1/WkOhbF9OWA5HJCBWIb0zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RiF7nDFs
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.19.2
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

On Wed, 27 Jul 2022 15:19:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop openssl dependency: "The OpenSSL provider was incompatible with
> OpenSSL 3.0. It has been removed"
> 
> https://github.com/randombit/botan/blob/2.19.2/news.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/Config.in  | 2 --
>  package/botan/botan.hash | 2 +-
>  package/botan/botan.mk   | 7 +------
>  3 files changed, 2 insertions(+), 9 deletions(-)

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
