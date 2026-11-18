Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328060A2615
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KLoBfke0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A83A81027;
	Wed, 18 Nov 2026 18:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBGCojWQ7APU; Wed, 18 Nov 2026 18:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E77AF8104C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795027367;
	b=RlUWEVtK5nWZP+JKlOEc7uRmnkfTM0yCDoEUxM2Nikgi/jWUioFBAOBCLij829YkllFL
	 uiB1p111CUwys7DCHVfKlLhoZDzfgsfoRHYksYpolpnouAcg9m9phOeCiUSs9nMqlCR6T
	 7nESIWXgV6Xp/XEi6FwK2KYXd/xvPbD+v2kGcLNiTwkgIAOJ7zr7ucTJLnmaE7orKV1U1
	 zjkJ4VG6CKRZgK1Xp1Y6q37PuukMD2nWuSRQ29N9ECjAKdrB9NP77K64EkvxBcaPXTciJ
	 BXy8c16H+Qh8pdrXjXdUMbDcwTyL9Iq1KDHMr3ji0dAegUHPXgdfKN6Iv9X+O6YEsow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795027367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hJq8XGoveFEZe4jBHDSJvqiz5i/RR1/nsY/EDwqGWVo=;
	b=R++L4YumnWZY54IyQz+8RoViiJturEWH2MgX7HbJlC/3AYGMuY6iiSvBsLu542l7fnp+
	 kyDYqpjOs1a2bTtFcmd/KES/aDi6zxUD+QLkeJVBkUyD636ffUc+f97ZlxxLo3d7Y90gP
	 jx4FMubnRMd4CqKKjrtBk1z8cIbBeL3EUid2D706rcJDqqma0jTGwCYmidZSUL4QBsyLD
	 SA1tZpt38kFDqDah6n/ag8akaBBUHmrapfGuJJ+bgycbKXZwqRq7FDwwenMXgI1iWlAuv
	 DIHfoandyHHN1EGqsVCXXA0Ee2/UBi8vratVRUaCqN1d8dWRVqU1Lm6YxsC4pwzzkGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795027367;
	bh=hJq8XGoveFEZe4jBHDSJvqiz5i/RR1/nsY/EDwqGWVo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KLoBfke0NCHjAieeBqfwITHQcEUpm5muGxgLfJ2DPSSvs7XDkn/OdNkpFnKw7uckq
	 G0HPMQIuYM1Dby7/FkZa91G2oK2F4+Hi7YmyZ8mujmzjvMGNnHIe72cUmNS49dKUnJ
	 lAXYiBFfjYkG77PYbvsq1zOv3lS4lnE6hTxFib0cEAMQpo8wSCUR/tyG4yApFdbWLg
	 b3JEyV9WGHjaNUEHwfeWfjyEj5ihfINZxKXqrO+vGxeTU3ckYeuA/EkhQTonP663QA
	 rtGubxJxYUok4bNu6IsQZCH9NNaTPxBGpqW3jZgP9OJ5YKMbhuF2xtFENUM5wC3fo4
	 a/ErwaZdAFtdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77AF8104C;
	Wed, 18 Nov 2026 18:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 171F613C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D0840785
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4G-I3sMLKPa for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2C0504077D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C0504077D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:42:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 90EE913F88D;
 Wed, 18 Nov 2026 19:42:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:42:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:42:38 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, "Claude Opus 5.5" <noreply@anthropic.com>
In-Reply-To: <20261118110901.2312921-1-giulio.benetti@benettiengineering.com>
References: <20261118110901.2312921-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <082485dc69c6ae545576662f975ef98e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2026-11-12
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

On 18/11/2026 12:09, Giulio Benetti wrote:
> Drop local patch that has been upstreamed:
> https://github.com/espressif/esp-hosted-linux/commit/139a7b6
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
