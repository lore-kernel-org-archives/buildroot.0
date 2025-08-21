Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9E7CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EADD741BED;
	Thu, 21 Aug 2025 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZ2U8dnCItNQ; Thu, 21 Aug 2025 21:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A5541BF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A5541BF1;
	Thu, 21 Aug 2025 21:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A247F1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F97D415D4
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9zdLd-2eyME for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B26EE415B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26EE415B0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B26EE415B0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:37:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EE66A13F8B9;
 Thu, 21 Aug 2025 23:37:34 +0200 (CEST)
Received: from IP-208-94-110-98.static.fibrenoire.ca ([208.94.110.98:36870])
 via IP-208-94-110-98.static.fibrenoire.ca ([208.94.110.98])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Aug 2025 23:37:34 +0200
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 23:37:34 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
References: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4d3fcc66d7d6504d6ae874d9e8fe67ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755812257;
 bh=FuzXeuvlVqKIlOsDQa2O1sbOJRqHlVlyPtLuNydFyO8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oaCYmydNVcoP7jVFSwG8z5HOZm4/gsvnTJsX5NWjIp/h1nRje2T1pjo+XQ97cPmsu
 mgwKLQkD9g0bncdyq4TeWhM/a2UgoHgMpHYvFHpn58oj2Ck8CBpr7TVUlNnFZWmU1R
 LNDoVJCid5ZE0/j7Lb6rYmfh9WaUF4ETUwTrao8LL+DiQ8iVoeI2eSU8/Z0+2bYxpY
 dJQLNZQn7BVBW2jTedKLu3KyXtkAW/sCdOkgwPyUnU8PoBg0e8srp38VZQnBgeWCyK
 HZLzDY1mdMibycvBjhF7CDRLlXfFhliw78pMkMBAVGd+K9oTBNHIEiFfqRUZTqeIdh
 WgZH6SbyhKTYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oaCYmydN
Subject: Re: [Buildroot] [for-next] package/harfbuzz: bump to version 11.4.1
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

On 19/08/2025 23:32, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
