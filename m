Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:37:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE3860F35
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECE3860F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECC982C2E;
	Sun, 17 Oct 2021 09:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoWOvPwRv_Nj; Sun, 17 Oct 2021 09:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F8CC82B84;
	Sun, 17 Oct 2021 09:37:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1D31BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A934027A
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAnuRKaej7EX for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:37:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6F15401B7
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:37:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6C59CC0005;
 Sun, 17 Oct 2021 09:37:18 +0000 (UTC)
Date: Sun, 17 Oct 2021 11:37:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20211017113717.3f642315@windsurf>
In-Reply-To: <20211011212125.402086-3-glex.spb@gmail.com>
References: <20211011210241.396390-1-glex.spb@gmail.com>
 <20211011212125.402086-1-glex.spb@gmail.com>
 <20211011212125.402086-3-glex.spb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 2/2] package: add smpq
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
Cc: Samuel Martin <s.martin49@gmail.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gleb,

On Mon, 11 Oct 2021 22:21:25 +0100
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> smpq is a utility for manipulating Blizzard MPQ archives.
> 
> smpq is a build-time dependency of several source ports /
> reimplementations of Blizzard games, such as DevilutionX.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Thanks for this contribution. Could you clarify practical speaking in
which context this library is useful?

> --- /dev/null
> +++ b/package/smpq/smpq.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# smpq
> +#
> +################################################################################
> +
> +SMPQ_VERSION = 1.6
> +SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
> +SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
> +SMPQ_LICENSE = GPL-3.0+
> +SMPQ_LICENSE_FILES = LICENSE
> +SMPQ_DEPENDENCIES = stormlib
> +HOST_SMPQ_DEPENDENCIES = host-stormlib
> +SMPQ_CONF_OPTS += -DWITH_KDE=OFF
> +HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF
> +SMPQ_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))

Why do you need a host variant of this package? It isn't used by
anything else. Could you clarify this?

Note: for both of your package submissions, the commit title should be
"package/<foo>: new package". And also, in each patch adding the
packages, you need to add yourself in the DEVELOPERS file for this
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
