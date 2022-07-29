Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99441C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358EB410BC;
	Fri, 29 Jul 2022 11:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358EB410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcgWwHc30Rzj; Fri, 29 Jul 2022 11:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09992409FE;
	Fri, 29 Jul 2022 11:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09992409FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87FD31BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6388240BA0
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6388240BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwzL5Z0N4rQv for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:27:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEE640154
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AEE640154
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:27:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 062DB1BF206;
 Fri, 29 Jul 2022 11:27:56 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:27:56 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220729132756.174271d1@windsurf>
In-Reply-To: <20220729052145.792037-1-aperez@igalia.com>
References: <20220729052145.792037-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659094077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsTwhmGR5RnmU14PjbQnq5JpDO3+bgMZVOxZ1pW5iqE=;
 b=XhIK3MEdOwOQaKRb1eyEJ9Ojl3qBsHFOSgl1KOmYnffVLn8h++dUn/f0Rn1igbtCUJmk7b
 FXcVJTmcamO/o0gjXw+v+wCCRVKB6EHUOJNEVW4rtGCTQ00ax14/mvHeMyMMWIgeoNJCPg
 PB1zHYHck4H71PjzM6sqIaOS2JATiKvsEqe89UAA/4Y2ygW/GjD3B7gDAoT8AqO8W8Dzbb
 QiYqxNJ8Q4uin0vfkGr4r/gAHMJxwgv1NuQQIGaOWwo3D/uC586waB/50y1iYNmmmR0o62
 2PKK2hUt2FBUtun56vjbErIl2wVhS5fiFFCcCTRlDz1d/qaUp9AJHpXI08Pf3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XhIK3MEd
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.36.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 08:21:45 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, including the patch that can be now removed, and
> security patches for CVE-2022-32792, CVE-2022-32816, and CVE-2022-2294.
> 
> Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.36.5.html
> 
> Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2022-0007.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 -------------------
>  package/wpewebkit/wpewebkit.hash              |  9 +--
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 6 insertions(+), 63 deletions(-)
>  delete mode 100644 package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch

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
