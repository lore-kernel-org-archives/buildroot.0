Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7701C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF78408B0;
	Sun, 30 Jan 2022 14:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHsX0npFMYdh; Sun, 30 Jan 2022 14:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B11D401E3;
	Sun, 30 Jan 2022 14:13:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D72EA1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C548C408C3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAkkKJA4XMJj for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:12:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C930140554
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:12:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DABA51BF203;
 Sun, 30 Jan 2022 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643551955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxmJQaNgAeX8FNZEuA1p3VTYktd38gjzFEPAHmwB6KI=;
 b=VuVtQzRYj4lfgqUNtbU1tm6OdEJ9Fc0PCyxqaDVrrrbvObmJ/kHAcvzY4CXirw3qAhH/UX
 XJD4Qn2s/bofJUZ1yqc+fEmBt+QGbB3jsfRM6Ciu40TfcakKXiICE/XP0FdDORwIXFGIxX
 W5b/ZcaguJUs1MYxSg9nSbUvacTw2og6Efuz7p0/krF8lLFQ54zvYc//767lX5jq280Kua
 EEt4NHqapjXiB3rl7xvPpZqUA32ChhF5EhHvogXZMniTsax83nmSpzX/ish0XIDWNr4WbK
 +alOUlQIFZvPenWIVhH/KuFRg/kZbMBtebw+Y371vFXdOGUQSdAIlWZLBs9aVQ==
Date: Sun, 30 Jan 2022 15:12:34 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130151234.6ab8458c@windsurf>
In-Reply-To: <20220129224651.1282263-5-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-5-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5]
 docs/manual/adding-packages-directory.txt: reorder select/depends
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

On Sat, 29 Jan 2022 23:46:51 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> From [1]:
> "Even though the ordering has absolutely no consequences in Kconfig, it
>  is not logical (when reading). It is more logical and far easier to
>  understand when depends come first, followed by the selects."
> 
>  Also, the Config.in example in the manual suggests to use this coding
>  style [2]."
> 
> Use the correct coding style in the chapter "Choosing depends on or select"
> in the manual.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
> [2] https://nightly.buildroot.org/manual.html#_coding_style
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  docs/manual/adding-packages-directory.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
