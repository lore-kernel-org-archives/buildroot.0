Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B1DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68F7849D2;
	Fri, 28 Feb 2025 16:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0wUvwWpwExW; Fri, 28 Feb 2025 16:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A32CA849E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A32CA849E2;
	Fri, 28 Feb 2025 16:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E831711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0AB842E0C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PhdtqlTFrSw for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFF341998
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEFF341998
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B1D86FB9; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ef3c9d64f700bb90c61c898021d3a129638fa2c
X-Git-Newrev: 47f70b194e4e29408dd874a0fff61022f4d77c92
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.B9B1D86FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/directfb: remove
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47f70b194e4e29408dd874a0fff61022f4d77c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

directfb.org is dead so since commit
89ab2a5a3f4588891ab1e9e76feb8c3f69402d5c (from 2022), we are
downloading from sources.buildroot.net.

Clearly DirectFB 1.x is no longer maintained. A DirectFB 2.x project
is now at https://github.com/directfb2/, but despite an attempt in
August 2024 [1], it still isn't packaged in Buildroot. Therefore it's
time to drop directfb 1.x, which doesn't prevent in the future from
adding directfb 2.x.

[1] https://lore.kernel.org/buildroot/20240705132544.351613-1-shengwen1997.tw@gmail.com/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |    6 -
 Config.in.legacy                                   |    9 +-
 package/Config.in                                  |    1 -
 .../0001-fix-missing-davinci-voodoo-header.patch   | 1726 --------------------
 package/directfb/0002-imlib2-config.patch          |   36 -
 package/directfb/0003-setregion-lock.patch         |   99 --
 package/directfb/0004-use-gcc-link.patch           |   35 -
 .../directfb/0005-add-missing-idivine-header.patch |   65 -
 .../0006-fix-client-gfx_state-initialisation.patch |   39 -
 ...efine-__NR_futex-on-32bit-architectures-u.patch |   43 -
 package/directfb/Config.in                         |  156 --
 package/directfb/directfb.hash                     |    3 -
 package/directfb/directfb.mk                       |  167 --
 13 files changed, 7 insertions(+), 2378 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
