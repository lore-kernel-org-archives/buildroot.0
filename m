Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC786D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D70A606E6;
	Mon, 11 Nov 2024 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3CR9wahIkBe; Mon, 11 Nov 2024 20:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C6160706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C6160706;
	Mon, 11 Nov 2024 20:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D78CD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86C8240460
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gFJNobPND2E for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1184940124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1184940124
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1184940124
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:44:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 265CB1C0006;
 Mon, 11 Nov 2024 20:44:02 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:44:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20241111214401.7ac58b23@windsurf>
In-Reply-To: <CADvTj4oU1W_eKJkOGDvg=Wtad4pfUfn1Ag_DLnGz_FtSr0avtg@mail.gmail.com>
References: <20241110193734.1463141-1-james.hilliard1@gmail.com>
 <20241110193734.1463141-2-james.hilliard1@gmail.com>
 <20241111211949.6f844f31@windsurf>
 <CADvTj4oU1W_eKJkOGDvg=Wtad4pfUfn1Ag_DLnGz_FtSr0avtg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731357842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eCCZ9yvhyhCLboZlg39MsgUsaca1y8UFhtdAhL6eN8=;
 b=VHE8HT9hLP1l78zFH1EH2PfkKkKA6T/iKb6Z/APg1Nu8x5ZMtB7+raIatyDqBQnXUC+SSt
 +G+h6ZOmGgNG1bwKuBA5hcYwd1S7JDBYr3N1kfdEsBT8UCIXOQ2SuZABm893oLUUZKtXz3
 1UKNet3oQlLH88LoDB9//SUOigWv2rSsm3QQ0n76kFqYmSSmVTt+BkhgzJwe5KrQrETww2
 kOCiJutxrr1IG0260yTe/zBd4WG7P7IcRGufSS7HpP5XSVlFc6WCpzfl3h+GsGXS4Yuqxs
 51wG1wpIhXOLH+NiPfV616kY6lFGXB+NwL6CNlcHGIZQBg3XVbRsEO+E9Qe+2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VHE8HT9h
Subject: Re: [Buildroot] [PATCH v2 2/2] package/swig: bump to version 4.3.0
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

On Mon, 11 Nov 2024 13:25:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Based on your PATCH 1/2, you tested libselinux, but what about the
> > other packages? I certainly don't require testing *all* of them, but
> > since this bump has caused some breakage for libselinux, we can
> > potentially expect some breakage for other packages. Could you build a
> > defconfig with a good number of reverse dependencies enabled, and
> > verify it builds OK, and report this in the commit log?  
> 
> I pretty much just test built packages individually rather than adding
> them to a defconfig. I think I tested pretty much everything with host-swig
> as a dependency, I didn't bother making sure all could fully build but
> just checked that there weren't any obvious swig compilation errors.

Hm, how did you verify that there were "no obvious swig compilation
errors", without fully building those packages?

Could you provide some more convincing evidence, such as: "here is a
defconfig that I tested, it builds successfully before and after the
bump"?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
