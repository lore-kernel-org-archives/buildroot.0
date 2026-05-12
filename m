Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E0CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85094108D;
	Tue, 12 May 2026 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIVwzBosjM7t; Tue, 12 May 2026 20:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AEF41073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778618306;
	bh=omOEbFNg3nFzkJCc+JxOtufyUVnjnYkS0sw07jzbz4Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nloNCS/2va/2cpZpdh+FVWxgLu+HHOkuHTTgnjKb5MD5mi1o6lwaEWEa7UrVtiNn4
	 Ffdq3X7tBi8Oc18w714U/nOUXDyKEf2kD9Z1K44fweeqrt/Rx5HJqcb9zskfL6sbZa
	 iC+9chNck6LFqicFwbSW5jquAXyKk88xn5gqN/Q5hlkA/OOMybnhhQnzm+yTUZISNM
	 aOb9R8exqsj9QBO2EhIhyKa9zvJx4NyjcQV8yZQv+O4tEf1CdUHdFPuPxv/qRHSXIT
	 eYsCuj55tgxhsjdnSfvFUuNRSWH78cforwrGg/17qT9/fGAuvFC+UUKswjcG3li02c
	 1wmP79MVJyEiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71AEF41073;
	Tue, 12 May 2026 20:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 491BB15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A77441073
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkrrJUBwqnQl for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 131B641071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131B641071
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 131B641071
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1BB475FFAA;
 Tue, 12 May 2026 22:38:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 22:38:19 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:38:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260511185024.3025627-1-bernd@kuhls.net>
References: <20260511185024.3025627-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b5d1f83b37e77b582d53c7a8f1196c5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778618301;
 bh=2ZYbt9PEX//kBH1MmrIknPR5Eu85mI5UEtMXSMND5rQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hXW0A1DZAZ6+k9DxmWnx32T8knLJEJQDu4vsS0qKUYMQQuxtHNq52rpRxSBY/wE/V
 dYzX/m8ZKMbP6mxLO11f32tqA23JiiZnoBRrYKFKbAl7iNiu4iZ7TAgNRDJ4nmInQu
 IXnUw+vo6aNVT89wrU5FgwbwCWjnpAxs88bqLseVohlzXE7s+Gdb+Ghs4a7EGIUvQC
 0e0O+s7rZFu8imFiSykTl8lc0xi1qrpagwMwQGpj8By4QTwkvbUoaaP+xGVbeoIWTb
 YQOHa3hb4iYPb67V/9keTeFfizSJOO7V9MvdMFWMQsOVD/OCOla4oD3r2UHDVtuyhQ
 SKlDCZXHigkKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hXW0A1DZ
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump version to 2.3.2
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

On 11/05/2026 20:50, Bernd Kuhls wrote:
> http://www.mutt.org/news.html
> http://www.mutt.org/relnotes/2.3/
> https://gitlab.com/muttmua/mutt/raw/stable/UPDATING
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
