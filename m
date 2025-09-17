Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C047CA0EE8
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 11:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D496145F;
	Wed, 17 Sep 2025 11:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm633pOjNd9O; Wed, 17 Sep 2025 11:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0A161500
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0A161500;
	Wed, 17 Sep 2025 11:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E605279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245054057D
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQX4nRVXAp9G for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 11:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1585A4057F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1585A4057F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1585A4057F
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:59:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 187CA780395;
 Wed, 17 Sep 2025 13:59:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 13:59:22 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 13:59:22 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250917112337.2521059-1-fiona.klute@gmx.de>
References: <20250917112337.2521059-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <01347364a3dd80018379bd33df5c58b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758110365;
 bh=StgHXyMl/7VEPPq4V23mamnUB1ijjM0TH9zIWC0NzMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AJoddsFfsaYKS7QB5TxGFYxkyXIzP0OsGM8wGy5KuTbbfTjEH/qvnq+lLvdwkpj/T
 6N3inLK35EDVn9bQZmxbggL7rWteOLy48S3Oc+O4MZQwjvnw3/jp8QAuLp6O/5cGOO
 eBZ03TFP60nz6BKdkzIxT63YbifvAuqOxrp+fiio/p6CbqHRrqqO39/HYwd0ANTmiN
 10NWsBgRLVi0ZRAy/hwF+i+loYNfV2K3T1lRdL7u6YaV/mrNlBu8BoeYXE5fTcCob5
 q6Rs0w4lFFw2c035fAikZpIbUi8kr/Ni5Fh2TlI6pumxVuVGTX+yuNUsLsQf4fgDPj
 iYEGOTBgouCrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AJoddsFf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump
 to version 2025.9.11.17
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

On 17/09/2025 13:23, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> package/python-cffi 2.0.0 (bumped in commit
> 07903d2b274bc98f930e06dee237682015acb1d7) fails to build due to an
> unknown trove-classifier:
> 
> * Getting build dependencies for wheel...
> configuration error: `project.classifiers[8]` must be trove-classifier
> DESCRIPTION:
>     `PyPI classifier <https://pypi.org/classifiers/>`_.
> 
> GIVEN VALUE:
>     "Programming Language :: Python :: Free Threading :: 2 - Beta"
> 
> OFFENDING RULE: 'format'
> 
> DEFINITION:
>     {
>         "type": "string",
>         "format": "trove-classifier"
>     }
> 
> For more details about `format` see
> https://validate-pyproject.readthedocs.io/en/latest/api/validate_pyproject.formats.html
> 
> The list of trove classifiers Setuptools checks against is provided by
> package/python-trove-classifiers. Upstream has added the classifier as
> of version 2025.5.8.15 [1], as well as a bunch of others [2], so
> update to fix the problem.
> 
> [1] 
> https://github.com/pypa/trove-classifiers/commit/331838aaea0eea6374e4e51e8fe05e13bf7e4957
> [2] 
> https://github.com/pypa/trove-classifiers/compare/2025.1.15.22...2025.9.11.17
> 
> Fixes: 07903d2b274bc98f930e06dee237682015acb1d7
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
