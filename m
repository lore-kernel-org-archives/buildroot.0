Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48885EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 007ED61425;
	Fri, 14 Jul 2023 10:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 007ED61425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3829Elccyut; Fri, 14 Jul 2023 10:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FD161429;
	Fri, 14 Jul 2023 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FD161429
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07DD41BF983
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E4E61411
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E4E61411
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8NIxCMbrrmN for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2D56143F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2D56143F
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95914240004;
 Fri, 14 Jul 2023 10:21:47 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230714122146.4073ba02@windsurf>
In-Reply-To: <20230713214616.463353-1-james.hilliard1@gmail.com>
References: <20230713214616.463353-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxRkI9nZBYaotQrmKF98t6AHD2Y0A9jolFkhfkqWWpo=;
 b=PCxtFqku5Z43eDxWY3YtK8oUBjSwn+4ul9NHwqty9DoO8CfdAXbRpyYOGUWxkChSW9Dc5O
 c92L9VFEJ2J5FHqvFjN1wqt6446iMvMEeQdgpNUTslNOKHSyCc2dK76Xr5FOUffTyj5Cqt
 wHE2/Ax8FxXeOs0+RqaStxb8IWXMJtkkVUUnC3PGoAvfWMyGon2IfB/4ivgDuZrGP56p/v
 Rawpw/jNQhVJ9644E30nfL2dQO3EmIXxvjiS01jSI1JlOSkURPC2Eadw4hLEXSjv9PdOba
 Pst7k7mG3Z8kYH2pEj1bjF+WVKiD5M0+70hUi47FQGlSZNYJSYvt+eqHb5qh9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PCxtFqku
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.4
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

On Thu, 13 Jul 2023 15:46:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
