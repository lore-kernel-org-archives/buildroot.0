Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B64E91269
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 07:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ABDA8401B;
	Thu,  5 Feb 2026 07:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARf3lFztfK5H; Thu,  5 Feb 2026 07:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3834A84032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770275871;
	bh=d87JOMTONHzusqA5/jz/uDRHilifbG/2BaNc4+UsRYw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixLrmc4kKljuG7JTVPxCJ1KqXBeC4vEGQa1OP6TPttfVVsgIuhFx9we7eAtHHupMG
	 PHqIjT3VP9tDo04rNpAhEDMDIZimUfosmepeN8ufUp0lcF3NrK+mbiVoFG4/r8InBC
	 85VbtraTCXsLK/6oMoehooIYA6CK5jS4cOcE5z4hOiC/rQ0gR7x2vJj63kdZKJprLq
	 nb8xIS2+IbUPbtyRgM39fJXgteztc3bcmW5Bz+dUpKN9I6BwquqibW8ZXG9IAxfn/z
	 nQDkl+TvkkFHrSsXCnoGu0qermLpTnsUvgnhANw1XwXasqahM/XfkOME/g8o6EA6FL
	 zc1zfX5/wZhRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3834A84032;
	Thu,  5 Feb 2026 07:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A61317A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A8D610B9
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45L-gsh_YWsS for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 07:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FE0860D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE0860D97
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FE0860D97
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:17:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 474593868; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 07:17:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vntcS-0000000DXmy-3htE;
 Thu, 05 Feb 2026 08:17:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260204183524.36078-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Wed, 4 Feb 2026 19:35:24 +0100")
References: <20260204183524.36078-1-ju.o@free.fr>
Date: Thu, 05 Feb 2026 08:17:40 +0100
Message-ID: <87y0l7oe0b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NOEI1KkNYpwZGwEQB/LmFg481lyjGZrN5zswDD27b6TD+2K9umwXBH8pwRulkifJgZQgJvrjahxQEeyf7/9FbIv8kALgolbf7rYLPGTtudzVF8F5aNIcYiq8/rYxHVUe9ekR4Pn1cq6b971rS20dSzRW8rgIlgPLdqXzXS9y+i46GhZIx3ju76LZrTzLqjNfUDqheEAb+uBrvLd3VOUf5QABFnkbfrgIH63zwFaE39K2f1IvZb4O0Jq1/IkS44MPBcnHDn1bbB5KHvg1136eo7USuYnGEuRLPcPLTOrjQAC81Oc6Q8yVvgiDxEsI7WqBLC6WdFO8GcGMd8suwniULg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YmEkVZ2V1IM6w3B18OF+wvBC+D5wDgZtpt5+QO3iCNU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=NOEI1KkN
Subject: Re: [Buildroot] [PATCH 1/1]
 support/misc/Buildroot-Initialize.cmake: make include optional
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] introduced a new Buildroot-Initialize.cmake file,
 > to mimic the upstream Linux-Initialize.cmake.

 > However, this upstream file was introduced in commit [2], which was
 > introduced in CMake 3.27.

 > When compiling a cmake package on a host with a cmake older than
 > version 3.27 (for example, the Buildroot Docker reference image has
 > cmake 3.25), the configuration fails with the error:

 >     CMake Error at /buildroot/output/host/share/buildroot/Platform/Buildroot-Initialize.cmake:1 (include):
 >       include could not find requested file:

 >         Platform/Linux-Initialize
 >     Call Stack (most recent call first):
 >       /usr/share/cmake-3.25/Modules/CMakeSystemSpecificInitialize.cmake:21 (include)
 >       CMakeLists.txt:20 (project)

 > CMake version < 3.27 is setting its LINUX predefine elsewhere (see
 > commit log of [1]), so this commit fixes the issue by simply making
 > the include optional. This will guarante the cmake predefines will
 > be present in all the cases.

 > Fixes:
 > [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/ef9f0a07ed40970a7de4c608a5708ef6ceb75131
 > [2] https://gitlab.kitware.com/cmake/cmake/-/commit/cc737ae8295156812e697a9d2f3f7b79bf7b72c8

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
