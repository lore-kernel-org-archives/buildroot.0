Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB8CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D58DA83F82;
	Thu,  6 Oct 2022 18:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58DA83F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUsKUq5yy4Va; Thu,  6 Oct 2022 18:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1028083F66;
	Thu,  6 Oct 2022 18:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1028083F66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9E9E1BF3D2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82FA3419E8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82FA3419E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BL9Yk9-mV5Dg for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 18:45:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CA6419E5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1CA6419E5
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 18:45:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DEFA21BF204;
 Thu,  6 Oct 2022 18:45:26 +0000 (UTC)
Date: Thu, 6 Oct 2022 20:45:25 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20221006204525.68e10713@windsurf>
In-Reply-To: <20221004093649.31017-1-jesseevg@gmail.com>
References: <20221004093649.31017-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665081927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n04OLBkLlAkLVRKikw4QsN5cbWmQj3yD/lshRRQOlpM=;
 b=plK5TfEBLtKjw66L/IdY0Y6hyYxNEvNYdk10kc39eREbfuI75jD0SDu1T12jA9nP0zBHpC
 ps3OWKgasSWjYuHyk+Y2AJRsp+cLtsESclLgbRGInEFc8bKz+qgTBz0TRLR+GV8K7ErRHT
 TZwtoZe18dc39CyJSE57DbJqDzsMvx2S4CSm5FfSGW8a5hAq7rVMIkVNixk+umL/eAYqC7
 iGQn6K53ZcRgncwCRSIsR63gCDfVWyR0fMAgzAM80FD+KoHUZdB931RHBXU9RXd3Kbt8SD
 b4yxKu69q+zHQgJfVd/kyl9kPkRqWZh73pbUSJQ1rpUPWnKD77daUJSc4Z+/KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plK5TfEB
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: bump to version 6.4.0
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

On Tue,  4 Oct 2022 11:36:49 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Drop the qsimd_p.h fix, this has been fixed upstream since 6.3.2/6.4.0
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6.mk                            |  4 +-
>  ...al-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 -------------------
>  package/qt6/qt6base/qt6base.hash              |  4 +-
>  package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
>  4 files changed, 6 insertions(+), 55 deletions(-)
>  delete mode 100644 package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch

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
