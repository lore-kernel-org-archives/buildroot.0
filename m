Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96994C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436418149A;
	Fri, 29 Jul 2022 19:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 436418149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9SDZ3P0HsM4; Fri, 29 Jul 2022 19:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9208141F;
	Fri, 29 Jul 2022 19:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C9208141F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11EA41BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE7440C4F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE7440C4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsXW4_oH1_-D for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:58:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8C2401A2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC8C2401A2
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:58:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9A6E1BF204;
 Fri, 29 Jul 2022 19:58:16 +0000 (UTC)
Date: Fri, 29 Jul 2022 21:58:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220729215815.311acdad@windsurf>
In-Reply-To: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659124697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4HEF+T1/czpWeZzjF/LWqQwZ09oK+IXlCiH6d+7lC8=;
 b=ch77PRTORaiOQKK7N1TQU4SZDA9pYgbALplTlvHke9ncP/K4kUO3CsJXuvfc8o8BEZtQk5
 mRxXAjTJMb2kR6SpdWvwvQuqe7N/2NK5UmQAWIEDcBkVIGJYqzXGjLTYRp43Wfyc6XS6Ci
 eL1PmYkjRWgD7X6shx5ElejWgck7bkhTsk7eejTyIpO9Kz6XoaWuF1PjFkICFAJuy2D8bg
 fjam56xOpbFx4kNy8mfuuhcmw6t1z1B1nCXUMpl6n2QDX4g+0wCSBy6j7YGl+43olxJu+9
 4zZP1lQ/Ybmw5kz1l6pPRmz0hedJsCviAdAWk6w2cHw6eRu6/+9zE7WX/IpNEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ch77PRTO
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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

On Fri, 29 Jul 2022 17:46:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1 wrongly stated that "a
> configure script bundled with a package may be generated with an older
> version of Autotools, that may not yet support the --runstatedir option.
> This will give an "Unsupported arguments" warning and the option will be
> ignored.". Indeed, this will raise the following build failure with
> attr, libtirpc, readline, etc.:
> 
> configure: error: unrecognized option: `--runstatedir=/run'
> 
> So to support configure scripts using older version, the variable is set
> directly instead of using the --runstatedir argument.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c853f14773d875be30e32ae24daf80e181fef34e
>  - http://autobuild.buildroot.org/results/045211cd66cf78c3d89d2d8ac41ec4edf0b0ee58
>  - http://autobuild.buildroot.org/results/8c5160eef99de2f1f72f33d5e5ea94d417855b2c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Remove revert sentence

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
