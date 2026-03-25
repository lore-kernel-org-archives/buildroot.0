Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F01A109C05D
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B2660B35;
	Wed, 25 Mar 2026 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd6g2J2U3WWE; Wed, 25 Mar 2026 20:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1899060727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774469507;
	bh=W+xAU4Gp6i7DaoJ8dNKoV0ThIhy3rN03aHMI9yZ9uV4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OLJDdo23+vLB4UuSTk6FFwLAAvsPyISrs7iZJYlwE3s3H2whCLvQiQQeY6eTmkQ7Z
	 3+mvFSlOMZQ2CgknfyaSWd65UIaB7+DnCi/RSlJgdScXuINmy0Kdlz4aa0qnzjC/o/
	 FvEJ3Kj7Xw4i6PpvlNJn0wiHrJQzUWt/OjXbs8Jt1q3hXahRO1vtN+lHVA57GYho8b
	 YCOopGmxABZWyXWSLhrcvxLkX2AR2GnlzxAfnFYAjaEA7rcK7481XCYlptu++rzzNE
	 FfNfOPuj43aog/0AbYYcGwm5rvXtaM5XlN5wLosjkhdcDzjPRNcIVHoGKdlM05pJMg
	 fzxnwx6T491Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1899060727;
	Wed, 25 Mar 2026 20:11:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A07DF353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D1B40B64
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8A2ctm9_etV for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0F9340B61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F9340B61
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0F9340B61
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:11:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 22BEA13F861;
 Wed, 25 Mar 2026 21:11:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Mar 2026 21:11:41 +0100
MIME-Version: 1.0
Date: Wed, 25 Mar 2026 21:11:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260325180122.2974279-1-giulio.benetti@benettiengineering.com>
References: <20260325180122.2974279-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <c348082de7cad65c4352f60f2e0edcd7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774469502;
 bh=aTgKSWBiFKlSv0Wtk5vMHZYgjqJs52OmF16Ae8au00w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ENh+MwR5UcVbpombrpyZbNCwKDJgNThPH9/V3KbC2dutf4p51oqqgNcDD/vjOC2m1
 JXaocGbI1eW/N1uzh38mkU2g67y9U1sGIo+1xoEkBiMFzaPGYRnoesRwhKDCEoJuWk
 Bjw9fvYqAKk1lbT79g/KeYoNcNyTiQFtUiKtLi2p3wllBWlfxkfENlxMouHQIyNIO9
 ybqcG9rc/6LFniG/cAIwbSxNnUiJNj6BUhbbg3Mb3qdlWfGUl48LPK1E3MgRFlAwbX
 GDjAN87FEuCYBCQru6WYU65EhRo7SNYMj+Dowharxuc9MErWZjfT60qJGI9nrjborD
 3OTtustn05CtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ENh+MwR5
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.47
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

On 25/03/2026 19:01, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/changelog.html
> 
> Fixes CVE-2026-1519.
> 
> Fixes bug:
> GL #5708
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5708
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

> ---
> NOTE: GL #5708 link is reported in changelog.html but it's broken

Maybe this is because it is a security issue, and the link will be 
publicly
opened later... Let's see.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
