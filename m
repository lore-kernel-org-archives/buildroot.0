Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE33EC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A061815CC;
	Wed, 27 Jul 2022 14:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A061815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kn9AJNt-3xU2; Wed, 27 Jul 2022 14:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D1EF817A3;
	Wed, 27 Jul 2022 14:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1EF817A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 027D31BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F5C4013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F5C4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obYMPYgPghoJ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:53:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB264400DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB264400DD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:53:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD0A01C000A;
 Wed, 27 Jul 2022 14:53:54 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:53:53 +0200
To: Nicolas Tran <nicolas.tran@smile.fr>
Message-ID: <20220727165353.5051ecab@windsurf>
In-Reply-To: <20220727125504.2177588-1-nicolas.tran@smile.fr>
References: <20220727125504.2177588-1-nicolas.tran@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckn60bC++T8RheKuV+aO/lKZlZc4i+LB3d2IP0NYFJs=;
 b=SbavdAiKtWUd6t9Igu6rZIZ07DsEnoqVl3ApzCi76b4+Omqb6F2yCWUF8leC5kB8nRZgjV
 bwXWbdNRL8xiGwqfTzlKgUjpBDPNdm59O03Ry/2zsRd3w/KfTOf3fklaDXxQlw1IBpzkXm
 Qt4XATavLTloz2b0aKNi1TVc4gx/738H3sD3WF0DLt3jgbqrMcOuZRyWZqgoos/h6S9ca9
 5AskOWzviUN4O1HsB5Q61zsMiSY6r20nL1UlMmxEXkU0mSUUjgGnZ7IwqNF6qFfkQs37v8
 cFigGgG3HLgObKF6zd5lPH35Z7qF5rtdAFBJ3fXOuMWatI+OvIM2yENwbJLEjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SbavdAiK
Subject: Re: [Buildroot] [PATCH v4] package/dust: new package
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

On Wed, 27 Jul 2022 14:55:04 +0200
Nicolas Tran <nicolas.tran@smile.fr> wrote:

> dust is an alternative of the command du from the Linux kernel,
> written in Rust. It aims to be more intuitive and visual in order
> to give the user a better view of his system's storage capacity.
> 
> Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> ---

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
