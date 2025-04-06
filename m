Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A663C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 19:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463088179D;
	Sun,  6 Apr 2025 19:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrmQa7GEF6Tc; Sun,  6 Apr 2025 19:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CBE819D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CBE819D5;
	Sun,  6 Apr 2025 19:37:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD9EDA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8197C40747
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cf9I3weFRrFR for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 19:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA9FC405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA9FC405AB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA9FC405AB
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:37:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0766F13F86A;
 Sun,  6 Apr 2025 21:37:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Apr 2025 21:37:44 +0200
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 21:37:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250403194021.823332-1-vfazio@xes-inc.com>
References: <20250403194021.823332-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <1d0671af1eea38a2d1dd2329e3dd2a4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743968268;
 bh=DvqMms22qpYwa9Wc+YYZ1EP1Xgi4bA2BHVl8zA6Y+2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FYn7fLIPzuJtBwn0n5yLNjObDCLn8AXwA/ldDL0lL4mqq2DAjV7H5RiwFy52xSIbX
 BVUMpPsohEkJUlENg59JGHzYJ11OpF3cDWv8hG6sqrvodQQbMSjqOAJH0G67+Ts5Ph
 hnPmzDy5/6CV18I/yR4gBFZ064L2uS8pTBOhJFb9RBFTaQJ4SyPVCKc9ZVgKGplLA6
 p6zssoBESf6hxTEtPB/hsG0gEPk2DS8fZ62Q3tlRmxrKsjzQ8co+gR153JM/luk+N4
 OvRNc/wb0/85+bTrRy4hW5s2pNfhB2KwXMrU8v2X9+jiBwBLxf8rDuLuKCoGqMVUeB
 +foA089oyIUNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FYn7fLIP
Subject: Re: [Buildroot] [PATCH] package/python3: backport upstream fix for
 mimalloc on armeb
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

On 03/04/2025 21:40, Vincent Fazio wrote:
> Python3 uses mimalloc by default, however, mimalloc did not compile for
> big-endian ARM and generated the wrong instructions for ARMv7+ targets.
> 
> These issues have been fixed upstream in both mimalloc and CPython.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/26b752738022e8b46e810a08e28d687120e5c4e3/
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
