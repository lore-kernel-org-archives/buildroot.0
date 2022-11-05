Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED679C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786F74089E;
	Sat,  5 Nov 2022 20:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786F74089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZN-JobfeAwg9; Sat,  5 Nov 2022 20:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E7F403C5;
	Sat,  5 Nov 2022 20:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E7F403C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0DB1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C9C84032A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9C84032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUMmf49N6m7g for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:40:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C666240393
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C666240393
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:40:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B188EC0003;
 Sat,  5 Nov 2022 20:40:37 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:40:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105214036.49e34b51@windsurf>
In-Reply-To: <20221103234342.351104-1-fontaine.fabrice@gmail.com>
References: <20221103234342.351104-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667680838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ccv20BGnu8Kcul9xp/OnSR046+sHxS1y+PuXgVa3Uc=;
 b=WPLKhMDoy8woddzATMNV0zx02RFIO5/hiHmUNqa5roZLlHkuH/Edv21BMsfmUBlKIDozIe
 S9cuFKBhTksZaTCaQcsn1d21z1XGwzYvXeUqPBhem5Pmwda/+bn9FJvUstJRwUznR0WPqT
 oytU85m9XQj/1nXjxEiAiisySOacH0ZY3NnRvO8+AunRWaMfTUyH9dTncG3J01Yz8yiyzv
 3Vm0dhEGwuqB9P4CSvgg7cUgF4A0KSPD8pdEAUc3ZHJ219g3vROdzSnHwnDbp5xPvNsWy3
 jB6+TjbJ1rkQUCIbXOIQJuvm2xfnVvsHteO2/mYP0IT957P4YUPJpnyegkYBAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WPLKhMDo
Subject: Re: [Buildroot] [PATCH 1/1] package/libqb: disable tests
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Nov 2022 00:43:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable tests to avoid the following build failure when check is
> enabled:
> 
> libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
>    11 | #include <gnu/lib-names.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> This build failure is raised since bump to version 2.0.6 in commit
> 2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf and
> https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libqb/0001-Add-disable-tests-option.patch | 62 +++++++++++++++++++
>  package/libqb/libqb.mk                        |  3 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 package/libqb/0001-Add-disable-tests-option.patch

So I have applied but like upstream said, I think the actual build
issue should be resolved. Disabling tests is really just a work around:
people who want to build tests will still face the same build issue. So
I had a look, and from my point of view, the <gnu/lib-names.h> include
is simply useless and can be removed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
