Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918FFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8887610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8887610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D28E403AC;
	Wed,  3 Nov 2021 22:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpVfLSbYJS3R; Wed,  3 Nov 2021 22:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 649EA4016A;
	Wed,  3 Nov 2021 22:38:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A22F41BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912D64016A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1KSBik1Gu6K for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:38:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CC0E40165
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:38:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BD43B40009;
 Wed,  3 Nov 2021 22:38:13 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:38:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211103233812.5fbbb1f7@windsurf>
In-Reply-To: <20211030215307.2155221-1-fontaine.fabrice@gmail.com>
References: <20211030215307.2155221-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: add missing C++
 comment for mysql
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 30 Oct 2021 23:53:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add missing C++ comment for mysql and while at it drops depends on
> MMU and threads which are always true
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index d44d4e4913..6873e6d5ab 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -377,13 +377,14 @@ config BR2_PACKAGE_COLLECTD_MODBUS
>  config BR2_PACKAGE_COLLECTD_MYSQL
>  	bool "mysql"
>  	depends on BR2_INSTALL_LIBSTDCPP # mysql
> -	depends on BR2_USE_MMU # mysql
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql

Regarding the removal of these, there is a school of thought that says
it's better to duplicate them, so that when the dependencies of mysql
change, it's a bit more obvious what to do.

>  	select BR2_PACKAGE_MYSQL
>  	help
>  	  Connects to a MySQL database and issues a "show status"
>  	  command.
>  
> +comment "mysql needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

That being said, what does this means for this comment? Should we talk
only about the C++ dependency, or also about the threads dependency ?

Arnout, Yann, Peter?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
