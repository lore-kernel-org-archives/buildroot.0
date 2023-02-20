Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EC0C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61345701C4;
	Tue, 21 Feb 2023 02:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61345701C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj3h6QT9a_TP; Tue, 21 Feb 2023 02:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99BCC702BE;
	Tue, 21 Feb 2023 02:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99BCC702BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF75D1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F1E6100B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F1E6100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSe78CCg8BWU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:34:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7115760FE9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7115760FE9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:34:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 883E61C0002;
 Mon, 20 Feb 2023 21:34:56 +0000 (UTC)
Date: Mon, 20 Feb 2023 22:34:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220223455.318a2fbf@windsurf>
In-Reply-To: <20230215230413.28610-1-fontaine.fabrice@gmail.com>
References: <20230215230413.28610-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676928896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfY47CEAk4kfhBV2VSSVNPqQUg5yncwz0qitx/ta6xU=;
 b=GNZ9gIZ416lMZBm/+CEb+7H53RBgzOshEwHf3EAtNh1QOlUo3qhb/yW6xuPjUL+e8Y7xIC
 B4cqr9CtAjxibhYJFOK1NLtXw1tteB/srCrtt0CZDNE9hZGLn6qnxbyG4rBhQd9GbFkMsp
 FxKXrefJaYgdnhcKPvyRbFemMnkPD97w53WDrW0ExfglqJjMCHOQH4q9UFU1d/K5+Ud6RO
 PGGAC+Pjx6p0HemdCsQDc96ULzmG2FHwVvwfOWbL+BhOhZS8Zce96Vq3Vd9epI2Tp3maMW
 Qgm5c7g/qFV6B6HXTs28rwU9lGGvPA2XLqMRxbLhf6PIM3ATSb2KO5hTnKn5DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GNZ9gIZ4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webargs: add CPE
 variables
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
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Feb 2023 00:04:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:webargs_project:webargs is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebargs_project%3Awebargs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-webargs/python-webargs.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
