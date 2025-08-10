Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E4C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FC9811F1;
	Sun, 10 Aug 2025 20:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8AQje5crU_E; Sun, 10 Aug 2025 20:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4E9811E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4E9811E1;
	Sun, 10 Aug 2025 20:04:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D011D3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFED26102E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOuS0UjIwYcH for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F49361034
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F49361034
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AC5D87166; Sun, 10 Aug 2025 20:04:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 21:58:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e58b052072a072618d7afbf986b87b0eb13bed1d
X-Git-Newrev: 947dbc92a20c5acea7882166cae7893e6ea661e1
X-Patchwork-Hint: ignore
Message-Id: <20250810200449.0AC5D87166@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: update to Bootlin
 toolchains 2025.08-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=947dbc92a20c5acea7882166cae7893e6ea661e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchains have been rebuilt with a recent Buildroot, and are
based on:

- Stable toolchains:
  GCC 14.3
  Binutils 2.43.1
  GDB 15.2
  Linux headers 5.4
  glibc 2.41
  musl 1.2.5
  uclibc-ng 1.0.45

- Bleeding edge toolchains
  GCC 15.1
  Binutils 2.44
  GDB 16.3
  Linux headers 5.15
  glibc 2.41
  musl 1.2.5
  uclibc-ng 1.0.45

The microblaze bleeding-edge toolchains are back, since we integrated
the "atomic issue" fix.

All tests are successful:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1976388296

(note: the test branch had one more commit doing tweaks on the wget
option and re-enabling the backup site for unit tests, which are
needed to avoid intermittent failures of Gitlab CI jobs)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tests/toolchain/test_external_bootlin.py       |   84 +
 .../toolchain-external-bootlin/Config.in.options   | 1614 +++++++++++---------
 .../toolchain-external-bootlin.hash                |  860 ++++++-----
 .../toolchain-external-bootlin.mk                  |  460 +++---
 4 files changed, 1645 insertions(+), 1373 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
