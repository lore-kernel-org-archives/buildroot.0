Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6EC71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC765809B7;
	Sun, 15 Jun 2025 10:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcK5jALB9xDe; Sun, 15 Jun 2025 10:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E3D80983
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E3D80983;
	Sun, 15 Jun 2025 10:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C81BD198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB364007C
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2S1UsPT0yjX for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D734540073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D734540073
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D734540073
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:07:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D7625B00565;
 Sun, 15 Jun 2025 12:07:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:07:44 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:07:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250613054406.3479383-1-neal.frager@amd.com>
References: <20250613054406.3479383-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b6c8b435423519a401803fab511d5c93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749982073;
 bh=IvfmO5G+c0wTBqWsC+unmp0BoArhl9WT8jMv1eTMlqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XKgoQpMlfuJ2X7qAVitwrUSbrH5S4n/b02R+eZFjb4T6F6BaQOtXEAZvbSt759S6X
 7174g2NHWYbuSOZR74WjyDEVsH84Y5ut322IPt4iGp7JcGemC6KnJLPFz0PiN0OCcP
 K4F0un7OjwkUIg1m2KbsKRetYjsmbFo8fUKcFLGL2SW+RquXnqmFvKa15ws2nAzQy7
 7CzaJT5IPjkJxLOYzVHgiaVvcX9Q3CFUx1szayugtvES9c/S/8epMksxbV0R4GSlgl
 yjtCK/4YVhsYzIlPfaXO1FRPuDBwPvjPvjaacJKsNwxjuVTJBCamgSME0PsffCHVgK
 GxCFS9UjZz9mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XKgoQpMl
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: fix path to local
 FlexLexer.h
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/06/2025 07:44, Neal Frager via buildroot wrote:
> With bootgen xilinx_v2025.1, the local FlexLexer.h file is not in the 
> same
> directory as the cpp files including it, so the previous patch used to 
> solve
> the issue below needs to be updated to find the local FlexLexer.h which 
> is in
> the win_include directory of bootgen version xilinx_v2025.1.
> 
> So this patch corrects the path for including the local FlexLexer.h 
> header for
> fixing the below issue.
> 
> Bootgen embeds an old version of flex, but uses the system include 
> syntax
> (#include <>) to reference it, causing conflicts on systems with the
> development headers for a modern flex version installed, leading to 
> build
> issues like:
> 
> ../bisonflex/bif.yy.cpp: In member function 'virtual int 
> BIF::FlexScanner::yylex()':
> ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' 
> (operand types are 'std::istream' {aka 'std::basic_istream'} and 
> 'std::istream*' {aka 'std::basic_istream*'})
> 
> Fix it by using normal local #include statements by:
> 
> sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
> 
> Fixes: 
> https://autobuild.buildroot.org/results/60220f94cca1bcca5667afcb2acffb5aacae048b
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

For info, I added extra info in the commit log to reproduce the issue. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/92f23ce83ae0fa5b19f034ba6d1d5e7dcd073991

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
