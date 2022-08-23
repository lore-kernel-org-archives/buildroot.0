Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E490C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139FE81971;
	Tue, 23 Aug 2022 19:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 139FE81971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cc89xrdZyVNu; Tue, 23 Aug 2022 19:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552F58186E;
	Tue, 23 Aug 2022 19:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552F58186E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB3A1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B3240929
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B3240929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVlYuLb6TKD6 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:41:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2940440922
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2940440922
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:41:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 31D19240005;
 Tue, 23 Aug 2022 19:41:30 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:41:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220823214129.040b5206@windsurf>
In-Reply-To: <20220822084331.3261657-1-james.hilliard1@gmail.com>
References: <20220822084331.3261657-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hh5eFMImWGGXsMtRTPVVs4ZYaH0gwUFhSWkNy7kQeYQ=;
 b=FnVAYF9zTn46z5qrbgDlQUUSK9tvds31SDmKai0JmkpFaxjbhIMG/W/d2w/I/Zne8ktHn9
 +/IAyxxf2vbxzEptG0tOHu4+jjlc/fLRolAkyWAWS3pT0H26xLNu6OIidrZ2Q+Wg87geFZ
 nOPsz2Jv8Kds0u4epokh8tqQAmTFcy7tPLVWRuTFrXd0D5IdYED/4+A69eYvimJfFfXGGV
 uEi3ARTcjPGAgrpnXhR/YZ6y7LHt8KTcJ0eCcBpa5apIXctELyt/SuleVn4QZBZ9Z5bQuK
 4ENcYaNc34YzRqrzkoZbGmAKZ8hIj0Obyc89oZkCGJtgRnJEBGXh1J4RRbkXuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FnVAYF9z
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-inspect: bump to
 version 0.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Aug 2022 02:43:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-typing-inspect/python-typing-inspect.hash | 4 ++--
>  package/python-typing-inspect/python-typing-inspect.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
