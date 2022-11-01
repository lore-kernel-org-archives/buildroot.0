Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA8C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A05C4098D;
	Tue,  1 Nov 2022 22:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A05C4098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yf3u-YRah2R; Tue,  1 Nov 2022 22:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BAA4091E;
	Tue,  1 Nov 2022 22:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BAA4091E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6D151BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24DB40383
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A24DB40383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKV-yyPPQdOb for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F843400EF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F843400EF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:41:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99E0920005;
 Tue,  1 Nov 2022 22:41:39 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:41:38 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20221101234138.66423cf3@windsurf>
In-Reply-To: <20221007235002.79221-2-vfazio@xes-inc.com>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
 <20221007235002.79221-2-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667342499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qGQOYHzeprWX/YIZ5tI6GU/ExwpleL4D+Wsy0+MWl0=;
 b=oCLFsIgDsgArlxVpH2H9uHEXTGHRTd07VcSEJYTgEnD3GJ5SyVZAuXOphGNkvqsbc0zq2u
 EgvwyPcd3AUpsAov55GBM8cBOJrfod9SKC0TUDBnf50bjJT6F1C8P7odmKTqBi0WtAuAUC
 IMjERSHM6VmC1WknLAWuBlXgsuc3NiHDYThDdaDw8PSH/xvu7eaP0FKDOaEYkxuofn3f+m
 zSWU0828eDG1aqnin2XkHEmXEthGs+VWLCNsd42K5IYzBN+Uk3JTmO0/iiKvzzK+5cdWs7
 VUx7LfCkYJTpLrf4VmOCJA6JMSUXdXBuUyN25gJBAOBYBRbdCP7PfX+o/lSVIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oCLFsIgD
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: redirect errors to
 /dev/null
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

Hello Vincent,

On Fri,  7 Oct 2022 18:50:02 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> When busybox.mk gets read, pkg-conf gets executed to determine the
> location of relevant libraries.
> 
> When Busybox is built with per-package directories enabled, a number of
> errors related to executing pkg-conf occur because directories have not
> been synced to provide pkg-confg at the point when it executes.

I don't get this. If pkg-config is executed before the per-package
directories are created... then how can pkg-config find libtirpc?

I just did a build of the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LIBTIRPC=y
# BR2_TARGET_ROOTFS_TAR is not set

and I couldn't see the errors (but perhaps I missed them). Could you
provide an example configuration, the details of the error, and a
rationale as to why not finding libtirpc is not a problem when we in
fact expect to find it?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
