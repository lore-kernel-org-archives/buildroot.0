Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92140C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC8360B49;
	Sun, 11 Dec 2022 17:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC8360B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SztLDykLjzcH; Sun, 11 Dec 2022 17:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B3E3607F4;
	Sun, 11 Dec 2022 17:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B3E3607F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E8691BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2849A607F4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2849A607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTtMsySFJjeq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:15:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFF7607A3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAFF7607A3
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:15:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 147B5240002;
 Sun, 11 Dec 2022 17:15:34 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:15:34 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221211181534.178f8318@windsurf>
In-Reply-To: <20221205183504.2699092-1-bernd.kuhls@t-online.de>
References: <20221205183504.2699092-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07BLdkcrjqbbOyKQ16JKDgQ5Uq5RtSHnFJGJjK9rEQ0=;
 b=HcvE7S9h6/Sa9NN3efTAzq5IZRvt/tEHX+LYrvdOkUCPTWqnmjrdtcBY3muz9MTDIlcENz
 Mnh9OKRh9+xiDLeqYAcD72UvL7SuPya7OOhXzZhZHgX+0y9JvVVtAwR/CCRO/YDIrCFSUh
 vcPikbWlX7Wr1i+WPqUirUmthoHSLl6nX8NuhO/skXT/j4pKrjZ9sn/Q8+1RVjco7Oj2Xp
 fWN0FiEmV9jo4MMwHf+BFJyHxYLWfv3j/JBZuqOpIR7QbhvPTpRkvRKuSvzXu7tMZXxBsQ
 ZPmUYgRQbvdRXUbfqEhedzNj5Hhb3QGiSVYev8AmmCT0sjtO5nlagB247wLSXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HcvE7S9h
Subject: Re: [Buildroot] [PATCH v3 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.0
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Dec 2022 19:35:04 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed xmvc support due to upstream removal:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=8cc766d8f7eac26b7c029a2fac1bdfdba4776c29
> 
> Removed comment concerning gallium-xlib due to upstream removal:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=5bed3d4ad659c30cb0ef4b40172f1aab877ccc98
> 
> Rebased patch 0004 due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/util/macros.h?h=22.3&id=c0b891ecca2b92c9ef2945440c77f45345df3290
> 
> Please note that patch 0004 can be removed when buildroot toolchains are
> updated to uClibc 1.0.42:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=v1.0.42&id=03fbd941e943976bb92cb392882c2ff7ec218704
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: rebased for master branch after -next merge

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
