Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6441EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2E7404A0;
	Thu,  1 Jan 2026 09:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsDnXdZVgurn; Thu,  1 Jan 2026 09:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D659C4082F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260947;
	bh=7t9YxIxFyzsU4dJd5Pdt+zXL51RQEgxQ5hWBXDX5jcQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nbs5+AlbIj7c7HEj/q8Sdq/QarNAIH0TNCU9tleQSCXzxg3VM6WBZmTAIVZEwlxbM
	 pVoUAiVmiMCpxQlHDsDpec3Uhg+dDdTmTm1Dg4/DTMALny8rkiOG8poKzC/y7B0AKD
	 GZQ40bMGDvzH7+lxHU41IlQitUrr8zanGQw6eL0bcAN/CW+HWzHzJJpeeRhJPBUD5Y
	 g6o2w69xBTeup0RTcPtwJdpEhvBat0/QMt2ySNnO/s/LcoF6x1lspdpS1282tHJsQo
	 KmG9dCnL5Z7vtV9hArDMzULqEX+NojBgKMowJ8ccixhVCHc8K2E/B5FeWqkEzWiqNU
	 PfQJaFaLtPc4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D659C4082F;
	Thu,  1 Jan 2026 09:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD983206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C220F81DFB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AFIUDmgL226 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B411181EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B411181EFA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B411181EFA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F32D71A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9423606B6;
 Thu,  1 Jan 2026 09:49:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26C35113B071F; Thu,  1 Jan 2026 10:49:03 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104656.6d5b0815@windsurf>
In-Reply-To: <20251231220505.243655-1-james.hilliard1@gmail.com>
References: <20251231220505.243655-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zzTik4FVQl5VIL6A20xBzraxBxWZEDKvZuO29uKplVc=;
 b=mLm1HUyeJxWU6jV838xo2hNB40BlW5hcFMYCWuf0EiNraDQWuqdtem0MiJLdp0RDqxxeEY
 p+iks6QYLHLfqdJoQcXpRokNzbX02aSy9TtkmxnrzI+pbznk4+ZqtrQCqeHeWtHOA53GVL
 6BP82I4NKgMcEiO9yMCeJiX4BMVVGhVOZXwsWvL8ohYK1jQZbv6jzVCzjTl/M4Pq0toUeM
 GgK4+zARZ9mt/7ltNgtrCVjaqSqwProwm8tSY9ps9wZCTdAPqSZdgPJGviEpodiKKlBuVQ
 zmsPYZZCzhuMDfb9mEHEhCmCZvDp6fbnAKnOKC5Qpv4WwuYFDIhwlgyoIR0ltw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mLm1HUye
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 5.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Dec 2025 15:05:05 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add dependency on c-ares and set env variable to ensure it's used.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycares/Config.in           | 1 +
>  package/python-pycares/python-pycares.hash | 4 ++--
>  package/python-pycares/python-pycares.mk   | 7 ++++---
>  3 files changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
