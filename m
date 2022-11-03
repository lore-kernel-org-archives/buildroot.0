Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9460DC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B046105E;
	Thu,  3 Nov 2022 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B046105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7JafgTFsiz4; Thu,  3 Nov 2022 22:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41C861043;
	Thu,  3 Nov 2022 22:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41C861043
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675931BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42E8981F78
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E8981F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v528fv-Mo8EX for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45D881F74
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D45D881F74
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:10:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EADC660005;
 Thu,  3 Nov 2022 22:10:49 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:10:48 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221103231048.0171aa43@windsurf>
In-Reply-To: <20221031072634.2986903-1-yann.morin.1998@free.fr>
References: <20221031072634.2986903-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxsS3Z3BH7lo/rWtgUVqedWfdii3Z7A42KzDdMxgksA=;
 b=lL2pDohswNz8hNaCw4laUsCfzvanM7Y02LSlADf7UnXzWPoL6G2kNOP6yL8VQCktbes2Gz
 n3vIXSSulmx5U7vkgG4Wxwq5vZt5ImEXP1na+e5I2ociLnulSMQLbKEirvLw1BwyIi/acV
 wZ0U2psepQKpfeYFVNHvjz7JphoZPl+CGUcTmZDT0DQbBWOvfUMhUdgM3cFR1ldUmKQiTV
 PSxR898u4TfaUWcnULDa/58P7JQyGe26ynb3elc1/DKgnL41DrecQtSZqOGaFCFSRjKewD
 QMtNrAeh+AI7tRldEpqXP7iXAoc+ixW262TB/qQzbgVVDh3OJGijeHv/Gap02g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lL2pDohs
Subject: Re: [Buildroot] [PATCH] package/gawk: drop incorrect patch
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

On Mon, 31 Oct 2022 08:26:34 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 8cd06967b9be (gawk: bump version and migrate to autotargets)
> added a patch that purportedly reduced the installation size by not
> installing the versioned program (gawk-X.Y).
> 
> However, the versioned program is a hard-link to the unversioned one,
> so, save for a directory entry, it does not take extra space in the
> final image.
> 
> Drop that patch.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/gawk/0001-no-versioned.patch | 16 ----------------
>  1 file changed, 16 deletions(-)
>  delete mode 100644 package/gawk/0001-no-versioned.patch

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
