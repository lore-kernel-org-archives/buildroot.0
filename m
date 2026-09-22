Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90F9C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF7080BD6;
	Tue, 22 Sep 2026 16:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsFjR9pXZziL; Tue, 22 Sep 2026 16:38:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B9A380BEC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095119;
	b=hlccCTSy7qWKEiztPhgTsqQwQUPun6AfOZEyw7yKIRlt7c9EkjhNMBE64/vZEOdUs2MR
	 XTMkHv1Lg9sdCDJcgzLscQ6StC3HTuxNIZ5m5Nti8Gj4+ylc5/hP4NNe/ne2BkW/JCS2J
	 nCNwVTOFnufxIxX4l9zAQnEI/VBe1QNZIWbGyYfScK312Aq+kQDaAQmMNXeqUR4mHt4mg
	 MTD9W6ERmxaNdaiXYXAE9trnQfgbBM2zYPzHDZd2fV/zGWjiPo5Rz3A7B/euTcTrxRRCS
	 2lzB7lX9T98j8pmI+9oC1eKFhnnqj1m0J1DHR1fwhz9qaTbP7CTz2OWMNEgqGTepNlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095119;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=DDm243O096VkVg7bbVdVnD0ZT8WYy6ijlfO6aBBqk3g=;
	b=G5EbPctsDlijYSmZA02FVR7jR7uWYq4srYPj7ys/Xgri9BS+MvCcUDagKl/IjULMF0ae
	 dqKbxHyuQmudboFhC8UzpCxMSVisVQTkCTegf1tW3iOLvrTEW8XkRdSwIdj4iO1PuUwoy
	 tSrIJLWUklFeCUM5POXMZ5XPctUzOGEZ8WwtJ41P/Sb4PE0VBn0Sy9mTP2Vp+jr4rs3Ft
	 6LqLw/Hd2OWAW8kA6J7nAXFhiIUsfwWRo6kYU2PVkPVQNPxPCxNWUgb7gbFbIkLiQ5gNG
	 POL3bTEDIsOre1oS3kcPRvh9LdzLxe2lzNofkAOVuWlVocGA8bNI0WhRvnjkgSgem/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095119;
	bh=DDm243O096VkVg7bbVdVnD0ZT8WYy6ijlfO6aBBqk3g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oeuEAj2VGAnaQ/Fa0M046bTydH4GqR2pYCXvH54ESz9OdG8CGCzzgB9PTv9zeVkOb
	 7uk0IlfpJ0uGuXxnYXpzYclO+pfoNyyuj97tl3x6EVTtHDPhtehYkkeGpac/zTS5ie
	 g7Gr/6mOv8jGU9bn81Lb/5Enpv+R86rb9mFvwzclfoHaqc7MfyxFt5BbrZb2YJyWOv
	 CqMxQ0L1n6Rj95xhgee8F0JdMrYZrxEIJMbSbGfq1XXugVigj+38dOvpPOXNQNIv3K
	 GCwFcaui6QxFFjrFWobSXaCYWEopCDXZdJH/j/oxfHZ4ojB3hJAw3zbAjxykYNsOhW
	 dQ7d7fMcNdISA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9A380BEC;
	Tue, 22 Sep 2026 16:38:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE1E9CD
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C7B680BEC
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnD_w_vt_DlK for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:38:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D655A80BD6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095116;
 b=jWtnDQTAtNmbDfI3G4SOH/hBQlCPUxQnnuXd3hfDuT5WIr14FiEfy3BL27AHtp/viIOn
 o3jtxC5jUGjlBicj/Jqq3bnQODfxZg3msNYb3EX9MdrwLAZ5FVT+oAsQfJ9qzDZL3XNS8
 mBzUkLOJc2p2IQo7BzLj1Tswcs3SEeLn35t7zWZV8e3vr4cGng3tA1nQ3GZVi8ydDrkDj
 xsnY3zWeptG0UCs8rTwdKa52HvFAGJkajQdvsxz5Dme9Lzr1iekJRRgSs62c0BgMkB9sk
 hgO5CMmBMQY4ieQjSHV5siyGpNWlkZCG7JmqF7m7mW7BqvgTfaZsjJ6P5QUUVaRytkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095116;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=e/ORfqrb8SkJuc6CS7EQthj6Oat3SPonjRBYW+bKJ8k=;
 b=LsU/7WEw/hPipiNpnT3OjyCa3oYFdW7f54Gj5uG0f6W1801Wos/dULfcpNcu26cUjxAg
 l2MzIKZRJgzWnf2KmHSiZt7ffJGmeAOMhSbQ6wtq4GZTK3Ssc0ZwNffAx8jLjE6IWy8wZ
 Xx+XwHCnAGNc8/pdzyMVSDrmyueG5aEt610E07DyXCYcqXoXX1jVVHmAtqeR0XytKHMyb
 CBK2iJs2SVl2F7MNacfHVGrd/uuDxuhuYIxqbcXPe8crS8Dr5adcWYzxO06JRAiUPW9OA
 L5McJfJeU7ARA97VTfgv1tvnRlmnT8d/Mb4olnMSKYCEv3aI2CRmjccvjniEpIU6QLA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VaufAHra; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D655A80BD6
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:38:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5D8245FFB7;
 Tue, 22 Sep 2026 18:38:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 18:38:31 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 18:38:31 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260922092129.2540915-1-giulio.benetti@benettiengineering.com>
References: <20260922092129.2540915-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <fc13bb3150b1a57bfd088872e15f807f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.5.0
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

On 22/09/2026 11:21, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.5.0/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
