Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB97AC5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87C181462;
	Thu, 13 Aug 2026 20:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYNr4ncC0_tK; Thu, 13 Aug 2026 20:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C9A81420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786652321;
	bh=zNAMX4CR5d8+sLf3ET0FdiKN3TN3/Q2d7TInZu9Ra5U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DIlgH6CTO7BD0PfwNxsiQFdcMdwO5KReJkbtbT6lHjVxAd8hGFC9AOEF0gj7Ekgfj
	 ZKtiUqMVqbssVdavBNQvD1bMjKTov5Be1QWf4dAOaBCkDvhwo/7vFmQowBe1QXUKKc
	 flM5VGZNpGYKltEdxqnSA3KHwWSe6TtR74PzCgqVVxQf4/9ChieXTN0tSD9/Y/XqTb
	 azMBwNMonYJF8gzCbtVvZ0LY8MWnLMVE6pENwLtatzM078zZ/hCju1+G5eaktejwhm
	 lzQKPc0aoxuYkKtBZd9rpVSvENUdiNcUL+wbBJY2cuBVMUQfoCROmeMFXQBkcuXP2J
	 NZlSc9dW+2jBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C9A81420;
	Thu, 13 Aug 2026 20:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C187F1393
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF1F640CEF
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NX_wDwSl_Vt9 for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C388140CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C388140CE4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C388140CE4
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 16EB52003C8;
 Thu, 13 Aug 2026 22:18:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 22:18:35 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 22:18:35 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260812092621.1840808-1-egorenar@linux.ibm.com>
References: <20260812092621.1840808-1-egorenar@linux.ibm.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <09c9604540e185a84c03a67fa2581cfa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1 1/1] package/s390-tools: bump version to
 2.44.0
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

On 12/08/2026 11:26, Alexander Egorenkov wrote:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
