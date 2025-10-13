Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B24CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF4B60A41;
	Mon, 13 Oct 2025 18:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDlzbjDnUyrX; Mon, 13 Oct 2025 18:04:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A99E60A47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A99E60A47;
	Mon, 13 Oct 2025 18:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EB0BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E65DC60A50
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mwwsI_XThRy for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB5C960A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5C960A47
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5C960A47
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:04:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03EBA113E;
 Mon, 13 Oct 2025 11:04:21 -0700 (PDT)
Received: from debian (unknown [10.57.6.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C0C43F738;
 Mon, 13 Oct 2025 11:04:28 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:04:25 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
Message-ID: <aO0_KQPauWkz8Cye@debian>
Mail-Followup-To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu>
 <aOi9aehsauNaVtWI@debian>
 <1148a6fa-9de0-444f-9a4e-d6a91c598dc3@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1148a6fa-9de0-444f-9a4e-d6a91c598dc3@bubu1.eu>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

On Fri, Oct 10, 2025 at 03:47:32PM +0200, Marcus Hoffmann via buildroot wrote:
(grep --line-buffered option)
> Ah, this makes sense, I think I have notices this delay here mostly in CI,
> where sometimes there's no output for minutes. This seems to improve that.

Hi Marcus,

This change of behaviour in your CI messages output rate is an unexpected side
effect!

I think that without any option, grep and sed adapt their output buffering
policy automatically in the same way, depending on what they are connected to (a
terminal or something else).

Now that sed is the last program in the pipeline, I would expect that it would
still buffer its output in your CI case, as grep was doing.

If you fancy, you could try to add the "--unbuffered" option to sed command line
and see if that changes its behaviour in your CI:

  |sed --unbuffered -E 's/^([0-9T:-]{19}) [[:print:]]*(.*>>> )/\1 \2/'

> 
> This should probably mentioned in the commit message.

The intention was to avoid any visible change in term of buffering; sed should
have replaced grep in that sense.

Best regards,
Vincent.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
