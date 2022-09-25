Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EEFC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 18:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B7F40571;
	Sun, 25 Sep 2022 18:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B7F40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i40huEVur4z1; Sun, 25 Sep 2022 18:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B924052A;
	Sun, 25 Sep 2022 18:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B924052A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025B11BF32E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE96E82B9F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE96E82B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAKUiFdgEP3G for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 18:16:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6928C8277E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6928C8277E
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 18:16:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4a9f:7e6b:a045:201d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6D6595FF9E;
 Sun, 25 Sep 2022 20:15:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 20:15:57 +0200
Date: Sun, 25 Sep 2022 20:15:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925181557.GB1419013@scaer>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
 <20220925171932.1630739-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925171932.1630739-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664129763;
 bh=biwnQOiJiPBEl5GAKMmGf5qpkeP1hl2H6ApglxC0fTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8v9x/+CGmxLVkeIzZR8/jaTBMx8TPhr7d3UvR3cPn5SHSRFbRL+rS/Zd89v+Nro1
 KV/og6oNbFIck6WOmdHNOM+2UZEYZkBCL691bCT+Qjvsmd0zKEhE01ScUxfpFCrrLu
 zlAI077QT3mxHeqT3Zvlus8j8PLJX1eWvbNjf9MXmoDNf38evjXaBj1+RvshXWQPBp
 SuftzKmoBYN2r+2Mz1XSrJ3g0SfLaEpkdNP0Cn7fb95RVLrMJ9iyWXf8tzQ1PURUJD
 kCH6JpRSejlTK0Ofk5KHk1nK4xHYkEIHhH/j50b1BrzMD60RLrVm4wDpeLbtWXYkBb
 vNxe+MA8Y9wXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W8v9x/+C
Subject: Re: [Buildroot] [PATCH 3/4] package/nodejs: add patch to adjust
 default NodeJS search path
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-09-25 19:19 +0200, Thomas Petazzoni spake thusly:
> By default, NodeJS searches global modules in /usr/lib/node, but NPM
> installs them in /usr/lib/node_modules/. Therefore by default, if one
> installs modules with BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL, they are
> not accessible by NodeJS, unless by passing a
> NODE_PATH=/usr/lib/node_modules/ variable. Since this is not obvious,
> and it's nicer when things work out of the box, we simply patch NodeJS
> to look for modules at the right place.
> 
> See
> https://stackoverflow.com/questions/15636367/nodejs-require-a-global-module-package
> for some discussions on this topic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> I am not 100% sure this is the correct approach, and I would
> definitely like to get the feedback from some NodeJS people.
> ---
>  ...ules-cjs-loader.js-adjust-default-pa.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
> 
> diff --git a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
> new file mode 100644
> index 0000000000..b4692a4e5f
> --- /dev/null
> +++ b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
> @@ -0,0 +1,35 @@
> +From 4ed7de24fe18bb75b6e38922eb33141e2cec43dd Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 25 Sep 2022 11:10:06 +0200
> +Subject: [PATCH] lib/internal/modules/cjs/loader.js: adjust default path to
> + search modules
> +
> +NPM installs modules in /usr/lib/node_modules/, but by default NodeJS
> +searches for them in /usr/lib/node/. We could also set the NODE_PATH
> +environment variable, but it is more convienient to have NodeJS
> +configured by default to find modules where they are installed.
> +
> +This issue is discussed at
> +https://stackoverflow.com/questions/15636367/nodejs-require-a-global-module-package.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + lib/internal/modules/cjs/loader.js | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loader.js
> +index f1971c40a4..52fcd56125 100644
> +--- a/lib/internal/modules/cjs/loader.js
> ++++ b/lib/internal/modules/cjs/loader.js
> +@@ -1261,7 +1261,7 @@ Module._initPaths = function() {
> +     path.resolve(process.execPath, '..') :
> +     path.resolve(process.execPath, '..', '..');
> + 
> +-  const paths = [path.resolve(prefixDir, 'lib', 'node')];
> ++  const paths = [path.resolve(prefixDir, 'lib', 'node_modules')];

It looks like this is an array, so maybe we could keep the original
path, and add the npm installation path:

    const paths = [path.resolve(prefixDir, 'lib', 'node'),
                   path.resolve(prefixDir, 'lib', 'node_modules'),];

This, in case some ot-of-tree packages simply copy files into the
original .../node/ directory.

Alternatively, we could symlink node_modules to node.

Regards,
Yann E. MORIN.

> +   if (homeDir) {
> +     ArrayPrototypeUnshift(paths, path.resolve(homeDir, '.node_libraries'));
> +-- 
> +2.37.3
> +
> -- 
> 2.37.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
