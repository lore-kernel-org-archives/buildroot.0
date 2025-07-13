Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A667AC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD6840A21;
	Sun, 13 Jul 2025 11:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tkt7AjQlVM7u; Sun, 13 Jul 2025 11:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09E640A27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09E640A27;
	Sun, 13 Jul 2025 11:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B625E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38EF440A27
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJkHsQulivbu for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:06:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B0A340A2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B0A340A2E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B0A340A2E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:06:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4FA485FF88;
 Sun, 13 Jul 2025 13:05:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 13:05:55 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 13:05:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
In-Reply-To: <20250621173157.4048801-1-bernd@kuhls.net>
References: <20250621173157.4048801-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8452100bc181bc62bc849384a3e0a9e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752404758;
 bh=AkYo7UtlQCF6pUiTBAPS0de4UbYowIorfhkZydzDbug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GYv79Vlf/l3D4Bm/LS2E/93QDr7SMIv8ynyoDrxJ3efFxRseTV6bg7qxCysLMXz+T
 fzrjE0gFO3Z/HJvkJUybRqV7p/COxCWxEhQvPxFFDaYzd/+Sswot4VJ2JQdRs8OnyD
 xBNbe7f/xsiPbPeuKGSCLNtMgJ722nYlMGR0q8PjNeOgWXmBu60h2Q25I1gjItKLF+
 mAAsRLk6XgrJEqCtYyxJD/xgiLgZJXoLpebtb6ccFnIOzYA1x+4cqmIOQN+a7VBDdq
 PVWGud1L8tRy4lqKhyhhsU0vo4iZkx+eWquOkNNpeSJNAmhYUkr8xQXvRQt9J0xsgR
 W2Hqxku0D0OZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GYv79Vlf
Subject: Re: [Buildroot] [PATCH 1/1] package/squeezelite: bump version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/06/2025 19:31, Bernd Kuhls wrote:
> Update license hash due to various copyright year bumps:
> https://github.com/ralph-irving/squeezelite/commits/master/LICENSE.txt
> 
> This version bump is needed for compatibility with the upcoming bump of
> ffmpeg to version 7.1.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
