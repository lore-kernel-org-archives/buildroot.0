Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B7606A322
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NKJ5LnGs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1559815CA;
	Fri, 23 Oct 2026 17:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbkB99pLaRZ3; Fri, 23 Oct 2026 17:45:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B0908159B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792777506;
	b=bZiz0uQ9G/J79vAX63+YtgXBX8HBQMV/NiRVa1fBz/j0IO0va29UhiA6oXYcGD74G++4
	 MliPUqZskC5tsRMpjwqFjoHBAh5Usr1pjMRauNbs7ScEKAuua3TL85sdbWH8WwHufdTlp
	 qHPqN5Rx8WzrXs+wRy4YgP2hF1r0EuSbeU71hQ56mj6OWfcfvsCdG+BY/Oemm/XTNQSyL
	 0aZqP2JDiimwtvuy7H6h0J0isgQc5tUCb7Nna8dMukCNiXEJsCZYhkVca0t2+UPg8kjcv
	 21qhiSPmqhfVDu26F/yImKg3LxxZb7oIC3k7yaxIm1nWqRZEzLAbHSZlNxuU1IhnYcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792777506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=F4NA8wPxcqjvBrQbDakJI66F91p5hjxGnUsrgVNaVfk=;
	b=m0TUQngiTaUBGFiG77OZzm4ECh0BemapymtGdMnY+UfSRxRBIjcCmdcnrTgQ34+rs9ye
	 5NUuXoa0rupVbrwGzXmrthFsHXATRLGerg7Xj12d/K8LLYg6B5TJJM+m74X7jvAxUMp9Q
	 ZHS6zVsGLanZcJomz1YLE3vduPgGqB95LU/I8lrIJWWZdocw+JrDWqf9OlkGtvT5+CayV
	 KuEN8/sqf4VEqi26BUJwiaTizxJE7TG1fR1fj/g8mopwqYvQprHXN43tD9ABEQ1EruO0I
	 ptVjVmwe2U3t+7iUK48Tqmmf1yB77h0I9UUz6oRf/2ONyZtIGfjuMCpEPsN+XZWfcwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792777506;
	bh=F4NA8wPxcqjvBrQbDakJI66F91p5hjxGnUsrgVNaVfk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NKJ5LnGs2YEOTXILgsdshpYKgp8zkKfFopD2ZjTixzfPiovdu0YrL6h9exmYsIRYR
	 P0/RFx/r5ngTImQeWSlVRyIZJi9I+FUSG3JiW58Fgl7QNvG10IQr4/etcbxbN8eyHC
	 5ccltWE9cwEhSn2Xnv9sbSZluXDrqJY3L4EYQFapFvxyeSCLYv3BiSGLo/v5TmmiMD
	 iCC74sgAlyD0RXl8yc188t6dm2ThT/29eIZxA/bxBLv/gPPYVBsILEoGTlrqq1LQaB
	 Hk4/jaZYOnieAMRjcPyoDvR7qJ6DKp+q2Ea5Hb1ROjyPp4zqitnb2Pdl+qb6HmCN3y
	 Fd2XXexFDySLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0908159B;
	Fri, 23 Oct 2026 17:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 934E412C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E968401DF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrRJnw1IW0J1 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 17:45:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0FDAE40059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792777501;
 b=h7AC1DMJu8ofaHQt7PAYlvYAUZHo5+C+CQPXHU7/GFwHqRkDAOvpwqIhUrYuYvV5i8Ig
 kpLIbzS5SgiezSSQe2RWwaFlhDJNTGaPcLnkpa2hv26yGyxObbQhre8X19lvvvIjOR57x
 1X4gLfFMkV+FTtRV4ZJb3pBzd2MnPj/iGhOwhmug4XLkrIkT3D5IOotWZ60HX6YHlF2x6
 WxjGa2LV/LEtfTPJ7a7u8UOP83/F67sXMpsHQLCJZQ1Nmrf6sVFugNkOxmKRRpk/hH3FU
 TfOAXkBbVts1+vmy76LXVuWxUwatlM0m2m4wEvZTnvNLbXTXZD8l6iteQWizacX+s4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792777501;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Q3K3yKb95Pb07hNleFR8swU6zqPIWkEXN8jbRHaMlew=;
 b=fFrXxbMDe1G5XScDg+M1NtorqgqHJrOL4zC4qws9db/kOKrHbcq9hpzdXWsFDvfCjssW
 G8L7XUzTeCo/hMUHkgUs3kAftZLW4tAILoHOCbZalrNRX5LNN19VxZ+jOd6bc2w/N/Kv8
 6SZE/xJ0C0nKfvZNQNLG8XkNm1+yLsT8n70tAgsxOwB4JMZadGDaZEBKUwtvIT3rmksMg
 B+rVBBUwIG0V+ct/eG1sS84ppY3VtWhnN9AqLxeBMkF6SI7Ppth/KOBsk+l6qxFEzOFch
 +24Wfom0vG+2UlFGWaj/rDUal9a+MIh5C66RYQgh8BBKb1TFW9qSCK82s3DmwpF4w1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IJ1I1x6L; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FDAE40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1E2855FF88;
 Fri, 23 Oct 2026 19:44:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 19:44:57 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 19:44:57 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023133016.1694359-1-yegorslists@googlemail.com>
References: <20261023133016.1694359-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <752637ab32da89dc584a326006b4c7d5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/feh: bump to version 3.13.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 15:30, Yegor Yefremov wrote:
> Changes since 3.11.2 include:
> 
> - 3.12: %f and %n format specifiers are no longer allowed in --action
>   and --info strings, as they don't escape shell syntax and allowed
>   command injection through untrusted file names [1]. Use %F and %N
>   instead.
> - 3.13: switch the default font to the bundled NotoSans Medium.
> 
> ChangeLog:
> https://github.com/derf/feh/blob/3.13.1/ChangeLog
> 
> [1] https://github.com/derf/feh/issues/821
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
