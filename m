Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7E7CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5812180E2A;
	Sun, 31 May 2026 06:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2YeyUstqYPx; Sun, 31 May 2026 06:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B5B84F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780207897;
	bh=xtcxZBvG+MXpwb6UXwauzDLFaMz/wihOl+zxQ1hxFZA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrQAcrXEOnhTfkdozHg84+tgTyChfBQj1pel0VE9wLUdAMcN/bgKGBEGR/kR0zaQo
	 ya4RRiGRSoG/mmh0ZqmeR9Q8AuNgKyi5YPjYwFP0Cp/3EcDzUX9z9wa6YYVqa7tm3q
	 M3egPk7W5aciscq9K66eEHu7XWG/uy99QOtA6THt6p5n3mLij+ucc98d5qm26ClZvO
	 mSG/o18kJwODZOBg2mBr28j97HRSehRN5UzB2jiF7Xh2ygLymt4tt2kCBOoroRC6XT
	 mI5S3b/V09hlz51CBVMBnNkqmY8HrDmUOJEuOHLqU3MssXvzzqn/TJOUyBrIsn3mhe
	 9jZZM6M/0HVCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B5B84F2F;
	Sun, 31 May 2026 06:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E6F9389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4426F42B94
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhLF2l0KytpV for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C7FE4266C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7FE4266C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C7FE4266C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:11:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D9F23C62473
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:11:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5BFA8604EC;
 Sun, 31 May 2026 06:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8600710888CC7; 
 Sun, 31 May 2026 08:11:31 +0200 (CEST)
Date: Sun, 31 May 2026 08:11:30 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahvQtE5hSLGHtjej@windsurf>
References: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780207891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MrI3VTMu13Ljd6ynfuByqyb0afefdwDOEVQ1ZL+GJEA=;
 b=I0BVSlzpqIkjdRewTk3BKRMczIm9UspAX4x0fbXc+BKSFH4lBsChHV2H5bvNcFbXd+l0pc
 BTKxohFKpnhWyl8P0V/8UToBqx4hb2Zsnl7f20lFqZ7CmIkx3A2lzI3NBjEyqudCimGrS8
 wtoe1hTBfp7UDeS5/q4JYj5XuGOxq1D6RmxM9u+VBSuNBFZ7IPLgVrmq9me3iQvYGAizn7
 45NkJ9xI9j7edph8BLgPLPaeZcz4e4rlgvrWS/Fj329c7XXK9wNja7SBxPoKmmtrov/hqc
 lbQHz9AeaSP/yft9+SNE3ldJZ/XUCanNfFB839QYy1BAVgjeCZoFDQ3QVYTrNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=I0BVSlzp
Subject: Re: [Buildroot] [PATCH] package/tcl: bump to version 9.0.3
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

On Sun, May 03, 2026 at 01:42:03PM +0530, Shubham Chakraborty wrote:
> Major version upgrade from 8.6 to 9.0 series.
> 
> Key changes in Tcl 9.0:
> - Full Unicode support (UTF-16/UTF-32/UCS-2 encodings)
> - 64-bit integer support
> - Enhanced encoding with -profile/-failindex options
> - Script library packaged with binary
> - Improved virtual filesystem support

Where is this list of key changes coming from? It doesn't match with
what is at https://www.tcl-lang.org/software/tcltk/9.0.html. Is this
just AI-generated slop?

> Also remove bundled itcl and thread packages to reduce bloat.

And this will not break existing users? Is it because those packages
are new?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
