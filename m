Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57747E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2408540F48;
	Sat, 11 Jan 2025 16:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU7r7-va2943; Sat, 11 Jan 2025 16:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 077AE410CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077AE410CA;
	Sat, 11 Jan 2025 16:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3102C940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F02F60E81
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru2MNC-IvVJe for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F5A360A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F5A360A4F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F5A360A4F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:24:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2DB102003B4;
 Sat, 11 Jan 2025 17:24:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46358])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:24:32 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:24:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20250111131110.2463054-1-james.hilliard1@gmail.com>
References: <20250111131110.2463054-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a57059c6cf0b040925307b0958dc02d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736612674;
 bh=eWC/2tDvj6qLoV3RWNylJf9akL5ONNq/aasLe/dtLSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OngXim9LK4KxwqDGUXoXi0nrzmtu/mORQ3AuZJp0Uutvj6UQST6/yNDfK09V/h+NU
 3Lnn0GybtKiYRooimemEAumMMqnxLjZP2+TzJAsdag4pLfAqpS/GXop1mUi5I1B2zQ
 cQyiYi3UfM5xKUptIjjVt13G14vDf6R7MqUzfyR4c+4HYNd14OUxps2kj/JgxUUOqJ
 3cg89XqbfpxD9UMO7BphCsKWglelECx7fMvBJP+CseNUlYYsE5FUc7YDss+PlWsvm6
 I6lJQ84aoDto6q2f2WCtF3JpocZ7lQD5Evf5RWyPu33BfX9bC7qGuKP8yQnfF+87Is
 J/AtemWMzcsKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OngXim9L
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy:
 bump to version 1.2.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 14:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
