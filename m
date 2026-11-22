Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC80606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DMkmCkTE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD2040660;
	Sun, 22 Nov 2026 12:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rz_dHhurtt3P; Sun, 22 Nov 2026 12:51:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 810324062D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795351861;
	b=VrAxuQPQkn+pbKgwR1RtX35oFUGaoFs/s1kwBCUHQW8HBIM5dA9Vjx6BxcAkWS2SxflM
	 CCz9FmShibzD9w7/xeOauNwOKkOMdE59NQQ3sTZpG0oMUOcza25BFbXjWy9Y24QflpMLy
	 f8zw1b/Jsxf6MgHb04tKEDTZdcfHrahPsni3iYjDiNs9wr2+Szb6JRCXbXRuHxVbZ3bVS
	 BM9F+jigLyyhF52bGTTA33bkpKAP7nOcCFok7tHSvPvATEuljL4AYkgxx2aKBTMygFf14
	 bTnOtnYkwwB4p4TgabWa4ryxd3uIZC9nTqtLggW54qDSwUt+yGbb5Xz+H5xkmb0hdlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795351861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3qFmzP6b2O9PZ9Hkw1fAWVQZcVFrZX59fMzoOO21GNk=;
	b=PaVueAxxV/GALlgruoMPDBxKdnKwbsygCozYF95a7/tvifNoRKzs8d97Y6sP855PMCQQ
	 S5x4EQN+JcrzCslaVFCMzY78gkjrqeO+fpRRex/0tx7TWbKmL5LB7sr5w/ja5pR8JvySU
	 hPRFQLsQQLoiretNJZKCZpyWOCVbbiMf8+GSwDO5E5k0ZapOnB3lhJ4yucXlcisDTzdyh
	 thDdfgMnjdrnKY4wgBfw+OtIrP8yldu7aIpW+bIKg60fhRCt9BDNf9o3Fs5dQGNklZijP
	 6rT6H4M8ClyMAzPCe44nIxE2QQHQuC0Dx9rxijMdPfO6OPANkRP+VqHfbqiREFo61AQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795351861;
	bh=3qFmzP6b2O9PZ9Hkw1fAWVQZcVFrZX59fMzoOO21GNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DMkmCkTEv1FXIwjbBa50+jjHrESRUuKTJzkMTrodF53D/e6L0QJ624EpjnTjXvcFw
	 I3VxsXrOq6BH+y4XZIV+IFzuZWsLvvNjObuBCy4myVQJFqUdMVf7sZiStxHyukwLKS
	 Vc+Ba0lQ+esSRw7EOSfw0L2ZOUEUPlACjWEeo8KBtOv8jPKCaDMz1NnGwirl2ytDoQ
	 aEnvUH+CVGsDstF+oECrUIq6kJmSQSoFNtIum1RtZGrFdWw2UkQeLUsjHa9SoNHY8G
	 UOIsZFTAOwbMua0lUfNfbRuWmVRC8YpcbYjlD4PWV6NvD2Tua0q/iiLv2F1Z7bBv16
	 LUHRUqSAx948Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810324062D;
	Sun, 22 Nov 2026 12:51:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45588465
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BECE4067C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c69cpaMxdo_7 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 12:50:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9AB154062B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AB154062B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:50:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 34F76780316;
 Sun, 22 Nov 2026 13:50:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 13:50:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 13:50:52 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
In-Reply-To: <20261120204928.4020930-1-angelo.compagnucci@gmail.com>
References: <20261120204928.4020930-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <f85877275fb75a4e87677915741ad4e7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/jq: ignore CVE-2026-44777
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 21:49, Angelo Compagnucci wrote:
> CVE-2026-44777 is fixed in jq 1.8.2, as stated in the release notes and
> in the upstream advisory GHSA-rmpv-jgvr-wpr9, but the NVD entry marks
> all the versions up to and including 1.8.2 as affected.
> 
> Release notes:
> https://github.com/jqlang/jq/releases/tag/jq-1.8.2
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
