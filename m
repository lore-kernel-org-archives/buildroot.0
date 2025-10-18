Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3FCCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D039360D62;
	Sat, 18 Oct 2025 10:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQJlLjOwbgSA; Sat, 18 Oct 2025 10:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180D560BD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180D560BD3;
	Sat, 18 Oct 2025 10:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EFB1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BC040691
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhZMmixnfkhx for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45D1640D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D1640D5B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45D1640D5B
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:55:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0AE8D19F593;
 Sat, 18 Oct 2025 12:55:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 12:55:18 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 12:55:18 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
In-Reply-To: <20251015112503.2785606-1-buildroot@bubu1.eu>
References: <20251015112503.2785606-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <a1865b05845c375b673994b6b7a0bf45@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760784922;
 bh=/riuzTSttpTWRNtWI3s2IbSGuiVZoo4XzwhH/OvRPlo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KFtEI0HSHFPP2e0a2UIn7P2OpesDDlpBFD2Xoc1Is0dsltec7pO7BcAG1a/Vb8C9u
 YsYiVUXtEXyl0YAr4Pnc2Z9S4qnia6hP7wl8PeluRdZpQ8lYkfQpKL5flUoS2NX1CF
 VzI67VFGF1zCNZ2yrB3oAgiekPWIQbGIZVj6UEz6GHvhlY7G0A7/T1w2eKEmlNWFKF
 n3T1wKUMfPqu48JetRolUW/vk5TrJFdwrn3ekTpMsQT9COIMG6pgYPJvaodPRXrr+j
 myU+lkLmHJ0v8yEWajN5jrVbtMEhQz0Fv60QpEm14WuG6EONkq2sw9P+PXWhpsatYL
 Bh8vkfnUFRevQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KFtEI0HS
Subject: Re: [Buildroot] [PATCH] package/python-sdbus: bump to 0.14.1.post0
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

On 15/10/2025 13:25, Marcus Hoffmann via buildroot wrote:
> Changes: 
> https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
