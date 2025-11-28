Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F257D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 22:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0F6848C6;
	Fri, 28 Nov 2025 22:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm-mTOemxVC0; Fri, 28 Nov 2025 22:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E668784783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E668784783;
	Fri, 28 Nov 2025 22:01:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 581221A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E6F64003A
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWsif3k2SOTe for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 22:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6709B4002B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6709B4002B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6709B4002B
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:01:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F114319F576;
 Fri, 28 Nov 2025 23:00:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 23:00:55 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 23:00:55 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251127133953.1894470-1-giulio.benetti@benettiengineering.com>
References: <20251127133953.1894470-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7e26b59e05e526cfdf5fcb9575739a31@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764367258;
 bh=2wKNXqzUvj1iqUaTarsr5e99+ky4NsjBc0aSOVjv/UM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PpuY2SU+HcQ84/kbuegdtV9bOGsW0G8QVvfWT2rkUvmEjS3ACcczFqG4L0PkUCtag
 d2bDJ9cvsL4T/zu6aQVs6m+Dp1XJ60//BF/gTcJxSjyVYkNgpFThS8pbAoxbR/Eya7
 zYPdwSIs9E8Cf/IpnHfcOVed5AQFzRz5iSAwNigZ6tR4pvffVlDYpg4KexK21VCRYn
 yhkLpoYaU5BjhPbkvN9zwBV76LFyB83KScg5rWJ6f2j9weQ4gUpRfi2D8cnUmfvmYw
 6z9vJluPckIkpTsjK+bsFZCRgLpmV+Dcuv2w1yumb0wH5fo/6a+jxyMMip03Eo7oF0
 YQ+LJABVAGqoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PpuY2SU+
Subject: Re: [Buildroot] [PATCH] package/liburing: bump to version 2.12
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

On 27/11/2025 14:39, Giulio Benetti wrote:
> Switch to github since git.kernel.dk is not always reachable and actual
> tarball sha256 has changed. Also note that local patch is required 
> because
> it's been reverted wit this commit [1].
> 
> Release Notes:
> https://github.com/axboe/liburing/releases/tag/liburing-2.12
> 
> [1]:
> https://github.com/axboe/liburing/commit/6f8b3481cf511ade803fe7a2ea8fe3b99fce3658
> 
> Fixes:
> https://autobuild.buildroot.net/results/ddf/ddfd0bb8f5623a1ce7aa4168c5759b2c54a933da/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
