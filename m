Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6B8CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495E240ACB;
	Thu, 21 Aug 2025 17:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCBjcXHY8t6W; Thu, 21 Aug 2025 17:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 836B240C33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836B240C33;
	Thu, 21 Aug 2025 17:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C53D8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 723A884489
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNtSQv6-IVnY for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 17:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97CEB8445C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97CEB8445C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97CEB8445C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:01:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 460DF19F58A;
 Thu, 21 Aug 2025 19:01:12 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Aug 2025 19:01:12 +0200
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 19:01:12 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250820172131.2060348-1-angelo.compagnucci@gmail.com>
References: <20250820172131.2060348-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6f0eb86e8b87d0e98d6f44923a488fb3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755795673;
 bh=veSYxv0lSgZnztOYhyfCljb4MDb9SpNILZPwdn5aaFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vReElJxfOxhPuye5FUHtSp9OHer+Hm9VaeIypq1PjMDJ7XMWFS19GHKhlMvlRUuMg
 kILGAincpZxqi5jZM6xTBmBS0v+9X/ne6IriQvkRU5jUMit5kh1TLqIaEuFZLimqAO
 Kt9rNIs3hfXqOk/Mk+HnfHMoubDRcrSfd9lb6Hr8J4Fi0NjTUa0QLf2FkSCkukbWfr
 VXKM0/8yd2f+uQygy34BfMB+7qGp3I1fnJgTk2QOxwSdaQkJ5/RUIZfu6hPffFmWl4
 j8KOgEs9NslJ8rc4Z1xOceFMz6OgbfLjs4BFpheY/8k/KTcfGWBRmMufFZe5+RJiPB
 PvTNzGMWFxTNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vReElJxf
Subject: Re: [Buildroot] [PATCH] package/python-can: bump to version 4.6.1
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

On 20/08/2025 19:21, Angelo Compagnucci wrote:
> Changelog:
> https://github.com/hardbyte/python-can/blob/main/CHANGELOG.md#version-v461---2025-08-12
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
