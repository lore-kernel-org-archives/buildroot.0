Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BB2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25AB408AF;
	Mon, 23 May 2022 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QdHpIJFHiV6; Mon, 23 May 2022 15:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB2D1402B1;
	Mon, 23 May 2022 15:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 881CD1BF390
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84D1E60EB7
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFeIg4uruvMi for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:46:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42BD360A77
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:46:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E460124000B;
 Mon, 23 May 2022 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653320803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSCs2Hy7IYsH76/U9+KMnp1kM66l0ex7bx2lDVj3vpI=;
 b=dMB4vNvftnJCYKIet7bb6YKFruo6VL3doWrykI7UgLIXgfpv9lOWFUJL4KKYi4/9HBE8v2
 n8WzL6PI5BAGSWP6LGCvOQnIUnbzXkOMGtLrDE3VwVE4QCxA0OysyzhnhcektjA39LKJvN
 F8hEeoCeBWcjp6XJPuFcSSj5+4jumthpDto8o92vEaZger4FPT5cDbW3GwiZzWY/bO7ysj
 zju7LS+c6R2jNFJSU7XMU6XdAoQxV6wNTTmA+uHwpQb/ZtLqu8nF+tFrIp3eXxxdj3cylF
 5PiUaGtPUla9A68jK2fQZgVS8vtt+7rNULAb7QWJMEzRdRmuU0I3QNfoNrDM2w==
Date: Mon, 23 May 2022 17:46:42 +0200
To: Ramon Fried <rfried.dev@gmail.com>
Message-ID: <20220523174642.0c7a2fc2@windsurf>
In-Reply-To: <CAGi-RU+TOb+RCRzU=WeWw2DDwtcxk9_2gptgDpZJRZNonMGZUQ@mail.gmail.com>
References: <62886d67.1c69fb81.ac372.4710SMTPIN_ADDED_MISSING@mx.google.com>
 <CAGi-RUKF09JmK_EACoQdBnS_Aw8G6Ep88Lx3rCHY3ZkxrqLvmQ@mail.gmail.com>
 <20220521164440.0f0df25f@windsurf>
 <CAGi-RU+TOb+RCRzU=WeWw2DDwtcxk9_2gptgDpZJRZNonMGZUQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-20
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ramon,

On Sat, 21 May 2022 19:47:24 +0300
Ramon Fried <rfried.dev@gmail.com> wrote:

> > Let me know if this helps!  
> Yes.
> I managed to reproduce.
> How do I know if it's a regression, or a new configuration that was tested ?
> How was the configuration generated ?

Configurations are randomly generated. So it can either be a
configuration that was never tested before, or some other package that
was updated, and which has an impact on bitwise.

If you look at:

  http://autobuild.buildroot.net/?reason=bitwise-0.43

You can see that the problem started appearing on May 1, 2022. It
affects only riscv64 and m68k/5208, which is extremely strange (which
only those architectures ?).

What can be tried is take the first of those build issues (from May 1),
reproduce it. And then checkout progressively older commits of
Buildroot (before May 1), and see when it started failing.

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
