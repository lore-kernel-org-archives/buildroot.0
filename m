Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB14C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FEA5610CB
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FEA5610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1711F40241;
	Thu, 14 Oct 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6QciBKN6Vge; Thu, 14 Oct 2021 21:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FD2401D7;
	Thu, 14 Oct 2021 21:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235DF1BF9B9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E664083AC5
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2hkLcafKa-i for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1527383AC6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E1ECF94EA3; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:58:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a56f9edbca8dd8b19567be6be2b32e44ebb860
X-Git-Newrev: 446d9f510255dda094d2ea89ad4f24a334b0ecc7
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.E1ECF94EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/automake: bump to version 1.16.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=446d9f510255dda094d2ea89ad4f24a334b0ecc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will avoid to set --with-python_{prefix,exec_prefix} to fix
the following build failures with python and libsoc or libgpiod raised
since bump of automake to version 1.16.4 in commit
fe90272b5128987ee7492fff950660e05324838d and
https://git.savannah.gnu.org/cgit/automake.git/commit/?id=ed8daa069a6c8ed34f7856c42402ec46f305e670:

 /bin/mkdir -p '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
 /bin/bash ../../libtool   --mode=install /usr/bin/install -c   gpiod.la '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
libtool: install: /usr/bin/install -c .libs/gpiod.so /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages/gpiod.so

[...]

libgpiod: installs files in /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot//home/buildroot/autobuild/instance-0/output-1

Fixes:
 - http://autobuild.buildroot.org/results/045dc3f737f58d44014a4b717b5a565388e86f63
 - http://autobuild.buildroot.org/results/6e7a129b05e7852a4dc8dd35148664ad09610f28

https://git.savannah.gnu.org/cgit/automake.git/tree/NEWS?h=v1.16.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/automake/automake.hash | 2 +-
 package/automake/automake.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index e8112e0c48..b2e70641db 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  80facc09885a57e6d49d06972c0ae1089c5fa8f4d4c7cfe5baea58e5085f136d  automake-1.16.4.tar.xz
+sha256  f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469  automake-1.16.5.tar.xz
 # License files, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 470a0bd46e..5270e7864d 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.16.4
+AUTOMAKE_VERSION = 1.16.5
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
