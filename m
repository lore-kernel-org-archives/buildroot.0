Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44C8C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E14681280;
	Wed, 26 Oct 2022 20:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E14681280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8WV0OK1o_sL; Wed, 26 Oct 2022 20:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5B98126C;
	Wed, 26 Oct 2022 20:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5B98126C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C34A31BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E1D740547
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E1D740547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baYMUlnRs-SF for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:00:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3700540571
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3700540571
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:00:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E935420003;
 Wed, 26 Oct 2022 20:00:10 +0000 (UTC)
Date: Wed, 26 Oct 2022 22:00:09 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221026220009.12ec01ee@windsurf>
In-Reply-To: <20221020141412.346992-2-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-2-tobias@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666814411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sm4d1FJjyFDsNihm7U5f6KMExxlM1oLbUJj3OYLF920=;
 b=gn8aQwWr9FISfB1g+XAKZzWM/zYQalnH56lVSQaZSrEMrZ0B8fqr4VTzRMSNpadB8E0/vb
 1hZBusmLuyeLZHGDMSTUENFDttgEp9GmrFy2Nk2pELBv+HmlljsVj2V/RDESCFChFSw6dw
 94AEZXOjctD4YpVFpREIWuduwPgOsLvVKAK0mzNlWyPMhlRidSyOXDbVpjq1NzHn6CUPAL
 4L8bHyOlyipRCFzB7T9H7YYPHqf911fVlZfKfOZlq8xcypO1tLVVIj5nqum/uCLN6z52f3
 BpI1PDqoyHoAd80yE2PsBBiOgrYEgf2MrFhNLYZfanxPIxeD880BR9jIFcYh2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gn8aQwWr
Subject: Re: [Buildroot] [PATCH 1/4] package/libbpf: fix cross compilation
 for 32-bit targets
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tobias,

Thanks for this patch!

On Thu, 20 Oct 2022 16:14:09 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> Add upstream patch that sources the library path (lib vs. lib64) from
> the compiler rather than from uname(1).

Could you copy/paste the details of the build failure that was
occurring, and provide details on the context it was occurring?

Indeed, when looking at the results of our autobuilders in terms of
failures when building libbpf, I don't see anything relevant:

  http://autobuild.buildroot.net/?reason=libbpf%

In recent months, we only had build failures on the S390x architecture,
that don't seem related to this.

>  ...cross-compilation-for-32-bit-targets.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
> 
> diff --git a/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
> new file mode 100644
> index 0000000000..3730b2fa41

Please put the patch directly in package/libbpf/. Putting it in a
1.0.1/ sub-directory is not needed. We only do that for packages where
multiple versions are used (like package/gcc, package/binutils for
example).

> --- /dev/null
> +++ b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
> @@ -0,0 +1,37 @@
> +From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
> +From: Tobias Waldekranz <tobias@waldekranz.com>
> +Date: Fri, 14 Oct 2022 21:14:14 +0200
> +Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
> +
> +Determining the correct library installation path (lib vs. lib64)
> +using uname(1) breaks in cross compilation scenarios where word widths
> +differ between the host and target system.
> +
> +Instead, source the information from the compilers '-dumpmachine'
> +option (supported by both GCC and Clang).
> +
> +We call this the "host" architecture, using the same nomenclature as
> +Autotools (--host configure option).
> +

Please add:

Upstream: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1

> +Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>

Could you send a v2 with those changes? I was about to do the changes
myself, but I really don't know which build failure this patch is
fixing so I couldn't fix that up myself in the commit log.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
