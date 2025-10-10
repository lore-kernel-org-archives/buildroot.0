Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A7CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EA54022B;
	Fri, 10 Oct 2025 17:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1Qm8jI2d9Pz; Fri, 10 Oct 2025 17:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D8440787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D8440787;
	Fri, 10 Oct 2025 17:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F26119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B840F40787
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ym-Ug7yJQvbS for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCB684022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCB684022B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCB684022B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:45:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EBCBE5FF88;
 Fri, 10 Oct 2025 19:45:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 19:45:06 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 19:45:06 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251007180553.2582202-1-giulio.benetti@benettiengineering.com>
References: <20251007180553.2582202-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3244c407ba9395b1164f4110d29ceb57@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760118309;
 bh=n0fh9t4+BEqEjMYn616t3DGE27AgK0QyoT3yDaoZLIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IjaA1eyRjJV9UAV2NsPA33LgSzH1tUJpH/hu0dPaRkNVUgq83UOLmu0inZTlo0FFA
 mJia9YKMiUyw31Rnrx9wW4b/toQvdvc1HdmzZqsGvlBSob3+cYAe6JfPbqvfBCwLwB
 ET11QiMLobuTGKtZ4fCaX5QasBUmnk9W35uVuYPFGuv7Q7sXQHzyHhUjFJun1oqr+U
 sRQFtS+SqTMxqkTIfRM9kAtLP3dVqiAscKALXvk38USso9Nqz1/YGHTaMbqexJS5KZ
 y3LqOJDdZ7YPZbv+JXDdwHnLN89XbXODpwOr8uV6qpO03bgIRPO8CuUkBpoCzCL6s5
 rmsTdXxPHJpUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IjaA1eyR
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with
 linux 6.17
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

On 07/10/2025 20:05, Giulio Benetti wrote:
> Bump to version 2025-10-07 on branch v5.2.2.4 to fix build failure with
> Linux 6.17.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
