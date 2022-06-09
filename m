Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DCDCCA473
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCF8F41162;
	Thu,  9 Jun 2022 20:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpniGFdHXX8K; Thu,  9 Jun 2022 20:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE50641154;
	Thu,  9 Jun 2022 20:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82DBD1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E9E40C44
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUaO7U4aC_pN for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D7A640ADD
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69C82240003;
 Thu,  9 Jun 2022 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaY/MwZkMV+/mVyHuhEVAGNxraZ+DsdKhSPCSHxp1qQ=;
 b=L7POpbyFz4ADO9ZCLVW09KEWhKqj/LDMd1bZmlSpKhZnI/lXBQObI00Sx9r84QWN9Xt1UK
 eK+YYWa1BRznuYw/Uq42HRLNQCkgxnpulL0+1uM4LtEcKGNZBekKd4xOwBeb5P4yjMcD6A
 o76PRtyiyXH4I2hDw5zAi4Z78Z/0qulJI1ZpJFcHHPDQXl+nmvaEHOO9/fAHAwMTTe9M+0
 eTJAQ1mF7WQD+DSKUHUzly0TS/PRYV4B1L/4ujR+qR19gmT34KWg0Lk/c1US1qQNHA2/GS
 ZELY1INJnLLIo5QYazqc1y9JGdKt2JboaPQRgjnGgs3YFCmqCU2YbY+JRAU6hg==
Date: Thu, 9 Jun 2022 22:44:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224446.4f102809@windsurf>
In-Reply-To: <20220606220026.134315-1-fontaine.fabrice@gmail.com>
References: <20220606220026.134315-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version
 3.4.5
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

On Tue,  7 Jun 2022 00:00:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ksmbd-tools/ksmbd-tools.hash | 2 +-
>  package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
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
