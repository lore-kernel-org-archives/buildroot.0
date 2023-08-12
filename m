Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1D7C001DB
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46BC460EB3;
	Sat, 12 Aug 2023 12:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BC460EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZbfgmcx4fyy; Sat, 12 Aug 2023 12:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D91560E70;
	Sat, 12 Aug 2023 12:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D91560E70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4F601BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 917494012F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 917494012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-kKX0qxwvpR for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:36:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C15440018
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C15440018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EEEE60003;
 Sat, 12 Aug 2023 12:36:22 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:36:21 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812143621.6c67dcb3@windsurf>
In-Reply-To: <ZNdwsocEpsgQ7U9J@waldemar-brodkorb.de>
References: <ZNdwsocEpsgQ7U9J@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691843782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbi7ZeQVwOPiZgw+N3bad9c+UOO89Xd0RNvCznK3HpQ=;
 b=keJ1r3pVNuFDOcf4AYUAAnAec5mWAw5MnipRVJWUeiGANcNu+EaRtJ1beJ7TUyjMSvC50G
 Bleqh65Wv430lK9aaLf4HbEQRPqkoQyhIX6UjDg/suybAnM3Nh63ugNdQ7vUSOqRF1wsPg
 jxEA8waZrWxt55X/bkZHD8xJZ1PwoLjjayqFxyJ0elnD/EVBuR7m9hTZoyRbExJCMA+yF9
 +O7TbEJX7RNEnBqq6dPJrkDx41PzjJRkdH3OCeC0jzXkCKVn3OuO2pCxviRRDc+SZePFsN
 ZC5bxa4NpZVybKxETy4UPv991blMGAxgONG/1B68+as3dFusFNRAIF6bQv/zVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=keJ1r3pV
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_111001
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

On Sat, 12 Aug 2023 13:44:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> e2fsprogs package fails to build for the SH4 architecture due to a gcc
> 13.2.0 bug that leads to:
> during RTL pass: sh_treg_combine2
> rw_bitmaps.c: In function read_bitmaps_range_start:
> internal compiler error: Aborted
> 
> Let's add gcc bug to avoid to deal with architectures in packages
> when a gcc bug arises. Let's instead deal directly with gcc
> bug number.
> 
> It's been reported upstream:
> https://gcc.gnu.org/bugzilla//show_bug.cgi?id=111001
> 
> No need to backport as gcc 13.20 was introduced recently in
> buildroot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/Config.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
