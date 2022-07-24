Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DA6C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC3A61ABA;
	Sun, 24 Jul 2022 10:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC3A61ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aomenc8-lMTr; Sun, 24 Jul 2022 10:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25259617A0;
	Sun, 24 Jul 2022 10:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25259617A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 899F01BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1490741840
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1490741840
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQAWN2uWk9sB for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:29:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D8F417C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64D8F417C4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:29:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 839A5240004;
 Sun, 24 Jul 2022 10:29:40 +0000 (UTC)
Date: Sun, 24 Jul 2022 12:29:39 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220724122939.7cfe0f2d@windsurf>
In-Reply-To: <20220722191558.809011-1-sen@phobosdpl.com>
References: <20220722191558.809011-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658658580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G2XSf8wPFvEHF+CMKNFIDYF+AKDJiAB4N1Q/GnkmUo=;
 b=aLHbQSVy5rfv1iUkVqwrUwmbKXHAKSwGCZWpUQqYKd5bx1wBhHctc07g/t3HH/taaMMbJN
 aoiSyKBa6PwEqrzDbCqaePkpNLQT0fdb08roiE71TTZzW/yWB6dlSXDEcgLkUihr2m8XtQ
 wB0XxrySGiKxyBam82TTgUs92zeiqGa4TtD1AU4gbpBdhPClTzplaIgqarg6YVFUA+9uHq
 d4/rQTo40xY20QMjJ3+RtNM14Rl9duiQ2J1sUb8C5gtZvd8Nf8f8GAji2fSaCouBLj06Mg
 CfaWsLL5AUFoVvFH+o9dIONzJJapZjRL3qcFa9RZxGU4J8ErMXBBTc9Jm/w9UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aLHbQSVy
Subject: Re: [Buildroot] [PATCH v3] support/scripts/pkg-stats: migrate to
 CSS grid and inline javascript
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

Hello Sen,

On Fri, 22 Jul 2022 14:15:58 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> This migrates pkg-stats.html from html tables to CSS grid, allowing
> the use of newer, simpler javascript that is short enough to be
> inlined, instead of relying on externally hosted javascript.
> 
> Javascript sorting function was rewritten from scratch in ~55 lines,
> short enough to be inlined directly in the html.
> 
> Tables were redone in CSS grid, but with care taken to mimic existing
> "look and feel" of prevous implementation, albeit with slightly
> better responsive behavior and default styling characteristics.
> 
> Column labels are now "sticky" and stay stuck to the top of the
> viewport as you scroll down the page.
> 
> Also, css was rewritten in fewer lines and table elements were changed
> to divs (for grid support).
> 
> Other small misc fixes include quoted hrefs and document language
> declarations to make the w3c html validator happy.
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>

Thanks for this patch, but I'm seeing several issues now when I compare:

  http://autobuild.buildroot.net/stats/master.html (which uses your new code)

and

  http://autobuild.buildroot.net/stats/2022.02.x.html (which uses the old code)

Here is the list of issues:

 * Sorting is now very slow, to the point that Firefox complains that
   the page is slowing down the web browser. It was instantaneous in
   the old code, but way faster.

 * The "Latest version" cell is no longer with a dark orange/red
   background when the version doesn't match with the "Current
   version", these cells now have a green background, making one think
   that the package is up-to-date in Buildroot.

 * When sorting on a column, a small arrow appears indicating that the
   sorting has been done based on this column. But then when you sort
   by another column, the arrow appears on this new column, but doesn't
   disappear on the old one, so you no longer know which column was
   using for the sorting.

Do you think you could have a look at those issues?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
