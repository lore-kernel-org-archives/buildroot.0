Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173C04091F;
	Thu, 30 Dec 2021 17:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJlGoFBiKOn7; Thu, 30 Dec 2021 17:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60696408B9;
	Thu, 30 Dec 2021 17:12:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC411BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CAEA408B9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkDJVZK_Skay for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A0F540868
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:12:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A036EE0003;
 Thu, 30 Dec 2021 17:12:18 +0000 (UTC)
Date: Thu, 30 Dec 2021 18:12:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: moritz@h6t.eu
Message-ID: <20211230181217.1786552f@windsurf>
In-Reply-To: <20211019063914.58884-1-moritz@h6t.eu>
References: <20211019063914.58884-1-moritz@h6t.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtasn1: do not package tasn1
 programs and tests for target
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
Cc: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Moritz,

On Tue, 19 Oct 2021 08:39:14 +0200
Moritz Bitsch via buildroot <buildroot@buildroot.org> wrote:

> From: Moritz Bitsch <moritz@h6t.eu>
> 
> no included package depends on the tests or programs
> 
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/libtasn1/libtasn1.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Sorry for the long delay in getting back to you. I have applied your
patch, but after changing the approach to remove after installation the
3 programs from TARGET_DIR/usr/bin. There are pros and cons to both
approaches, I think the approach of removing an explicit list of files
is what we more commonly use.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
