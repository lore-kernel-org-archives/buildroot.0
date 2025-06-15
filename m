Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0368C7115A
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711E36069D;
	Sun, 15 Jun 2025 21:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siKNPCMP7aMW; Sun, 15 Jun 2025 21:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C379760724
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C379760724;
	Sun, 15 Jun 2025 21:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 872091A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77BE04049A
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYiurzF_mV2w for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 21:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34FE740480
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34FE740480
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34FE740480
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7BBB6780331;
 Sun, 15 Jun 2025 23:06:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 23:06:17 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 23:06:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250610060322.5249-1-heiko.thiery@gmail.com>
References: <20250610060322.5249-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dcdc0b85f3f413a353a4f59eae841def@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750021579;
 bh=tXMYt0Et1RR3J5QH7N352KgIMKhbWUjTTsT9ovlchz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MCNx7QCFwvioYYyD4jirfnciavVq2rPz9glmgJqcwtfZ8YdG+lkbsClPXNGpVjw+6
 5BqfMXpSGHlUFslNxcq6/oAIAMC2zm+upIDo/7Ucc9q9bYnM9oN3DcenvS5rZACjUX
 BR1ZpKOxlwvSzAXqh5t7zeABb6EFO+wc9RZboUHB1K8cKObeiLkPCVwkgQ/G3ySJdK
 WN6BEXZcj2FUVIPrCdBTPKXyh9vL68bIRnv2NpMewHs8caBTCHppFkwGPJDYU+IYVC
 XAEga8FMOrbrnsoKSIC+MqeJwfTJpI+PMQgFpnUfWgPHZzf+aEkGpDgwetVUzXAnVM
 lfuGmEv9SVLFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MCNx7QCF
Subject: Re: [Buildroot] [PATCH] package/python-yamllint: bump version to
 1.37.1
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

On 10/06/2025 08:03, Heiko Thiery wrote:
> Upstream changelog:
> https://github.com/adrienverge/yamllint/blob/master/CHANGELOG.rst#1371-2025-05-04
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
