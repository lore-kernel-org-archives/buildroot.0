Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D0C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DF140191;
	Tue, 26 Jul 2022 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04DF140191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfQ-tSvCHMzr; Tue, 26 Jul 2022 21:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F624017F;
	Tue, 26 Jul 2022 21:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F624017F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07E8A1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E46014013F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E46014013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1L0r_8gHtn9 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8228340012
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8228340012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:33:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5EB8B240008;
 Tue, 26 Jul 2022 21:33:06 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:33:05 +0200
To: Jared Bents <jared.bents@rockwellcollins.com>
Message-ID: <20220726233305.053568a3@windsurf>
In-Reply-To: <20220511143316.58942-1-jared.bents@rockwellcollins.com>
References: <20220511143316.58942-1-jared.bents@rockwellcollins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658871186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6ctbk4iBYg9F1uVxKXZKKiY0MpeLNNpgEJpduohTzM=;
 b=DJ4FkbyWodsUIgpr7wQRW+6E0U85yd4Vs4NhMlmIziEg+H3W5GG2A8wL9pXPHsTud6oQey
 RB3S06B6Ib/cnGnpfux45lXpu9mC4ZiX/IVcylLN9yGC3iwwFE/Sw2F+tuSdlYGhGIuPxQ
 itriW2N1H0sX4ect+VZYkTJcZAWwDNRk+24Rs2xhWvOmD1M10jOaW/GsPghEpRdfVDpkpx
 9MQIXO4H30ujZFeROTdEvVi7QdW2znXoG0mOe7PHZLm8BJQjFZ/9EzEN6qeZyLP+ydkbLE
 0gWdNdJTQP07H26XYyN6z3RNDiSxDqpq5rHWyqK+o8QZdwqbK7hJb4Xbv7IRhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DJ4FkbyW
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rsyslog: update to fix
 service permissions
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

On Wed, 11 May 2022 09:33:16 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> Update to fix the permissions being set when installing the
> rsyslog service. The service should be installed with 644
> permissions and not 755 permissions.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/rsyslog/rsyslog.mk | 2 +-
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
