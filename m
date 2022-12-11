Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F90C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B476E40934;
	Sun, 11 Dec 2022 09:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B476E40934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkH-6RVN7z6o; Sun, 11 Dec 2022 09:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEEA74098F;
	Sun, 11 Dec 2022 09:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEEA74098F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 385721BF3D9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A29F60709
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A29F60709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-BgZNBAZCpV for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 09:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34C3606F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34C3606F2
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:56:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A04640004;
 Sun, 11 Dec 2022 09:56:24 +0000 (UTC)
Date: Sun, 11 Dec 2022 10:56:23 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221211105623.01a59397@windsurf>
In-Reply-To: <20221207150903.4053514-1-giulio.benetti@benettiengineering.com>
References: <20221207150903.4053514-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670752584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poUfdiBWB2GCWhBBILvp0dUEhjP9JmNQt88jR5uWCmI=;
 b=F42vtZk1XLeRDV4hzW8+kmUU/q1SRhIrV1oPHpQHuMow9I6jktb/qRV+OIcE5d8qeZo715
 UQgD0/ti91CRgCYVLiFO92NbsSZfxkfbHlKZSjYwYoz2KBgUF0uY29eitVKew9nOB4BOyZ
 Cg5vMTZHyihMtgOZNX0OQxbMMH7nISC7Ssaf0GVwLRmNOQqHeyMJMVYJlUPYWyrQcL0LKq
 FumtnOnCOHjw3GThw56PzH+TWVB/tHOYoNz70vXMXawwDF4HS4lvi0g909lStSh00kYSrW
 6CwEvlHqgc1fBrfWiU1/Mt+T7Bx1xx7vj8nfFQgylKIRezFMjRxJN0GQWkji4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F42vtZk1
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: disable -Werror to fix
 build failure
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Dec 2022 16:09:03 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/349893c66fcfbbf0e0e10285299581894254c941/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8189es/rtl8189es.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
