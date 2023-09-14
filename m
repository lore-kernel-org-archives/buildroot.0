Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B76EEAA74
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744F9612BC;
	Thu, 14 Sep 2023 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744F9612BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuQ5XrDy66ey; Thu, 14 Sep 2023 20:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BD1612B6;
	Thu, 14 Sep 2023 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5BD1612B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF781BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A438201F
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A438201F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHIKBaWqo_ZK for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:25:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F0E981FF0
 for <buildroot@busybox.net>; Thu, 14 Sep 2023 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0E981FF0
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC0D8C0002;
 Thu, 14 Sep 2023 20:25:12 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:25:11 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230914222511.17c97598@windsurf>
In-Reply-To: <20230912185706.2605439-1-francois.perrad@gadz.org>
References: <20230912185706.2605439-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694723113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypobPbc9YT2plLGSn6zy/iiDMlpqk6E2yiviBVbj6v0=;
 b=ZXuwTMhNRnYQJaI2Kz9QJOHb9UJK14OoIL2K+GmhygbpWTK68UQ2LjzxqzibnVwBuo5gq0
 ULAg1Xsk/XlWrrHt/d/2V+6OW1PTuIDlZdOsJz9/nUukLxGvkREgZsjB1HVwwt0ZCt0aV3
 shwFw7jB6beuwSFJOXk4oGi4PVW7cRm+oo6PkTdKEqIzcBOuN0DCi5bP6CWfqVu3uv/uvu
 NQFWFeUbqsWji+bcytOjJc/eHSTqB3torLrfncMQR/iJbEap/Hn5zKJCj+HQWRaaUh4OW3
 6j1rm01v2Kc7mrLKr/cyDSf3FmX8ojuvMg8YjBAIkmiFJhjLRKntv5qMFke6Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZXuwTMhN
Subject: Re: [Buildroot] [PATCH v2] package/luajit: bump to version
 41fb94defa8f830ce69a8122b03f6ac3216d392a
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Sep 2023 20:57:06 +0200
Francois Perrad <fperrad@gmail.com> wrote:


> +# emulation of git archive with .gitattributes & export-subst
> +# Timestamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
> +# repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
> +define LUAJIT_ROLLING_VERSION

We normally name our hooks after an action, with a verb, so I renamed
to LUAJIT_GEN_RELVER_FILE, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
