Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E7A606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lgJTOVHx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=fAE4vZuD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D37760712;
	Mon, 23 Nov 2026 10:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLuDHgkV7yGI; Mon, 23 Nov 2026 10:15:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B6DE60651
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795428919;
	b=oxfQg8VhCRLpWyweyXbIN2/jbSS/+o0nkRl5A/te7ou/6hmzjUbte60RF4s3wd0uKROc
	 tBoC+UwwJ8hcvLilcN0TOCxbZxSjhFdRei3qHhDHsIk8jgN+Bem7SMri6OBF8p4P8sabT
	 TCxl6Grnq2HrRK6FL0PZIYRo5xH7Z8kjMYKGW4MkvW1Kg1GWGyt/T0UQKKSBAvMBZfwI2
	 86C2lpMoWDaRLIpp0QfwdxenwRfLzg5nIC8Xw8R3O3kbYijDNKghvTN0Ct4jyB5sytvns
	 qO8pCR+pIXiBdSePb6CxB3+QsXtdom9a+n1SS8Er7vk67uBuemUs/nMZb3SUWj5YhfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795428919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sI3dTQN5IpaAmhqsmsefIP2x8mQqZFCpOQPmMmqKm6Y=;
	b=TuM76cX5miEL5aAqIOLLQ6G9TEHO6DqI8d0trP96/J5jd/kCj/oUq55tAILzKWFiZfID
	 4L9stGak89L3/daBAfa5HiKOQo7+TCGCe7f6IiWI7dEGbNr0f+nMzehKvV06GQORPKjvN
	 W5Q+81tHJUw5m20kZykgtYzz96npghpQ/jKtqSljv/s8TFrSqmKkSnC9bqj1bEA3vhQD/
	 M73Qo9/OCiiqIgbcGfSor72zYPedktiCS32mixJW4S/hLXwqDaQtPlCtadVtjIKzjt+y2
	 APRD/YT/8NHASokPvFmrRa+eYGuUtt3Tr83DDz4vOx32pNrUpHzd5zCFNksFmkcO3IA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=fAE4vZuD;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795428919;
	bh=sI3dTQN5IpaAmhqsmsefIP2x8mQqZFCpOQPmMmqKm6Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgJTOVHxZaS6tQWqA8UnCzQnCgNpMCGQoUPMW8GVHvPBzaxwlT5ztR11Xb28ozsUh
	 i0bUA/FoKEVVmdibRPHyHalOaiddVEl9etSc1Doa0uZBhnvocakMjVFMkqvBmOP/sB
	 8VPWi9KMUe2BAL7y0HAPjgxQLZQKZLyANq7tCi5WPFMWzVhRc0yddQpu+YZ9h0UFoQ
	 oZBwTaivYMJ5NShCVJzxWIUI4sKyUrbEwU2tn27rj7821UxU13ZkT/BfVSaFLBIZSn
	 UODrnA3RaodmxbCiXNlC12z5YwxHOHs+jAR6t9SB0/5LEdrVVsv793q0N8804nFM8t
	 KsQmRBb9tVv3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B6DE60651;
	Mon, 23 Nov 2026 10:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D174079D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32A360651
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhoPqcFNusLC for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 10:15:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A72A605F4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fAE4vZuD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A72A605F4
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fAE4vZuDOLp4yRqyjTxxjAya+2iOzPZShfn7GD/4+M02sr9kt7BDCZHhzTcimzjveH+FODuc/Ai+MPUSZ1gogxWNefP71LUHUurs7mNoIN3GixesTFKQ/gFjKY/LRK6d/rezCvX9LyP2LfuelgLtbIjdYWWSeMRA1zzcVnq/dS6gOiAIFjT1Z/q2HOsDHzG2xHj731bWPG3ewjvvEU6kYe06idBZwcfECwedehnkdGRT/x28gGAHtugCX2IGovTRuTBbkxVkbpeHQv8IDMY/IWZNhY8OO3LIdaD2g6ey7ZX2XGKcyKv7dN8RD+LJ+eWyrPwPl4X5hC4Vpp+lrJG0Fg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=LCWediBPASKTbBusiK1L+CUfF8QVF2F6pI00MpUM4Bw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 460609322; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 10:15:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVR4n-00000007Ba9-3iNv;
 Mon, 23 Nov 2026 11:15:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
In-Reply-To: <20261123091624.1331936-1-fiona.klute@gmx.de> (Fiona Klute's
 message of "Mon, 23 Nov 2026 10:16:23 +0100")
References: <20261123091624.1331936-1-fiona.klute@gmx.de>
Date: Mon, 23 Nov 2026 11:15:09 +0100
Message-ID: <87bj7fn9aq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: point at official U-Boot
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

 > The official U-Boot domain is u-boot-project.org, not u-boot.org.
 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
