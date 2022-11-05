Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9782FC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 410E040893;
	Sat,  5 Nov 2022 20:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 410E040893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5iKzzWsR4J3; Sat,  5 Nov 2022 20:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A5C4087E;
	Sat,  5 Nov 2022 20:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A5C4087E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26B521BF371
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2F714087E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F714087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CunwSIsEEs9g for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A96864085B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A96864085B
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:03:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B97440005;
 Sat,  5 Nov 2022 20:03:45 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:03:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105210343.4b8409be@windsurf>
In-Reply-To: <20221104161851.645974-1-fontaine.fabrice@gmail.com>
References: <20221104161851.645974-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667678625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1PyYhUsrOrvOODxzDoNB2mrpueNQYEGN3ABa9QVr20=;
 b=lK/7F6PgBJMltj78YWHIU55N8YFMdE/uqo7TTPCnkUuF0FHcbJejBicndsZruj9FXnp0x+
 ciDEbLVFJ34NUN5JtlEaJQ9G1LVBno+HI4/irX5W+qp3PSM4RR+LqdZlUXTgEhmrkthLKH
 5Rr2Tn2uL5XVIknjvNqADuLh6j8pxRCqppDEKbLUHfYgwz8yhnw3OuWqm9CGW1+bDVCePQ
 24WZRaHiTu2miSAreVbECML5gUBbYadws8Zf0sGKf1SrXB1E8J9i/wfwU1y86aZPb7Jyqz
 EXbzp7CpgGAw1CMpScNSw/06ceqH1bkxFWQI6yuPAwLnNBLA76mEQev15OxfLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lK/7F6Pg
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Nov 2022 17:18:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixed a vulnerability related to online certificate revocation checking
> that was caused because the revocation plugin used potentially untrusted
> OCSP URIs and CRL distribution points in certificates. This allowed a
> remote attacker to initiate IKE_SAs and send crafted certificates that
> contain URIs pointing to servers under their control, which could have
> lead to a denial-of-service attack. This vulnerability has been
> registered as CVE-2022-40617.
> 
> Drop patch (already in version)
> 
> https://www.strongswan.org/blog/2022/10/03/strongswan-vulnerability-(cve-2022-40617).html
> https://github.com/strongswan/strongswan/releases/tag/5.9.6
> https://github.com/strongswan/strongswan/releases/tag/5.9.7
> https://github.com/strongswan/strongswan/releases/tag/5.9.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...gswan-plugins-wolfssl-rename-encrypt.patch | 150 ------------------
>  package/strongswan/strongswan.hash            |   6 +-
>  package/strongswan/strongswan.mk              |   2 +-
>  3 files changed, 4 insertions(+), 154 deletions(-)
>  delete mode 100644 package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
