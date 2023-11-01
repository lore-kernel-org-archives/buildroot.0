Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F72C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8463A432A3;
	Wed,  1 Nov 2023 21:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8463A432A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBquvynIWVLq; Wed,  1 Nov 2023 21:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD705432BC;
	Wed,  1 Nov 2023 21:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD705432BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6B951BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DE877052A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE877052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiFpj6WN56V1 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 550F6704D3
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 550F6704D3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9499040005;
 Wed,  1 Nov 2023 21:44:36 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:44:35 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101224435.3586abf5@windsurf>
In-Reply-To: <20231016205050.13725-1-fontaine.fabrice@gmail.com>
References: <20231016205050.13725-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2ZsQ9SnL3W3MTmaFfFj8ftNwyygv+ZInK7EPlA1+mE=;
 b=Nmsxk6EIoqlQ75cvXg4GzdQOWEfZaFlTi+J/QzlPzcQ9KtR74blZSc7UVHShXAsVErvJbG
 5I/6fEFe4Dx6uatw9c++8MvYz8QHf1/xxYiHyocm6MQFihxEKmXu86PsUj9zdvCPWuebSO
 D66RsdHho+/U38GqZpluqa0VIVarELLtzXF0dLbicQlgo5I9bn1yfd5zkm2rpLrm+qtto8
 I7em6UPT6XAt/vZkxoSlFCFcsHo99jQxX3/WssyPbNazn8KOWloXbONIsiStwW/w5SlsTf
 Nlbn9h/9yysmyJkhtB06+IaJbVgCfs+fg6jbzHSZ2x1CGWGWoSAX8lL0ySVRMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nmsxk6EI
Subject: Re: [Buildroot] [PATCH 1/1] package/sslh: bump to version 2.0.1
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Oct 2023 22:50:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libev is an optional dependency since version 2.0 and
> https://github.com/yrutschle/sslh/commit/711c11c820f8be4f1399024bcaa1d7072de33217
> 
> https://github.com/yrutschle/sslh/blob/v2.0.1/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../sslh/0001-Makefile-add-USE_LIBEV.patch    | 59 +++++++++++++++++++
>  package/sslh/sslh.hash                        |  2 +-
>  package/sslh/sslh.mk                          |  9 ++-
>  3 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 package/sslh/0001-Makefile-add-USE_LIBEV.patch

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
