Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B240E8FDB8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E60760A89;
	Fri, 26 Dec 2025 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGEAaoORM08m; Fri, 26 Dec 2025 20:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D1560B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782148;
	bh=WfdctsNAM77eSTkj6DYzpEIgyB0Eh7kLMXiXFAs24dc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HbIJFh7rzNyVew3R/2S07OTnoYxmk0ElvTlno6TzPPaA8RGVxWe22aRwW94lTmKPn
	 lF5kLslhik58vy7EbLq7Lorg2LYcsT/01feWx48ZoDs6OAWjfocHzvk9MRT8Nz1As5
	 PG6r1SA2wncGZ7PBLS3/gt+maVpDzKZlIAVm3hHOVs9UsWR9L5xfFpxFakSZaOQZ8a
	 zBr7C7j2+cg7DhCn5aeSMUReWZuAFvayZyLf+t2CBTCtrK+ZQAnPWMIbe3eHIaGK0+
	 qEu766GkGTgzHGDfvctSVNlk8r/L61ffAn7vkeOXfGqnYk76eLEIrzPMkmkjSB2zhU
	 +OqZBYIsThuWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D1560B45;
	Fri, 26 Dec 2025 20:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 684A1B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6671840788
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyySCf5gXew2 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63A79407E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A79407E8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63A79407E8
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:49:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 67E7B13F861;
 Fri, 26 Dec 2025 21:49:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:49:01 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:49:01 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
In-Reply-To: <20251222132143.357875-1-buildroot@bubu1.eu>
References: <20251222132143.357875-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <fbf77ad59af69e2fee2d7766c2cbdaaf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766782144;
 bh=vOEC0RH9skgS3GNpT3yxvVqC2RfdUMV69quAVf88bu4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E1f1NpWmrQjwHf6NUm0yIVMK5giV47NZZ999zJNdHv7y4p7XL5OWG9DdnZTHYYJzS
 vPClY3CS8QWJR3L5DWRxTVIWuzST3kJ78uh+LngxW4jQPwvQ5WRFCVqxr4Om+j2tCn
 GgR+KDgcCDGpHkrRBAlVst9RyqAZ2FHSV6eqN+HT2SZuLhnb2GLEGUex3oaFlrWMNm
 U6mNWItQjra71uByHs8lfsG91dVAxxvhqKfgbU1RhTMeVYK0oeiIXZ+mRFjw6ipLyL
 ubak4Gqs4IUG2JyYN/BhQqQvmAVPCnLGAn3AZAeCyN5PNBQduNLLstyYO3kgFmBnp+
 T1nW9DHIKOGOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E1f1NpWm
Subject: Re: [Buildroot] [PATCH] package/python-sdbus: bump to 0.14.2
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

On 22/12/2025 14:21, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
