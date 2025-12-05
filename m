Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B6D2F7E7
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2A361CAB;
	Fri,  5 Dec 2025 12:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCnFiy7klAbO; Fri,  5 Dec 2025 12:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ED5061C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764938163;
	bh=Pd4nQC2htkwk83AJqwMlVZn6U6mPOzJm37QV+Xw3btY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gZiqeLt3nPRSF7YhCXC6ZOKAEZPxLISfhvfcNn+lJd+jrDIbPz+hwYGgz6gjIZhxN
	 yt+BWRpN2CbQsDfaDj+18mHPS7jYKr1FG1O8BbnvPP/irlx8gIgJatNr859HKNB/2w
	 OVxWt7dgsU3C2r/NuBAShAubJzaMl9mgQZXLvCalUCVisPGM7vaEGKFgKlLlMLqmxD
	 errnD1NMPcdKooLlrS8G2mzCc1bRndFuysVeauW+umxV9Ti+8MQF0JRntEmvK82GqZ
	 s8By4/cwcexsHymRmbSkNqqe5P2INclx/YUMcvUclEJT574o8eWEpk9q1er+4AvsQP
	 3ychQRIJT3dbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED5061C9F;
	Fri,  5 Dec 2025 12:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B41DBE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5BF461155
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-03JKqoBGvb for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 784C460669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 784C460669
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 784C460669
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:36:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D2130B00576;
 Fri,  5 Dec 2025 13:35:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 13:35:52 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 13:35:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251204163409.1315954-1-bernd@kuhls.net>
References: <20251204163409.1315954-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <429028a315df34d1838c1bf01073a4a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764938158;
 bh=AoRLnowwOVGFP3bUk7JQoSJ3f4qNAbEz6bniETD567I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Os3tbQ2U7D/i4INBS1JDPQRZgxdhLm2piQJ2IsjUt9jN1ft+xHGHC+AizVwP785fI
 A6QYbl1/rMfulNHmdneYXEIhftJh60C2dW0yqlqf725b9KCffPY6RBMMDqS4m/5PeB
 NwkZOpFPItqryfEbNKXztjeDSTObCuxfK7HJaeQ/8eDOLEOWjIosgILj/7O+JyVUoc
 fKwkn0Xb/xIexB96L/6hBqOszhTWEnJwbRigcZi6rDjZNmqROMGSA92Ah5yesl07WJ
 NsOGYbBDnRIWtddvJW+6vMSokcYuc0TClNDCIMaf0z4+czw0lpbMlCJDaf/3jBbjZV
 HCCVel9EHCJLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Os3tbQ2U
Subject: Re: [Buildroot] [PATCH/next 1/1] package/llvm-project: bump to
 version 21.1.7
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

On 04/12/2025 17:34, Bernd Kuhls wrote:
> Release notes:
> https://discourse.llvm.org/t/llvm-21-1-7-released/89029
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
