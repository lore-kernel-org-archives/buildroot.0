Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4B5FCA198
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 22:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC46E815C3;
	Mon,  9 Mar 2026 22:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXe2jV5oP4pN; Mon,  9 Mar 2026 22:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9EF815CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773094056;
	bh=7mP8aiI3mEQllM7E4Paz8k2b6XTB6C564FucW28vYVs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oAyp95+Mjf5KvUKwsraGLjR3PDI36A1Q8W8hgCK99TYHYYTdwOWI7221R2Qc9s0lt
	 sLPhZ4OAgPVXXlx6EPFCAKEKZDAXZ/4LMyBhHqc5CDEcT2bOiuesipVUGJhPwX4gbu
	 7e9UHf1+riLPTMdWAr8go1iYD2uicNbUj7uq5FsIfqKjqVevXjYz9+LqPoDiEO1YDZ
	 r7ZhAQSOhIQW2j+g+hsQw7ZaB1w43S3uz2XWCkSWvDLOtf4Z3XCs+UaPoh2mX8iUVx
	 V9naMDIpQqQJEjXk3T7eRuaZGLhMlniGoiM14vHQ1GTtv2N2DtFwsVhOVIyei5n68d
	 EkoB6biOxXSMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9EF815CF;
	Mon,  9 Mar 2026 22:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9711CB2A
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 22:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88CA661317
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 22:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7pV3FKq_oea for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 22:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9042760837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9042760837
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9042760837
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 22:07:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9657419F576;
 Mon,  9 Mar 2026 23:07:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 23:07:28 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 23:07:28 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
In-Reply-To: <20260308063433.16295-1-fancp2007@gmail.com>
References: <20260308063433.16295-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <e6b98fffc6f46dcd3aa5f3cae52b6700@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773094052;
 bh=3LBRkKpCuxTCuE3T8lSDtfdkQ0yofSrrU/p5qnrrSDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vDMrD32JS6EoREa7nESDMX9fiVr1qOIExpF86wFANdHYfesVS5PWfY07xGy406NKe
 4dCmb0m1py6iTGkjFUpchg8OMlcmc1tBX/9FPOOCo91TLtEq9fK9bJpcRefCGHsdO6
 eFptczS5rF4treYszomYyxEnUmo/EW+rDiQEV8D590wWJ5g273wUPi+DOxp3UOikW6
 iN7g0WXW6hHIIaFwfGd131StGq5eq6DjQEJzuaekOzWv8OM8xUFgRsMiw53r2/nG4Q
 gb+QXeZtNiG0GLHSG0yZV04vJ4KF+oXzXN2fu37pqQD+LO9L4c1cY0WmTB2aQ3aawV
 9L2u4WbefMkgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vDMrD32J
Subject: Re: [Buildroot] [PATCH] configs/cubieboard{1,
 2}: bump Linux to 6.19.6 and U-Boot to 2026.01
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

On 08/03/2026 07:34, Scott Fan wrote:
> This commit will also switch to the Bootlin glibc stable toolchain.
> 
> Switch to Bootlin glibc stable toolchain as requested by the 2024
> Buildroot meeting report:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks. For info, I removed the linux-headers.hash
and changed the comment in linux.hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b95b9ed076e203868a8990a0e6ee44aa4776293a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
