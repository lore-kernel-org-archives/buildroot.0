Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811CCE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E188607AA;
	Thu,  2 Jan 2025 18:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XugEv4J8hkE; Thu,  2 Jan 2025 18:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6496079E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D6496079E;
	Thu,  2 Jan 2025 18:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 751C7E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62C41403B4
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4yLHUAZLymJ for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D8DD4039A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8DD4039A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8DD4039A
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:50:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5356419F72F;
 Thu,  2 Jan 2025 19:50:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40156])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 19:50:41 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 19:50:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
References: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <18cc839baa3dbb620a1a6c667c4065a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735843842;
 bh=EUN3dM4mpOvuh9jJoOXUsIFkL7uJorKEV5Ll0ltu0pc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OLwS5eU2xkMPy7DfXn1VTNSM6IqD2ebWgqNPEYfkXM6hOxC2+4tDaNej19LpPjf7w
 X9u7OS4Zl4h6TOI+bGNL04qWtCVYv//e3coe9BiLguOw/y9d+T4OSy6NvE30QX3/gI
 BkKe1uA9Q7eAx/Uw/qPS4xVy6pGcKHClYAPwqEJDaHAuJoGB0UZjrQ6W+ATNw0AXMU
 G03voTzEp/sa4SpKsS9BKlwkApnM+ibRUrzsAZbHUBFgro9x350G5e7eBUGag0bu3K
 4n4IU0C6Qcu6ivFKbLjOv0QZqzuNMCUrFquxEoNRXYVE2bbtMi9DlTW3wPCilQ5QaD
 tx6wrRhfH6aCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OLwS5eU2
Subject: Re: [Buildroot] [PATCH 1/2] package/c-icap: memcached code needs
 <crypt.h>
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

On 01/01/2025 23:37, Thomas Petazzoni via buildroot wrote:
> The memcached code of c-icap needs <crypt.h>, which is no longer
> provided by glibc since glibc 2.39. So add some logic to add a
> dependency on libxcrypt when needed.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/63b04f86bb8794b79d206659a883acef96dfebf0/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
