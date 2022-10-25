Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B75C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC42C60ACD;
	Tue, 25 Oct 2022 20:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC42C60ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_FC9SIkCOeT; Tue, 25 Oct 2022 20:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0A160B01;
	Tue, 25 Oct 2022 20:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C0A160B01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D41D1BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AFEC80DCC
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AFEC80DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vp2LGh8bIhre for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:57:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417F380AF3
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 417F380AF3
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:57:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2785A100008;
 Tue, 25 Oct 2022 20:57:43 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:57:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221025225742.52be95f2@windsurf>
In-Reply-To: <20221025192219.1296974-1-james.hilliard1@gmail.com>
References: <20221025192219.1296974-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QeM4feIOc3sknPNbaUBXZkSdEWXtL7SPDXFO8M1ajY=;
 b=JGf+YdgWzsLvoZSptLLHXTWIFsffgGRoJe5EwdOXBUtPjsMnEj9CA6ekgc6/yeNu2nDbxo
 04AlzziWMt2dI6zfy5URJQBlW6t5bvkYrsxrIt7uHoCHCtZK/BrkPKDDEzwlIzwcdaCAjo
 xjfbM0kxrofRtgiMnE48ivlI0VJuT1wUDL+T8Sf5BG67XIr6aaEPgtvBxZRjwkvccILR+K
 v195TyVi3VQJIIj6wBBy9zexi7IXmUp7igei0S+p/RDdYjj/Obw2tLmc0HHMN77vIt3Vgk
 gtt8T+CKX64g5jxtrO0MTWZhfkpWfG2kRXQYEmRS4q6RvRY+SFl452/IdXaamg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JGf+YdgW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cchardet: fix python
 3.11 compatibility
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 13:22:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add host-python-cython so that cython will generate python 3.11
> compatible sources instead of using the python 3.11 incompatible
> pre-built sources.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cchardet/python-cchardet.mk | 1 +
>  1 file changed, 1 insertion(+)

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
