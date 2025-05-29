Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E6C5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3AEA40B80;
	Thu, 29 May 2025 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bB2eJJXP22mm; Thu, 29 May 2025 22:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC8AF4088C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC8AF4088C;
	Thu, 29 May 2025 22:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22DB71514
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1459640675
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-qhB1T6RJS1 for <buildroot@buildroot.org>;
 Thu, 29 May 2025 22:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5129C403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5129C403FE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5129C403FE
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:21:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4223C13F879;
 Fri, 30 May 2025 00:21:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 30 May 2025 00:21:00 +0200
MIME-Version: 1.0
Date: Fri, 30 May 2025 00:21:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250529160059.3657634-1-james.hilliard1@gmail.com>
References: <20250529160059.3657634-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <10de85ac7360f0a15729e3849ab59440@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748557261;
 bh=aKErDT9+WUjoUU8GZDs+lt14tuoSHOAUHK/BPS3OLkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o5bOIqgfgV6RRPrE8FV/Hk0H3L/822VWZdNGhzsef/o4qIQ8naayNDJ1+05B4ZGFV
 z9XhX/hIYfCbKICZTKbtng+SN/llTS5SO9MMdBVgUPvnp1OKyJ4r7ueDH+FP1I2IkH
 qUYtBc95Xhok24F6Lu6TkVTEbS49/vsgovNZOKfTK/Tu8kK7zkear7hsVqaZ7L/gj5
 b7bKmSBYb/GMDzOSNf/6mn3TUXmbctW+arLDEUenGkHDSusyW4CNTSBCD8DYnpkO/B
 H0fG5Gyh1SD6Gn+Cthc2qpwj8GSTIV1S5CE+VJCIDU5ORw2CfeYxnEL7K2nInWq8OZ
 uXbOZ+08ehqXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o5bOIqgf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.0
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

On 29/05/2025 18:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
