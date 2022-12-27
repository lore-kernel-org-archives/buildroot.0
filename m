Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F948C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C122540260;
	Tue, 27 Dec 2022 20:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C122540260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd-fhpBvAILk; Tue, 27 Dec 2022 20:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 151C94016B;
	Tue, 27 Dec 2022 20:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151C94016B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED45A1BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 504974016B
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504974016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aR9GFRC9gssM for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:27:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0121F40165
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0121F40165
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:27:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E516BC0004;
 Tue, 27 Dec 2022 20:27:33 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:27:33 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221227212733.557456fd@windsurf>
In-Reply-To: <20221224125720.2905231-1-bernd.kuhls@t-online.de>
References: <20221224125720.2905231-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672172854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44++vM1sUOCrIBDbiU2SCFwwl+eKcVkkk8ZyhRUGrQk=;
 b=Wnan0G1hQBsI3M93pzXUl0bgTS71dFqjSukTieTnsLp9pfAsHzCuJFAiBiN9rwwmLAohJs
 qAKdfGdsptAF/typ+s8CrlgdWFd8zas2SM6M5De2zIhGkNQE/a1PF3MrIc2YbsF8ZXvpNa
 uyEVcl7fT4Sw3wxg+qSjXP/mIsk52slXg0yerdJeL2/PZsXtd+0I6C7uH3/ei7S4N5pyoZ
 5QgDTz+yKYZSdySljaSYIwJlrTIBjRXxVf7P+ckqnfaSK37K+nqBILoWHAu8uSD5VDIQ5r
 OgZ3bp0IHNpZfGdGYfiSQAhZgX4A08FaUa2pNTkP29PCaArrGspr+68YqVA2QA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wnan0G1h
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi: bump version to
 19.5-Matrix
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

On Sat, 24 Dec 2022 13:57:19 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed two upstream patches included in this version.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-jsonschemabuilder.mk                 |  2 +-
>  .../kodi-texturepacker/kodi-texturepacker.mk  |  2 +-
>  ...char-as-formatting-of-non-void-point.patch | 54 -------------------
>  ...t-as-char-as-formatting-of-non-void-.patch | 33 ------------
>  package/kodi/kodi.hash                        |  2 +-
>  package/kodi/kodi.mk                          |  2 +-
>  6 files changed, 4 insertions(+), 91 deletions(-)
>  delete mode 100644 package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
>  delete mode 100644 package/kodi/0006-WinSystemX11-cast-as-char-as-formatting-of-non-void-.patch

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
