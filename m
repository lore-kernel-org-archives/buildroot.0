Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C979DCD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C5E403F6;
	Tue,  3 Sep 2024 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO8nT629yLQ2; Tue,  3 Sep 2024 20:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78BD840504
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BD840504;
	Tue,  3 Sep 2024 20:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1DD1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E7D402F6
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2dOf76HokT9 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30A9440198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30A9440198
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D8BE7F8B4; Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:40:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fdd9b3e24b910bdc5fb37daa01c9b0e0f3c5b54d
X-Git-Newrev: d3ad58dce9cafccb22d782e56677e060d5eb5a52
X-Patchwork-Hint: ignore
Message-Id: <20240903204050.1D8BE7F8B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external/toolchain-external-bootlin: bump to 2024.05
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3ad58dce9cafccb22d782e56677e060d5eb5a52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit updates the Bootlin external toolchain package to use the
recently released 2024.05 toolchains.

Notable changes:

- Tarballs are now xz-compressed instead of bz2-compressed

- We have new toolchains: RISC-V 32-bit glibc stable, RISC-V 32-bit
  uClibc, S390 uClibc, and the Sparc V8 is finally updated

All unit tests are passing, except 2 (see below):

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1417551794/builds

The two tests that are not passing are the RISC-V 32-bit musl:

  https://gitlab.com/tpetazzoni/buildroot/-/jobs/7607519955
  https://gitlab.com/tpetazzoni/buildroot/-/jobs/7607519954

This is due to a bug in Busybox, and already existed prior to this
toolchain update.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/toolchain/test_external_bootlin.py       |   81 ++
 .../toolchain-external-bootlin/Config.in.options   | 1519 ++++++++++----------
 .../toolchain-external-bootlin.hash                |  870 +++++------
 .../toolchain-external-bootlin.mk                  |  890 ++++++------
 4 files changed, 1756 insertions(+), 1604 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
