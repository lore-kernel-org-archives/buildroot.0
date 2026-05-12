Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BCCCD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 395C94102C;
	Tue, 12 May 2026 19:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajd-hPXX7fJa; Tue, 12 May 2026 19:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB6740FF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614942;
	bh=ZWwdM9Rui7NHpjJqFobzVvPEZ4y4gF8sulGmW6vXFjA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qVXVKdpN8gqUSzf6IV8JVvbCXSHOk3sT+OYsQA/JfsE+kb2+EcszqbsPKiQWYeZgR
	 DeNa2eThJasc9rmN/uK1oJg1QsMqcjqGOX5wzSmC/gaLJknQLVQ4xq1lZPMBfRp6uT
	 BVIOxmKAMOZMYRi2tcRc3Irx3hYG1pFlMDvQ5V4wVbTZYQQmyvbxKkB5xfd0H85Fd/
	 dFp98NrHQQjozHcUsH2o+3hS0vHszE6GW+bqON0BKilQSHPyHGx+E9rtpvS13s+QbW
	 LQKYQJdi9DLBHsxck9OMzVQFz+97Yblk2Jo/prU9Ob+9B+F+VnF36FyTsfVrjbcPyz
	 Yw3ghZO6zCB/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB6740FF7;
	Tue, 12 May 2026 19:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BB9F219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D41340FF7
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Epqz4J-hzTO for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34A3740FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A3740FEF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34A3740FEF
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:42:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id ED3F7B0053D;
 Tue, 12 May 2026 21:42:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 21:42:13 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 21:42:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Frank Vanbever <fvb@funkworks.be>
In-Reply-To: <20260512164319.3691172-1-bernd@kuhls.net>
References: <20260512164319.3691172-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b01dedcadfaac0f7e53a68e248563ba9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778614936;
 bh=j7TeebialS4jEwFYDGDdwgWe0rvE2g2zE8bpigAn5U0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZA2j7NJv9PNDcl29Sy+yfwgPbi9wafndXf54vvsNYjYuQ5df23lXumNRVzy9jHNcu
 LEat6KN9OP449Xvd4HhISHqPHr9mvgZr08rvjs5CWnd4sr5frthYFT9vuyVUwsgZxv
 iRGPu5HI0F4pAsg9oL9Ct1u2NjV/tnprKUeqyPxbrGu1u+9+Jj8VKvhbpxcc+bzb8K
 8BOtEEiuR1tIh8EMkeZMH+zzfobzJcJchdFF7h2I+DR/J5U7sxKNMQemN8x7WD25eZ
 H58gCHb9DmY87matFHmcR4wq6DRxhPrj1d2gm8hclB2sKfZwfF2dZFzYbnrTy9iFto
 Dn79IrSDIrtYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZA2j7NJv
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.15
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

On 12/05/2026 18:43, Bernd Kuhls wrote:
> https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.15/CHANGES
> 
> Fixes CVE-2026-42268 & CVE-2026-30923.
> 
> Rebased patch 0001 due to upstream commit
> https://github.com/owasp-modsecurity/ModSecurity/commit/f38b5b7296d87e7b1744ef6b5f3dca11fe7cf886
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
