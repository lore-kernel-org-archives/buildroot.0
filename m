Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89F7C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 13:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7621E40A49;
	Sun, 27 Sep 2026 13:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id supqkfwu2Avs; Sun, 27 Sep 2026 13:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A8568407CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790514572;
	b=F0QPxsaVQWf/nXy6GAh9Nyb6EKRvbVplvpE2RFvxmsk7TCoSDsrdsdhDJYCbxrnjjIb8
	 NMxAsjQZRuSRBonfAlB+N1j/PAUliVaONn3BviI0LJblpvbYIsu7awhkpsKhFd+BrzBJa
	 B/OJbwK6JZElZkKG2R799MqS9QCfoXl8RyVfIr0ZGCMZKtShAwRBY9dgyagD+GZBb//Ze
	 bbQhbdIkePDQDfCwiRf0KwHwqDRmlPR6owtiZDnFyI7w9hwguPYkDo6JDGXEynW8Axd9f
	 U6agCRGydNiLoQa17/lQWYYhSDbdZKJijUjGpAYStognCuDr4WGaj6HYTj5hwQKk84w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790514572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=E2yc/nyOlk3zY+BJDs6TF+hwpAxrkH0DHSqQokQVOrQ=;
	b=d3nzbCqU7hPpN4COAaiZgkJ+KhcrMQy475oQVdn12+pPXcyNNb72bsmjV4A2aU0t3j9d
	 Gwoik3re8aFAPnjOis38ctWhoUbK7kDQCaMYTc07623MtHadz0d0WzXyFUl2KwF3GRWeE
	 BxXxgza5C+L8cPIXaMFs1cqk2ZitDB1bWo90yeBLwIKSzEKQhNCd7eUhg1795hyZfyvEd
	 ot2aRYwfs/bT/2j8dfnl/mqsFPLydd5FB1rvZWe6uvJKWjSaeXDB0xE+hFWr6/9jLnPNc
	 wex/Wqd50sLCYpWOYkOWHO4tel9Uv3D5rd/j5B+rqonDdl9oRbAIhDnAy/HHLiwCkzg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790514572;
	bh=E2yc/nyOlk3zY+BJDs6TF+hwpAxrkH0DHSqQokQVOrQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bYMjUx5b7uHtscIGUSBkGTWVSOGzUDn0EBqn37JuypbT/hv+S+K/s8lalYSEw3OZK
	 qRUsYfk2wuMV0hxVfHv4yye1u/BWk8B5a7VAfLH/wb3sd8nJX20qkIOUvpjz7xwJ14
	 XNv4bxPp8rg8y9Czjyz04JolWijELYoUt7HBE578rXdDcalTB+DRSKohHVp6C5cDnP
	 LSkv8h54j0FRfi1hi2I0lR9pC8QDnw5xFBYzu6hhE3K67uZl+ekFMrE2+dazDnxMsf
	 1X4dd9BrElQyc20y7Smhol/aw1kY2ijjpDV1Iu03efVKTACsCcIRQeiryCrEHP/S8J
	 W/cbtwqGRWfGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8568407CC;
	Sun, 27 Sep 2026 13:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5A6422
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFD4E40099
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5MLnltxjP7T for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 13:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 73DE040068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790514570;
 b=XTEantOgoWr/Y/iMQcIcld4MnH0jou3dGArdy7aje/alIQwRaEvP6VgaO0Mw5ocNuduL
 RI81Jo+2Jp5iuXEiVcyxCFdH6M1I+LJMgwYG1YN0z9ddtTh6XjaoAOm/p4029hVkfi8P2
 GrdIMsUdZLyqGHmaK63Q0GLtpZF8S7tFLPTz/2qzZygZxhXWEObKfh6GtNdTRd4ov7otN
 9P0jWAj2KAfDVvXUTOy9Qn14fbuFEGDIUGFktmrMXQlZ+ug5sPgLcMw4Ew66tjBv5erU1
 FM2ZbuwbHywaY0BwLGdPl4PVs1VnUNXbmsiKhChNuhnttl8s9dzgljqzge865moUTEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790514570;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=mAgg8Qnb8VRs7RDhOEAbhTreWaOmFsLuFAUNoL0GN4E=;
 b=oqyyEGys4w5214Ph9+iRMOWCD0Sm5Eiui1qpGcH67nYPMzFO9XOXerDU9gKS/Kg0zosl
 nz7WIAZk7xzXbLgMdShlStTd8yFyxEzx1nqOdOjlB3ZF9NiNFlDMA0QgxeGjKwbmBV3qR
 jIT5ImiYHUpfU2t+Ct8lKbvfsZlNizPuiatNl1ORETM+UOvqdayKQINi+Qm24UHX37wnq
 N+JdYBTaF1U/d/50GmFmcjh8PUYn2xM3Wn1YuUrknH5cBnI62eehrCJmdIU0E+hpk2q0j
 ucp/Q2dGzsa206bbA0rQwDz3pam0S4FF3wu1Z5ZufDVy9y3mxcXbidU6x2cAHEyXgaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gui9XTA8; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73DE040068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8834AB0053E;
 Sun, 27 Sep 2026 15:09:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Sep 2026 15:09:25 +0200
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 15:09:25 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260927113730.117619-1-ps.report@gmx.net>
References: <20260927113730.117619-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <049a3588166da024bd1dc58d8561ed1e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/chrony: bump version to 4.9
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

On 27/09/2026 13:37, Peter Seiderer via buildroot wrote:
> - bump version to 4.9 (for details see [1])
> 
> [1] 
> https://chrony-project.org/news.html#27_aug_2026_chrony_4_9_released
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
