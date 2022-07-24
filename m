Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7787C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2A461178;
	Sun, 24 Jul 2022 14:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2A461178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWwWY75TaCcE; Sun, 24 Jul 2022 14:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD9F60BC7;
	Sun, 24 Jul 2022 14:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD9F60BC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D23151BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACBE984C3C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBE984C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDXEp5_hPEvA for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:56:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3211184971
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3211184971
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:56:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7002B1BF203;
 Sun, 24 Jul 2022 14:56:32 +0000 (UTC)
Date: Sun, 24 Jul 2022 16:56:31 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220724165631.708af168@windsurf>
In-Reply-To: <e7d99988-6353-5cb8-0202-5a045eb57a88@phobosdpl.com>
References: <394b4fbb-5d72-92ea-ccf3-3cbc47a0c1a9@phobosdpl.com>
 <e7d99988-6353-5cb8-0202-5a045eb57a88@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658674592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSh82K+wF0M697wdO8CFLOL5W8Am5tsnxOmWUivpkk0=;
 b=kwIhVFn42GNqBujb5/yhTZkuv7ki0NG9LERCIORIw1dt/QTTVtgOxusIGJb230J6l7NGpX
 KUn2dac8qgBhO33WzkPdxa3qKRQ7ZUrQuOZgwODBhulYbIHffibzCBczoai48kPb3zPudC
 s69CCq2kWHQSp+6c/cITAGRKU4Qf7j/t9hITIpirfGlSeqVaOt34/Ha/sDjfXrZO5wI1lY
 6RsBg8bqsz1bUrBeGqk7ddOjDPSTZuOAikR9eKIOPbomPK1HnqA4RX5c3XnDOtncxt6r2/
 EGPIA66OME6iso/pmP6SW8p0Z8OzkGkwufs2xv1Irj7DK0c3+ktILxqK9zHLXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kwIhVFn4
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

Sen,

On Sun, 24 Jul 2022 09:36:20 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> >  * Sorting is now very slow, to the point that Firefox complains that
> >    the page is slowing down the web browser. It was instantaneous in
> >    the old code, but way faster.>  
> 
> Wow, dang I see what you mean. I was doing testing with relatively
> *small* defconfigs. Looks like the bottleneck is actually at the end
> when calling packageGrid.append(element). I'll dig into it.

Thanks:

> >  * The "Latest version" cell is no longer with a dark orange/red
> >    background when the version doesn't match with the "Current
> >    version", these cells now have a green background, making one think
> >    that the package is up-to-date in Buildroot.
> >   
> Ah, that's a cascade order issue. Fix is to move the
> ".correct, .nopatches, .good_url..." rule above the
> ".wrong, .lotsofpatches, .invalid_url..." rule.

OK. I guess you'll send a patch to fix this.

> >  * When sorting on a column, a small arrow appears indicating that the
> >    sorting has been done based on this column. But then when you sort
> >    by another column, the arrow appears on this new column, but doesn't
> >    disappear on the old one, so you no longer know which column was
> >    using for the sorting.
> >   
> This is *kind of* a feature? sortGrid()'s sorting is cumulative, so they
> are all *technically* being used for sorting. This means the table is
> not *reset* to its original state before every sort.
> For example, sorting by (clicking on) "Infrastructure", then "License"
> will yield a different sort (row order) than sorting by "License",
> *then* "Infrastructure". An actual table "reset" is achieved with
> sorting by "Package" ascending (down arrow). I must admit though, after
> the table is reset the other arrows are meaningless until clicked on
> again. That is definitely misleading, so no matter what arrows *should*
> be reset after a table reset. I guess I didn't realize my sort behaved
> differently in this regard. Whatever behaviour you think is most
> appropriate (the original or cumulative), I'll make it do that.

Yeah, Arnout told me the same thing, but I find that not obvious.
Indeed, you then simply have arrows on two (or more) columns, and then
don't remember which one you clicked first, and which one you clicked
afterwards. So basically, if you don't remember in which order you
clicked, you have no idea based on what sorting rules the current table
is listed.

> > Do you think you could have a look at those issues?
> >   
> Yes. As a clerical note, should I do multiple patches, a patch series or
> one big one?

Either multiple separate patches sent individually, or grouped as a
patch series, but not a "big one" :-)

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
