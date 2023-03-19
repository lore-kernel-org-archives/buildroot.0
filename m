Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D60DC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A9EE81378;
	Sun, 19 Mar 2023 16:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A9EE81378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0l8uL1A8BSA; Sun, 19 Mar 2023 16:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FAA812A8;
	Sun, 19 Mar 2023 16:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48FAA812A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA0F1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF13140873
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF13140873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJ7TyVb-l-8P for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:43:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE62A40869
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE62A40869
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:43:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 633CB1BF204;
 Sun, 19 Mar 2023 16:43:55 +0000 (UTC)
Date: Sun, 19 Mar 2023 17:43:54 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230319174354.0fee0a69@windsurf>
In-Reply-To: <20230319121659.88039-2-giulio.benetti@benettiengineering.com>
References: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
 <20230319121659.88039-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679244236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61+8iHj63Y2g+dhrlsiwhY6ur9iyB2V1MvqGSvi4TCo=;
 b=muqEno7n3qxycISQ91DOi7C7Nq1Of+us6FZF7hUEXIrqcjJzfkdCUs1KxFmJEZKKKsfgN0
 BL4Ic2noPdFe7II3TLollUKEy9z+Smn+bIh3+wZLveL/aY9+uBahKtyVkc7mHnBKAo90cG
 csMEeIKhQfv5z00Y/UCcNLt4tWYNtpZILyudq3MDS4bJMV/5zRSNjPg0uJxoODQATPMav4
 X8vYqUm9th3PpUBXDQrhUg+LGFPAavPMWWZaMNlg5jD8+nFjF4MmV5MhlcXFDWNOuJnudk
 Rxh3jL/g3Slac+pMlDkBtsl9H0s/2ozhUkimXjz1LA1oxodarloDbky34LKNmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=muqEno7n
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2023-03-13 on branch rtl8189fs
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Mar 2023 13:16:59 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> rtl8189fs branch is specific for rtl8189fs controller and diverged from
> master so let's switch branch from master to rtl8189s to fix runtime
> failure.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8189fs/rtl8189fs.hash | 2 +-
>  package/rtl8189fs/rtl8189fs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
