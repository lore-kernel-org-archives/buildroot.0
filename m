Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B6C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 10:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3EB40E22;
	Tue, 11 Mar 2025 10:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJ4UlHUnGIrK; Tue, 11 Mar 2025 10:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9D340E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9D340E2E;
	Tue, 11 Mar 2025 10:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 996A01C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C3540C06
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv8Gv85B4SIO for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 10:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA7D140BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7D140BC5
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA7D140BC5
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:22:46 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 58AF84408C7;
 Tue, 11 Mar 2025 12:22:40 +0200 (IST)
To: Daniel Palmer <daniel@0x0f.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250311101153.3567108-1-daniel@0x0f.com> (Daniel Palmer's
 message of "Tue, 11 Mar 2025 19:11:53 +0900")
References: <20250311101153.3567108-1-daniel@0x0f.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Tue, 11 Mar 2025 12:22:41 +0200
Message-ID: <87ikofamtq.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
Subject: Re: [Buildroot] [PATCH] package/musl: Add upstream patch to fix
 building strace on m68k
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Daniel,

On Tue, Mar 11 2025, Daniel Palmer wrote:
> Currently it's not possible to build strace on m68k when using
> musl because the version of musl in buildroot doesn't have the
> m68k specific definitions of POLLWRNORM and POLLWRBAND.
>
> This is already fixed upstream so manually apply the patch
> until the next release.

A link to autobuilder failure is missing:

  http://autobuild.buildroot.net/results/ec3de790a66373f270f731519e2ef51c293ba683/

> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  package/musl/0006-m68k-fix-poll.patch | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/musl/0006-m68k-fix-poll.patch
>
> diff --git a/package/musl/0006-m68k-fix-poll.patch b/package/musl/0006-m68k-fix-poll.patch
> new file mode 100644
> index 000000000000..45d5dcede459
> --- /dev/null
> +++ b/package/musl/0006-m68k-fix-poll.patch
> @@ -0,0 +1,25 @@
> +From b09e3174a695d1db60b2abc442d29ed3f87f0358 Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Wed, 7 Aug 2024 08:51:03 +0300
> +Subject: m68k: fix POLLWRNORM and POLLWRBAND
> +
> +As noted in commit f5011c62c3 ("fix POLLWRNORM and POLLWRBAND on mips")
> +m68k uses a different definition.

You should add your sign-off and an upstream tags here.

See the manual:

  https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

> +---
> + arch/m68k/bits/poll.h | 2 ++
> + 1 file changed, 2 insertions(+)
> + create mode 100644 arch/m68k/bits/poll.h
> +
> +(limited to 'arch/m68k/bits/poll.h')

What is this comment meant to say?

baruch

> +
> +diff --git a/arch/m68k/bits/poll.h b/arch/m68k/bits/poll.h
> +new file mode 100644
> +index 00000000..00063f41
> +--- /dev/null
> ++++ b/arch/m68k/bits/poll.h
> +@@ -0,0 +1,2 @@
> ++#define POLLWRNORM POLLOUT
> ++#define POLLWRBAND 256
> +-- 
> +cgit v1.2.1
> +

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
