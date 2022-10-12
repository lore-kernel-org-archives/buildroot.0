Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6678C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 09:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9FC41869;
	Wed, 12 Oct 2022 09:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9FC41869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QveSHm60E7Z; Wed, 12 Oct 2022 09:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145BD410D0;
	Wed, 12 Oct 2022 09:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 145BD410D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9370F1BF20F
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 09:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E34410D0
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 09:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E34410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzoeOeRPwIbz for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 09:36:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAED340880
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAED340880
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 09:36:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 46A65240017;
 Wed, 12 Oct 2022 09:36:34 +0000 (UTC)
Date: Wed, 12 Oct 2022 11:36:34 +0200
To: Leonid Yuriev <leo@yuriev.ru>
Message-ID: <20221012113634.1ae5d496@windsurf>
In-Reply-To: <14ff4a72-41f4-256c-aaa9-b1948391ba6d@yuriev.ru>
References: <20221011084540.jebe33uW@myt6-3efb34da3dd5.qloud-c.yandex.net>
 <14ff4a72-41f4-256c-aaa9-b1948391ba6d@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665567395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BNVjau2cLPlU4XdqCcOWCCWBxqxnHap1xoRz0/sTm0=;
 b=D5J1XteL/4a1kOhjegcB2ep2Z8KxtNoXWfeGovl8NrVaiwj5v9uyPGACjKHkeefIM2ndi2
 XQQZqbsaZYumMI3NPHVxVHnrngB3tQ3C6GRnj1Ud8gxrvyJpfdqoQsLvokUnu36nj2M+h9
 1Y7uV2d2lnqaSh2wQOJyjWg3RTa7WwdgobQhVjfWT4rw3l9RwtvR3zQkM80K3Z1e4pjQqD
 2WlVXZc01r0m1RhlROAx5x2+Njp0KazQqRS0B+E9/rt+5WPQyXVck1m+Rc8D9Jnn0/5DPh
 l4JH2IPm8htE4xjxshsebDMJlM7JW9n/J+vcyN2n95QgYrHIhPoZyZNxeuMzYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D5J1XteL
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-10
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

Hello Leonid,

On Tue, 11 Oct 2022 14:11:10 +0300
Leonid Yuriev <leo@yuriev.ru> wrote:

> Please fix the configuration error of toolchain for microblaze arch.
> 
> I already wrote about this problem at the beginning of the summer, and 
> then changed the diagnostic message to make the error more obvious.
> 
> Basically, the failed assertion (see below) checks that the width of 
> l_start end l_len fields of the struct flock are enough to hold values 
> of off_t type.
> So, the libc in the toolchain is misconfigured or/and has wrong layout 
> of headers, etc.

This particular configuration was built using the glibc C library. If
you believe there is a bug in glibc, I would suggest to fill in a bug
report at https://sourceware.org/bugzilla/.

Thanks for your help with this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
