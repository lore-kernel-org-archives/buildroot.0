Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC09EC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752FB4093C;
	Mon, 14 Apr 2025 19:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xs45fvL2us01; Mon, 14 Apr 2025 19:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A15A240BA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A15A240BA1;
	Mon, 14 Apr 2025 19:03:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A36D1205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94DC441080
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBD6CWmDT0-C for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9565040C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9565040C53
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9565040C53
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:03:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 986E8B005AA;
 Mon, 14 Apr 2025 21:03:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 21:03:43 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 21:03:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250413112836.789291-1-br015@umbiko.net>
References: <20250413112836.789291-1-br015@umbiko.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <f29796a5bf2b5a05c8b4a9252136e6c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744657424;
 bh=EKF4XHthZLE/layic2IDtl1fO1kCLi0HNmTHTqJNFyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OndCfdRaOcP52VBOyidjPuVihFJ8hwThDYJ5mBG/Aap98SUu1wGB8gMznD7sZDUZT
 WkzOYGNSBMDDd0J62uMSp94pvECN7PsJ7agEOCrP3z9P/zUyuwLrc1AJ/fXaEoZgbh
 klnVGHGqNVilEhoonqxMnYnEweFP43DhBHFCksZfJnFRRNJIy5j4B7gBw3yvv7d7rP
 /1bzDMd2/uGmQqxwNCOwC1853eYBRrmyE9kZg6w6cbWzQo2QN9e4WJqw6fu8W709v2
 CH0UBk//+kqZ963Q4D5/v9RcNWYgRQBTKpGUYEbjzVRPblVXZ2NiQUWihMA9r+EDZt
 +GALc4tTLAISQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OndCfdRa
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.3
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

On 13/04/2025 13:28, Andreas Ziegler wrote:
> Since version 0.24.0, support for SoundCloud was removed and
> yajl replaced with with json-for-modern-cpp.
[...]
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.
For info, I added the missing entry in Config.in.legacy. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b1ebc686d316a0ab3eaebc50880a6e420afbe220

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
