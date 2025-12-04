Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F3DD2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A80360E1A;
	Thu,  4 Dec 2025 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErtaHVj_E-HE; Thu,  4 Dec 2025 20:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E183608A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881013;
	bh=GA0SyIjslMPnOC+AHM3PWM2v6PD/ZV/eZa6TMeEnXJs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UO6h48w4QvOGbRBCr+G69mtbg1tH3lCpJ9qFbhCfgoRHsWRosrplOw/Is3/+yleuT
	 QHDuf4aInSmDtn3heWzjKKl/+WrLQH0hz/j2vTr/QdUC142DNYIjQYWWNYhr/StEeh
	 tZ5C/Qxx7P5DJyGLdJUn8GGoBAWHJ9pCMTUxmtz9ogvGTgF6QXq+ODyyjcHByyqL93
	 lhveRr8wES8u2FZTzCDf9p1y7En6ODf5wXa8vqwilZwglSp/jQk4zAlRTu8Y/iNmfT
	 R59PFQYWlM0FROEnhfMzQpu2babnC0ZE2cSnQZdeo1RBhnftWQ6vFdbx1QmKk14STh
	 JosNH7NfUK2Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E183608A0;
	Thu,  4 Dec 2025 20:43:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CD2D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734DB608A0
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGip9SVQ8NDI for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A95AB6089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95AB6089A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A95AB6089A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C22E813F88F;
 Thu,  4 Dec 2025 21:43:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Dec 2025 21:43:26 +0100
MIME-Version: 1.0
Date: Thu, 04 Dec 2025 21:43:26 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20251203050234.56665-1-nemaakhilesh@gmail.com>
References: <20251203050234.56665-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dc170d6f149bc24f3c5aa9195bd5ba07@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764881009;
 bh=2zzwct/3bHWJN1g93aF/ouprYczb+TjPxPDzmFEFwQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e94HTkUV+exeEq8UQJ7+7tMrnTE27RNtAMQqW2Q5mtgCqv4nWV39Of6byt5lMhkcE
 ls9HXkyaKrxCxlEABpKRHKrDYgF7GNEXYiBZp3moeOY/mo9HyD3S93C1kwV1KntyD4
 aNCbMr6WaUjRAeWiskimV4UJbqfPny+Q5EJt5oeJcIzX3EU7plpLdJTW3/Q7pv38QR
 6rGetgUzp6NGuf1ohMknyiE2wzvfj5Nq4JRlSdsRZq1G3AmxB6IIHUMa3fjhtlUQY1
 uF5jZYpoGAzGb8TxL4F6L0HRw/TIDhc6W0IgMiGsVBkyYMQYshwy/kgmpu0BP15aRV
 BXqJX2X6/xzfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e94HTkUV
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.42
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

On 03/12/2025 06:02, Akhilesh Nema wrote:
> Changelog:
> https://github.com/pikvm/ustreamer/compare/v6.41...v6.42
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
