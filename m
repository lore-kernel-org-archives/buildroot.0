Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9745DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4274984CEB;
	Thu, 13 Jan 2022 21:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3KJqIfl93T2; Thu, 13 Jan 2022 21:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB29884CE2;
	Thu, 13 Jan 2022 21:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966541BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9143F40A6D
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGv4mq4IFHha for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:40:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 310334010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:40:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1A5AD100007;
 Thu, 13 Jan 2022 21:40:36 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:40:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220113224035.6423fb12@windsurf>
In-Reply-To: <20211222174905.71902-2-flaniel@linux.microsoft.com>
References: <20211222174905.71902-1-flaniel@linux.microsoft.com>
 <20211222174905.71902-2-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pahole: new host package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Dec 2021 18:49:04 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> pahole is a tool used to show data structure embedded in debugging information
> formats like DWARF.
> It is notably needed by the Linux kernel to generate BPF Type Format (BTF)
> information used by Compile Once - Run Everywhere (CO-RE) BPF tools.
> 
> To be built, pahole needs __LIB to be set to lib at stated in its README.
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>  DEVELOPERS                    |  3 +++
>  package/Config.in.host        |  1 +
>  package/pahole/Config.in.host |  6 ++++++
>  package/pahole/pahole.hash    |  3 +++
>  package/pahole/pahole.mk      | 18 ++++++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/pahole/Config.in.host
>  create mode 100644 package/pahole/pahole.hash
>  create mode 100644 package/pahole/pahole.mk

Applied to master with some minor formatting tweaks reported by "make
check-package". Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
