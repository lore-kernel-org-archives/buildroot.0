Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38CFB40C93;
	Mon, 30 May 2022 20:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWGFWps7rkLI; Mon, 30 May 2022 20:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BF040C97;
	Mon, 30 May 2022 20:28:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A75D1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669E141B7E
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QYY1G6KetEv for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:28:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C49C641B6F
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:28:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C898C0009;
 Mon, 30 May 2022 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653942495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK/jOob8FKV+kMpDwVtF/pN1lsua43W2w4QSdEmCLvk=;
 b=pCkxdV+RItcLWHb8wmFF8y09lzREcatdEKyRUxzeHsIvbkJNaLVgcKwAvMJoEoVmutS80V
 wi9Q034uqcUvIxBYGEMi048zyz1G6Kqks5zPwN4rfRuE8an2KA+VYqPHq3kUO5p7Ir4jxV
 QT9aJHqFeG++560ATUmsQvZF9HTEycr9Q1mhF6BvDvDVz6V6mNxd+FQUFkRwNF29CLaBkG
 /RH6AfvaPV80bGKo4VkSJizkBbO0fmK0RZtnlTqaxVBdSGEKcMK4xI6hNqb7uyFkEHZJC2
 B0j7492amyK0lIQf9EHxvEGabld/alIyIiBaSqf15OUs/ETL5+ODHJNRZRXfrg==
Date: Mon, 30 May 2022 22:28:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530222814.71d5c84d@windsurf>
In-Reply-To: <20220521130622.340752-1-fontaine.fabrice@gmail.com>
References: <20220521130622.340752-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: drop libee dependency
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 21 May 2022 15:06:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Extract from
> https://github.com/rsyslog/rsyslog/commit/1bc60d4ba29053bd54dd11de46e985f1d34d8462:
> 
> "NOTE TO MAINTAINERS: libee is not used by rsyslog for quite some while.
> However, we never included this info into the changelog. So if you still
> make rsyslog depend on libee (some do this), you should stop doing so
> now. Libee is dead and no longer been maintained nor hosted by us."
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rsyslog/rsyslog.mk | 4 ----
>  1 file changed, 4 deletions(-)

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
