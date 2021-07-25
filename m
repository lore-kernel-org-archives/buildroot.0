Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF17C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4406360551
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4406360551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6A26060E;
	Sun, 25 Jul 2021 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKeXdfTmmP0l; Sun, 25 Jul 2021 21:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC6A605B3;
	Sun, 25 Jul 2021 21:41:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB2801BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA916823F6
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJdL60Xy0vFp for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:41:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46D681BD6
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 21:41:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C0A2DE0004;
 Sun, 25 Jul 2021 21:41:08 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:41:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210725234107.48122620@windsurf>
In-Reply-To: <20210331200710.GH24043@scaer>
References: <20210331185001.24790-1-ps.report@gmx.net>
 <20210331200710.GH24043@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Pierre-Jean Texier <texier.pj2@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Wed, 31 Mar 2021 22:07:10 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Are you sure this is correct? Later on in that file, 'path' is forcibly
> assigned as thus:
> 
>     200       path[0] = '/';
> 
> And then, 'path' is used to start the daemon:
> 
>     527    else run_daemon(handle, path, argv);
> 
> So, if the original argv[0] does not start with a '/' (e.g. because it
> is called from the PATH), then 'path' will contain a mangled program
> name:
> 
>     argv[0] = "haveged"
>     path = strdup(argv[0]) = "haveged"
> 
> and thus with line 200:
>     path = "/aveged"
> 
> Did I miss something?

I agree with you that this is weird. *But* if you look at
https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00#diff-043ded6506fb937c60ed15d0e9cfe02d6de6c72bcbd0bb14b7ad5e64ee7a6713L19
which is the commit that introduced this, they really just added the
<sys/auxv.h> usage as an additional thing if the path doesn't start
with /. So what Peter's patch does it make that new "feature" compile
time conditional, while it didn't exist at all before.

So with Peter's patch, on uClibc, you're just back to exactly how
haveged was behaving in its 1.9.13 version.

But I agree overall that all this string manipulation dance looks very
fragile :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
