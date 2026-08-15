Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85387C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBF2407C8;
	Sat, 15 Aug 2026 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPImxK-WfQUk; Sat, 15 Aug 2026 22:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB221407C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831791;
	bh=PTHHFYQSwoodtm0YDUMOZ2UdHBcPXIxTTmV97xNDvVM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a27mytQGEJgL1zM7fsuv7ZsiqqMXwwy090YA7+me2QfM0j8ENV9jZ6gPRgJmZ6EDH
	 Fc1jqLs+leFnb68EDJ71hFRkR2Kli0Rofhz4dzjTVk+N0n55heD1Z25aba6xqhoz2V
	 2hL33BvfCFfZ0sfoVZLHeKYwP2dBc9d9yx3XNGCrSxPw2xyrZs0G1H9qac/2a1DpK6
	 39cGuYn583r/hqc5tq99oiSwyERO55M6JFn2AglRxGInN2bO3RbrIN5nVgSdjcUITX
	 5OKdfBVs/BcIQEX00oPOLJPhGhbhKIqVF0LG2n6z8oM8fu+AG4VZ5G3hqkPQAham7I
	 +npVbsy8pv5rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB221407C4;
	Sat, 15 Aug 2026 22:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8AD336
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C31B80E4E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BJAWzQOfYpu for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B490080E95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B490080E95
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B490080E95
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1241F5FFAF;
 Sun, 16 Aug 2026 00:09:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 00:09:45 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 00:09:45 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260815215953.1015733-1-giulio.benetti@benettiengineering.com>
References: <20260815215953.1015733-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <32de3d0d898643b31d452c34ae074f52@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.3.1
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

On 15/08/2026 23:59, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.3.1/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
