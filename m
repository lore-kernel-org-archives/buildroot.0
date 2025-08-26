Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1173CA0EFA
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 10:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF8D84584;
	Tue, 26 Aug 2025 10:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qX5OfnTxexar; Tue, 26 Aug 2025 10:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D1AD844E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1AD844E6;
	Tue, 26 Aug 2025 10:19:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A39A5CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 10:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 954A16F7FA
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 10:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDTalsLXxyCR for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 10:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4BF761629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4BF761629
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4BF761629
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 10:19:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9EDD94E40C5C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 10:19:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 70CB6606A7;
 Tue, 26 Aug 2025 10:19:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16B741C22824A; 
 Tue, 26 Aug 2025 12:18:52 +0200 (CEST)
Date: Tue, 26 Aug 2025 12:18:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250826121851.06ec731e@windsurf>
In-Reply-To: <17c60c20-55aa-4864-b838-45751b67210e@gmx.de>
References: <20250818132436.338635-1-fiona.klute@gmx.de>
 <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
 <cc0f34e2-366d-4f78-a8e7-5c163e57c3c2@smile.fr>
 <17c60c20-55aa-4864-b838-45751b67210e@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756203557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ecALJJ5PgGW5alIOE3CP/xbvV6VdP1/V3E8bvwWOW7E=;
 b=FFJZ7sgB3xb4QTsV9iPlTu+H3lydTRh44r3gd6qAhlGcirFeSeGb8ShNLPVsDuBspa2oBg
 c19OJvm5wCa8SH2RQIRGVoM4f8KTxgZBmK6hw9/F+SZPjP6AdKnmweE8O5ScChwuPd82rF
 H5C5zprnxyS3y9paJtxOXFw2vRUt0B6UAZB5RYFZiv5O60Nznnm0H8VgmbHKm+tGFK4WJz
 2So909ZjmbXcQkuBGql4/lvghUBcvEIhmt3rHetathKzQqaX7VT6HgxyN+08MAURrW5Y6y
 +M6O+1ALxjODJCORRvMzkNcW4nxUetGHgWL70YGMYN+HzthKlhzSg61lGdRJ1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FFJZ7sgB
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Aug 2025 12:24:27 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> It looks like the "kernel too old for toolchain" problem appeared 
> before, in commit 521b6f85508ee9ab848b0b2ea1d36edaf1701bc1 that was the 
> reason to use the "stable" Bootlin toolchain instead of "bleeding-edge". 
> Earlier this year the stable toolchain was updated with headers 5.4 
> (commit 947dbc92a20c5acea7882166cae7893e6ea661e1), so I think the 
> reasonable solution here is to update the kernel. Looks like the kernel 
> config needs to be adjusted for 5.4.x, I'll send a patch when I have the 
> tests passing.

Indeed, now that the stable Bootlin toolchains use 5.4 headers, all
tests should use >= 5.4 kernel versions.

> Another question is if it still makes sense to claim support for kernel 
> versions < 5.4 and cgroup v1. Maybe it'd be better to simplify things 
> and have "depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4" for all the 
> Docker packages, or even remove package/cgroupfs-mount entirely and 
> require all packages that need cgroups to use v2? There aren't that 
> many, grepping for BR2_PACKAGE_CGROUPFS_MOUNT (other than Docker and 
> Podman, which already works with either) there are package/moby-buildkit 
> (definitely supports cgroupv2), package/libvirt (haven't checked, but 
> I'd be extremely surprised if not), and package/balena-engine (no idea, 
> this is the first time I've heard of it).

Totally fine with this idea. I think it's OK to require a 5.4 kernel if
you want to run Docker.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
