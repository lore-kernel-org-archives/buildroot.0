Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D4C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB42881467;
	Mon,  8 Aug 2022 20:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB42881467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgqed6QMko7z; Mon,  8 Aug 2022 20:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBEE281429;
	Mon,  8 Aug 2022 20:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBEE281429
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 987991BF291
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC504092C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC504092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpZKUS05peuc for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F8940928
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F8940928
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:45:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 54E6C60006;
 Mon,  8 Aug 2022 20:45:03 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:45:02 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220808224502.01c047b4@windsurf>
In-Reply-To: <20220403221953.1158787-6-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-6-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHS6Vq9oBrS8Zy1hrVL14Sezt/dOKWzEalRcJTXWiJY=;
 b=CNC2HfwjAYH0H8gDKWEJLJjg1hvDpPbbVt6i1EWWzeQ49XaNo41lg0MvTvWEUWfn5YksI1
 XN6ZKfZo2xoERKdRQ6ZDijkeOB6yE1AakW0d6mN6Nn2UZghCP5KAc98A9VARi5I8pdOjWq
 rHahdj8DtcIBJCTLKkxvYN+epx6EWdoiFK98+1FgCxkj3FpZHSSygeJEvGR2D63pGpXY2b
 YIvxIxqdnsfOK6JokGTbtIlre5VM33fPgSwWzFwET6qJaRqhWmCEjsQmO/vaMVwxn8qnhV
 Ws6TsH39MdoZNUJ/Qzn1sT9AHg0+IljM/mIa9Cu0c6YlGJsHTnlXygZnZBiMRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CNC2Hfwj
Subject: Re: [Buildroot] [PATCH 6/6] package/python-crossbar: fix
 configuration
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

On Sun,  3 Apr 2022 19:19:53 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> From: ecorm <ecorm@users.noreply.github.com>
> 
> Fixes configuration and patches setup requirements so that
> python-crossbar can build and run.
> See https://github.com/crossbario/crossbar/issues/1936 for discussion
> with Crossbar author.
> Fixes: #14556
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> ---
>  .../0002-Remove-idna-requirement.patch        | 29 ----------
>  ...002-Resolve-conflicting-requirements.patch | 57 +++++++++++++++++++
>  package/python-crossbar/Config.in             | 21 +++----
>  3 files changed, 68 insertions(+), 39 deletions(-)
>  delete mode 100644 package/python-crossbar/0002-Remove-idna-requirement.patch
>  create mode 100644 package/python-crossbar/0002-Resolve-conflicting-requirements.patch

I have applied, with a number of changes:

 - The patch 0002-Resolve-conflicting-requirements.patch is replaced by
   a more general patch that removes indirect dependencies from
   requirements-min.txt.

 - The test case for crossbar is changed to no longer force autobahn to
   use umsgpack, as we now use msgpack, expected by default by autobahn.

The minimal Crossbar test case we have in
https://git.buildroot.org/buildroot/tree/support/testing/tests/package/sample_python_crossbar.py
runs correctly.

If you have some suggestions of other things to test (simple tests) to
better validate the Crossbar installation, it would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
