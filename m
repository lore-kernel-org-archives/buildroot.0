Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2C5EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E924161223;
	Tue, 22 Aug 2023 18:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E924161223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZhuBR4Smpjf; Tue, 22 Aug 2023 18:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570F56121B;
	Tue, 22 Aug 2023 18:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570F56121B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2A0C1BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BDF06120B
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BDF06120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFADcrW96S4E for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:07:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90A5561205
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A5561205
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FC841BF203;
 Tue, 22 Aug 2023 18:07:37 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:07:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230822200736.30cc8fc8@windsurf>
In-Reply-To: <20230822045734.3160078-1-bernd@kuhls.net>
References: <20230822045734.3160078-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFr8wSmwBx9MDlX5Rh9F7Hf09TucJaFYwkFCgj+BYrs=;
 b=ijvKk934twD84YRvSF1t9iEKxjd2QwtXYuIRylfdwqvEzXDcZ4T2EOt7Q/Z/1vT1jjkhNO
 hAV8Eo5v+qeT3V1HoYkXpsrLDmprMVLGkoOEtMjn7cSMecF1W9EO0nEUwBb5kzmu9shkFb
 9/ktuVehOoVLTqEKpht67Fdtar7gbAxH/yAhNiYDAtsd+IhXFAHpISlsQWTkvy+Om4fG1v
 2I/rayf1PVfXlYWSsnsxSfI1cZ11oRga5wyl4nhi1Vl2MldTROPXuiBMgRX3+6up3MOvAo
 0ZFPmiHM3JpZJ2BSMrxgPqUrrXVJ20BviRoX87l56fX7L9y0f+9DzU+H1r6BIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ijvKk934
Subject: Re: [Buildroot] [PATCH/next 1/1] package/gnupg2: fix build without
 ldap
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Aug 2023 06:57:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 8f1418b5dd80809dc90196d967d8d9665b794c8e bumped the
> version of gnupg2 on the next branch causing a build error:
> 
> server.c:(.text+0xbf8): undefined reference to `ks_ldap_help_variables'
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...he-call-of-ks_ldap_help_variables-wh.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch

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
