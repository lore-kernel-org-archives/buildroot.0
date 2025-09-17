Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778D2CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C63083C7D;
	Wed, 17 Sep 2025 16:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9JiSYpizryc; Wed, 17 Sep 2025 16:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E1884378
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E1884378;
	Wed, 17 Sep 2025 16:50:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00650279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E5D83332
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIlARBiz5xkW for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4478E83C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4478E83C8D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4478E83C8D
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:50:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8FD41780333;
 Wed, 17 Sep 2025 18:50:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:50:18 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:50:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916002515.2488746-1-james.hilliard1@gmail.com>
References: <20250916002515.2488746-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a40ac65b04d58e0adc8e409fab15c703@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127819;
 bh=FIeWy88w7gAGodISvPLDHFfrHkGn+S7qnPueeCDy9dk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ell/1XulIPRQ6/kPd0WebyrEyDUjk+tDHpJkvzP3Rnpx0P60fNyDOUsIEsNv+46qQ
 KTPh1GO5GmyhvXtfbcRbNgiM6H5yIMzEDwaV4w9CfkIbH9FS5ZOT1L4yEO9F9/ByW/
 Sl0d1dd3UiQn2lcCv+93EWQFh8tnT4Q+gQZ+EnNMUP+lJAxuiX53KggOFLt/I2NGEr
 QqUdPQbT2EAk21zEemhxVG0u5fORSq4eU7L/4Pvn2s/3LAXk6OxmnjmTIYo3tKgZFe
 W3jA3WI1oNvJXvAMfPSsQyIg/JvWr/w2ju5XOhVM16BLRMvjHAbSS42KS1aY/nPTOV
 7cP3e6Yk166nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ell/1Xul
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycparser: bump to
 version 2.23
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

On 16/09/2025 02:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
