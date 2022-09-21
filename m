Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9302ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A97A41972;
	Wed, 21 Sep 2022 18:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A97A41972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K55gEwHhYvB; Wed, 21 Sep 2022 18:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E154195A;
	Wed, 21 Sep 2022 18:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E154195A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1DAC1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD56682EF1
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD56682EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJxbk4O4GUoq for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE13823E3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FE13823E3
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 18:09:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C19101BF208;
 Wed, 21 Sep 2022 18:09:39 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:09:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220921200938.3f1eedc8@windsurf>
In-Reply-To: <20220920190338.3688731-1-francois.perrad@gadz.org>
References: <20220920190338.3688731-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663783780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igEqp9wwBW1rdSAluE+wF977Y24uADszPIATqVnkx50=;
 b=WDQ7CS1AywMp8h4rEl9DVEt9qT0M6E5T1WyUTip3CxtuZbX1X9wkNKzOTZETk7ehHIOD/s
 9QNxdzlqS7fjQP1kqT/+cojkphiaEJagiS70Mr6v4mq4iQEtQ/LqF5ZqEYUXpe4dhmdw6d
 FENW1U+Ild/HkvdXzv5Hm+v8xsQiN3GvC2iLdpiSREwgA2ECSI/8bDtYLLV9XGU9wQshPo
 BDs0ZSCaTxDIwc7YfFwHvypzjPE9oyn9nkWYgYFrdotr3z2HZLk471cAIJqSnupWiBY/Vu
 coputSDt++qF0/jaPj1bXm7nKGa8rfzFwluom+Ck9dvhDBBeDp9WE3hUkOOZQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WDQ7CS1A
Subject: Re: [Buildroot] [PATCH] package/lsof: bump to version 4.96.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 21:03:38 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> sources are now hosted on github
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lsof/lsof.hash | 2 +-
>  package/lsof/lsof.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
