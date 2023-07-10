Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29DBEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6517581FE7;
	Mon, 10 Jul 2023 17:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6517581FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZQ_b4Cj8ynl; Mon, 10 Jul 2023 17:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B09E781FC4;
	Mon, 10 Jul 2023 17:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B09E781FC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7169D1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AFFB40B33
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AFFB40B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpfF0LL0Sin2 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:22:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B5040B46
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44B5040B46
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:22:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE58040003;
 Mon, 10 Jul 2023 17:22:41 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:22:40 +0200
To: friedtj@free.fr
Message-ID: <20230710192240.492dc4e3@windsurf>
In-Reply-To: <1804084242.19433889.1688821218678.JavaMail.zimbra@free.fr>
References: <1804084242.19433889.1688821218678.JavaMail.zimbra@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689009762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pY4VGU5pYetoXi77oyGrOJHntUMOi1UGpZa3v/ZLGFQ=;
 b=Gv0v6UwYxDFfC4WdJCQxuBLeH73+RJIHTxKQEDNN1RIFxZAEVMHFktWQHg/bycxmFPsb+l
 vdkXkoNo0gxMzIlNxVNt+4dFfUl+rA/Z3+9RldyeClloaozxUd4ErNNCfQWBmevsklMKrF
 sobI+qyFOUxQnx7lyBpZXTFyWnHvT2dmKnmcx1s2wEi7EA5in8nywZEym91uWshFyL0vY9
 JvrY+4NTChLNyQmILUi4+t5C9M/ogFp0NhOlhQvEUdoYBynCEdrofIYzORcDBXVxy2DdL/
 lRiF/yv7PPAYXXCw1+Xxv71JBqkX+oPiHgWd521wbCSMIOZZOZffTKQCBWgjAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gv0v6UwY
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: heiko thiery <heiko.thiery@gmail.com>, brain <brain@jikos.cz>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 8 Jul 2023 15:00:18 +0200 (CEST)
friedtj@free.fr wrote:

> The current linuxptp is missing multiple options added lately as described at
> https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg04908.html
> and the upgrade to 4.0 removes the need for applying patches already included in 
> the current release. Tested functional on a Raspberry Pi Compute Module 4 
> (raspberrypicm4io_64_defconfig).
> 
> Signed-off-by: Jean-Michel Friedt <friedtj@free.fr>
> ---
>  ...g.h-drop-clock_nanosleep-replacement.patch | 49 -------------------
>  ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 ----------------
>  package/linuxptp/linuxptp.hash                |  7 +--
>  package/linuxptp/linuxptp.mk                  |  2 +-
>  4 files changed, 2 insertions(+), 99 deletions(-)
>  delete mode 100644 package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
>  delete mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

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
