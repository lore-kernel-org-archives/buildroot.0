Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F22C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1464190C;
	Sat, 29 Jul 2023 09:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1464190C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_d01Ph8lWin; Sat, 29 Jul 2023 09:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE4C41B67;
	Sat, 29 Jul 2023 09:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE4C41B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223571BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B301241966
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B301241966
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqm7b863HWHh for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:00:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BC1C41961
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC1C41961
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5265C60008;
 Sat, 29 Jul 2023 09:00:00 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:59:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230729105959.3a10d419@windsurf>
In-Reply-To: <20230728193417.97338-1-james.hilliard1@gmail.com>
References: <20230728193417.97338-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUrHGdytsVjfMlwaagqfqiTR+IA0AkHM9dLOL4khMcA=;
 b=ewXeIDteUboeqbQezWyTNfXDeFqWEsLVmwnIhcXzSIBgC0LpP2XtojKqKFwSHOtt/eLaY1
 QAcZanNaNHR1xUPUyfhaIVFB6cgQf+bJO8Wv02DD5ddE40XylaQKkI6pooPIMzYtABozjU
 6uNXhyoyrkxn7YSOmkrtuzkAO82QsJc0c+9GecrCFHp1fzMnXKQuw+kiTCtFSX4SyXu0S0
 7n9TlSfPJfyptcCBAmbShMSIyw1k2WmBBF+g79Q+daxGWyG8b/l2HFYQOdrK+bbj/+DRNd
 jdUrF/fF9HK2v+T+AYP5GpxPHQXSzQxfotDEWqIygxBYRWEgj9UoHjNxWiNwhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ewXeIDte
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: don't select seatd
 daemon if we have logind
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 13:34:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> If we are using systemd-logind we shouldn't need the seatd daemon.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
