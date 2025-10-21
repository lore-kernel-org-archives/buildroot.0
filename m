Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25AECCD1AF
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F50480C20;
	Tue, 21 Oct 2025 20:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VkHOY-HTKIG; Tue, 21 Oct 2025 20:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE1138238F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1138238F;
	Tue, 21 Oct 2025 20:10:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4778D277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391098237F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s2yIDZNe3mT for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67E678237E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E678237E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67E678237E
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:10:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 68D7C7803A2;
 Tue, 21 Oct 2025 22:10:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 22:10:44 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 22:10:44 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251021162330.106028-1-titouan.christophe@mind.be>
References: <20251021162330.106028-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <81bc10843831424d584809383fc4213d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761077445;
 bh=gcEDtqzlGJ+S1368kR7t3LyxCVVlSnyVKwWZilzepMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=prtqUreSdU8qD9nOcU4iKphg8C6/R32DIAuXq9tm7+7zbD1890OLdisprdsjS7gX2
 5aPgRHZ6OCEu+kLn8PuSA0Apo1Rn37F7HUvPoJDKots22ONkwaJpP6szIrvEKytxlo
 N6kuO+mGpFsc1+BqvI9CyMMc529ZQgHGCU9db0XgOhy/zWkUmaTOUy/i+lRSFHLkNG
 NagimhlicFQ3CZCKhELlqx9sjrekasATWPbAB3YW+fXxV2Pc/ShftX8iBvLfcqb0po
 ySqChFPETtQn3k7Mn3ROQEeZG1Lg3/8f7aHOcExC2qhN2mk7w966j6Vqiuwr8qfKzQ
 X/QIqx2zxVGUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=prtqUreS
Subject: Re: [Buildroot] [PATCH 1/2] package/xerces: security bump to v3.2.5
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

On 21/10/2025 18:23, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12352411&projectId=10510
> 
> Also update the download site to https
> 
> This fixes the following vulnerability:
> - CVE-2024-23807:
>     The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
>     contains a use-after-free error triggered during the scanning of
>     external DTDs.  Users are recommended to upgrade to version 3.2.5
>     which fixes the issue, or mitigate the issue by disabling DTD
>     processing. This can be accomplished via the DOM using a standard
>     parser feature, or via SAX using the XERCES_DISABLE_DTD environment
>     variable.  This issue has been disclosed before as CVE-2018-1311, 
> but
>     unfortunately that advisory incorrectly stated the issue would be
>     fixed in version 3.2.3 or 3.2.4.
>     https://www.cve.org/CVERecord?id=CVE-2024-23807
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
