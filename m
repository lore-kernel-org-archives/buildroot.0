Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72FE4058F;
	Tue,  1 Feb 2022 22:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwqZe7iQX3Fc; Tue,  1 Feb 2022 22:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB113401DD;
	Tue,  1 Feb 2022 22:06:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A161BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9FBE60C33
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9HSgvHDVtnE for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED79A60B3A
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0F8DC82817; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:53:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f458646bd0b86884cea0a26a0ad5c733477a6634
X-Git-Newrev: 20ddb8369478c311212420e4a2a0cbffe859f8f2
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.0F8DC82817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ddb8369478c311212420e4a2a0cbffe859f8f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests which are enabled since bump to version 2.0.35 in commit
13d4856b916d797c3c771669edd3eb883336766f and
https://github.com/CESNET/netopeer2/commit/466a0b3c268ee319b4f65980404715a2723b4c0a
to avoid the following build failure if cmocka is built before
netopeer2:

In file included from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
                 from /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
                 from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/libyang/libyang.h:18,
                 from /home/buildroot/autobuild/instance-2/output-1/build/netopeer2-2.0.35/tests/test_sub_ntf.c:27:
/home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
   53 | typedef unsigned _Addr uintptr_t;
      |                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0660a4f767d5cdaf07b28a508101b87f0300850f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netopeer2/netopeer2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index c8b6763313..43f22b7e4c 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -11,7 +11,9 @@ NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
 NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
-NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
+NETOPEER2_CONF_OPTS = \
+	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
+	-DENABLE_TESTS=OFF
 
 # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
 # files. This also ensures that concurrent parallel builds will not be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
