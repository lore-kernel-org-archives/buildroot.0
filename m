Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEB7C61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 17:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93BE60615;
	Sun, 30 Aug 2026 17:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnviZHkfxZjU; Sun, 30 Aug 2026 17:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788110536;
	bh=gaFTnf29d7kZyQ2zS0nrhrBEwc2GFe7DTPfmxrL3V9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dtej8ArKanypdTcZSGWb/DQDiEnnhx40aYZ1rDT0TnsjMUW/i4sw9iVM3ohCSY5Ex
	 s19NESp1iIOi/2JOw3LFFqinrrbbJZSngGaJ6us1Yu5aBUL9q8/Q5hA9qVutomYQq9
	 RFUNbkPzufMs0VejMKaB8ddMOmuO1Li9HEG2bmwo6eSCHziR9YhSP7dL3SSSNRGgdO
	 qriXGZlxcSI5vWrZjzyeFZpP2jin3FuUZ0qXTFteQ4/Mg0l/lIv85bTqxSqbxhXsuc
	 LNgsloOqi6xXebaFbVce1erYhIft+uIYClNhO9qrLYtXG4G6E92MyQGzJFJwbGtyg0
	 qh9A8esTcz9bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A11605E5;
	Sun, 30 Aug 2026 17:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D17F265
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13155806C1
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgPZrz2Mcv4A for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 17:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045A5806A9
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8D26513F86E;
 Sun, 30 Aug 2026 19:22:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Aug 2026 19:22:10 +0200
MIME-Version: 1.0
Date: Sun, 30 Aug 2026 19:22:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260829185753.1216210-1-bernd@kuhls.net>
References: <20260829185753.1216210-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <04cc0c66a8a1c8c8b56aefa93e057e50@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: security bump
 version to 1.11.3
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

On 29/08/2026 20:57, Bernd Kuhls wrote:
> https://github.com/signalwire/freeswitch/releases/tag/v1.11.3
> "This is an important release containing critical security fixes and
>  stability improvements. [...] We strongly encourage all users to
>  upgrade to v1.11.3 as soon as possible."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
