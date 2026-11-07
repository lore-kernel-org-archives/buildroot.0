Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC2606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i8HsFZD+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD87560602;
	Sat,  7 Nov 2026 17:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mC5lab3vGyBb; Sat,  7 Nov 2026 17:53:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 031CE60661
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794074024;
	b=X6dkuNyoW1ogSnvMnjkDmngVAWZkQipnG/U0+WU0TBcJJM2bxmepXLMwNh4ws6j5l10P
	 y7gxFYJGbQ0uIbFl5Od+AjyF7JeR9PXpgh0A/ZirdjoE1+dpGL9r9/RaDidr902JTG/Gq
	 fkGoI41p2OzaXYuOZ5Nt7gCszFI9hLOnupyIpgVPQjmG/ceZqG8YSjYcEmYANlx+whsIa
	 Rh1n//mmAaJRIjsdeu1W/veRvR+G3p6/4pkinuGPiR699wwYffF2mk1ulWJBD4NnRvh18
	 CqDO8tLIqkfDXV2b2WyKS9ZN/CmakfPFUdYATdW5MdEowToZHWqPWzsCsoBHJiITdjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794074024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3kPT+dMf9sOK3DCMT5hmow6WqsiM8L1Os797Yf5DOyY=;
	b=XVdez3PG0oUUcetjtdV+NeRKhR8ufDwaI6nGX50KXfB5+hdSy6BDRqB88oS1PF9ZgFcy
	 MGi5O0J8FBhwmuDp0APCKAGLzr2FjQU1BYaMQX2m7M3++O9kpW22pBkG+plK7SsOmm4f2
	 UgAt6e2fKhPcrZBGwdxaqCa/oB+TJPmvgX/h9bwjkFinaQm2B/5rTPTamVt2tHV5yHsHt
	 uahe+3Gu+9J30TgwjYIj4TjcJR6NyHBveM9knsavjBmV0YjkfuVcagcmDgsu40HZ+Yb2T
	 PQvU8l6DnjGtdUtBwsH7lCQES71hFyCsHBXbn11O4XYwrj+QaGzmxgfeJiITjCTJLsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794074024;
	bh=3kPT+dMf9sOK3DCMT5hmow6WqsiM8L1Os797Yf5DOyY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i8HsFZD+6wcoBOOI1TzqLojmznMR9uzCe2q+gkMUqcHbmj66oeA1oKYt6immM5Ify
	 1V1f0lBvuKSFer2gK0PJooA/pnZJMYIQj19hfAsTFfjP3rceRIQmiZeNKGq2b56/2y
	 b9RtfaPPzrVun3v9eWs89RO0h62rgAyILAFmhB9aaDAqfGAJieBGlMJxZtNN6V5WUB
	 zcv/xmfEO98wYOTPPF/oXrW/KRH2y6ru+C+1k7QWAS4GAbgfMp19k2RwtuII5BlnDV
	 F4hQQ4DCVFxWoXxCj/ru3xoENDt+S2f9tD3Y7yp4EVHnav2SDoBTwzduJnvGk1+Lkh
	 Q8OHkYlRwKk4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031CE60661;
	Sat,  7 Nov 2026 17:53:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8351E211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80B64400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qut0Di9uoFtT for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B070F4009B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B070F4009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5D442780502;
 Sat,  7 Nov 2026 18:53:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 18:53:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 18:53:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261026215227.3243353-1-james.hilliard1@gmail.com>
References: <20261026215227.3243353-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <e4f70db7e83d55dea8a2e939313b864a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 22:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
