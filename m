Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F76C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B3E8156F;
	Wed,  9 Jul 2025 18:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8q7AMA0kyYmQ; Wed,  9 Jul 2025 18:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A41A81549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A41A81549;
	Wed,  9 Jul 2025 18:59:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B333C69
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9973040A2F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orjdeMU2rjTL for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 18:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DF9340A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF9340A0A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF9340A0A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:59:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 114005FFC0;
 Wed,  9 Jul 2025 20:58:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 20:58:59 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 20:58:59 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250709163650.115228-1-titouan.christophe@mind.be>
References: <20250709163650.115228-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <15af6227622c3e1d9c0897cffacd1242@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752087543;
 bh=o6hflKaKhivujgPGbmGGumIdUsvRSlc1cueY9/RjrrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DOO6M7CIndWEvNTTwr+NOcxIw2LZeqMyGJbArDPz8M2Xae08EZHlquBMEOQvG/icT
 6Geo00da8mmsrVFplOPcjFDg9VOqCRhD81HyYpm8RvSzXy8Vg8vUan3xNS66R9e+qb
 OEAxhce8b9Yn0+d2pW+dItW29lnSvUUCCOctFwnbgl+hw5l2a86+IcglUfZZkyIu1u
 bdioLfJq4+IcZS70fj2zD0UNyPl0u4aiDv3lO8jaccNd1K8DsEo7t3PffOmX2QL5fi
 TGOZoRmKd+aSnXC9Q/8XWuBQZ0+/gscNXQgv+BwoA9s5RSO5BpTa8kqMorMIafqHyU
 khK2d7g9tTM1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DOO6M7CI
Subject: Re: [Buildroot] [PATCH] package/git: security bump to v2.50.1
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

On 09/07/2025 18:36, Titouan Christophe via buildroot wrote:
> Read the announcement: 
> https://lwn.net/ml/all/xmqq5xg2wrd1.fsf@gitster.g/
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2025-27613 (Gitk):
>    When a user clones an untrusted repository and runs Gitk without
>    additional command arguments, any writable file can be created and
>    truncated. The option "Support per-file encoding" must have been
>    enabled. The operation "Show origin of this line" is affected as
>    well, regardless of the option being enabled or not.
>    https://www.cve.org/CVERecord?id=CVE-2025-27613
> 
> - CVE-2025-27614 (Gitk):
>    A Git repository can be crafted in such a way that a user who has
>    cloned the repository can be tricked into running any script
>    supplied by the attacker by invoking `gitk filename`, where
>    `filename` has a particular structure.
>    https://www.cve.org/CVERecord?id=CVE-2025-27614
> 
> - CVE-2025-46835 (Git GUI):
>    When a user clones an untrusted repository and is tricked into
>    editing a file located in a maliciously named directory in the
>    repository, then Git GUI can create and overwrite any writable
>    file.
>    https://www.cve.org/CVERecord?id=CVE-2025-46835
> 
> - CVE-2025-48384:
>    When reading a config value, Git strips any trailing carriage
>    return and line feed (CRLF). When writing a config entry, values
>    with a trailing CR are not quoted, causing the CR to be lost when
>    the config is later read.  When initializing a submodule, if the
>    submodule path contains a trailing CR, the altered path is read
>    resulting in the submodule being checked out to an incorrect
>    location. If a symlink exists that points the altered path to the
>    submodule hooks directory, and the submodule contains an executable
>    post-checkout hook, the script may be unintentionally executed
>    after checkout.
>    https://www.cve.org/CVERecord?id=CVE-2025-48384
> 
> - CVE-2025-48385:
>    When cloning a repository Git knows to optionally fetch a bundle
>    advertised by the remote server, which allows the server-side to
>    offload parts of the clone to a CDN. The Git client does not
>    perform sufficient validation of the advertised bundles, which
>    allows the remote side to perform protocol injection.
>    This protocol injection can cause the client to write the fetched
>    bundle to a location controlled by the adversary. The fetched
>    content is fully controlled by the server, which can in the worst
>    case lead to arbitrary code execution.
>    https://www.cve.org/CVERecord?id=CVE-2025-48385
> 
> - CVE-2025-48386:
>    The wincred credential helper uses a static buffer (`target`) as a
>    unique key for storing and comparing against internal storage. This
>    credential helper does not properly bounds check the available
>    space remaining in the buffer before appending to it with
>    `wcsncat()`, leading to potential buffer overflows.
>    https://www.cve.org/CVERecord?id=CVE-2025-48386
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
