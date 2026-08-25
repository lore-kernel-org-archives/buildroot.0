Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CF0C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C776F80B83;
	Tue, 25 Aug 2026 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi_ceFskaQZG; Tue, 25 Aug 2026 21:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787692774;
	bh=Bm24Xgfy3Qk/zRSqUA6X963/xH0op0pUMllIxE7/fjE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TQT/HT+8xPcKD2v7smvmIZiqDTQom+RykcD4sClK6VzvYwbQCCLKvI0+5BIN1steG
	 c0TktYWCqBBemIue+pOoIlnKJxADzQNCbrJk6Koh08c9/V9NpKYOCUq9GbHoq6SuW0
	 aQQ6rWtEP6CCq/ZwqTSfIRfz0/wCPGeapWHBO3Xht0AT0wkCk0EXYLoqro98wAqcOH
	 qH/nkn5+o16xedD3wYLoWR81utzliicFbdpS0o2SYjdyxbESvzjorUIbOZ+xAY4pHn
	 V7L/EYvxcoG7bqZSCeJEjvlS9ZLJ0OIsU3o2XiQPl8K3Euwj5SCPvlkx6hYU2jX2/X
	 /MQdr/uFlad/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CA380B50;
	Tue, 25 Aug 2026 21:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F31334
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93CA7606AE
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z23svc-oFQWK for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8570D605D6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:19:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 925D6B00548;
 Tue, 25 Aug 2026 23:19:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Aug 2026 23:19:26 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 23:19:26 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260817214251.209317-1-giulio.benetti@benettiengineering.com>
References: <20260817214251.209317-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <e54f1b16fd9b37ba807585a20ff90bff@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.39
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

On 17/08/2026 23:42, Giulio Benetti wrote:
> Changelog:
> https://hg-edge.mozilla.org/projects/nspr/log/54e7c1b0803d151e142e30dc0d05f12e1ec67a13
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
