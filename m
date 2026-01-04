Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3DCC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 11:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5675D80E73;
	Sun,  4 Jan 2026 11:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YhLKFu4VWbT; Sun,  4 Jan 2026 11:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F42E80E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767525541;
	bh=08AyXfdGPkUmxf9xt9yV3LFFdx+GOYtfca3m9c6QIrs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r05WA29/zOu+bl08PHMrPJ96JQkua/dyTSVZY5RwUB6RkHgkOG0VatDl/pmRdI6Vv
	 eMsc/Abl7j32xOJKxLhrS1uLvbNBlqhjy5kIu3B1DcIJAkRb19nmSjzx4YponQW1YZ
	 DnLRS3qSEC1LDIC9KTaTXKDri+BLIV5HsXZgNG7R09moZ8t4/MoMtTQXeYRMK9vOrN
	 DnxWzS3/ao1o0Lxrm4llvHUAu6nNI1J0IDdWEYUdG7QFm80e+UbXApi4pFMoRrc1rO
	 z8wz/L++vBFoQcSSmjhdXJ4umFN8E9RFO3684WK2kH+NGvoqb9KUeBRKES1BZtw7EI
	 UcS040lH84QBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F42E80E45;
	Sun,  4 Jan 2026 11:19:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97B82249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EACC80E45
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92ftA-oOFqbn for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 11:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0A4880E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A4880E42
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0A4880E42
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 98854B00565;
 Sun,  4 Jan 2026 12:18:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 12:18:54 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 12:18:54 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260102230426.531850-1-james.hilliard1@gmail.com>
References: <20260102230426.531850-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <519b3ae80dac0c5bcfd1f81da487540d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767525537;
 bh=gSm/9IxU7cvGpldQwUDMg3m8AJVQs+7eQPw0hkCDtKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=usV1oQBUi4olSGesKPVyOTcWr+sLkqSyIsmmYXdgtVLQGJapBn9IFy8oDIbGQ7LLe
 6/Wo5G0LRW66oRZ5ip0zgKkOrlndcCghOmWiu3+Xh3X1gPYCAN8KRIWKEAkwdKF9tH
 FvyE7fCBYg4mgXHgofHF7onJqaMCzccupuaDF7zwVzHT1O8qamxBJfKHdz06RvQkwc
 hJ3W+aVrufa5y0Tw7Bd8WYuGgMh9ZQHjUNzpd/JnS4jGo1lR0Gg8OwcxY89/EB9FG1
 8zLrrtyIvgOuy9S3kFJPaZkw/9AtEMBgeHGI1cD+t94vIyIX67x7HCZnICbCWyz9j6
 WOrEL8Am3U9YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=usV1oQBU
Subject: Re: [Buildroot] [PATCH 1/2] package/python-ipython-pygments-lexers:
 new package
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

On 03/01/2026 00:04, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
