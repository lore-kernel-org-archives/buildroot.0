Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC13C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 10:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDD38280E;
	Fri, 27 Jan 2023 10:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDD38280E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7m6p1nxEFJP; Fri, 27 Jan 2023 10:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABFE82848;
	Fri, 27 Jan 2023 10:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABFE82848
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 860C81BF306
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F334178D
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F334178D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNYWjXH24mv7 for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 10:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D393B4012B
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D393B4012B
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 10:06:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 18E02D389C
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 09:55:54 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2EBF51BF208;
 Fri, 27 Jan 2023 09:55:48 +0000 (UTC)
Date: Fri, 27 Jan 2023 10:55:46 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230127105546.0b7535db@booty>
In-Reply-To: <20230127084938.15712-1-neal.frager@amd.com>
References: <20230127084938.15712-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674813349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiM/mfWdqS1dmbh+429a9vz0bd1XUWqj8sajdSW3ads=;
 b=S7BRHeKcaB8v8/RiYxqOvm+KAErg4sT0vK/QYCdUhioW6rRhCslMrikZFSwdJlVpRd18NQ
 XpqDDXfY626b1b7kCzo4MBxvEdElESIQsvQZv/kwoGf2Iy7j0YgdEOwrWU/F6HFX4sIj3v
 N9VblImFF6vACa9EzSX8TlTIzxZsQPgGXCF8Ka+nALu/zx/KzpOg6BrY+bsyFWiXHPBcll
 kwdqKUkqTTNQUHXtZRqOdaAxqod9qLmiRPUX3vIozLNc9V4sbto3IVJO239oYgw8V7Hsma
 57jRpnBo3OwULlwHX5fQlMFu5/N+DD7JLEkfhVfHHi4KtFfSpjXSI6oAQLQzrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S7BRHeKc
Subject: Re: [Buildroot] [PATCH v3 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Jan 2023 08:49:38 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Reduce the configs in the kria/uboot.fragment to only what is necessary.
> These 4 configs are already included in the xilinx_zynqmp_virt_defconfig, so
> it is redundant to include them in the kria/uboot.fragment file.  Applying
> this patch has zero impact on the u-boot binaries that are built.
> 
> This patch has been build and run tested on a kria kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
