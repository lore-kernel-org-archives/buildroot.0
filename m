Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E269C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 07:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA9A401C5;
	Mon, 14 Feb 2022 07:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hU-8gD0293J4; Mon, 14 Feb 2022 07:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC9244019E;
	Mon, 14 Feb 2022 07:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D18F1BF5DA
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 07:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CF2560AD6
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 07:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIbYfXvzbAK6 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 07:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBF6A607CA
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 07:57:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C800E0003;
 Mon, 14 Feb 2022 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644825444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4JTMEgRvmMgqjGEv+uMSfxus2kvIOHJ5s4K7JuEjuA=;
 b=j+pfv4gAkvjMbdc0BIh5g8y1t1UjGBmvB25Fmd0CunnFMlE30Aa5PyW0cH6vBoleznQ6Vx
 bpramJG1ESlicv2LpAB47f2iujS5t3eI+XkMZxt/pYQA2lrPyYpXadwYcaTWKvsmf4ImwC
 w2n/xmJr7q/o3MWy1a3TtZORCnwAbiKX6V6k6FOiO73+Pm8vUkl6EjVbj71k45KSXSaxtG
 zcZiPfYIwXK24jD3sleEEJQbS3aUU7vrWNDgz/Me7+GVp99AXj6aY5UVvCGG3xqsBnSJWC
 MgNwbfP48VLf14sJ7yNZ8N3OuE1Gix8zSqyAgNSj6w/ImMBoonydZ7UWlo/KyA==
Date: Mon, 14 Feb 2022 08:57:22 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220214085722.330337d9@windsurf>
In-Reply-To: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
References: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] manual: board support: add instructions to
 test defconfig in the official docker
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri,  4 Feb 2022 00:54:38 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +Inside the docker hint:
> +--------------------
> + $ git clone git://git.busybox.net/buildroot

As mentioned on IRC, I think this is not very useful: if you want to
test a new defconfig, or changes to a defconfig, the changes to this
defconfig are not yet in the official repo, so simply cloning the
official repo within the Docker container will not allow you to test
your brand new defconfig.

So as they are, those instructions are in fact not very relevant for
the indicated purpose.

Either the instructions include mounting the local Buildroot copy into
the container, or they instead suggest to use Gitlab CI to validate the
defconfig.

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
