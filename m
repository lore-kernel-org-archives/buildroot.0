Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB03FC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 08:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 542064199A;
	Fri, 11 Apr 2025 08:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i610Fy2tILVk; Fri, 11 Apr 2025 08:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3ED419DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3ED419DD;
	Fri, 11 Apr 2025 08:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35038193
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 08:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2675E408C3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yJ2_NJXZuVU for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 08:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B18340F81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B18340F81
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B18340F81
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 08:02:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41827106F;
 Fri, 11 Apr 2025 01:02:06 -0700 (PDT)
Received: from debian (unknown [10.34.111.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B354C3F694;
 Fri, 11 Apr 2025 01:02:05 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:02:02 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <Z_jMel7v7-dj7O_i@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <20250410121450.1371559-1-vincent.stehle@arm.com>
 <a90dacbb25abd27002f06abf4d0784d3@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a90dacbb25abd27002f06abf4d0784d3@free.fr>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the build
 for macchiatobin
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

On Thu, Apr 10, 2025 at 09:54:41PM +0200, Julien Olivain wrote:
> Hi Vincent,
> 
> Thank you for the patch!
> 
> I have a minor change request. See below.

Hi Julien,

Thanks for the review!

The changes you propose make a ton of sense, of course. I will respin this
patch.

Best regards,

Vincent.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
