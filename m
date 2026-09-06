Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1BC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 20:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B2A40586;
	Sun,  6 Sep 2026 20:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXES6RNawOtq; Sun,  6 Sep 2026 20:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1C7BE40587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788727221;
	b=amk4yjRwrdb4G0i4nrK1Tz5cDiIPdnuEPeQEudbkf6G8VSpRjknff66VxqYiCswvNEWa
	 YQRi3H1tWFt6opbEFg6z+IrcE1VPQt1h1j6oHC4YeCDsMrBIfMDJygDQhwbHwd3knFccc
	 YPfYlj9Wrj1fkiocTr+ToY9ifkre5JYViGElLHf+mdsZVyQy/NN8tHc0FKMSvSfp2JBRT
	 26iFMilF0Pxyt7kzNSCduL3uo8+wUxB3WfFHzD7+wOH4LN+b0jW6mCNmTbywhK/mg2dQ1
	 Yo4ntv9+MazpUMCJf4Xwu9djy+809WIKJ2CLQyOlnRTjjJADOALgQVtkEdxukVyPvZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788727221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XzRlxtkICk/U6kb4At2+iwa4yU94tc+5mUTB+ia3eiM=;
	b=T82BFZMNSMQTOlMp4Jp1l68kVOxl+YLXkEyySjSGdX4b6r6ucJ4HT2fEtVnVMVnlX1Ta
	 NFMqYyQxtGNGIBl1x1ERZGRrPu0P9iQSX3Te5nSTb0ov3Px+CmIqR0iRr0BLpTrQAf37h
	 mszuz9dbwzYMyolVVBzo/xyWcLH0uD31wTLCTUOexdZCWmPBRSO6knMQlgGmO8VhX5Cqd
	 NRzXAGjpUadsfFpSYKviWcygDlCTDvhrpYzMfvf3nthl9xtBkeqF7vOsDfp2nxIdUHcXi
	 TWjwOlKD/91m4dDs5A0QPVkBzaWHozU0pSsNhQRQ3eLUMgcKewfdWWuvuk20nfbe5ng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788727221;
	bh=XzRlxtkICk/U6kb4At2+iwa4yU94tc+5mUTB+ia3eiM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=axQMiiwM758qf5sDnjYaq6PjxFjtuI4o6h4UiloSrzePg55PIYqyWcJbMR5/+9Uj0
	 y4ci5xxaGp9PNCdJ8STpQr8q/NuzGvGxY9tjZa4Sf4CVfg0BHyYXX4UsH9s/mVBuic
	 6deff0jhPa9DWlbMwJs4HiGTSZ0ScRowgz8CZIacq78grLjM8QXpq6bTrR+CVjrYLq
	 9ljH1xRO/1X7z8DPLAZ1cZsLtV+uz5h7WlGvk4OIOHdHuD39zbqOh2bAO4ou5OTewZ
	 OZx8+C8T+o0dUi70Uu8RQT2Ky+WMIQX8S5MwpCJKvvZzYYzPuChzBrhH/zAA/Y2VDC
	 zxyOFqTvozCSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7BE40587;
	Sun,  6 Sep 2026 20:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B8F72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC14F4009C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdYrbmSnj1aO for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 20:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D2DA840079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788727218;
 b=tTuHPOI/7jqOfW1gRjUWk5DKf7uRIeBFLIkw1uakbbDUl0mlN2OOjepuMqStAtyuE7s7
 hweMQwhPgSmJy6ApVHBkS2qdPhA6+I8kyEmvJWeCsCRlOSqwL25MYGRRto73qEB/U3nCa
 VP3PMStjZhtYTN1xdnSAUaESKCP267gp2jBRPAImuN7FwJqJbiB5JhFYw1g0TBEthnm8b
 vQOWdixY1caZoH1D/8WV3UwfzOedH4TmPGZKMtBzEN0yZ1GrZNC7v8fTX3u2FrJnWsfib
 egb5xpalvfWbA+IkGNV80teXdRy2Y5ENDaMqEgLebF/v+H5aAk/OL5Qg65abmRzaNWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788727218;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Rz2/yGhPT/6JTrQYcdznHmQGRhYZUi9foj7ZqxFDRd4=;
 b=X4vL76RnX0Eha9hrXb+7stDW5rOmP7a37hlh9YSqmdhnragcMvnxDKgTFDaMaKUzieyW
 8seM0Y+Kxp0mmKcVbO+C3cLwfwqfo5jjC3MF4FybDM1iCxbxcU79b4yEFFjnL5dBgU6bV
 qW8fmlFaX5ktgDm6HowdZ3QS3ZETwHtgA5VxcaT+orAz5c5htotwow5cWI/IjE8s/WjNw
 JnBM4Zp8No9lw5Yqo4LZblfjGakt3+r4/w5c+W7j7yE6yj0kFKcV2MbA/SW6dGTNH4AFW
 cMiPs41y6QVTgxdqTd462pypW7MZ+wr41mX+xqfcOib+SI63l91pQpaBI/Ay2eFk9dQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KmZV+KNY; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2DA840079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:40:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CF92119F54D;
 Sun,  6 Sep 2026 22:40:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 22:40:12 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 22:40:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Stefan Ott <stefan@ott.net>
In-Reply-To: <20260906163101.3704115-1-bernd@kuhls.net>
References: <20260906163101.3704115-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <b28fbf4643a3d61ae18e37697ce7d633@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.26.0
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

On 06/09/2026 18:31, Bernd Kuhls wrote:
> https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
