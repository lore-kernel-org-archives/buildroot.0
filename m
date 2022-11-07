Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4E0C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF62C408F9;
	Mon,  7 Nov 2022 22:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF62C408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bhz5ddoDzAr4; Mon,  7 Nov 2022 22:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FAC40384;
	Mon,  7 Nov 2022 22:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FAC40384
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6371BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12DDB60BE7
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12DDB60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nq0xNqiLxjfm for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:16:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23AB60BBE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E23AB60BBE
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:16:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B69B0C0005;
 Mon,  7 Nov 2022 22:16:15 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:16:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107231614.1f23c3e9@windsurf>
In-Reply-To: <20221106154831.293218-1-fontaine.fabrice@gmail.com>
References: <20221106154831.293218-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3eWbV/u6wVqJTKMGC/oALOOwqqjY0VpOJ7NOJPgGDw=;
 b=CiGLs3ZKEGjkAFsIjKXpLw1MKpaQXcIukTVWTiDxBUq/pzMDnujDQ/K5bvVy3CdqhdH44d
 zlAVjl7iHHJdTQPgoQCLhsnJ6gqsJy2wJs/XTx5HMd+bOfepsF8Xu2BPsoUzasXPbg8Q+w
 RvWVB7maDUZ2ec8BN4GHgkNlaJxrHBFEokFkbnNNmaRxgWhP+0DuE3lkwlKGocLot0oq80
 WVEFTl5/FgE6DHFsA/AlkgKydnTy7/99XCcDnOF+0RzvFPgueU7b8qOjnJqVJboig51uVe
 WZPgUO8f8+PReRl9H3DlJfHVzkpdRp0ZSd4AdTeU8MxowhL3sY9xcMeiPyA+5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CiGLs3ZK
Subject: Re: [Buildroot] [PATCH 1/1] package/s6-linux-init: bump to version
 1.0.8.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 16:48:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure raised since bump of
> skalibs to version 2.12.0.1 in commit
> 0f7bfc80814e90918b9527cab4cbf6afedd22195 thanks to
> https://github.com/skarnet/s6-linux-init/commit/6696cee3bd309f61fc6c945ef747262a845e9267
> 
> In file included from src/shutdown/hpr_shutdown.c:8:
> src/shutdown/hpr.h:20:40: error: unknown type name 'tain_t'; did you mean 'tain'?
>    20 | extern int hpr_shutdown (unsigned int, tain_t const *, unsigned int) ;
>       |                                        ^~~~~~
>       |                                        tain
> 
> Update hash of COPYING (update in year with
> https://github.com/skarnet/s6-linux-init/commit/42a91a98b780759257862642c764c2102237fea6)
> 
> https://github.com/skarnet/s6-linux-init/blob/v1.0.8.0/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4382beeb0f94d583ba605c70a47f34b45c76e311
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/s6-linux-init/s6-linux-init.hash | 4 ++--
>  package/s6-linux-init/s6-linux-init.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
