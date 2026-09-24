Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA09C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582AD40AD6;
	Thu, 24 Sep 2026 19:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYxHOD_SiA-w; Thu, 24 Sep 2026 19:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8104840AB1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276668;
	b=KpyyZ3nyxNgtZH0VvVWnXGQgSiUxWpMivvR7JYxfJQMno5VyVCFqm/BIwA+om5UtTM4o
	 We9XeXY1R5KJ66L5R4xn0MmA28dz1cJSp76eIDssDADAN66CLlMexd1GsrMY5UpyT2fxI
	 dlR7olGra5NE3RjaXg5yr2/R6uPIM55l9fbjjW3g4NAuKGrR0HZhA0smrQJvJaQmoaTHE
	 J4luSvbe0cHUjX6t8obG+Q0nEdjCQ5cEZeibzjAE9yiunduQtfNTEDks/3zmCew3QkEWb
	 u7d0+Bt9lLhNBwq6vrgng5NcUwZWt1iXExVaMHxUVQB9AouLlRY2RZpt6XUzLmu1CYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=jJ9FYwVt7yuWKZvxOKTmyuxFdR2rGCTbwLaqorlcykw=;
	b=PFv3N1QXBYm9YLS0gWw0Bc/Oj2z2M8cj/CmFnpquAXkNR6rDPEy+l6gCHWpTjiZPTZqY
	 RJdk/yyIunzt+fWP2jRW5TQvTYaQLa5y8N12SERg8NH98yN7WcrgdK8ZHBYmDtwuG84zz
	 T9STWiJ6jNbaNdjmWiZDb9uSS/hmaU+mu52sEZHlSIJr9hHc0aSaxaGqytJhU3KDti6cI
	 qq1miQ6g//XK5YOm0Gq2ztH3CD6YGTgrHAi08AOnxGLXSJa3iZj176lwsW9mmfgQv42Qb
	 0iK6nnfZvktDLHKYbURJL6yjXKgpIrv3nphJlt4LIeYOUGz+dnN1HA5yiLf4iOSm7zw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276668;
	bh=jJ9FYwVt7yuWKZvxOKTmyuxFdR2rGCTbwLaqorlcykw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DOB5akIc0qsHKfbrh61x2cBSeOG7mpktAtsoomGEOgF6g8s67FL3QkT6NzHP8AWkB
	 2YoStgXZ6LbwsrrNpeZYUtyGbQfpuD+JMZdREt4eKaeaoDSU3esGthDAgV3O5z5vVs
	 GFB2dBO+I/xb7lnqm9I2kvMgOduiDJ85J1rv0A1svzTvAJdVuaH7Newr2ona5YpAos
	 He6lyCX4jzhS+6hlVKmrhKL7fnF05IZmU6f4POTA9ZhKGi2gcsTQHgc7KGvcZIsfnT
	 vtnY9omy+UZmiLEKPvBKUgSZYW2IXGnTm+/+aQ0XizkwM7nSmHnYMa1459cxn7kUu+
	 neOr7vmnEqGlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8104840AB1;
	Thu, 24 Sep 2026 19:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D80E328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 104BE404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7jYHwN1mg-5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 19:04:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5EEA94017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276665;
 b=dmU6BRM6Kn0njuNvUkw22N5A1fOrOd+dVntvaXmHSwvX8syYkzbX01gH6v8KWEvzesSw
 uRrbvAlT7UemDd1z/ig61TZ+nYPvZHjTXz+egHWa5eSXtFK9UNHxI7kYAUHRjLJFsSIPo
 LwZlvjUaQ3e71dvqAlI336EtX9HCWk0qMGkmRTmqMj1ZBB1mDDKEmE3fuAm6pCmG8Kpof
 Vco7Kxa50OWQoimHeQ9gau7sBCru6jU3aZIOMXPpBtL9Vz8EvGewwCX8xEN++5kRfoQIc
 Bfutjimwv17uc6K1oiDcQ1GEHZ8kdaojcKY2BbZ7gb4MLy5qHaM/iFWTwwFHCcuBe8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276665;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=s1FSuar6CtZqj7xBy7cODgzQVB8ca25dN6UuUpFHA/c=;
 b=LC0bpiQcls7OSgIC8cWFIW+wzELSJT3fKSvUaI31c0tUyK846wpboBb5fAnv4Rirn5QU
 2VY/xAt1L3WnBUIgMgawRAL6NTbYwUOZH0VUXtWe1mIjWtl48Gea4+ngK+n3ka9LzAqQE
 HKcbFs+ie2kSmikJjfJJl5UKeodMei1iZaDmkmGtJqJlw7vmMuC3fmxCLaD3El9/majKf
 pl6SrZAL0Wg+u3WY6uZxuNIUlP2TuCN38mkrPJ1EOaW8c7S9G//gdHNCLYZDz4R5E/9QT
 Ji8OtaAqgvu1p60Dn6fyAmJCgpPDebUkd19bl4pvdlfQl2jD/T/xc+N/MyZed7gl0Aw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tBfdSuKO; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EEA94017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AD0D0780331;
 Thu, 24 Sep 2026 21:04:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Sep 2026 21:04:20 +0200
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 21:04:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260923171936.46557-1-bernd@kuhls.net>
References: <20260923171936.46557-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <a175b051f630c048b7a2a92460b3d8a1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.2
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

On 23/09/2026 19:19, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-2-released/91895
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
