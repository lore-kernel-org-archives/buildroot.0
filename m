Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F575C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A16D400E3;
	Thu, 28 Apr 2022 21:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YN5bJot5L5Ay; Thu, 28 Apr 2022 21:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B601840AC2;
	Thu, 28 Apr 2022 21:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF8A21BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE7CE83F25
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZ_V14OJzYWE for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:38:49 +0000 (UTC)
X-Greylist: delayed 00:42:41 by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF76483F37
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:38:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63D4E240002;
 Thu, 28 Apr 2022 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651181926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9nj6dRDMb2cVIFz+LbEDjq+c5yb2lXAsWQs4HqpoDE=;
 b=LF8s9UdYXw73jfRz3dhPOU4y4uyZmvpFKVt0p6wrm34/qCUPFN3PKBdtOYhD/DoVn3pVi9
 bJjq5DTwGXbCWuuaW0zEwqbhtzrRJe7VgxpZQuZ+OYhXzj5wWLfJfhvZQijLV0f2Cvix73
 s8ECQYpYrDC3FseJrotfRmkrVFfB8Rn2hok+PmMaNCh2Iu8t9u1sIhNkGz0MWVukyr8jtr
 JnRObYnFEuBg2NnchlfeFDEj0tNtXYeRLDRjsTROfRmna8/ZsLq63piy6IcbjGkt6nmJET
 FIcWbyidThitFoWWle386zb62nCKwWHHYY0OSxiQhtHotX3x+g59Aa5U4zdu/A==
Date: Thu, 28 Apr 2022 23:38:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220428233845.6a62a2a2@windsurf>
In-Reply-To: <20220428204932.948797-1-fontaine.fabrice@gmail.com>
References: <20220428204932.948797-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4843
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 22:49:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-1381: global heap buffer overflow in skip_range in GitHub
> repository vim/vim prior to 8.2.4763. This vulnerability is capable of
> crashing software, Bypass Protection Mechanism, Modify Memory, and
> possible remote execution
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
