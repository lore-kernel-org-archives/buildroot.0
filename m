Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D63C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8384A40543;
	Sat, 17 Sep 2022 15:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8384A40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eP85wLQkv5Z; Sat, 17 Sep 2022 15:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47E54023D;
	Sat, 17 Sep 2022 15:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47E54023D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CB0E1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C03F41830
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C03F41830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S559T6wXmE89 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:18:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FED41740
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4FED41740
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:18:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3682100005;
 Sat, 17 Sep 2022 15:18:25 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:18:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917171823.62808231@windsurf>
In-Reply-To: <20220911214418.192286-1-fontaine.fabrice@gmail.com>
References: <20220911214418.192286-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663427906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IgloW9U8bFmphQyXR02La0y55/j2U35wArTBu5HiH8=;
 b=L/znAWHcNUOU+WWzFPR7jcAWi0vs4KdbbKuEdHJof8aUom1oLgNpGAiip7br+gfXvpFndD
 Yy3vRl9jmn42V8mzzZgOhG7tABMIcdgdRRndJD+90lus3H38bHUHmLFCNHtv5SO3vAk3L1
 kg8GF8ob6EoSNwp7kM8Eqhmb09RaVpU+tM3QR4x2vojxWhJqgjVpYSzA2V9wPMoheC+ePu
 LyZAzhyuXS0IylmC6vstfC/EB6vJzWNOCmCpSd/UjxFBqfVr/RLfnaejqmnPy7kmrFtQ0q
 jjjRvfTCAnXmurORScJ+69z74POsIaPhYtqNbRnCRfmAtvPg4I7lbORoUyZVjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L/znAWHc
Subject: Re: [Buildroot] [PATCH 1/1] package/libpeas: bump to version 1.32.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 23:44:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.gnome.org/GNOME/libpeas/-/blob/libpeas-1.32.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpeas/libpeas.hash | 4 ++--
>  package/libpeas/libpeas.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
