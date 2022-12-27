Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F59C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C9A84042B;
	Tue, 27 Dec 2022 19:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9A84042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhZ2vGuApaTk; Tue, 27 Dec 2022 19:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ABF34018F;
	Tue, 27 Dec 2022 19:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ABF34018F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9031A1BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E72D4018F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 19:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E72D4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoYyFj2Ky2ms for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 19:57:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A36400CE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28A36400CE
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 19:57:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 921A11C0008;
 Tue, 27 Dec 2022 19:57:27 +0000 (UTC)
Date: Tue, 27 Dec 2022 20:57:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227205724.4500c37c@windsurf>
In-Reply-To: <20221226211910.552376-1-fontaine.fabrice@gmail.com>
References: <20221226211910.552376-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672171048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE46jPV4tRVWHu8fwwjkBs9o/HRmRLManL3AqTdx8DY=;
 b=m2mtnZotsHOIaWMee0X1sauf47e1/ocdsQc2dZ0MNf+zX+ujbvtGh//2LeQc2tTh4S5+Pt
 s+rUHWmZiJVdFGv8zPggNf4EsrKbkcUzQ63Q1HnwcM9sAAsIzEjviT2wbdNf2nxUGPpmkM
 Z59V1T/GclXTMp69ZU1XQmlFAsVj6609b+mVgmteiSMSIyjU2mByAvp3atwg6/w+FvdR/e
 6dm9fUqBWwds0uVIvRYPI4+5SXPgkOXuA5kMpNvydbR3wRaOxIqGefgHTP/vphJ0nEXvYi
 jLpfqAI9l611vZbacZoEuO56do7OnSznnv/NdApb75BsnMmjT18951UNPEKOSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m2mtnZot
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: fix build with arm
 soft float
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Dec 2022 22:19:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with arm soft float raised since bump to
> version 1.15 in commit c31087182fa545784d9a0a01f0b32715d78c3955 and
> https://github.com/ebiggers/libdeflate/commit/84c76f6f2cf5e5ac4deca0b1c25faebb42469f58:
> 
> In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
>                  from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/11.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>    31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>       |  ^~~~~
> In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
> /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h: In function 'clmul_u32':
> /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:9: error: unknown type name 'uint64x2_t'; did you mean 'uint16x2_t'?
>   262 |         uint64x2_t res = vreinterpretq_u64_p128(
>       |         ^~~~~~~~~~
>       |         uint16x2_t
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1445dcbf676893133f311a92ac21b29237fb75df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...or-due-to-PMULL-enabled-without-NEON.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch

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
