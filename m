Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59748C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE2F60BE6;
	Sun, 13 Nov 2022 20:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE2F60BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlODXxJsQpyP; Sun, 13 Nov 2022 20:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411DE60BDF;
	Sun, 13 Nov 2022 20:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 411DE60BDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71721BF406
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1A24058B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C1A24058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I60QyQ303wBm for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 20:58:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62FD2400F8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62FD2400F8
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 20:58:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8157E1BF203;
 Sun, 13 Nov 2022 20:58:35 +0000 (UTC)
Date: Sun, 13 Nov 2022 21:58:34 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221113215834.00ae7f71@windsurf>
In-Reply-To: <20221113184933.47232-1-neal.frager@amd.com>
References: <20221113184933.47232-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668373115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/62gCS7oXLD5CWhRqLuNbwqEBHozruAo1++4OJWOlQI=;
 b=ZM7sGDCJHnGTi1ZKFgncBGN0w0hlL2DSzap+gDtWr0RSTQzu42Nk5I8KhPL+75ALtDh8TK
 IKIn5plE03TAEFu+Qy4XzqNPc0HTN/vNEy4CUWWbXUJTWhczeX0ePnoJ9Xiiy7v8GfiisH
 MgiI9wmnGYiF+jVXA+Jo4koJxxmboRGb6/odyWNSUdkghnMjpBbjDlnLWx14o0RhmPEU0l
 xNLLKYs6YVlR3Vb7lDhWSX+jS2NpH+W4zkqCmRrgAb+SNvyoF/uAzKjdAi21/DVliFinCT
 TvlnPJFx7Ksobx84qTYGcbqNUJlQfPqKaRJRNqg2YXDaB+yzgmbYVsJcif7DQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZM7sGDCJ
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Nov 2022 11:49:33 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the
> zynqmp_kria_kv260_defconfig as it is not necessary.  The post build
> kv260.sh creates the proper u-boot.itb without needing this option.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/uboot.fragment | 1 -
>  1 file changed, 1 deletion(-)

I've applied to master, after adding the following to the commit log:

"""
    Fixes:
    
      https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
"""

For future patches, it would be nice if you could include such
references if your patch is aimed at fixing a Gitlab CI failure, or an
autobuilder failure. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
