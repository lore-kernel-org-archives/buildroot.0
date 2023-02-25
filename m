Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52308C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF96740BC8;
	Sat, 25 Feb 2023 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF96740BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDfJKlO3W2oQ; Sat, 25 Feb 2023 21:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3428240BC6;
	Sat, 25 Feb 2023 21:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3428240BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 945301BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C100415F6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C100415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnSjKnNTovjr for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 101DC4156E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 101DC4156E
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10670240002;
 Sat, 25 Feb 2023 21:02:28 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220227.0b3b6385@windsurf>
In-Reply-To: <20230225111252.1658233-1-fontaine.fabrice@gmail.com>
References: <20230225111252.1658233-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gx39R93L+CuYTV0i6zuyX0GLmlRrUGjGxrzzUOm+aPw=;
 b=OEZgstC+cxe3g22QtqS7sTQbn8mYjoa08EhbtE1qLZsvhymRrZBHd/M9kGJiB0afRMwlCa
 yV+Pt4KcdRIB0R5p2gmYifVbhZBAYT/HOaM75rkcubtv5NnsLi3G2xCuBnAfnZZu8jfllS
 fWPENMHX2MI3ZiQwbLph+rJih8Y0wfxMo3QH2HYZJVKob20XAGh8JuNIOD8E3P8FKCznIn
 2p7eMPBDjEhrDL+Txm/aAsjpm+rzS7dKjs+0G4ypSgfapy4KSJujmLwwTwwWSB9r2Gi+bc
 sIhGl3tM+lcFOnZBf0nth+qyMETFPFhtJFZLTWj2qD1FG+H08lSt+c/xSpFh2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OEZgstC+
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python > 3.10
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

On Sat, 25 Feb 2023 12:12:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with sigrok-cli and python > 3.10:
> 
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mips64-buildroot-linux-gnu/11.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/bin/../mips64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/435ad19597a1e216a7974bc9ccaf17064d1eccea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-Use-python3-embed-pc-as-a-fallback.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch

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
