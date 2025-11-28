Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C25CD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 027CA84854;
	Fri, 28 Nov 2025 20:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NQMnT6AN81r; Fri, 28 Nov 2025 20:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278E084851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278E084851;
	Fri, 28 Nov 2025 20:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E0E708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67C8C40052
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFyiuS4CjZFT for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47AEC4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47AEC4003A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47AEC4003A
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:20:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6EEAF78034E;
 Fri, 28 Nov 2025 21:20:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:20:42 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:20:42 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251124143748.2843324-1-buildroot@bubu1.eu>
References: <20251124143748.2843324-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <3a02a16d4b07d06ee8ef71cc3065539d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361246;
 bh=2S8+CuS+VGp+7xjwCEkTNkQWpEP8QHlzFAuZMI0lDlE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Iqgb8u9OflsAGF2LuF2OaaOQnAgIfk6EOhlDIG9qjpjhogpdzDelpnohJzXnrtsFF
 NHVRzif6gUsaa1AH8/WNim6UvSmw9G9GIBkynDg+lV+o6HiEIyh4jXfInOq4rrj0Vr
 /lXCsEH9O7bsyIMona2F6CHFkxzxX+nnV0amMD4yX7Lnw25zxmBlg0/dMn1nAxYeXg
 JCuadsGwTW9t+W49HaztOrflAUDEgNdU8r1sUb+WJnog4hebk8f1Mh4IScJnUa0Z1n
 Mt+WohobQ2fJynHn+xEKxdgRfNKNCg3sa0uCFvWre0tqyAXcTMzJsTv3uo+24TOfoQ
 /KzKWnS8oqQFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Iqgb8u9O
Subject: Re: [Buildroot] [PATCH] package/python-apscheduler: bump to 3.11.1
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

On 24/11/2025 15:37, Marcus Hoffmann via buildroot wrote:
> Changelog: https://github.com/agronholm/apscheduler/releases/tag/3.11.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
