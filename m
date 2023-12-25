Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A046FC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529E4415D7;
	Mon, 25 Dec 2023 10:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 529E4415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dx1pm1nXPA8Y; Mon, 25 Dec 2023 10:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F4ED41587;
	Mon, 25 Dec 2023 10:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F4ED41587
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7D51BF5DB
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 623BF41587
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623BF41587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfH1MJhN-7-S for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:29:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57CE2414C5
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57CE2414C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CCDF60002;
 Mon, 25 Dec 2023 10:29:35 +0000 (UTC)
Date: Mon, 25 Dec 2023 11:29:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231225112934.237a2b76@windsurf>
In-Reply-To: <20231214175310.207294-1-james.hilliard1@gmail.com>
References: <20231214175310.207294-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703500175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=488y6Rek1DQ/8koPsZVApfsoJVPpppWOtqsLuJT3j/A=;
 b=eICqOtI674jFmiZKywbHo2w1xjtp6CBfjA8ZpCbC4lMlYNVxsQgR64fGjlIbwjjSBDreCf
 LrGf/FSqeHpv0zSVdaiJ3iYpTcbdKd2fbhHWsxsZe141VZJuS3e2M+HZaGMlFi782w06Pp
 VVvm5YIjRZIAHkYesBaQBh5LX1yXras30MkQrcbxKjLbuYYqrXwfGaJLJZfrzjZREjpXkp
 I1Ek1NxMAeI9117tirMxkRygTmZJl7xTORWF381kf8Wj1rSa7gaqF6c7nS4Cbi2MH4qwnZ
 3R4SDlzy6BvZsvb6fo2JlJl5ysNCnxZPku+XhsHe56vbGBCIARCm5nB3UQfBpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eICqOtI6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: new package
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

Hello James,

On Thu, 14 Dec 2023 10:53:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> +PYTHON_ASYNCSSH_VERSION = 2.14.1
> +PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
> +PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49ddcc10567e52a8e0e1553fc936584e241d516b5682d55ea17
> +PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
> +PYTHON_ASYNCSSH_LICENSE = EPL-2.0
> +PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE

The COPYRIGHT file says the license is EPL-2.0 or GPL-2.0+, so I've
changed it to that, and added the COPYRIGHT file to the list of license
files, and I've applied.

One thing that would be nice for new Python packages would be to add a
runtime tests. These are relatively easy to add, and allow to verify
that all runtime dependencies are probably taken into account.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
