Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89778C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EE23404BF;
	Fri,  7 Jan 2022 17:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCW18Bsv8dAK; Fri,  7 Jan 2022 17:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32B25400E5;
	Fri,  7 Jan 2022 17:40:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4891BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169E5400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN3IlI_4QUxR for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:40:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A762340002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:40:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7B8DF40004;
 Fri,  7 Jan 2022 17:40:42 +0000 (UTC)
Date: Fri, 7 Jan 2022 18:40:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107184041.5a39d4e1@windsurf>
In-Reply-To: <20220106174949.1064731-1-fontaine.fabrice@gmail.com>
References: <20220106174949.1064731-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-modules: bump to version
 2.13.1
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

Hello,

On Thu,  6 Jan 2022 18:49:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add a dependency on kernel >= 3.0:
>   https://github.com/lttng/lttng-modules/commit/88eafb709ac811960b1163482f5d537cb18b32df
> - Add CONFIG_KPROBES to Config.in for kernel >= 5.7:
>   https://github.com/lttng/lttng-modules/commit/a65765406b03e4f3b7a4303e1c9ed83c86cdd358
> - Update license files and their hash because SPDX v3.0 identifiers are
>   used since
>   https://github.com/lttng/lttng-modules/commit/b7cdc18250880cc44edeef4a4b42c8ac7a135a6d
> - This bump will fix a build failure with kernel >= 5.6 thanks to at
>   least:
>   https://github.com/lttng/lttng-modules/commit/edfdcb685c3f56dde803244449f79ad7bed03798
> 
> https://github.com/lttng/lttng-modules/blob/v2.13.1/ChangeLog
> 
> Fixes:
>  - https://bugs.busybox.net/show_bug.cgi?id=14501
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lttng-modules/Config.in          | 12 +++++++++---
>  package/lttng-modules/lttng-modules.hash | 12 ++++++------
>  package/lttng-modules/lttng-modules.mk   |  5 +++--
>  3 files changed, 18 insertions(+), 11 deletions(-)

Applied to master, thanks. I suppose you will close the bug?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
