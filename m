Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D3CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 08:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1128283F4E;
	Sun,  5 Oct 2025 08:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAq1j1aJ2uWP; Sun,  5 Oct 2025 08:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193E983F52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193E983F52;
	Sun,  5 Oct 2025 08:27:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE43A909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9479B4110F
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUtszfpSKCNj for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 08:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 749BB40E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749BB40E59
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 749BB40E59
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:27:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4A2E019F734;
 Sun,  5 Oct 2025 10:27:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 10:27:36 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 10:27:36 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251004093348.269213-1-titouan.christophe@mind.be>
References: <20251004093348.269213-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <d4db5681a54b91431c058d6880c54f2c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759652860;
 bh=W+SDUH4Id9IdN0XPh5/bRvb4OW3CiUJc956bpwtY83o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i95YTTj2gP7MN5Yhrmv0iDapuM6xKXlV2/HT/gKRYvVy4KDgEZYotcutb7+q5EV1a
 slzjQ6jDgWt2coR57T2NzfdHUGo9eGt+G7OiB93Tl921SgcgQ7zxosxTtN4vqvYCxr
 dimGH+uvjUswo3KtwLdQch1dFYeCGq9+y1NqsmJPZ2YFxlAfHuvdkL8814MO49XAjM
 8TwTyE41ItqVXU3R2mJ4KRuS3J6TDjb9xPBh8pJyilGWhr+9628sqVbPDIA8Ph768O
 vW6bOTEmG52zfNP3QPcchrCxM2Q2NTva2tIAjlQnmVj6da6bpfV+oYvwlYdeSVJXRE
 zcWa8CwXNz7iQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i95YTTj2
Subject: Re: [Buildroot] [PATCH v2] package/python-django: security bump to
 v5.2.7
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

On 04/10/2025 11:33, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> - CVE-2025-59681:
>     An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
>     5.1.13, and 5.2 before 5.2.7. QuerySet.annotate(), 
> QuerySet.alias(),
>     QuerySet.aggregate(), and QuerySet.extra() are subject to SQL
>     injection in column aliases, when using a suitably crafted 
> dictionary,
>     with dictionary expansion, as the **kwargs passed to these methods 
> (on
>     MySQL and MariaDB).
>     https://www.cve.org/CVERecord?id=CVE-2025-59681
> 
> - CVE-2025-59682:
>     An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
>     5.1.13, and 5.2 before 5.2.7. The django.utils.archive.extract()
>     function, used by the "startapp --template" and "startproject
>     --template" commands, allows partial directory traversal via an
>     archive with file paths sharing a common prefix with the target
>     directory.
>     https://www.cve.org/CVERecord?id=CVE-2025-59682
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
