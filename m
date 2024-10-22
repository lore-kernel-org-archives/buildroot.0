Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA15CDD0E1
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFD56065D;
	Tue, 22 Oct 2024 20:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKO9Hre7c6mb; Tue, 22 Oct 2024 20:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A6F60784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A6F60784;
	Tue, 22 Oct 2024 20:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B9A359F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A23280E8D
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S98lPsoYNIsn for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0744980C41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0744980C41
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0744980C41
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:23:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 955601C0002;
 Tue, 22 Oct 2024 20:23:11 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:23:09 +0200
To: "Brandon Maier" <brandon.maier@collins.com>
Cc: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>,
 "Michaelis, Adam J Collins" <adam.michaelis@collins.com>, "Buchmeyer, Neal
 Collins" <Neal.Buchmeyer@collins.com>, "Julien Olivain" <ju.o@free.fr>,
 "Romain Naour" <romain.naour@smile.fr>
Message-ID: <20241022222309.06d64ebe@windsurf>
In-Reply-To: <D52LZL79C2WS.1LHI702Z0GTIY@collins.com>
References: <BN2P110MB1160FC5A43AA27C6195B68A1974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
 <20241022212420.4e850e1c@windsurf>
 <D52LZL79C2WS.1LHI702Z0GTIY@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729628592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0OPU1IuYXLVjNEhargj2ajGlYfvJ+1yVABp1jmvM3E=;
 b=IlLN+P2etCnONtTBJUJ1FUi7P7fu3xF58fEJDrRI0u88jxFiEieG1QKxxlO0efJpQ4lKN9
 meNFA70qAuN5tP07+X9iP+9IJif5zBXUJjEuaTQNoo1Daxo2xSSXwE9L9XNoeEXu0UiggI
 2a8PgiNCXA0jcfpgORUOptA6ijxKFH8jK8dAqF8WfAYR5uIcxsQDvH+FypZBzp7qL7WAxF
 +cSF7Nq47/GWq+Q6dohd+JXp9yR/69OpmrCBKj9dG+hiB7ZeBBGoMp30EXk+sTb2N8FYwI
 EU6RJDsDh5kSyp4GBpFFMP1vrKKcqC4g4HvluRDgzcwepET3TKGBXXBHYsTH1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IlLN+P2e
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: Install artifacts to staging
 for kmod build
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

On Tue, 22 Oct 2024 20:14:54 +0000
"Brandon Maier" <brandon.maier@collins.com> wrote:

> > I am actually wondering whether this should be an option. We don't have
> > any similar option for any other package.  
> 
> I think the main advantage to being an option is to keep the size of the
> SDK down. This installs a large amount of the kernel source code which
> appears to be hundreds of MBs.

Then probably there is too much stuff getting copied. I think "all"
what's needed are the configured headers + some bits of the build
system.

> I looked around a bit in the kernel and couldn't find anything.
> 
> I checked a few distro packages and they all seem to be variants of
> this. See the following
> 
> Arch: https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/main/PKGBUILD?ref_type=heads#L133
> Fedora: https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_3507
> Yocto: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux/kernel-devsrc.bb#L37

Wargh, I just looked at the Yocto one, and it's awful.

What's your use case for wanting to build out of tree modules with the
SDK ? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
