Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E853CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7C640794;
	Fri, 16 Oct 2026 07:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgPf0TkCBcP4; Fri, 16 Oct 2026 07:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7CDD4407B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134846;
	b=HVF6+tnOXCAGLBM7qYqsj+oJa4t8KVcN4mkDf63xjRDZxMtR87E3hn27JZwVqXTo5aXx
	 +ez5BBgMBh4oB1BoiVxbbvSBxoEqPPhvKZY8Z8Wn5/K9zUC0bqP2nKZq9i8KK0Cp8mjoL
	 QE6ZcQ5X/pJ9GUi9HPwdNySajrR0B17M8W+HupUd1UPgxFmMjTqQC8BrS33uCSJTwLfi+
	 b4kAkqNGIufXWYL6ItVZOIy6STY7KLHflClRXwQkB/sH7i+iXxKf5+TM2I4CHMTft66wa
	 iSD6b7YhAS03tX6uGSiiGG71j2lT2UCewB1o083jmWYjdhuSGLrbuRdU8c9IRvwJFJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VrhTFXNIMlpBr1iCFf3cLiSP2z9UU+Z1dpqUtb7sLGY=;
	b=LYsPo9q70T/fnF+BZkx0LFZh1QqY8hd3JQcp12NrJPeL+MUPe4f8asFi4p1bhlKCXynN
	 4WoOZ/5jH1Pql9aYPOGS3W1amA14jDK6yTqtcXA7yYnSIaybzNeIJti3m3AJ3n5/K5eBn
	 iE9Efp28xSOHDeygrfgTDmn3bKX3RzR2RHytB8guYql7Oq3aGXlrgHJvgLj3J71WQUcIw
	 ArR9V13RS9ogNPSPFYzpX2zHlR0klDdLcNYoGIfnkbUo4cwUIA7amTZrrxtH2T/o3avxy
	 BjEw1khzJb7lU2412jSonr21Fjga2PfV5m1MRhE3R314u+JI7LUBh0zaSBgYhtizfWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134846;
	bh=VrhTFXNIMlpBr1iCFf3cLiSP2z9UU+Z1dpqUtb7sLGY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K35oExOvjwCVDymzvYps+LLKq9850pbyT4F1a79kzDP4YJZsbfdRePYM76L+Tz0Lt
	 aJkbdFba56VvHku2EcNKfWxlkVryIK+YIpRkFc6Ghq6KriP7euYGZowTN+H/6B18yc
	 TWBbV9pRZYP7EDU3TrWjrwelBns07rSKdk50knuUaqX0j669syM4/HJ6lCbJ4DPlQE
	 DCC7z/wGFUwKS0whWQLz0YtMGRiu3rp2L9qAE+ULxQ69bApUA7UueudLv3H/i9ujfQ
	 bV7Wd7X/rkHtFmbdMSSsXoLyaQWc4vJUXWoePoDMaeJaHsHeJezu8G/XRlAvN8Tbi1
	 fk2ZNEzBBtoUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CDD4407B7;
	Fri, 16 Oct 2026 07:14:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F89B79D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D8924009C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5I1kDZjocBSP for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:14:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BB38140050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134844;
 b=h/GV0LbvBSps37rcoMrlHLxXMcqekedkLTpGAfAK66TbXIFURZTmOJBgPSNt68q7oJWL
 8CuWbwNVNM8TJEGYfZ8djFgMsD7GIBay/I7PPjDllc9jkVc/sFcj9MFggdHLBqAru1P0s
 xfGfVjtKJmotcnYkf5Mr3KEjbYxlGO3BYsLRwCAhqIFEkAezvprgwrF2wSmWakcUvb7Zq
 kXEFhyl/YjL2/RomdVTZ0JMBkF09Njf4Z2ZoDIpvj8uzkrqJ66fSkRW70qYY7zuW8mLgY
 i8Ts17DYiq2sVRPNqfdXkAQ7lpNw3BoRir2JO+2Y3WwBF9zyDejCRTNzRTJy0fcIxfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134844;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9KGfv8VzcmiQ8wlV0yNM+osw3KGLumDqx5mRhHcee64=;
 b=HPcAP5YwN6HM9rB4y8XllA8E2b+oQyJ5GbMy6RP8RTNgPz0vlHMwl1KTgoVyD13+N4Uh
 zHE0cFzysS4wNazgXwANV/FABCbXE8pHWFjQbYZCzfarJ45MW0sT/GSrFuODCpdZbosKl
 P2Bbsz3NGe8wHu9v3ZTipT2lMc29h1uOn/7phbUjMeZqJo770vNo3Au+F6EICMgNApqoa
 +zwXlgeB06BIJxskwP3LEhNc08AhuG7ola6osiXhkfch5OgJ8o9M0UKXTwbuYFY9kUqPC
 5G8tiJAb8AX2JuRnm25MBB/pEl8NjmfBAAkG+Vf9y01ozDZ8aJDZbipmoCMECCPk0Yw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MV88wZKU; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB38140050
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:14:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 79A614E411BF;
 Fri, 16 Oct 2026 07:14:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46DE06075D;
 Fri, 16 Oct 2026 07:14:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9B3710328C5E; 
 Fri, 16 Oct 2026 09:13:58 +0200 (CEST)
Date: Fri, 16 Oct 2026 09:13:58 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <atHOsfTcL1wP1BOu@windsurf>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <20261014164625.1474866-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-3-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/swtpm: disable building manpages
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

On Wed, Oct 14, 2026 at 06:46:25PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Swtpm builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
