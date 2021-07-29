Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71C7C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 07:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EEAC61077
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 07:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EEAC61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 628DD83ADB;
	Thu, 29 Jul 2021 07:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5y_8xMzh4Pf; Thu, 29 Jul 2021 07:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5B0A83ADF;
	Thu, 29 Jul 2021 07:14:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 998ED1BF35A
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 07:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C5240521
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 07:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lphtnjF5YD3 for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 07:14:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 629A440520
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 07:14:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 10C3420005;
 Thu, 29 Jul 2021 07:14:01 +0000 (UTC)
Date: Thu, 29 Jul 2021 09:14:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20210729091400.3c86b4eb@windsurf>
In-Reply-To: <20210729052530.21111-1-fido_max@inbox.ru>
References: <20210729052530.21111-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xml-security-c: Fix syntax error
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: matthew.weber@rockwellcollins.com, chris.simons@rockwellcollins.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 29 Jul 2021 08:25:30 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Add missed backslash to fix such error:
> package/xml-security-c/Config.in:16: syntax error
> package/xml-security-c/Config.in:15: invalid option
> package/xml-security-c/Config.in:15:warning: ignoring unsupported character '!'
> package/xml-security-c/Config.in:16: unknown option "BR2_TOOLCHAIN_GCC_AT_LEAST_4_7"
> 
> Fixes: bbda38afbbfa ("package/xml-security-c: new package")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/xml-security-c/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks for fixing my mess :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
