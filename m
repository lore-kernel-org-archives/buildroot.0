Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FBECD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 12:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69CFD849EC;
	Sun, 31 May 2026 12:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4FNHby3vaVi; Sun, 31 May 2026 12:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 843E184976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780229453;
	bh=9Te584p1K9zD7B7gpme3zSll0iFqXeYItzWTMTED3jY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=snCE7FhvMzifiHgLWGcehBs8QZcqDeXi5qwv4lxMBRxu0x0EII7xKaaa4thpKJvUR
	 DR/sKpxymb2/oz1O+rqUWPFszwakCyll7le/SQygpgmJF9zdDmCQP5x7VIDiKMdUYw
	 kqs/Cb8NinPK7OSiNsfvcIXs/mf1b68JciPC6aPD2gnaDDzwoA65tX4lqBqY249Zpp
	 TOsHOKhsKVcQjwkPf2XwwKdjR7YYH0be/94NBNwCpQLDXoTh8EOWaV0ClkdPu4/m4v
	 KbtznCY+cwf4AE2RPFi2QNWldJ5vd5Q7zwGFJbNpUZgZ/eZSeEdjmcLwevfWP56gGO
	 b9yulE9uFw/cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 843E184976;
	Sun, 31 May 2026 12:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 090F3F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0744760F7C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yERpbVaiDk63 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 12:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D38360F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D38360F7B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D38360F7B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7714C4E42DB8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3DBB260230;
 Sun, 31 May 2026 12:10:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61A8210888CC7; 
 Sun, 31 May 2026 14:10:47 +0200 (CEST)
Date: Sun, 31 May 2026 14:10:46 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, 
 "Ernesto L . Williams Jr" <realcontrols@gmail.com>
Message-ID: <ahwlOxP2pxF8-0X5@windsurf>
References: <20260218073958.455704-1-chakrabortyshubham66@gmail.com>
 <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780229447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=VDgOUm77IiFrwF4N6wz06ijztxG3ZRExrNQ5lQxrwrk=;
 b=cFfBxl5+VSwDMzD2TMc81W/0tTprcdkeMwQ9uP7hxqNDcNhYT93L8jsDj+8170/jnp2Y4v
 FPcC4VNwX4PnMZvqZHQWwZWUbJ1q/LJYKC+JtIuXT6DPMaga/07bnaM8zUj8lRamtKHl+P
 ysni+05dt2ptejsEx/DtO36lm+EJWm79kVYSKEJatTD+5+OugHiEkLVrp833EnXXa5eMaL
 Bg67V/Wg2IHtpBqDzSNXdIZmLiZ8ZmV9qppvGwvoWdVe8UqxuoxFo6aAnqdjkTrOpYJjSQ
 3O4F+8B71zS9uJwShGAMRuy0Ny8vGaCTSiesxSehmepCAclIalf4/IZQptyJEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cFfBxl5+
Subject: Re: [Buildroot] [PATCH v2] package/szip: fix build with GCC 15
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

On Fri, Feb 20, 2026 at 05:21:15PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which no longer allows empty parameter lists
> in function pointer declarations or old-style K&R function definitions.
> Modernize all affected declarations in src/rice.c and src/sz_api.c.
> 
> Tested with musl toolchain and verified across 32 toolchain
> configurations using test-pkg.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Same comments as for libmpeg2.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
