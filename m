Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E572641C61;
	Thu,  9 Jun 2022 20:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvFUIaTa4AyC; Thu,  9 Jun 2022 20:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D494941C37;
	Thu,  9 Jun 2022 20:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 244761BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A7E41C32
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OW_OdtEG1aT0 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E473F41B8A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAFAC240003;
 Thu,  9 Jun 2022 20:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTkCSwwsNSY0G89e+x6P2pUeCXPusSolh9LuHgf5Z34=;
 b=Q+BlJHTY0PBGgdEBTUS1x4x9Q0Wl5Pi6Jc7WGHJUE1Sv+W3W2mizUxwywLpWWuiq39KYkx
 CzIIdKu2hcMKHdNk+acIlKei9PwaJPIhd4ZFAFd+5JpStKjx7M7MnABlSFzJHa5bWM3uv8
 yUXAbjR0MBTRQRjh3sVCHsS2KB8Q5/IXK6O50ZtLzvi2BZmA0lHr4fBsLPa7+5y8VQ4lQJ
 Pm9T+wDAtkVVlzzvz88QUslQzixY14waj9cqqxTAzQsBcOnBV5Q/A+zUGJmWLMXnKkI9eJ
 mX8D1EbSOjOvjHx4WFc8uqzmmmPGTB7iX42+rJE3K1vFAli94sbCfBerg/ulmw==
Date: Thu, 9 Jun 2022 22:44:34 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224434.128a7ee3@windsurf>
In-Reply-To: <20220606213648.20480-1-fontaine.fabrice@gmail.com>
References: <20220606213648.20480-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.8
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

On Mon,  6 Jun 2022 23:36:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
