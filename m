Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49558606A336
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VNw1GTZH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BE6812C5;
	Tue, 10 Nov 2026 19:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny4KHY7SvrZu; Tue, 10 Nov 2026 19:44:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9608881186
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794339859;
	b=WAKo9m3x1yo4QIUExPUHqwv4WHgBELjkqqLaXl73HZWJ7R3Rpcvc2MQjTKcBGQL3Y6/4
	 K8Yd2LOxrCbXAKFlrlW2rtg3sJQaWoaW0lKp4awGNi4P2iOxv1UkST8q2fPx8tGaK18D/
	 F3tOHe/gS0UkMR4Aj25OrJuHmMJEw5TBjXyXDLuyxTNaY4f5ISTn9Kt7c44R9CJQGA/l1
	 mulTQZnfkGDB611GWi3ANa/+XeDyZ7xWFieMTIKsGC8D/GOZRKgeChiKzqcIevESZTl4p
	 RZTGgWddK0pl2JyXnS7n2eFS96RnAw7Aris3bZShvbD+P/tlOs/fNg4ARQ0+VBWSZOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794339859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=W+IPfgD19zKMeJN5StgHJOrmvwVlhwU53n99cWe8o38=;
	b=kBw02jrhWeq2ORHRkU9TNBKfGsGuqCE8oR8hS3xjFWMq8EYcWk8IAG/Gre8aGdcz0VY+
	 wI/WY3k+4QEwn6gXTpWNfQD57JBYHJmuj0FCxE9N3P/2wDwMH8i/b5LDT0fiQ2EAG9u87
	 pAnRJGKgcLntmsmaGUj2j+82tDT/XF353BEK556RlBZPTwZXR/Xawr8JZizLwniajoxoK
	 Y0hSFUrUCSLaC8uS76ZOYL2ZntWQMalWazi8QY6Ndsw93urznWXOkgWr8P+emRpIgD99m
	 xa8/LLGEvsPLQOY6YD9W4K5agBdF3G1o/yvEIiqAvhNZCY0ucFtbHPVnCdLDel3LB7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794339859;
	bh=W+IPfgD19zKMeJN5StgHJOrmvwVlhwU53n99cWe8o38=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VNw1GTZH3lpfS6jF4oxpJiWCQZRuvTwh4wff939MNEl+Kwv61rTslnm5XPZMEe61N
	 50WtnK1rpCfS3VOKWid0IpbsrV7wrV01BludLqMJo1n9VHNGDTcS52Yoq0PVoFtoOU
	 khmOcWCu8au6LO89+RS8Rr7tHFdpyeG+OH2rIud+shXG/eCs0G9jIm28Is6p5p1TN3
	 MGUqOjX5UiSJAvq4IqPr/lCmbFl0U30FJjrRvP+k4yd0mymnVKJijOfDaQyb5s0PSY
	 HaV4YLN/uVqjls3vuRYydTNw2BkgWZTZF0gDQhVAkrjhQZnVJK3EpbQHxj4gO8aMKD
	 VOwD+bQnIFbnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9608881186;
	Tue, 10 Nov 2026 19:44:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B8B9D1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D3381186
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RapxWIH6BEc8 for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 19:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BFE181125
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BFE181125
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:44:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 045E013F846;
 Tue, 10 Nov 2026 20:44:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 10 Nov 2026 20:44:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 20:44:12 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261109110029.1306930-1-giulio.benetti@benettiengineering.com>
References: <20261109110029.1306930-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <d0b490b5bb19404b8bedf55a2b717363@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2025-12-13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 12:00, Giulio Benetti wrote:
> This commit allows to build with Linux up to version 7.3.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
