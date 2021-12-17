Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A56C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B15B584DA6;
	Fri, 17 Dec 2021 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LyWgrZwygMRq; Fri, 17 Dec 2021 21:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C88984C8A;
	Fri, 17 Dec 2021 21:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 317991BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDAF40C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2rp1yH0fxPS for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:49:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFD6740192
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:49:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E73BBE0005;
 Fri, 17 Dec 2021 21:49:34 +0000 (UTC)
Date: Fri, 17 Dec 2021 22:49:34 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211217224934.5e14f4cb@windsurf>
In-Reply-To: <20211014093952.1943717-1-herve.codina@bootlin.com>
References: <20211014093952.1943717-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php-lua: new package
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

On Thu, 14 Oct 2021 11:39:51 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> The php-lua package provides a PHP extension that embeds the lua
> interpreter and offers an OO-API to lua variables and functions.
> 
> https://pecl.php.net/package/lua
> 
> Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> Two patches are present and were retrieved from the following
> upstream pull request in order to support PHP8:
> https://github.com/laruence/php-lua/pull/47
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  DEVELOPERS                                    |  4 ++
>  package/Config.in                             |  1 +
>  ...TATIC-ZEND_ACC_STATIC-for-static-met.patch | 26 ++++++++
>  ...0002-php8-explicitly-declare-arginfo.patch | 66 +++++++++++++++++++
>  package/php-lua/Config.in                     |  8 +++
>  package/php-lua/php-lua.hash                  |  2 +
>  package/php-lua/php-lua.mk                    | 39 +++++++++++
>  support/testing/tests/package/test_php_lua.py | 62 +++++++++++++++++
>  8 files changed, 208 insertions(+)
>  create mode 100644 package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch
>  create mode 100644 package/php-lua/0002-php8-explicitly-declare-arginfo.patch
>  create mode 100644 package/php-lua/Config.in
>  create mode 100644 package/php-lua/php-lua.hash
>  create mode 100644 package/php-lua/php-lua.mk
>  create mode 100644 support/testing/tests/package/test_php_lua.py

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
