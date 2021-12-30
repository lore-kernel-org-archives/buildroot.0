Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73848131C;
	Thu, 30 Dec 2021 22:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SD2odeFzc-E; Thu, 30 Dec 2021 22:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCD7812FA;
	Thu, 30 Dec 2021 22:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFAED1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B1240374
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpVZoRjcmG8K for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:32:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6341740373
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:32:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 82AB0240003;
 Thu, 30 Dec 2021 22:32:28 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:32:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230233227.16670ae8@windsurf>
In-Reply-To: <20211230204103.282138-3-aduskett@gmail.com>
References: <20211230204103.282138-1-aduskett@gmail.com>
 <20211230204103.282138-3-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] package/python3-setuptools: bump to
 version 60.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 12:41:03 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/python-setuptools/59.8.0/python-setuptools.hash       | 4 ----
>  .../{59.8.0 => 60.2.0}/0001-add-executable.patch              | 0
>  package/python-setuptools/60.2.0/python-setuptools.hash       | 4 ++++
>  package/python-setuptools/python-setuptools.mk                | 4 ++--
>  package/python3-setuptools/0001-add-executable.patch          | 2 +-
>  package/python3-setuptools/python3-setuptools.hash            | 2 +-
>  package/python3-setuptools/python3-setuptools.mk              | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 package/python-setuptools/59.8.0/python-setuptools.hash
>  rename package/python-setuptools/{59.8.0 => 60.2.0}/0001-add-executable.patch (100%)
>  create mode 100644 package/python-setuptools/60.2.0/python-setuptools.hash

Unfortunately, this patch causes a build failure of python3:

  https://paste.ack.tf/23e101@raw

I'll mark it as Changes Requested for now, until this issue gets
resolved.

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
