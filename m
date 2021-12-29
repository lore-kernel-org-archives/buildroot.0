Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C30EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 065CA40447;
	Wed, 29 Dec 2021 23:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXUo9d_puqbi; Wed, 29 Dec 2021 23:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32257403F9;
	Wed, 29 Dec 2021 23:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 486A31BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354534091E
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A895jKiKdr2V for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21314408E2
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:13:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EBC45FF808;
 Wed, 29 Dec 2021 23:13:40 +0000 (UTC)
Date: Thu, 30 Dec 2021 00:13:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230001339.52bf757d@windsurf>
In-Reply-To: <20211014225849.832479-9-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-9-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 08/11] package/python-pyalsa: add
 0001-fix-pytuple-set-item-usage-no-return-value.patch
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Thu, 14 Oct 2021 15:58:46 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> This patch is a backport of commit 5ea2f8709b4d091700750661231f8a3ddce0fc7c and
> fixes compatibility with python 3.10.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...tuple-set-item-usage-no-return-value.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch

This patch is no longer needed: commit
1055ae6c6b307331ff50d9e3dfaa82a37c8f9038 has updated python-pyalsa to
version 1.2.6, which includes the fix for Python 3.10 build.

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
