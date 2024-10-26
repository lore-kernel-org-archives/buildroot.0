Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCCD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB1F80503;
	Sat, 26 Oct 2024 15:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nXl29KOUKwQ; Sat, 26 Oct 2024 15:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F91F80524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F91F80524;
	Sat, 26 Oct 2024 15:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B58A5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C36D40340
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8x56rpc5e0s for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E404D40403
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E404D40403
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E404D40403
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:55:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F59460002;
 Sat, 26 Oct 2024 15:55:55 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:55:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, Asaf Kahlon
 <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20241026175554.0466d8c5@windsurf>
In-Reply-To: <20240917021332.3838579-2-james.hilliard1@gmail.com>
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20240917021332.3838579-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729958156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuq+QZc46LUp6zGejGGDwTwZQ0LmWgSN/H1Id4aPuGY=;
 b=ZumOWGFqFGUoFSNwxaBc9NtFazKFJEqwVGiUmZUXWfcm/s2bTkeeorVCcqcITUbW4jqusn
 rhfJmZ6xvyZiCinnzSNEie8lFxcoekbJLzFtOPwlGP/BVvcJf3ZpFJbeeHNSJqzzbqva9w
 q5n50Njvn3/KLm5Z+loVBCrGLJSsnFvrn8bg5FDbY8DnHNtgK0xy55VuCS8tT3SrlHHZHj
 BFhbxCy/aetzevnKQTmhCahCe2pOOxmkVIQLpK2BD5IFxc0r1GpPGkJeHXdZ9ZTTHRwXmE
 OO6zApYHo+PtgZgMcWQij/kW0YeKkKcYtgbqMUNdBIZE2N4+VlTRBawP6B8SWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZumOWGFq
Subject: Re: [Buildroot] [PATCH v5 2/3] package/python-scipy: bump to
 version 1.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Sep 2024 20:13:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to date update:
> https://github.com/scipy/scipy/commit/0ace7295322148d74932bee32b0647e29c38fc8a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-scipy/python-scipy.hash | 6 +++---
>  package/python-scipy/python-scipy.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

I wanted to apply this one, independently of the python-numpy update.
When verifying if it built properly, the following defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_SCIPY=y
# BR2_TARGET_ROOTFS_TAR is not set

failed on building... python-numpy:

output/build/python-numpy-1.25.0/numpy/meson.build:203:49: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency lapack: True None>

(I did not investigate)

But the same issue is visible here:

  http://autobuild.buildroot.net/results/179/179167678095590816c8b5c7330e3d5f018de554/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
