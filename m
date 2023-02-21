Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C0FC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 09:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A0A82BBA;
	Tue, 21 Feb 2023 09:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A0A82BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YmccbhpJ49Z; Tue, 21 Feb 2023 09:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E68D82B3E;
	Tue, 21 Feb 2023 09:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E68D82B3E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA3621BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 09:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C43B861103
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43B861103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUUdSk4lBHrG for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 09:10:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809A761100
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 809A761100
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 09:10:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6B9F1BF20F;
 Tue, 21 Feb 2023 09:10:40 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:10:39 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230221101039.2d86fdcb@windsurf>
In-Reply-To: <20230207220941.58066-3-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
 <20230207220941.58066-3-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676970640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MoixQiLcYflXe2zBicuqNR9MkdCcDaBGc4dR/3SmX1Q=;
 b=kShLtRz8qf+FOpTl5ZSg/9ydkvKxRlE3vuIi7IxSBEUPm0/KMmenD05wY9uqsc+VYvgKDb
 th5aIVyUiiPLIMUrHiIHllsGrSL+0uTK0G/59GY07X8xdZsgytJg2sD9faxFyplCea8p4o
 dVTmwI96FjkrPfRE7PUTGJNZ4Y/vvXgzmaeePqxNrMRtlRg/AGk27sc+Ikgmp7UVpDuov0
 P00h+bUdEbEvKJygEOq/titghWaudCwKKMIWfeJF25M7Vv8dQJOOUTcy2c3DDNhmfl+HFl
 rej+9sglLHkPs3JEk1kVxWTeS5beXpHsaL0VUj2Uxuuy8O+TpKWLwyKk1W8Mkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kShLtRz8
Subject: Re: [Buildroot] [PATCH 3/5] package/openmpi: enable mpi compiler
 wrapper scripts
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

Hello Julien,

On Tue,  7 Feb 2023 23:09:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> openmpi normally includes compiler wrapper binary programs (e.g. mpicc,
> mpicxx, etc...). Those programs are inconvenient when cross compiling.
> Those target binary wrappers are useless in Buildroot, as the target
> root filesystem does not include compilers. For cross compilation,
> openmpi also ships Perl scripts providing a subset of those functions.
> With those compiler wrappers, openmpi programs can now be cross
> compiled properly in Buildroot. This patch enables those wrappers.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/openmpi/openmpi.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
> index f14b55ced5..e6f5cd0250 100644
> --- a/package/openmpi/openmpi.mk
> +++ b/package/openmpi/openmpi.mk
> @@ -17,7 +17,9 @@ OPENMPI_INSTALL_STAGING = YES
>  # found. This makes the configuration fail. See:
>  # https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
>  # Disable explicitly to avoid the issue.
> -OPENMPI_CONF_OPTS = --without-ime
> +OPENMPI_CONF_OPTS = \
> +	--enable-script-wrapper-compilers \

So if I look at your PATCH 4/5, this means that "mpicc" is one of those
wrapper script, installed in $(STAGING_DIR), but meant to be executed
on the host?

As you're saying it's written in Perl, did you test it with a minimal
Fedora installation, to see if it has requirements beyond the base Perl
installation? (compared to Debian/Ubuntu, Fedora has a much more
fine-grained packaging of basic Perl modules, this recently lead to a
small amount of additional checks in dependencies.sh, see
https://gitlab.com/buildroot.org/buildroot/-/commits/master/support/dependencies/dependencies.sh).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
