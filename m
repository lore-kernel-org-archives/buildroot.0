Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB6ECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E51607B5;
	Wed, 10 Sep 2025 07:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_GYdXWwbwmJ; Wed, 10 Sep 2025 07:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E666065A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E666065A;
	Wed, 10 Sep 2025 07:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CABF10E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 037D86065A
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVMi1Bsiz2zT for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA6C06062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA6C06062E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA6C06062E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 53132C6B3AC;
 Wed, 10 Sep 2025 07:51:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 18A0A606D4;
 Wed, 10 Sep 2025 07:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30027102F1D2E; 
 Wed, 10 Sep 2025 09:51:30 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:51:28 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910095128.2e401f5b@booty>
In-Reply-To: <20250904211239.1928818-4-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
 <20250904211239.1928818-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HeF4v9BRtFhUN6vLHYT7u3pVktQHD0+tXxKd5UqzWps=;
 b=1V9WcdSKHsnFkmgem8cW11yU4pgqXi1T8lJ+VrGK8/S1nuj0SGnKzDuJLZ5Y/QCUNTA1GI
 eezBTF7tdbAUIqkBf6ShXVu/dncSW/O9uq0lpDlgsTS3dD9OQE7Z5o+GHtZ3if+G+G4TTm
 pz6t1q3z0rIrYyI0ouriaBLegcml5K8rBpF1WXnyk3NuwWlaZOvLlDulaWpVeXTuHe9jD5
 MWZBrvPXDF53TCr8ky5HzzXBMdcqYiKAkfWlKHLFuxfqAojS4D34QM2sNPWFRDAD+ceoZ4
 CsnNJPAp+uJPuAIpBNpdaV1ueZqBDcTP+YPX6Z0PpNwU4zqCRRF61qb2mW04YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1V9WcdSK
Subject: Re: [Buildroot] [PATCH v4 4/4] boot/xilinx-prebuilt: bump default
 version to xilinx_v2025.1_update1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 4 Sep 2025 22:12:39 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Bump the xilinx-prebuilt default version to xilinx_v2025.1_update1, so that
> all versal defconfigs use this new release tag.
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
