Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B1CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A513940593;
	Tue,  9 Aug 2022 11:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A513940593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWOj9EpTqipc; Tue,  9 Aug 2022 11:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9F6640278;
	Tue,  9 Aug 2022 11:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9F6640278
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEF331BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C507560E26
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C507560E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvR-FJqSLQfC for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:35:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A5A56059E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A5A56059E
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:35:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F8C520009;
 Tue,  9 Aug 2022 11:35:50 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:35:49 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220809133549.24d660b7@windsurf>
In-Reply-To: <20220809091547.27395-1-romain.naour@smile.fr>
References: <20220809091547.27395-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660044950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCLtzzxddlkEiupY7ms25rvR1FylmhJBL88ClI7km0U=;
 b=HX6mS0RyfnBqjNBI2usUUo9Pt9LurWSoer25k/UvSgwpP9hI8qa41cymMalo31WIVcNr+x
 5AtVagx55PoMVInibWV1dRASGQr2V+xUc4XpQ0hcz5cV+JQ1SKH1HmD7MYVWPS75rbJrDE
 WQz8b0Y3FzrkLipaRAYa2RMR5rp3mwzVciLNS+/Mm4nhPiH/GuJOGf49IlWm+F/YMseTZJ
 3Fq8i419DgBeN0uP83rEZ73ZK/yXEXZefGk0HDywi5eQ76sVuLmylGi4W2isLNOX/Q2skN
 LEydAxkW3BAunl/jnrqz6bC9JqSaywbp6LQrUnFdidhtqKMLOdvVlNB/kZrffg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HX6mS0Ry
Subject: Re: [Buildroot] [PATCH] package/weston: remove md5 and sha1 hashes
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 11:15:47 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Since weston 10.0.0, md5 and sha1 hashes are not published
> with the release announce email.
> 
> The values were probably calculated locally, so remove them
> since upstream provide stronger hashes.
> 
> Fixes:
> f67a6e9b7a7be9adbc405b3126000056120a01af
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/weston.hash | 2 --
>  1 file changed, 2 deletions(-)

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
