Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED184C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EAC1405B3;
	Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCCbHGVUhV7S; Sun, 30 Jan 2022 14:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9EF403F8;
	Sun, 30 Jan 2022 14:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C58201BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B35AB83E64
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id haj0_MxXGg7u for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:57:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB80683E62
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:57:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD01340003;
 Sun, 30 Jan 2022 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5772BjqyU2VN0J7hJstXUOYOUuDJ+/els/80NZde2Po=;
 b=Ixj9gVBkqxwX8plBhNunrMZg1jGos+G1Ghyk/bDIMzRXFL+j5sD7DtnKYDNSjAMIRHya7U
 t0rYTB4cr8nAZW2SBWREgoMHfdIoEULhB1nXkT8PU7MtEM6scKKoMoDgBbKV/VVBceO2bm
 qr8lqonnFDF8g8bfTLXfzKHIKsJz+UaKnAq+tenNrEiX/e13V7+8fgExGen5+tDH9rAGuC
 HaeU6bd5ghP8CvuTTE8iH7QQEYBSigmakCS3jlpZwUSeKfGrXuYqB47luJd38EnFF8c16/
 fY8+hsJ53DfU38Rkk7lEKn1H/ZinY+A58LdHSDqJpQIwlR6wQIMuYgbxkQWylw==
Date: Sun, 30 Jan 2022 15:57:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130155704.67ce3036@windsurf>
In-Reply-To: <20220128215657.3023442-1-fontaine.fabrice@gmail.com>
References: <20220128215657.3023442-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.24.1
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

On Fri, 28 Jan 2022 22:56:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/p11-glue/p11-kit/releases/tag/0.24.1
> https://github.com/p11-glue/p11-kit/releases/tag/0.24.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts-c-Add-stdint-h-to-fix-compilation.patch | 28 -------------------
>  package/p11-kit/p11-kit.hash                  |  2 +-
>  package/p11-kit/p11-kit.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644 package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch

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
