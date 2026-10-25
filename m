Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84870606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f5LFewPc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49076816DC;
	Sun, 25 Oct 2026 11:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRRRHy5gLHpP; Sun, 25 Oct 2026 11:57:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5FBB3816D7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929441;
	b=Wp4uVjAArnKPrJ/3Jrl6XQuTLx896frLYM9cCbn7Y25itBZN/xIH/MYfyrxI0p+islUn
	 IsfsDIKY3jQVO7G9gIxvBd/3QNkF41zi1M4joKZ3kEiQVUIvVljKBX8GpLGh/gKNaFJZq
	 zhZUHiIC7quA0oJkSXbL6Cs6UNBW+5EKK9LGqKab6i8IiLywa1f/SKCPkaT+wJm9M2pyn
	 SruN3ms/QlvQDBHx7zZJT+ORbjIjMCHfLluLtDDMg3XuFglRI6t46fdw+Z8y3zmP99xBm
	 TSArKV6DEMyqYiGxz2tAC8cvDzAFV32BSWH+sBeVVhAaenVzWCxVd0kNCfc6A+ubf8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vBphuTvSwFZSEBxvf84Ko2WQ7Z0sNQeGPW/t0j2wQGM=;
	b=ke7FfW6KuRNSdYZ0kTRJQSLszifTbgOhyvsFLK3fuRaGpsfFK5A1GXeOsNMJRC26Xhzs
	 fvvxWXBYcjJV6MHqbAcJEc5+jmaw48tlTMg6tFRJZRWqWCxbGrfEEykvKMGA/abF0dQdY
	 7ziP4jS36J/YIBII86ZRmqGOm2Hrar3Kqxh9cD+iSxAK7IDsP9+xk88nI3ZCdvJIljZaS
	 MhAdvNYa7tS5LVJ8K5Arg9Hh5QVDVHDQ8L18ZIP3KjFBhZ1G53NWiSgC7d+d3xzgeSIx8
	 CNo4OGU0kRFYLMToSZT5y8VePW8X5I4f38S5NaP20gVPmyCCOiTipx6Z/dIqrw4LELg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929441;
	bh=vBphuTvSwFZSEBxvf84Ko2WQ7Z0sNQeGPW/t0j2wQGM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f5LFewPc7QOSBVxehyDKXzQ6oIBL1iUct243cU9JzCLGAyFFENGkHRb8B2DawomZr
	 +QGt7rlClChPw42Nx2ggWZRXCJBhWCVEIPuVvPuo6T2Cfj45bENOTdsMItybD+qPg8
	 o4nv1xaZsbmARP/D8Ru7khZn40KHMH0+E5yg2sImjjgshW35hZWI1OvT5aiopC2ckg
	 e0YPjBWiYwU2vwJ7BOM0y3gb1750hHY3AEw11qdHDtZAVJefUgUsn2O87QLpJhC6FQ
	 ptqHFOrNlgihnQd3B1qmVzdmFlqcDU7iaVzOyQhmkuCZ5+lYJZi7STiA62BjjWIlbi
	 9ayFG/NYAJv1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBB3816D7;
	Sun, 25 Oct 2026 11:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C7FB3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F40BC401F1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8vxFHvTf25d for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:57:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5F86D4009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929439;
 b=i8xRmZSHTrczWgKDLMYE3Zh4Izz7cTXy+KXwqUvTIvVCp+CPZJwbyz5KqmfRI93iqX2K
 gKCZhx5APwV91R0jDCngryQ0ulwe1TLLJg7qEezlTnfnH/ZO7m3d5kKbFoaWRQhGCqfrg
 CFo7xAyWQeOpEIPgzgS0v0nrh4W8a4hDagnnVt17ViWoK6C+L2gQ8P53D51/4ijx8pPtf
 5NkVuwNUg/aTdX5V01/C+3MbiaV0C6hZhDeOfkk3bTmaQcxvFaF54rYMfaAsKbYxUTagT
 tTHQ+RENPVkj3fQJyRntJ5AdXqLmCI/jF8mC2YB7oarynDgXEcV+0cU/XLzgLHZRVgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929439;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/9FrawC+wtKBmDa5g0IPJ/VR5VXP1QSKDpF4h+W+sE0=;
 b=CYo7/uc5q2uXsyKcPjq11P8WCq8qGsMT/5//poDQZqb/4i9Ob8cuyrY6I9M12LvCcUWM
 xC0wpJIVo57Dd1n/4QOv7Kg9EW8e6V4Q8o17Xk6u2MScQJzhm3wZIF13XbtGpJRisXhRq
 isldOOqwUkwkUIJqgsTunh8tM8AAXhVXl+V9T6wcMUz65sN5spRvEqHKYUJszuLU5ZYVW
 jXj8eB7WKF3YTYWJvpA/KS/AdV+wMWlvFmfjOULYgdqxX8UsFFLOHeeGTldAvMzpII5+H
 bAZ2OjTWRg+XnfBjiKZGiyQtqae4m3+Qkd/DxHq0tIT6KnBDlm0vMZ9g6d6i8PU7shg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tFdi1lOv; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F86D4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:57:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0A24013F86E;
 Sun, 25 Oct 2026 12:57:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:57:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:57:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-2-james.hilliard1@gmail.com>
References: <20261024182913.1957467-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <da60252bd030f6da6720be8111a5e137@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to version
 0.162.0
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

On 24/10/2026 20:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
