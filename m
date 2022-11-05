Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEBC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1DB81020;
	Sat,  5 Nov 2022 22:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1DB81020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6LPIbhf9qJT; Sat,  5 Nov 2022 22:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2D7680E46;
	Sat,  5 Nov 2022 22:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D7680E46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85F2C1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 619F360670
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619F360670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJTz-VRvwNJK for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:39:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B566605AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B566605AC
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:39:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3F06E0006;
 Sat,  5 Nov 2022 22:39:46 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:39:45 +0100
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20221105233945.2f258c44@windsurf>
In-Reply-To: <20221103014132.791440-1-m.niestroj@grinn-global.com>
References: <20221103014132.791440-1-m.niestroj@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBaknjOh5pYPm0IyUST9+1/kJR5OwWQwG3Zx5Hs+2vM=;
 b=dq8hiMonstRwh7Kp2H2aX5/Jjviy0wNHh1bAzPxv4WQb8lWtEN+9HO+Yt3FIAF7eQ3XJvo
 9kdc7u/TUuWUdbf4zBAUsv8h00ujz6XDvEq0rz37IzowXRrcZpbPuspLuThBITdB/c7eOi
 eKnbi5iToPMKe85m5MYNcEKugkd3IoqJUN+sr9ylIhC6jFdmxry1brG6ZntIwDQMAgf+p1
 2pLcN448+fGX6S/Q7s2BOwFjm1jd4fiEfEkbnmrjRx+3MrBKDqcsexqr1aNPYbTsJ/YKbh
 K/zteSfrS/sHysz4aNlCRVYs3SSECIKzcxCkxigjUIqzwMYMGl4K/dDdffTJww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dq8hiMon
Subject: Re: [Buildroot] [PATCH] package/gitlab-runner: bump version to
 15.5.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 02:41:32 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/gitlab-runner/gitlab-runner.hash | 2 +-
>  package/gitlab-runner/gitlab-runner.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
