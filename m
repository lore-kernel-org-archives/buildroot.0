Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF979C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7009C432A5;
	Wed,  1 Nov 2023 22:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7009C432A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z87JXYlxHvWr; Wed,  1 Nov 2023 22:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01DD9432AB;
	Wed,  1 Nov 2023 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01DD9432AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6704C1BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3316A83B67
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3316A83B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jphqngJ1Tzy for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:10:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDEED83A7D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDEED83A7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20B8E40004;
 Wed,  1 Nov 2023 22:10:55 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:10:54 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101231054.161ab726@windsurf>
In-Reply-To: <20231015201204.1277675-1-fontaine.fabrice@gmail.com>
References: <20231015201204.1277675-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698876655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PA9vZ4/EoZNub8kz0OPbL8GXMMdJ4tiTudwszYU1xc=;
 b=FXsVnL4qYeggI+k7vBaDLKfXNGoRJQpPRqrSwhOPJUyLqz3wBAr8F+e1pG7fj9YPAkMAEC
 CJoqExkApT2gZYsTL5UyLbzqzzt04T9s97kQ/tvVTCofleEdx7pL5zCf4vevjdLQKBvATO
 /gUhgm5avgmz+9bzntdwpIKx6g5ITE3OvTN1sYnxnx4/3seVcvWyh0SoEVVQZPxvkXr6sp
 xGhEVgtyRIP/FzY/RfwRYJtLp1LTRDrEITxusRPJiQP2+W7JOebPIOUb7V7fJnAwBUuvVm
 zhI+vKRjEPPJ3UMiQn24q60anmzgHT95y/YPoH7dLJk2bvi0++DkiWw14njgiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FXsVnL4q
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: drop
 DISABLE_GEOS_INLINE
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Oct 2023 22:12:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> DISABLE_GEOS_INLINE has ben dropped since version 3.11.0 and
> https://github.com/libgeos/geos/commit/1516e42eeae3b3114585f1e94a0e723d835f7757
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgeos/libgeos.mk | 4 ----
>  1 file changed, 4 deletions(-)

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
