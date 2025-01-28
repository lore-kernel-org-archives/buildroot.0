Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D35C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 23:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6922D81E7E;
	Tue, 28 Jan 2025 23:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMnK5nZ2caAv; Tue, 28 Jan 2025 23:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FA7B8113B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA7B8113B;
	Tue, 28 Jan 2025 23:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD1120
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6EED605C2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq3-f3k_xd2C for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 23:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB15A6069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB15A6069F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB15A6069F
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:23:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1E1C72003C1;
 Wed, 29 Jan 2025 00:23:33 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42158])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jan 2025 00:23:33 +0100
MIME-Version: 1.0
Date: Wed, 29 Jan 2025 00:23:33 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250128202249.548819-1-peter@korsgaard.com>
References: <20250128202249.548819-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7cdf5c9ca47793ea3eab73d6a29af5ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738106617;
 bh=yORKK5W4Tatfp/n3UgZg/VngJjiLcjvPO3KVIuiIpkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ALHHxZy0KYefBLwO1j9eVI6cRXa6obmQKqiMIZw6off2Q51i0kGptdKyzxlDrMiPc
 CSaMajN4wF9hgrqNEV6blAnfW+lrvpPUnmUXHyGeJj6YENBUDVt6NZLeeJvl/LkgDW
 lYqOLC2Yamd9ZwPGJyILA+epvz4s2wmihoUCbwUx2Cz3kmHG3/a3TbBUnaNYDLSA/i
 R6YHM+bsdtooH2pk5YbSRJQiqL7/t22nsx0+pKMGghHqkSnvBolSYx2OELPFwi5gzG
 W9T6KgS5YupyOP2redWgg3CeamtrpLA5zbhWFCSZ9LD8SRsY0Ksx4T14m+GQm9kBBa
 C9+jc0N+1ml6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ALHHxZy0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 22.13.1
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

On 28/01/2025 21:22, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> Worker permission bypass via InternalWorker leak in diagnostics
> (CVE-2025-23083) - (high)
> 
> With the aid of the diagnostics_channel utility, an event can be hooked 
> into
> whenever a worker thread is created.  This is not limited only to 
> workers
> but also exposes internal workers, where an instance of them can be 
> fetched,
> and its constructor can be grabbed and reinstated for malicious usage.
> 
> This vulnerability affects Permission Model users (--permission) on 
> Node.js
> v20, v22, and v23.
> 
> GOAWAY HTTP/2 frames cause memory leak outside heap (CVE-2025-23085) - 
> (medium)
> 
> A memory leak could occur when a remote peer abruptly closes the socket
> without sending a GOAWAY notification.  Additionally, if an invalid 
> header
> was detected by nghttp2, causing the connection to be terminated by the
> peer, the same leak was triggered.  This flaw could lead to increased 
> memory
> consumption and potential denial of service under certain conditions.
> 
> This vulnerability affects HTTP/2 Server users on Node.js v18.x, v20.x, 
> v22.x and v23.x.
> 
> For more details, see the announcement:
> https://nodejs.org/en/blog/vulnerability/january-2025-security-releases
> 
> Update the LICENSE hash for a an addition of the (MIT licensed) 
> nlohmann
> JSON library:
> 
> https://github.com/nodejs/node/commit/27bcd103e775e00eb8d03ac37052bbd4ccb6d239
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
