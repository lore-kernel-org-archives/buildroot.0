Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AB606A336
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WH/GOPQl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24263608B0;
	Fri,  6 Nov 2026 17:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVwFe_LXMb0X; Fri,  6 Nov 2026 17:43:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB07F60771
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793987028;
	b=sA2ONmITHgevYsvisW/Q4IcKp+eOa270sphz5scZi+KebMMnN1+n3e33TTMDOmOgk0DG
	 A6FBwcncYFmEiKJyo7tSAR12beD/zCclfK/3SVb3mFNDRuh+hFlNfJt6vOxrou8vCog7z
	 qqveEWpjpDFVe3yObnC9/ptdZCRjXwOqUrYOx5cYgDIDYndWSHdKAaITAvEyZFWr+FHhs
	 6Xe/ZoOlrkVrzBTn6Hz/yrRIniTXJC7qBY8IYg4MjJk7G8Znl/ZHZpL1Myr9savCc0kXC
	 G7iBfivg5Koic8xztQMflcWdGmW6uYKPOTud+Hu47IiEXxhixVYdMuhk0A/I0qPBBSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793987028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=84PEM9KFXj5SJt6PT8n8b2eYJK6pmoyInye7mD9vQIQ=;
	b=kZOzA+IjFGa4Zl3OrTtBbyV1grD1pbTXnmJaIOnFkuDXBgey0qGs+Z89RRoCVzNFaDdQ
	 SZY/SXN9z289s8fuXsqEJ6x0WhZtfq8Ee3E/BaV5xUKo7awJ8NjCiQQEcRdKpSZlGrxqC
	 Bra3JhIqjrmJLcIFURZLTTTRxZVgydOza0VuSuIVXk7HFLwNylVsR/sVlgtLX721fc4iQ
	 jkWU3gnJHRJ6WMMuCu0jKZv7ro8pG7F2yrh9+VD1sYYwqEC6u26KjiPyasyiAoDSnNZB1
	 VsZJVfGga79uubmjN+ty1fKJ3b1t5WB416DAu8v/8jk1DM4EtJfriQrTKBgp+CwZSCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793987028;
	bh=84PEM9KFXj5SJt6PT8n8b2eYJK6pmoyInye7mD9vQIQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WH/GOPQlGsuUyF4MT4MLaEYaruEyMOkpKNQAcvZ30PwapCbWBO4wZSqQqvInzqTOS
	 +vpLvNQmZeUwy2W7YIC4pvSx+n+j5yXAKC3mPwOmVVfUdzrSyCbiMgco5lu5RRcxvO
	 KwSbFwMxEPK9gyc1a4NEWDFbjIhaCEeeM5wJzRjmgN/udaf52SPNdXWfE1LLLbmdnb
	 PlzaetCxJBGBgVm+fONI7uk6H5Uky9mYVtSeJEnnKKSc6/Hgm3K6PZP0/udR9OsWnN
	 nxb9EcYM0mCG8qoDDXJC9/xoKOG9ErQg5DHL881aYA5cePD7lX+4R1UW+JOREPJv6h
	 eI9cMW6VnXW/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB07F60771;
	Fri,  6 Nov 2026 17:43:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D3512AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A539812BF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4SYLxOE1ptV for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:43:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C35B812A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C35B812A1
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E32F560129;
 Fri,  6 Nov 2026 18:43:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 18:43:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 18:43:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20261106155547.668890-1-giulio.benetti@benettiengineering.com>
References: <20261106155547.668890-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9f221d6eb138f278914ef63ffafb4a12@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2026-09-11
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

On 06/11/2026 16:55, Giulio Benetti wrote:
> With this version we can build with Linux up to 7.3.
> Fix build failure due to GCC version >= 14 by passing -Wno-error to 
> CFLAGS.
> 
> Fixes:
> https://autobuild.buildroot.net/results/8c7/8c7196cbc64dc9eacd2c4b663e66be6e0da6c8f1/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
