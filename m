Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88309C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3714E82B21;
	Tue, 21 Feb 2023 08:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3714E82B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7bNhHg2U6nP; Tue, 21 Feb 2023 08:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A11A82A26;
	Tue, 21 Feb 2023 08:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A11A82A26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1571BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E36611DB
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E36611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKS7GA2GJUuk for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:57:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C136612A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C136612A4
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:57:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DCF740003;
 Tue, 21 Feb 2023 08:57:06 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:57:05 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230221095705.1dc184ff@windsurf>
In-Reply-To: <20230207220941.58066-1-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676969826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbdQvQ1OS8g7wL+z+Q1yLeJfm/efub71o8OI8V1/ngA=;
 b=CGbKhILORGdNHmZisWoXgdsgyVjRDZGrTLBbpK4SJNV3hn3GqF1wo3w+gfgsXFHo6uUlGk
 trqJjW0zlsFZoXTDaR3BXRKrRdsyx5FBn8AnFbfoJdhDey8h0W+dKx5KFZaYBkUy+/XOqp
 8Tv23kcBg0QMdFQXrUjCac3R5CFf+MWQGp7QSGWmd647fTqNuygNyeW5TuVP0TOIaZ9WUM
 9AQN3bvn3cLam5KBfd7abVnQvJHbu/moSncugaJxVGlbxbTGHotMnFt1b5kmvqksvRccVR
 zPZkXySOZNrqpmQLsinXHwgrWDRPmt9AOz/+K2DIChFAa1CCClY0I+zcLZy4fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGbKhILO
Subject: Re: [Buildroot] [PATCH 1/5] DEVELOPERS: add Julien Olivain for
 package/openmpi
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

On Tue,  7 Feb 2023 23:09:37 +0100
Julien Olivain <ju.o@free.fr> wrote:

> The package has been orphan since commit ee58353 (2018-12-22).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

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
