Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555A8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E5940888;
	Sun, 26 Dec 2021 22:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jOF7ppzoRmT; Sun, 26 Dec 2021 22:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6484029B;
	Sun, 26 Dec 2021 22:36:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0D391BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE5F840441
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcxyJ2oGPxdQ for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:36:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77ACD40298
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:36:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C4AA0100005;
 Sun, 26 Dec 2021 22:36:15 +0000 (UTC)
Date: Sun, 26 Dec 2021 23:36:15 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211226233615.54193e4c@windsurf>
In-Reply-To: <20211226180621.1350030-1-fontaine.fabrice@gmail.com>
References: <20211226180621.1350030-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-libust: set
 -DUATOMIC_NO_LINK_ERROR
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 26 Dec 2021 19:06:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set -DUATOMIC_NO_LINK_ERROR as suggested by upstream in
> https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html to
> avoid the following build failure with lttng-tools raised since bump to
> version 2.13.1 in commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-gnu/9.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/liblttng-ust-ctl.so: undefined reference to `_uatomic_link_error'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/066c72f04b4c82df3c5c6a75d2eef232d4468612
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lttng-libust/lttng-libust.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
