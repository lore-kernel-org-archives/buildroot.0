Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6983BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2638383E12;
	Mon, 30 May 2022 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lF-bHJ70lmWa; Mon, 30 May 2022 20:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B30E83E08;
	Mon, 30 May 2022 20:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005461BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3CB183E0B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDSYV2aFTx3X for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:25:50 +0000 (UTC)
X-Greylist: delayed 01:06:49 by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF12583E04
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:25:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47E2E100004;
 Mon, 30 May 2022 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653942346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgtsc/BPxAdcfEAl/mHLCBhwg2iEX/UZSlflP98Kpnk=;
 b=JyXrtMj4IHHjbS2hO5I6IveWGknMTpc+0GmyaNhJZKzwQQqAaM62OJsLdQZqhUb5UjxYDx
 CEfB/+0tblSueiLa8v00IJuqjfRwOGZ8DMFH8lGHLD9eCg0Z7BYSGhR27J21oBxZOKjXCo
 8R2bm+m32w96sQElW46s1Rhfvidu32bmjEha5pAScImLBme9aG18V7r3kDDxqiSSYIU825
 ph9qhoKNrIMcMdYR+T4god4SwMbkzsrb6xuzhKg/ICSAELbNrai72hLjgvaAURK2PPLsjf
 ewN4q8tqoLDMKfmxKZvQbGouiDybz0lt/bI7H7dznQeCdhLCHxE7B6GATFSDIQ==
Date: Mon, 30 May 2022 22:25:45 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220530222545.4c1262e3@windsurf>
In-Reply-To: <20220522184741.2309805-1-bernd.kuhls@t-online.de>
References: <20220522184741.2309805-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/xmrig: enable for avmv7a
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

On Sun, 22 May 2022 20:47:41 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Available since 2017:
> https://github.com/xmrig/xmrig/commit/aa4f8b6fa78eb8331b5927ba5315b926ac75ce9c
> 
> We noticed it since its addition to the readme:
> https://github.com/xmrig/xmrig/commit/97869f3347a621d9dbf20210289ce10c68a5bd34
> 
> Added patch to fix build with gcc-4.8.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build-tested using this defconfig:

Applied to next, thanks. I have also done a follow-up commit to
introduce BR2_PACKAGE_XMRIG_ARCH_SUPPORTS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
