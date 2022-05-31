Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0EBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7BC6116C;
	Tue, 31 May 2022 08:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DH8N4l3HKYSV; Tue, 31 May 2022 08:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87A160FE7;
	Tue, 31 May 2022 08:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9701BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBBC240C8F
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GhjI2Bp5n3d for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:54:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C0340A6D
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:54:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 947561C000D;
 Tue, 31 May 2022 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653987291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6gBxwmjo1WqI3D2K/hEqIHj/+tzhqgE0spRYjyNFRk=;
 b=l68cPB/T8NcMITMT9zDSNC++REJHHAw797Ac/kM3oP6acFJ3PTu01FQHG8ZwDtWqk2OS3o
 qJ88PUukhBkhDArYe2GqDdLptulIjxFHpMQApx0SrS22noeaeTrNZNBvESE40fsgADrSBz
 ylhUKsXWvOtQ0eq7V3Kk7C/Y8cTztmFncRZbGQ+NQDQxfkBzkoX1/t+MxVSYEI1rMZ6J7x
 bHbFO3lT6Q7XyJm/MtnW5NNzouiW5dBWfr/wkrQT3RXWE+/E3L751gQVyiYCVCz32mvFvX
 FbOYRhsG0JegAwqSQE6ubLZg17fqLKZqkTGxqDrdwt4x+/b8wlG97YZraSyKOQ==
Date: Tue, 31 May 2022 10:54:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220531105449.7e4498eb@windsurf>
In-Reply-To: <20220518014553.2558706-1-james.hilliard1@gmail.com>
References: <20220518014553.2558706-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: drop !BR2_arc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 19:45:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is no longer a qt dependency as of:
> 16ffc6549465cb5d68b751f10603e8b0363bf9b0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wireshark/Config.in | 2 --
>  1 file changed, 2 deletions(-)

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
