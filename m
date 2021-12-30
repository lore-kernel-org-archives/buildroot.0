Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE70C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2939828B3;
	Thu, 30 Dec 2021 14:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kliqi7UCQSuw; Thu, 30 Dec 2021 14:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CB6828A5;
	Thu, 30 Dec 2021 14:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 851531BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73800400F6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npGtu9Hmcl6M for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:21:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31EB6400A8
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:21:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 007671C0008;
 Thu, 30 Dec 2021 14:20:59 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:20:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230152059.465b21a8@windsurf>
In-Reply-To: <20200226090939.1810498-1-fontaine.fabrice@gmail.com>
References: <20200226090939.1810498-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next v3,
 1/1] package/font-awesome: make it compatible with fontconfig
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
Cc: Benjamin Calderon <benj.calderon@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Feb 2020 10:09:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This commit installs font-awesome in the standard fonts directory
> making it available systemwide.
> 
> Thanks to baruch for his technical critique.
> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Baruch Siach):
>  - Create a symlink to avoid duplication

I have applied with a reworked commit log. That being said, I am not
sure it was really the "best" solution. It probably would be nicer to
install the fonts usable by fontconfig directly in /usr/share/fonts/,
keeping the rest in /usr/share/font-awesome/.

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
