Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E146CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 14:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA26340B4A;
	Fri, 17 Oct 2025 14:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByymV2pq5gny; Fri, 17 Oct 2025 14:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2422406A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2422406A7;
	Fri, 17 Oct 2025 14:40:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 790E0972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F58940A35
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPaE4w8_IeOP for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 14:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 725C4402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725C4402C3
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725C4402C3
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 14:39:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C531153B;
 Fri, 17 Oct 2025 07:39:50 -0700 (PDT)
Received: from debian (MacBookPro.nice.arm.com [10.34.128.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FF953F59E;
 Fri, 17 Oct 2025 07:39:57 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:39:54 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <aPJVOlZTJvdk65L8@debian>
Mail-Followup-To: Marcus Hoffmann <buildroot@bubu1.eu>,
 buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <a4c335e6-b2e3-487d-b6d8-60318059b195@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4c335e6-b2e3-487d-b6d8-60318059b195@bubu1.eu>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 17, 2025 at 04:12:34PM +0200, Marcus Hoffmann wrote:
> Hi Vincent,
..
> After testing this change for a few days now, I have two slightly odd things
> to report:
> 
> I have seen the following thing happen once during a CI run, where 2 of the
> lines where truncated in the middle of the timestamp. I have looked through
> a bunch of build logs now but haven't seen this again, so not sure if that's
> an actual problem we need to care about
> 
> 2025-10-14T10:28:01 >>> [something]
> 202
> 2025-10-14T10:28:01 >>> [more things]
> [... lots of stuff in between]
> 2025-10-1
> 
> 
> And secondly, also in CI:
> The "Done in Xmin Ys" text that is printed in the end is still always
> displayed in the middle of a line during the end of the build output:
> 
> 2025-10-17T08:52:28 >>> owfs 3.2p4 Installing to staging directory
> 2025-10-17T08:52:29 >>> owfs 3.2p4 Fixing libtool fDone in 7min 37s
> iles
> 2025-10-17T08:52:30 >>> owfs 3.2p4 Installing to target
> 2025-10-17T08:52:38 >>> python-pydantic-core 2.33.2 Installing to target
> 2025-10-17T08:52:52 >>> e2fsprogs 1.47.2 Building
> [...]
> 
> Adding the --unbuffered argument to the final sed call, fixes that.

Hi Marcus,

Thank you for the extensive testing!

What you described is a valid reason I think to add the --unbuffered argument to
sed; I will respin a v2.

Best regards,
Vincent.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
