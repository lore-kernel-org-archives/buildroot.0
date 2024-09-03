Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73FDCE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9802A84966;
	Fri,  6 Sep 2024 20:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Enp7CPGnKboo; Fri,  6 Sep 2024 20:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDF284984
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDF284984;
	Fri,  6 Sep 2024 20:05:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56CFB1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4737B40C2B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw2EYiDy0cqD for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DD040B40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58DD040B40
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8F4F86587; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdd9b3e24b910bdc5fb37daa01c9b0e0f3c5b54d
X-Git-Newrev: d3ad58dce9cafccb22d782e56677e060d5eb5a52
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.E8F4F86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
