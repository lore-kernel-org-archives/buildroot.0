Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCABDC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73EF460C15;
	Mon,  6 Feb 2023 21:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73EF460C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MV3Fl-a8ErOj; Mon,  6 Feb 2023 21:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7ABE60C12;
	Mon,  6 Feb 2023 21:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7ABE60C12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB8F11BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4042460C0E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4042460C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6--kS-oUPVID for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:23:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41DE560C12
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41DE560C12
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:23:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B38BFF805;
 Mon,  6 Feb 2023 21:23:01 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:23:01 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230206222301.16570876@windsurf>
In-Reply-To: <20220731193521.1217825-3-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-3-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imBFLTa0qqH9XwpffHVg855wfrILTI1jP6g1lqSkrrM=;
 b=fhfSBtXmF+ASIYxzgIqoaWB2cr7XHIOTPNrxNx1NuxX7V70VNxZZX6GneMcFOGN/P/jzju
 SSz7zfqkfg/4hjQ+4i4ooXkHtz3O0FdIoXJIue7sNYqlsAb8xhoO4HDZRIgl5Tcli0peKM
 hRwbeGEzMIu9iRv1TRKYXKIRd3W2y7nF2r7eAfu0TV4oOq6dALNmdYwPWFY3N3utIt+m9i
 C0zGTJGXT2nx32p7tMX44h8v5a+tX4dP3glU+SeJML/ffjXPYKTkY1foMB3JDGRtDHcRBV
 gKl2DByaiuIJtfQ0viVX4sh3IC9viDoeGFRULHTzVUdx1r5fepTFDBrAnVWUYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fhfSBtXm
Subject: Re: [Buildroot] [PATCH v2 02/14] support/testing: test
 check-package ignore list
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

On Sun, 31 Jul 2022 16:35:09 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Extend test_check_package to also check the ignore list functionality.
> Check:
> - the entries in the ignore list use relative path;
> - an entry in the ignore list actually ignores the warning;
> - an outdated entry in the ignore list generates a warning by its own,
>   preventing the ignoring list to grow indefinitely.
> 
> For this to work, add 3 test fixtures, listing entries for an
> pre-existing file in the br2-external used in the test.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

We adjusted the test cases to the changes we did on PATCH 01/14, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
