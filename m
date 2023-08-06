Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE1C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF724099C;
	Sun,  6 Aug 2023 12:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EF724099C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLHukJv2NvaY; Sun,  6 Aug 2023 12:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C98C4038C;
	Sun,  6 Aug 2023 12:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C98C4038C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27CEA1BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C06D40985
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C06D40985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jn2nq4BVkKN2 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:54:48 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 957EB409A1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957EB409A1
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E050D35206AC; Sun,  6 Aug 2023 14:54:45 +0200 (CEST)
Date: Sun, 6 Aug 2023 14:54:45 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZM+YFazhq0X2JCwl@waldemar-brodkorb.de>
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691326486; bh=0k6XJoLukUJ2nHG+bfPLQ2qdpjRohLW7OrlRrHiME5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qF1QvA5IZjh3neBOwY9osOMJXIWJn+FAZPuJ7IXrtmCXYQ4FEhgXtNxqw4BO0hN1g
 Bw0p1MtrA8Iog0UNBHPb1RAAMLy1xhbkRl7ghCIcpNJZHnpaFS1CKRn+K8cfN6aZQE
 hg8SFJq5TGJw4G95yI/Rwp3pNR2ToXCyUDvFneu/RSgMpD4xbStJ4ZTSG52bZwPXOY
 oYUdi96kzX6jLGpCSgMVLA3eoqCTeBfCA92bEmnMtUjqZH9t24JpWZAufzNYiY4t2S
 NqyU04N4dGszhEA6E9LXeLH7hRTcLOw2GaYu+pOGDpZBOWQ558XeFJ/vCpAXdRjVqD
 d6jsvi2w8DPvg==
Subject: Re: [Buildroot] [PATCH 1/3] package/elf2flt: refresh patches
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I tested the series and it worked well for following defconfigs:
qemu_m68k_mcf5208_defconfig
qemu_riscv64_nommu_virt_defconfig
qemu_xtensa_lx60_nommu_defconfig

You can add if you like a 
Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar

Thomas Petazzoni wrote,

> Some patches had some fuzz, and patch 0004 was no longer applicable
> using "git am". Patch 0006 is renamed so that it matches the commit
> log title, as generated automatically by git format-patch.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
