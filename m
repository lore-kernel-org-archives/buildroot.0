Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F75606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gUA69UvC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC61811B5;
	Thu,  5 Nov 2026 23:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x88vCJKgYZO0; Thu,  5 Nov 2026 23:01:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1548D8119A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793919703;
	b=eXT6/BJVVoPJU1T2WbyFIPIgzKT7ScGaYu8r7C8bb6dd22KPwPqxWG87GjSpwZUZtDgD
	 oUPUEgpkTwgEovE4gTO4y9oFbh03Z3MflmqHHoHhHD/3l8W4bbxMeOij5OqKBnvzFS4Bh
	 wN0vZjMUnvhsLtxk+fox9R4bsIK3ZxF1iHgPY3XL2UPHl+XvJv0Ytx06uOio3oAeFHbcp
	 igb3mQcFjblYnH7j2YiQow3xcaDVChZz00v9I0W2qSOqTK1QxON3ww/3vq11zZjouLmjt
	 kN+pAKuOVFdGlNukc+TVH7p+iKX1AeJBGB/fb+L1/Fb3H5lyY3bdEzxNoye+YcUP3KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=zyc5oX3GEDfN8Ky3acmLUz9XmxXtOqASGanrcBRU9zc=;
	b=I6R2SM/tso36nujCNrrKv0Ux5bweBaeqyfS7YhGkTiW9ucp3PFV04HrXwlqVqlmkK6jb
	 PduzJfuTeNLXFOQJA302P+pWS+z8lbhTJ2Mc6vUxg+JfB6OvD/T1FcgAZhWNwlqK/jylB
	 COBinCGam7fn/jUWKS44c9yFVUd2386iiL5YwSqCDaUx5euBbp64xsubmhePOkkxIyn+m
	 dyk6YiR5laDgDpkQygu1llynEADTyZDTeZC8bDPaOhO6/00VQrkapmUfT7Ih90fSx+Nsf
	 yWSP1Upvgrdjnxkui3STyJEJrOH3/euA/0LwpIUEVKRgIFLloHBImYtXfK5QJVJVgoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793919703;
	bh=zyc5oX3GEDfN8Ky3acmLUz9XmxXtOqASGanrcBRU9zc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gUA69UvCBingBVtmfzhLFzvkMGTfpEL++xvbz26289u6nRWU/+YuLNTi2XzoNUdo4
	 R9KKRcKsS3Py0r27kOMeEmGmw2afTzII4/7SE2sSvyJeC6S18Z9fpRqM8/NW4CCHwm
	 iJ6ZWBPOHDt3pVASRb1mbBrw9i2KqvPPHnUhC4UoPazaCFZK6c9DumdQH7d7flnEYs
	 0hOV2qruZidO/7uo3iPYuhVK21+vzT7MueAIuj6P+zfJfdoIp4zkzcDBe76Rfv4+gt
	 JSSfcO5oL+YfVIdg5+M2Ynz7C8uaq7p9dzLWQ7TuiVlTuYIusgiuM3cVH2nLTEj9ml
	 cfyTv0LHuhmYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1548D8119A;
	Thu,  5 Nov 2026 23:01:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 992B5209E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD1160885
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPpKwc8ojEB9 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7AA960833
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7AA960833
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E66512003DA;
 Fri,  6 Nov 2026 00:01:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 00:01:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 00:01:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261105201253.1384280-1-bernd@kuhls.net>
References: <20261105201253.1384280-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <3f1be75c84766b8db5ea0fbe00f9a445@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.5.2
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

On 05/11/2026 21:12, Bernd Kuhls wrote:
> https://download.samba.org/pub/rsync/NEWS#3.5.2
> 
> Fixes CVE-2026-119741.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
