Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F5EC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A194C417A8;
	Thu, 28 Dec 2023 21:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A194C417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVtus6XntuFd; Thu, 28 Dec 2023 21:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A584179D;
	Thu, 28 Dec 2023 21:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A584179D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51D901BF966
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2706640120
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2706640120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGFONjl2fmUc for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 21:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 179B94014B
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 21:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179B94014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 071AD836E4; Thu, 28 Dec 2023 21:03:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 21:57:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eab17d763c6ca1bf74749e3a793fd044b5e6d457
X-Git-Newrev: 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
X-Patchwork-Hint: ignore
Message-Id: <20231228210313.071AD836E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: update to
 2023.11-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New toolchains have been released, with the following changes:

- The bleeding-edge toolchains are based on gcc 13.2, binutils 2.41,
  gdb 14.1, kernel headers 5.10, glibc 2.38, musl 1.2.4 or uclibc-ng
  1.0.45.

- The stable toolchains are based on gcc 12.3, binutils 2.40, gdb
  13.2, kernel headers 4.14, glibc 2.38, musl 1.2.4 or uclibc-ng
  1.0.45.

- The glibc version is no longer affected by CVE-2023-4911

- The gdb build has been fixed to no longer rely on uninstalled
  libbfd.so and libopcodes.so libraries

- The zlib library, which was incorrectly present in the toolchain
  sysroot, is gone, fixing various build failures encountered with
  2023.08 toolchains.

- There are now toolchains for m68k 68xxx based on uclibc and musl in
  addition to glibc, which was already supported

The careful reviewer will notice that a number of

    depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14

are being added to the toolchains that use gcc 13.x, as per
a0d2a5cfec0ade7cb577cbff25aac289e746e61b
("support/scripts/gen-bootlin-toolchains: generate
BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard").

All 214 test cases were successfully run:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1120323562

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/toolchain/test_external_bootlin.py       |  60 ++
 .../toolchain-external-bootlin/Config.in.options   | 618 ++++++++++-----
 .../toolchain-external-bootlin.hash                | 836 +++++++++++----------
 .../toolchain-external-bootlin.mk                  | 438 ++++++-----
 4 files changed, 1124 insertions(+), 828 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
