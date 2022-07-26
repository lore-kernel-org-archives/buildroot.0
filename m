Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DECEC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAE88146C;
	Tue, 26 Jul 2022 20:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAE88146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-fvJWiaxfyy; Tue, 26 Jul 2022 20:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DCC81466;
	Tue, 26 Jul 2022 20:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DCC81466
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 563401BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E3EA40598
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3EA40598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z54oMXFXQ1xD for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42B84046D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42B84046D
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:04:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9C4B60003;
 Tue, 26 Jul 2022 20:04:06 +0000 (UTC)
Date: Tue, 26 Jul 2022 22:04:05 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220726220405.4fbd3e0c@windsurf>
In-Reply-To: <20220726193810.43817-1-pevik@seznam.cz>
References: <20220726193810.43817-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658865847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzaBBhHS1Vo0hijwxXOny43Tvd2GJQe8rmnmzFkkV9s=;
 b=kxJi4xqZsvGOnaaBkzCNgBaGCGF/taS95FaeQc/YsSt5HuAPOytw8EWrth7WGLarp2+Oez
 hNf+YoGWeawu4m+PbYhSJf+4wbDLwdV0E5lAsKuqoSfypOtG+tD1/XDFOiYlJqyr8ttkLk
 aaeOyVhCmoAPA94RUZ4SLDAKicCwIFKqNupRlIxrIGtNsEdJGKQA002skK3f8HuWW2hh/o
 kyYGThS+ewaAQUgFVMBJ8Q0wKBBaBD7rZId4IgkapTa7N2Gi6hQuvLByLKpwx6EaZ2yaVk
 JyoGC1QY6siDm+RifL+jKZ2kPASKxKGMaiT6vAgSA9/Y7xsA5QCXZz8DBKcPvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kxJi4xqZ
Subject: Re: [Buildroot] [PATCH 1/1] package/debianutils: bump version to
 5.7-0.2
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

Hello Petr,

On Tue, 26 Jul 2022 21:38:10 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> debian/copyright has been moved to a different tarball
> (debianutils_5.7-0.2.debian.tar.xz) which does not contain the source
> code, thus build from salsa git instead of tarball from
> https://snapshot.debian.org/.
> 
> Add patch to disable po4a (unnecessary dependency just to get
> translations).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/debianutils/0001-Disable-po4a.patch | 25 +++++++++++++++++++++
>  package/debianutils/debianutils.hash        |  6 ++---
>  package/debianutils/debianutils.mk          |  7 +++---
>  3 files changed, 32 insertions(+), 6 deletions(-)
>  create mode 100644 package/debianutils/0001-Disable-po4a.patch
> 
> diff --git a/package/debianutils/0001-Disable-po4a.patch b/package/debianutils/0001-Disable-po4a.patch
> new file mode 100644
> index 0000000000..2af9a93279
> --- /dev/null
> +++ b/package/debianutils/0001-Disable-po4a.patch
> @@ -0,0 +1,25 @@
> +From 7134952f97ad5afb208e270571afbfe12670cc14 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Mon, 25 Jul 2022 12:59:45 +0200
> +Subject: [PATCH] Disable po4a
> +
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 86ac499..7c61896 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,6 +1,6 @@
> + AUTOMAKE_OPTIONS = foreign
> + 
> +-SUBDIRS = po4a
> ++# SUBDIRS = po4a

We already have a po4a directory in the current version of debianutils.
Why suddenly do we have to remove this?

I'm also a bit annoyed by patches like this that we cannot upstream
(and therefore have to keep forever), and that require AUTORECONF :-/

Do we have a better solution?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
