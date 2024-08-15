Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E38FC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 14:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE42406B9;
	Thu, 15 Aug 2024 14:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_66KGOJXmz1; Thu, 15 Aug 2024 14:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D73406D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D73406D6;
	Thu, 15 Aug 2024 14:15:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40E651BF591
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F61581229
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 14:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2fVUkB8LoqM for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 14:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 791FB8121F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791FB8121F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 791FB8121F
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 14:15:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 426F93535C0D; Thu, 15 Aug 2024 16:15:40 +0200 (CEST)
Date: Thu, 15 Aug 2024 16:15:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zr4NjOxFOcSXbWuX@waldemar-brodkorb.de>
References: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
 <20240815145006.72b13d72@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240815145006.72b13d72@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723731340; bh=j7IiLGbjUgsvlc2LeNpCr3FgDFsxSze/8IJy0RMLZps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RReAm2qPnXxI47s1VrAU85bAMHDrJGhMGUZl+mZfa9Yvbr5tI7+hAXDCnQb+/QVep
 s9HAUbSzcisjZRYsF/jJJo9bvTIA3rTz4OrWOzgOC4LVkA1ZrwAkviT2fOwanC7gec
 fPhN5osp9BGwFmy/CEWROEvWunJPGv9UPTS58Ydnc+1qhpz9Oe9pUJUdqkL3LZLhp9
 iTXTo+bz6g1oWCqYzCf3h1ebwJBGDacS9naOnKTG5PzXx+xLMkigb3AkumSoRJXLyQ
 pbNX5EUA+6KOwDQfJelrod0QBrhIe9ojvTKugviXCoGcd8oblcuGBIvLahY/JouBwT
 cQF6yayjMAcvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=RReAm2qP
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix microblaze compile issue
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Thu, 15 Aug 2024 12:45:45 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> > +FFMPEG_CONF_OPTS += --disable-optimizations
> > +FFMPEG_CFLAGS += -O0
> > +endif
> 
> Could you clarify why both --disable-optimizations and -O0 are needed?

Yes, --disable-optimization prevents adding -O3 after our CFLAGS.
So indeed both things are required to complete the build.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
