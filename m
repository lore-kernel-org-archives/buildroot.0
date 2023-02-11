Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA53C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 09:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD6A402F6;
	Sat, 11 Feb 2023 09:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD6A402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F78bsCxJhQS6; Sat, 11 Feb 2023 09:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD74F402E0;
	Sat, 11 Feb 2023 09:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD74F402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319CA1BF279
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1852F402E0
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1852F402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYiLW6VHVw8W for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 09:49:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E1AC402D4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E1AC402D4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:49:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2452A24000D;
 Sat, 11 Feb 2023 09:49:35 +0000 (UTC)
Date: Sat, 11 Feb 2023 10:49:34 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230211104934.4c34267c@windsurf>
In-Reply-To: <20230210233658.3763549-1-romain.naour@gmail.com>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676108976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyyewtrc7MwHsyM7STcdCqC0ajrkXC8gAOxfTaQF55o=;
 b=N3wMLFT86ss84Z8uJYn9c643iDxL6ZWtgUWJgp7j3EF+18CnLJtvctcfVVR75TuZug5EJP
 Ly46CAAp3/E06sGpt4Qnt1Eo4hwtzvaIUXU9YHCR9HRn6wWMhLqlI1vHZvjN0EtG/ZQ+Hh
 uPluWFuC2nqKcgyzCmBEihNKqBylrqu6PSNEWqe2Qf9dYbVEKn0hAFVxAnZULnzjJkwHZD
 JibNnXiMoruAtWEjo84DyQmqT/2zt9dS909V8i9SHQUA3IXJbaezeTLUJQHtnW37erVnsq
 QuF3hf93sIZkMhH0LLfHxs8hNUS8WjOr5AQbmuOYmLOksoWrWyuETkT/fVr28g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N3wMLFT8
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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

On Sat, 11 Feb 2023 00:36:58 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> The toolchain-builder project reported an issue with Qemu 7.2.0 for
> x86-core2--glibc--bleeding-edge toolchain [1]:
> 
>   Run /sbin/init as init process
>   random: fast init done
>   EXT4-fs (vda): warning: mounting unchecked fs, running e2fsck is recommended
>   EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disabled.
>   Starting syslogd: OK
>   traps: syslogd[52] general protection fault ip:b7e21465 sp:bfe59e6c error:0 in libc.so.6[b7d9b000+123000]
>   Starting klogd: OK
>   traps: klogd[56] general protection fault ip:b7e94465 sp:bf8f069c error:0 in libc.so.6[b7e0e000+123000]
>   Running sysctl: traps: logger[62] general protection fault ip:b7e48b6c sp:bfd7d194 error:0 in libc.so.6[b7e05000+123000]
>   Segmentation fault
>   traps: logger[64] general protection fault ip:b7dd3b6c sp:bf9b8604 error:0 in libc.so.6[b7d90000+123000]
>   Segmentation fault
> 
>   (Followed by a kernel panic.)
> 
> Testing with the pevious Qemu release (7.1.0) allows to boot the system without any problem.
> 
> Building qemu sources between 7.1.0 and 7.2.0 allows to identify the first "bad" commit [2] and
> report to the Qemu project [3].
> 
> Thanks to Qemu maintainers review, several issues was noticed:
> 
>   "The default i386 busybox build config does not respect glibc's requirements around stack alignment
>   (see [4] for previous discussions and a workaround)."
> 
> Disabling CONFIG_STACK_OPTIMIZATION_386 option (as suggested in the Gentoo bug report) fixed the issue!
> 
> This option has been added and enabled by default in buxybox 1_29_0, so it was used since then the for
> Buildroot's qemu defconfig.
> 
> Note: The x86-i686--glibc--bleeding-edge (generic x86) doesn't trigger the issue with
> CONFIG_STACK_OPTIMIZATION_386 enabled.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
> 
> [1] https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
> [2] https://gitlab.com/qemu-project/qemu/-/commit/958e1dd1300f37f18b2161dfb4eb806fc8c19b44
> [3] https://gitlab.com/qemu-project/qemu/-/issues/1478
> [4] https://bugs.gentoo.org/725674

Thanks a lo for the great investigation. Do we understand precisely
what is happening? The link at [4] does not really have an explanation,
it only has experimental observations that lead to the conclusion that
disabling CONFIG_STACK_OPTIMIZATION_386 is a work-around, but it does
not really explain what is happening.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
