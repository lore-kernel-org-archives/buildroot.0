Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA80C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D71240905;
	Tue, 27 Dec 2022 20:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D71240905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8BMqQUt3l-R; Tue, 27 Dec 2022 20:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286DD408F3;
	Tue, 27 Dec 2022 20:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286DD408F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4398A1BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2841560B35
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2841560B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuSOQSsoV-Py for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB0D560B8C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB0D560B8C
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:50:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 017CB100005;
 Tue, 27 Dec 2022 20:50:27 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:50:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227215027.2c9874c0@windsurf>
In-Reply-To: <20221223220100.58811-1-fontaine.fabrice@gmail.com>
References: <20221223220100.58811-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672174228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYdDZX/3MDbG15sfVRonlQkwATZu1Ueeu2zMUEF2QOY=;
 b=C7NTgmw/gsyr1rPxKArHUjFSKxa5JfgDUiD12l92SElosqz7o1dYHbHKSVleykBMdJiglu
 CAJ3NyfBJk6wCXNrY/SL41+UzFkJm26lcPmtejPLu14eSE9rZYCxiuIcSSNglYzUCtibwo
 IVa57D3rkkognlbfkRIcA5tM/SbOBGoWdF+rtYqirZGxBfLQCFc1WLZOYgBlk80dL67zSc
 7mF02SHE4CF1Ky6n3jlhOE6vWfjfsiWMBLWWZDABsY1A6QYIMJve9VUNhiwjeh94KSGC2W
 xNmcVjjZ+BtjNEjfeuloW4lIbr3Mu0q7M7DV+tPrE5F/DGKOfYLa9DNkouRMaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C7NTgmw/
Subject: Re: [Buildroot] [PATCH 1/1] package/orc: bump to version 0.4.33
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

On Fri, 23 Dec 2022 23:01:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.33/RELEASE
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...powerpc.c-fix-build-with-kernel-4.11.patch | 70 -------------------
>  package/orc/orc.hash                          |  4 +-
>  package/orc/orc.mk                            |  2 +-
>  3 files changed, 3 insertions(+), 73 deletions(-)
>  delete mode 100644 package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch

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
