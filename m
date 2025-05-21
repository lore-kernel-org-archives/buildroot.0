Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07229C54E71
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E2340BD8;
	Wed, 21 May 2025 17:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYSKa19n_f1G; Wed, 21 May 2025 17:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD6940BB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD6940BB3;
	Wed, 21 May 2025 17:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9591D758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F7940BBF
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUcPzoLacG9U for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80E2140BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E2140BAB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80E2140BAB
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:58:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6747F2003B4;
 Wed, 21 May 2025 19:58:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 19:58:28 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 19:58:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
In-Reply-To: <20250519142045.4025181-1-titouan.christophe@mind.be>
References: <20250519142045.4025181-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <4b74d4f679cd99c41533fd5dc7e1cd40@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747850310;
 bh=+4DMHKF30WHQJjxW8mYrwjd38PD/cA7VNJHedJPCrPQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t9LsYSo6h9li3e0onyOQgZTaSNSw7do9qOP/Y2G8Gm7kLN/Z04C9RHZCd9wM5/Veu
 Z0u7J8tmXSDaNVFJaoHml26NN7DZsFglkO4IvtCnei6J0YO9LHbqpjUuLeQyW6g8zV
 DIhFNsHXJqumAGyKHSLCgobdwMET22AvuRLzeLexBHEUzNtTx02zBxXnnVQTjFUSQS
 QivJFi503QPZ61CuSNSpDevhrhdceyPYqnDypQuYTWiEV+HR+OCTXwRw8jyuSvaZSg
 i5AXc0Y56LJn4oK4Vg0Mp09RYmsiZzgAZ7GwzxwGlufDoLeHpjGvyidsf1b0x2u7xD
 wXYH5kIWcn8XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t9LsYSo6
Subject: Re: [Buildroot] [PATCH] package/bootstrap: apply security patch for
 CVE-2024-6531
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

Thanks for the patch.

Unfortunately, the package patch does not apply. See below.

On 19/05/2025 16:20, Titouan Christophe via buildroot wrote:
> Fixes the following CVE:
> - CVE-2024-6531: A vulnerability has been identified in Bootstrap
>                  that exposes users to Cross-Site Scripting (XSS) 
> attacks.
>                  The issue is present in the carousel component,
>                  where the data-slide and data-slide-to attributes
>                  can be exploited through the href attribute of an <a>
>                  tag due to inadequate sanitization.
>                  This vulnerability could potentially enable attackers 
> to
>                  execute arbitrary JavaScript within the victim's 
> browser.
> 
> No "official" patch has been released upstream, as Bootstrap 4 is EOL
> since 2023-01-01, and security updates are shipped only with commercial
> support. So we use Debian's unofficial patch instead.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/bootstrap/0001-CVE-2024-6531.patch | 49 ++++++++++++++++++++++
>  package/bootstrap/bootstrap.mk             |  3 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/bootstrap/0001-CVE-2024-6531.patch
> 
> diff --git a/package/bootstrap/0001-CVE-2024-6531.patch 
> b/package/bootstrap/0001-CVE-2024-6531.patch
> new file mode 100644
> index 0000000000..1e172d444d
> --- /dev/null
> +++ b/package/bootstrap/0001-CVE-2024-6531.patch
> @@ -0,0 +1,49 @@
> +From: Bastien_Roucaries <rouca@debian.org>
> +Date: Sun, 13 Apr 2025 12:33:22 +0200
> +Subject: CVE-2024-6531
> +
> +An anchor element (<a>), when used for carousel navigation with a 
> data-slide attribute,
> +can contain an href attribute value that is not subject to proper 
> content sanitization.
> +Improper extraction of the intended target carousel's #id from the 
> href attribute
> +can lead to use cases where the click event's preventDefault()
> +is not applied and the href is evaluated and executed.
> +As a result, restrictions are not applied to the data that is 
> evaluated, which
> +can lead to potential XSS vulnerabilities.
> +
> +return false in case of error that will avoid the XSS attack, and 
> avoid further
> +treatment by the handler.
> +
> +bug: https://www.herodevs.com/vulnerability-directory/cve-2024-6531
> +bug-debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1084059
> +bug-debian-security: 
> https://security-tracker.debian.org/tracker/CVE-2024-6531
> +
> +Upstream: 
> https://salsa.debian.org/js-team/twitter-bootstrap4/-/blob/1925007041cf88bde02af23c9507ad9e7426e362/debian/patches/0003-CVE-2024-6531.patch
> +
> +CVE: CVE-2024-6531
> +
> +[Titouan: stripped away UTF-8 characters from the patch body and 
> author name]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + js/src/carousel.js | 4 ++--

The bootstrap source archive used in Buildroot does not contain this 
file.
Running the command:

     make bootstrap-patch

fails with output:

     >>> bootstrap 4.3.1 Patching

     Applying 0001-CVE-2024-6531.patch using patch:
     can't find file to patch at input line 34

Could you have a look to solve this issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
