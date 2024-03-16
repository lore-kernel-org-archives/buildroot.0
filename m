Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007D8C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32F34157E;
	Sat, 16 Mar 2024 22:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEDrJP4aCaTl; Sat, 16 Mar 2024 22:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE934159C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE934159C;
	Sat, 16 Mar 2024 22:29:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9951BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7808860769
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvGZS_UeuZ1D for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D512605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D512605E6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D512605E6
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:29:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6660CFF803;
 Sat, 16 Mar 2024 22:29:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlcWb-001Xad-06;
 Sat, 16 Mar 2024 23:29:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240212143222.1555220-1-aperez@igalia.com>
 <20240212143222.1555220-2-aperez@igalia.com>
Date: Sat, 16 Mar 2024 23:29:09 +0100
In-Reply-To: <20240212143222.1555220-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 12 Feb 2024 16:32:18 +0200")
Message-ID: <87il1lkdze.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: security bump to
 version 2.42.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Fixes the following security issues:
 > https://wpewebkit.org/security/WSA-2024-0001.html

 > - CVE-2024-23222: Processing maliciously crafted web content may lead to
 >   arbitrary code execution. Apple is aware of a report that this issue
 >   may have been exploited. Description: A type confusion issue was
 >   addressed with improved checks.

 > - CVE-2024-23206: A maliciously crafted webpage may be able to
 >   fingerprint the user. Description: An access issue was addressed with
 >   improved access restrictions.

 > - CVE-2024-23213: Processing web content may lead to arbitrary code
 >   execution. Description: The issue was addressed with improved memory
 >   handling.

 > Add an upstream post-2.42.5 patch to fix an issue with an invalid
 > backport causing a build issue.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
