Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5CA61162;
	Fri, 17 Dec 2021 21:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8v-yK2dkY67Y; Fri, 17 Dec 2021 21:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08712610C3;
	Fri, 17 Dec 2021 21:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34CB41BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21E2640C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFSmM6fT1Vej for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:49:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCB3A40192
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:49:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 69D52FF805;
 Fri, 17 Dec 2021 21:49:25 +0000 (UTC)
Date: Fri, 17 Dec 2021 22:49:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211217224924.744be718@windsurf>
In-Reply-To: <20211011110756.510878-1-herve.codina@bootlin.com>
References: <20211011110756.510878-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Oct 2021 13:07:56 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> APCu is an in-memory key-value store for PHP.
> Keys are of type string and values can be any PHP variables.
> APCu only supports userland caching of variables
> 
> https://pecl.php.net/package/APCU
> 
> Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  DEVELOPERS                                    |  6 ++++
>  package/Config.in                             |  1 +
>  package/php-apcu/Config.in                    |  6 ++++
>  package/php-apcu/php-apcu.hash                |  2 ++
>  package/php-apcu/php-apcu.mk                  | 25 +++++++++++++
>  .../testing/tests/package/test_php_apcu.py    | 35 +++++++++++++++++++
>  6 files changed, 75 insertions(+)
>  create mode 100644 package/php-apcu/Config.in
>  create mode 100644 package/php-apcu/php-apcu.hash
>  create mode 100644 package/php-apcu/php-apcu.mk
>  create mode 100644 support/testing/tests/package/test_php_apcu.py

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
