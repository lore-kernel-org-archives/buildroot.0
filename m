Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24760CCD182
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 20:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A2060655;
	Thu,  2 Oct 2025 20:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4ERClYldCtC; Thu,  2 Oct 2025 20:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24125607CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24125607CA;
	Thu,  2 Oct 2025 20:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BA331CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F7B607CC
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXUeSbQGXbGm for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 20:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D5D860655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5D860655
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5D860655
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:26:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C8CE220039E;
 Thu,  2 Oct 2025 22:25:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Oct 2025 22:25:59 +0200
MIME-Version: 1.0
Date: Thu, 02 Oct 2025 22:25:59 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251002150628.528563-1-titouan.christophe@mind.be>
References: <20251002150628.528563-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <688b2e27c936bc54d790ef62072f6b77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759436762;
 bh=KhlNwl8v4RwkiCpmNMTtG6gI3Kn9BZqSi8Ha3kADRfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W0TWW6NNcHdTjvphdFRcg7EdRpyccUTnxmXETgevcrJQglPLotnphA4BvqsMcvhR6
 cHdbVxD5WmXMUuIUzy+lz9ETgGD4pBC3FEbgFcj5xl20aIYj/sj7ywkwsCaWwCVmU/
 PmNdgp19u9g6s24lBwxcKyE95wdEp2GNvagL/RtOZ77pzPnXX19fii+OlgpiJSYu5Y
 42oOxXloPSy2BGiEQA5gAzIEEYSuluxzF7JV/txaJ9mvdFKww2klLoBaUTtGWD9r9d
 Wvxnh+25YDG2D/E7T8akVHBsmbwFate+m2sZdVmKC6TjAtaUDlM9RSwj4SolGHryQk
 sPGkV7pRVryug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W0TWW6NN
Subject: Re: [Buildroot] [PATCH v2] package/python-pip: security bump to
 v25.2
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

On 02/10/2025 17:06, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2025-8869:
>     When extracting a tar archive pip may not check symbolic links 
> point
>     into the extraction directory if the tarfile module doesn't 
> implement
>     PEP 706. Note that upgrading pip to a "fixed" version for this
>     vulnerability doesn't fix all known vulnerabilities that are
>     remediated by using a Python version that implements PEP 706.  Note
>     that this is a vulnerability in pip's fallback implementation of 
> tar
>     extraction for Python versions that don't implement PEP 706 and
>     therefore are not secure to all vulnerabilities in the Python
>     'tarfile' module. If you're using a Python version that implements 
> PEP
>     706 then pip doesn't use the "vulnerable" fallback code.  
> Mitigations
>     include upgrading to a version of pip that includes the fix, 
> upgrading
>     to a Python version that implements PEP 706 (Python >=3.9.17,
>     >=3.10.12, >=3.11.4, or >=3.12), applying the linked patch, or
>     inspecting source distributions (sdists) before installation as is
>     already a best-practice.
>     https://www.cve.org/CVERecord?id=CVE-2025-8869
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
