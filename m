Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49335C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF23340993;
	Thu,  2 Jun 2022 14:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKY0OUR5Jw_8; Thu,  2 Jun 2022 14:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF3B84097D;
	Thu,  2 Jun 2022 14:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 580A21BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46A08605A6
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jq39FJRClCd for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:01:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BFC26102F
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:01:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0907940018;
 Thu,  2 Jun 2022 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654178469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5a+cTVCCOitEvL+8hc4KAs1rHLVqLzH3luQooV8+q8g=;
 b=Q/oMoC1oGIAb4rXrT9GUXcbPqjbzbjQQMgL1VT7eyLHfjWe7feO0i0SCQXUzE0ariTw3KU
 Y80oFLe5ryCYmi0/9Nm93vUJ5koFvqjA5c8fk10zTznqxuTCSr6D844jihnpGuppIuOZTv
 J86VRiVCTz89eWmLIFjP7k7jNzYnQXAUUkW7BNzyHCl+o2/6S0uE08Glr0hVoOuRJbSmDd
 gxanqDRh2DKzQtOZzlWuNhfx7XXpLMImM4Adpvb9B6b92+fGGwzxbsNzg9S/6GeIl3yXXB
 ljqo1qYuxcpz/XurTaG9PoZm/k5AyzYJgRZc7kW2GrEgvXYT73KveY8Norr3TQ==
Date: Thu, 2 Jun 2022 16:01:07 +0200
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20220602160107.73c5bd46@windsurf>
In-Reply-To: <20220522174133.106721-1-b.bilas@grinn-global.com>
References: <20220522174133.106721-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-esptool: bump version to 4.0
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

On Sun, 22 May 2022 19:41:33 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/python-esptool/python-esptool.hash | 4 ++--
>  package/python-esptool/python-esptool.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
