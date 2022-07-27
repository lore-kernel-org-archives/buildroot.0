Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9470C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B39404A8;
	Wed, 27 Jul 2022 09:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B39404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YojWza6H5-en; Wed, 27 Jul 2022 09:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A21F4028D;
	Wed, 27 Jul 2022 09:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A21F4028D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7482F1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD91409C1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD91409C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FOkRtjG5FFg for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA4AA40901
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA4AA40901
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:56:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8655E200006;
 Wed, 27 Jul 2022 09:56:16 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:56:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727115615.54169c30@windsurf>
In-Reply-To: <20220727085023.876407-1-fontaine.fabrice@gmail.com>
References: <20220727085023.876407-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658915776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Er+BQrHjxDdZY0KWIl4VEdKCJa799bZc4RGWVAd0NtY=;
 b=b9C9ubg7rYzFY5q77VCmq+I0RqM7G0tho0ewiQFOAz2PLJNMB2yYCkfgd/dsEpFjonD9xH
 dq0f04JAm+/IYskHE2EXwbtruYQL3IlArMsN14UF9nN4P6NqusG9RrusLnZn7qtnQ1qoaB
 Jjwg0Fc7rm3+l+XGoBCiExqdCK/l6BvLDXPaoYZ5auuJ50DYpBT1sHH6lk4n5Bb1szM/yu
 1SzHvVFdTSTjzXjiIhV2TpD/TypC43dT4DA/gV+kcCflRwZjKBzMUAspwIYrtKDqIIyGSm
 5A8eizyEElhXpk7eBTsRLJXIpXNlisqkJOmyKieL5YIDnJtlvBawhrIZ72g6iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b9C9ubg7
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: drop ncurses
 dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 10:50:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ncurses dependency was wrongly added by commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 1 -
>  1 file changed, 1 deletion(-)

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
