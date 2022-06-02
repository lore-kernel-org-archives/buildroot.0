Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C96C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE09260DFC;
	Thu,  2 Jun 2022 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtTgtzCL8NJ8; Thu,  2 Jun 2022 16:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4EED60B71;
	Thu,  2 Jun 2022 16:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB2C1BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97769415AB
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1TJhFBtKfr2 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:52:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B827415A7
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:52:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 172DC1BF207;
 Thu,  2 Jun 2022 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654188763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rysHebTnEXT8wpq/QPsyuk3FGKZURzDKEV5JToDzlg0=;
 b=bn0Li4HxcSChsijlfLxzeA3b6Y/t+UzxtQ/HYD+lY1l3g55NBPk+gqc6dsq4FGUGnbG9Z3
 FPZJbEnJ/8LUNqh2tWdPQgQ8p+vvPIdMXXjHu0z0IPf0lyUb08XIPLpAvDKRND9Ir5xvmO
 lA0BuslNMsM9f4MwzDlEODR8QwqYX77OGNuziBxUqTKfL4ptMJD3IhOry3AHWTPF/P/nsi
 MM5ssUrfGGm5sjptR0TySxdUVzpLjH4hUXfksHbxgDhNpZZkEoYy2U35LRfvtBd91tiMj1
 WvrdejbfjkOjy1oxrmB7XDD58FdnxYG2xtPIY9PK8sekum7WY1OZ0LULHtMYvA==
Date: Thu, 2 Jun 2022 18:52:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220602185242.24ee361f@windsurf>
In-Reply-To: <20220517202422.1522574-1-james.hilliard1@gmail.com>
References: <20220517202422.1522574-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to
 version 1.0.1
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
Cc: Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 14:24:22 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License moved and hash changed due to rename and removal of authors:
> https://github.com/wtforms/flask-wtf/commit/d37c22b42202ccf4c8f96c445ceafe72c4c5ed46
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-wtf/python-flask-wtf.hash | 6 +++---
>  package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
