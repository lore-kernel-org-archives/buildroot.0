Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79793C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBAF81456;
	Mon, 25 Apr 2022 19:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwcmJfFncfPQ; Mon, 25 Apr 2022 19:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637EB81420;
	Mon, 25 Apr 2022 19:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20ABE1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F5B481420
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUbEEc9X5kwu for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4826812C3
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 19:09:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4702A60006;
 Mon, 25 Apr 2022 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650913783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqcgjbjkfSLqC/gfqtXk1GpH81pyruFwnQwnxuQlKUs=;
 b=XiDCLSuN6+qLYxthlN9BqHqwsUUnCm9r3VaHwEbQtYGmhxV1DZ+NJxmmE1r7K/A3FK44NO
 /+ufbxIt6OqDHQH94WbJKFl0sCARnsRUrWWPbe035SJ/Gohh4UCGOmbf/jhMBobid70qxx
 2C7IARoMbmqCFNnsBQgNxs/14Uugvm1IRWWr3j8Q+0P7CCoYsKoesqgKKQU4+iG5wpG74H
 OFDtBEXTZ2vtMuvF7y7+NeIZw7aScsyUye1HHp7SXBBSwkIDk6/APchuMBa8bv8Y/oojG5
 NojzBqhepgyzQD05tefUtAmQXlXVBZvpwqC0RRUj37IElSol/9geuksxedxl/Q==
Date: Mon, 25 Apr 2022 21:09:39 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220425210939.52c89b70@windsurf>
In-Reply-To: <20220424072016.3459504-1-francois.perrad@gadz.org>
References: <20220424072016.3459504-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.5.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Apr 2022 09:20:16 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
>  package/libressl/Config.in                                  | 2 ++
>  package/libressl/libressl.hash                              | 2 +-
>  package/libressl/libressl.mk                                | 2 +-
>  4 files changed, 5 insertions(+), 3 deletions(-)

Applied to master without the unnecessary change in the Config.in file.
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
