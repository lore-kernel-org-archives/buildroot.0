Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28612C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA784840D1;
	Mon, 30 May 2022 19:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e03_Zq0wlWQL; Mon, 30 May 2022 19:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95DC840C3;
	Mon, 30 May 2022 19:31:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30B781BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E56240C72
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aInljkqv1GHR for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:31:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB9F4409C1
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:31:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4EFAE0007;
 Mon, 30 May 2022 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653939067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=et3LHcQh4KzI5dXF37BMWZgal5WtuwbSc5ql4JIdWf0=;
 b=J4gB8RiCW7ZfKXYTtoif+IH+P1qSBAH8AkvfVKZzb1QiZwW4LqzCJZCfAYE6YdZc81ytSa
 6AmLq/+tMnJlE7j7CJbY3dU3nvRc7cQmxXFOJ1sBDbmOetA/3sur6BEHbePjw3LnMLpWy7
 7gD16GcGE1ZzUNz7lk02KF3hwwtv/YxBFQQaj/nq0HgyVwk6UXHSMYr2yBd5Kw0CUvOc59
 PT6BdF9dDCvqXOjA6o7jLq1XqkPkiOXe6p7ziagCg68lrogWbzawlhnl8o5yQAT8XVEZX8
 ToYvxyhp+kulCcCqCQfink6dSpC5NNn/3c4yu3t8qNVmh3AKpk8ehPkxicSO/A==
Date: Mon, 30 May 2022 21:31:04 +0200
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
Message-ID: <20220530213104.3f8755d4@windsurf>
In-Reply-To: <20220530033836.474926-6-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-6-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 05/11] package: python-kflash: Kendryte
 K210 UART ISP Utility
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien,

On Mon, 30 May 2022 12:38:30 +0900
Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:

> Add the kflash Kendryte K210 UART ISP Utility as a host package to allow
> users to program their board boot ROM or SRAM with built images.
> 
> The kflash utility is available through the pypi.org python package
> index. The project is homepage is: https://github.com/vowstar/kflash.py.
> 
> kflash depends on the python-serial and python-pyelftools packages.
> These packages are modified to add the host package definition.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  DEVELOPERS                               |  3 +++
>  package/Config.in.host                   |  3 +++
>  package/python-kflash/Config.in.host     |  9 +++++++++
>  package/python-kflash/python-kflash.hash |  5 +++++
>  package/python-kflash/python-kflash.mk   | 15 +++++++++++++++
>  package/python-pyelftools/Config.in.host |  7 +++++++
>  package/python-serial/Config.in.host     |  6 ++++++
>  package/python-serial/python-serial.mk   |  1 +
>  8 files changed, 49 insertions(+)
>  create mode 100644 package/python-kflash/Config.in.host
>  create mode 100644 package/python-kflash/python-kflash.hash
>  create mode 100644 package/python-kflash/python-kflash.mk
>  create mode 100644 package/python-pyelftools/Config.in.host
>  create mode 100644 package/python-serial/Config.in.host

I have applied to next, after doing some changes:

 - I have split into a separate patch the addition of the host variant
   of python-serial

 - I have dropped the addition of package/python-serial/Config.in.host
   and package/python-pyelftools/Config.in.host, as these were not
   needed. We only add Config.in.host files for host packages that are
   directly "useful" to the user, not when they are just dependencies
   of another package.

 - I have fixed the commit title to match our coding style.

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
