Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E4CF58E5
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBECC80CD8;
	Wed, 19 Nov 2025 20:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id re97tBCqnpGX; Wed, 19 Nov 2025 20:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1868580CD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1868580CD5;
	Wed, 19 Nov 2025 20:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 249A737D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1654038A
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIGWfI3AY3lH for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AAFC40382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAFC40382
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AAFC40382
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:26:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 46D6019F72F;
 Wed, 19 Nov 2025 21:26:34 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Nov 2025 21:26:34 +0100
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 21:26:34 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Oli Vogt <oli.vogt.pub01@gmail.com>
In-Reply-To: <20251119183903.629518-1-peter@korsgaard.com>
References: <20251119183903.629518-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bf642d2f501aab9ce3d46c26f9e3395f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763583998;
 bh=3pNIcj0sTGmaWZr+wqAFIRry4nyWQW7/2ByHBMWbz7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UMZ5IbyaYsMxkdhU444kpQHTYyJolZWe6hILMgx5BroOfjbfnEj9QwOpmCfgpni9W
 Pw+nMEs2wrk4uSv+UEjo3ZbVngbbR8SIThnfbKIbSvhCN9lbff7JMUq90/BC59T+g7
 Rd36xId7w9cGmC2hD+Raq5rg2mpwWG1wFZHnKVFG15rk4YL/oc7k2evrAb2IBNDn3L
 K1RCWPwmxHUjlZE+CjGnqw3CL/UUjRkcW+7yZQ+bUiffV9efiCDG5eSUypDEDpy7CQ
 2hYHCb5iKatY8jicknM2vpT5ZclgSMfKyzDYm/x0sXbvZNvA8Yur+w/0oWHlE4BxkF
 JyiSZZ9QgQEYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UMZ5Ibya
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.2.8
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

On 19/11/2025 19:39, Peter Korsgaard wrote:
> Fixed the following security issues:
> 
> CVE-2025-64458: Potential denial-of-service vulnerability in
> HttpResponseRedirect and HttpResponsePermanentRedirect on Windows
> 
> CVE-2025-64459: Potential SQL injection via _connector keyword argument
> 
> https://docs.djangoproject.com/en/5.2/releases/5.2.8/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
