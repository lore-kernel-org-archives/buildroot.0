Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3598C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC2C41ED3;
	Tue,  6 Feb 2024 10:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC2C41ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxebANlzNBKe; Tue,  6 Feb 2024 10:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A1341EB9;
	Tue,  6 Feb 2024 10:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A1341EB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB29C1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC73C61124
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC73C61124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7U78O-JS7bZA for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:53:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7CA16111E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7CA16111E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D71C40003;
 Tue,  6 Feb 2024 10:53:01 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:53:00 +0100
To: <yann.morin@orange.com>
Message-ID: <20240206115300.0bd8b584@windsurf>
In-Reply-To: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
References: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707216781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qE8TtJlv5hBpMl/on16+4eKWwW0ZhuSoKf7EfFcV+M8=;
 b=IWrztJwZwXKk5lEgEDKkl+RXXFGvulzZeBco5c/DuFPYS23nTLeQ1YvJexInsTzObQyOrr
 2udiSN34vUeaYMbWekMMv02m1SNNp7YzWI1bRM+EMkrUnxzkbN3pk+xa9gvfXYCsL1bUdn
 Q1lBEtZVpH8YOVr4JIi6Rf4wqpjIK42q6pl4N+04rRsObLgOkMHqBr47t5FBP4XUcUIwGa
 j9OVNUgwWzVZWHQMvQ7lXwgOiNjBOfbQ9KzIp70zygKTfwRBAN9pPWq8IFreGq7Y0+CG4y
 IUO3GRwfTm0wfFEGe1ppCbrQEot8P/4qLYs7wV1JTf3AyBbSGkZ/pmJcEv3bmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IWrztJwZ
Subject: Re: [Buildroot] [PATCH] docs/manual: extend makedev syntax section
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

On Thu, 18 Jan 2024 17:08:50 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The section of the manual describing the makedev syntax is not
> up-to-date with the current features, and does not properly describe
> existing ones.
> 
>   - extend the list of types with the requirements on the existence of
>     the target file or directory; for 'c', 'b', and 'p', the existence
>     requirement is inherited from mknod(2):
> 
>     ERRORS
>         ...
>         ENOENT A directory component in pathname does not exist or is a
>                dangling symbolic link.
> 
>     for the other types, the existence requirements are extracted from
>     the source of makedev.c;
> 
>   - format the types fags, so they are rendered in monospace;
> 
>   - extend the 'mode' description, as it can be set to -1 for 'f', 'd',
>     or 'r', so that only the uid and gid are set. This is most useful
>     for 'r', where setting the same mode recursively for all the
>     sub-directories and files alike does not really make sense; indeed
>     in this case, the modes are usually set correctly when the package
>     (or rootfs overlay) installs the files, and only the uid and gid are
>     interesting to set;
> 
>   - extend and update the examples to show-case the -1 mode use-case.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  docs/manual/makedev-syntax.adoc | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Applied to master (with the typo in the commit log fixed), thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
