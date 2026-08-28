Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C629BC61DCD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 09:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1420940819;
	Fri, 28 Aug 2026 09:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haNwVuFCThvN; Fri, 28 Aug 2026 09:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787908154;
	bh=qpvB0AvhdS2eOGG4IlN+J+vFDAyUnupLzUyw4pRF5vg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OiVL9N3XWMZnfXvlWztZ4RFZufHRUPmdrAWJkXfXxSl+izPtRqWNjAvT1vHeYYduK
	 V5hNdb9OGPgEbNGeDNFlK042DY5TLehgxfdSuSHVgQe0Gs1/7mkpbzAitcF6BueUu2
	 +BTXwgjoSK7/4s8A1VyJ/k8KdKpV9xxtIukiQylFpl36Vc1PrUnVDX9hud3Pq0f9KL
	 HUdlnz4GAT7vwUE9piEjABSUzwVTcvZX0KJncPBfSfh/2jUEhTv8AUDycXZ84BkwQW
	 yw0kgxNzJTnkx8mFPgAotMxSoNwQbAshtVsqHkepV40ZdmrdJ0pCu7QPHbhMMeIkkv
	 6TUzLCz6TdbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1E2407FF;
	Fri, 28 Aug 2026 09:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF58478B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D108F80EA0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwXvUPXjahfl for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 09:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBCAC80E97
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:09:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9A89913F88F;
 Fri, 28 Aug 2026 11:09:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 11:09:08 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 11:09:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260828051225.42832-1-bernd@kuhls.net>
References: <20260828051225.42832-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <4c13c2e641f2afa056bf642e87ff18ad@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.10
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

On 28/08/2026 07:12, Bernd Kuhls wrote:
> https://news-web.php.net/php.announce/504
> "This is a bugfix release."
> 
> https://www.php.net/ChangeLog-8.php#8.5.10
> https://github.com/php/php-src/blob/php-8.5.10/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
