Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9FEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C3281495;
	Sun, 11 Dec 2022 10:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C3281495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OpSfkf5LelZ; Sun, 11 Dec 2022 10:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C028148E;
	Sun, 11 Dec 2022 10:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C028148E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC7241BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DEC54091D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DEC54091D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puvv3wIaJkKi for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:31:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377BE4091E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 377BE4091E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:31:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0247B240004;
 Sun, 11 Dec 2022 10:31:10 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:31:10 +0100
To: Stephan Henningsen <stephan@asklandd.dk>
Message-ID: <20221211113110.34f98ea3@windsurf>
In-Reply-To: <D5CLMR.W52FYUR7ME313@asklandd.dk>
References: <D5CLMR.W52FYUR7ME313@asklandd.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670754671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSO3oLMTBEveEREmuy8+y5/5arzfJRviF04FoWpDn7k=;
 b=ZTMYCAFeGQQST+0LlZFRe8b84lZCowAw7WNIcfKATssFhkAsaaCC9r/kKACnGt823oYC0t
 maDHFltANKobO4JEFFHWG44XrLYwJE30PMs86y5u22ng/K4c0HeDFgbbx4W5Xkv+ZyA/RM
 wFjner8Em0gZ6ShZ7qwQXRXeXsiUzgGfOvnncCeLZ/0rmrEA3/dIXm1XlZlf3PAJLLBW8v
 yQfTk1dwVWqP4y8Tr6kJKw0Rl+LXID5hW1yv1dZNzBjMqapCkFK/KP5JnYanV4DGJ1eb7I
 Y/fNAwtwoM0NOlbOqSeVY/DKRVfJkVcuivk5GTWSDnftlFX0RpKl2eXdZ3LTrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZTMYCAFe
Subject: Re: [Buildroot] linux-firmware-bump-to-20221109.patch
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

Hello Stephan,

On Thu, 08 Dec 2022 22:10:25 +0100
Stephan Henningsen <stephan@asklandd.dk> wrote:

> linux-firmware.mk: bump to release 20221109
> linux-firmware.hash: add hash of bumped tarball, remove hash of deleted 
> files
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>

I'm afraid that as others have pointed out, your patch arrived badly
damaged on the mailing list. Please use git send-email, or teach your
e-mail client to not line-wrap the contents of the e-mails you're
sending when they contain a patch.

Nevertheless, I took your patch "manually" and applied it. However, I
reverted the parts where you removed the hash of some files: they still
exist in the newer version of linux-firmware. In addition, your hash
for the WHENCE file was wrong.

I fixed that up and made the following commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/bec9e5f7852f6fefb234877dff45916d921c4b18

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
