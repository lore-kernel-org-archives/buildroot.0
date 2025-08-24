Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511C6CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F182484518;
	Sun, 24 Aug 2025 10:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2x8-_dMWO-vj; Sun, 24 Aug 2025 10:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2BD484513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2BD484513;
	Sun, 24 Aug 2025 10:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1036D19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 023B061734
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jVwuPSL-Tf4 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1160860A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1160860A54
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1160860A54
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:28:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B2F075FFA3;
 Sun, 24 Aug 2025 12:28:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 12:28:24 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 12:28:24 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250818210426.3257467-1-thomas.petazzoni@bootlin.com>
References: <20250818210426.3257467-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b97d3a7aec6ff40fb52b16fdf6bf5520@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756031306;
 bh=1v1EEOSGKKwKahwlAJpk7ozkrFm+NUidU5wYeQJJ7GM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dtlKT36kr0trqOYJHR9AgQ2QMTuxibpOex+wZYua1GXDGURxwK0CTXtDVZXmMBSCD
 DSfn1vmiLoSI4ftwkE9uDvLGFNjMDexwb86CsCRBrQL5Q70qhpv7CF6BFCS2ce/Enc
 BEHjZ3EjVaaQjKLZrL8rU4rHXhPsAmRDWmkHnB8vfKSYRwJEiB2eEsUyDkYJ70ufqg
 iO8iPDnPKIF5o8N0wtxicQm60i9uh7gYZ6UesPHNp8Hg9Yn5JnhO6LGl/Gk+VmzTMC
 UTgkkPs3w/eOXV2I7j5cCNyvXyQuMJrEF0yKM2Io4iCuaW8kWww3sWRGanVrkQqmiZ
 hQikppb2/ZjBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dtlKT36k
Subject: Re: [Buildroot] [PATCH] package/python3: bump to 3.13.7
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

On 18/08/2025 23:04, Thomas Petazzoni via buildroot wrote:
> This is a minor version bump.
> 
> Release notes of 3.13.6:
> 
> https://www.python.org/downloads/release/python-3136/
> 
> "3.13.6 is the sixth maintenance release of 3.13, containing around
> 200 bugfixes, build improvements and documentation changes since
> 3.13.5.
> 
> Release notes of 3.13.7:
> 
> https://www.python.org/downloads/release/python-3137/
> 
> "3.13.7 is an expedited release to fix a significant issue with the
> 3.13.6 release:
> 
> gh-137583: Regression in ssl module between 3.13.5 and 3.13.6: reading
> from a TLS-encrypted connection blocks"
> 
> Patches are just refreshed, except patch
> 0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch which
> is dropped as it is upstream as of commit
> cdae923ffe187d6ef916c0f665a31249619193fe.
> 
> Passes our basic Python 3 tests:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1990154299
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Since this bump is bugfix-only, I applied it on master, thanks.
For info, I also removed the _IGNORE_CVES entry for removed
patch 0009. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6b410a5fd88c96a9fef97d9bdaaa7124eb9f7bad

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
