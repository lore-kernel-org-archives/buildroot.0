Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1C7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C3F41296;
	Sat, 12 Mar 2022 17:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wP9W1X2CHhi5; Sat, 12 Mar 2022 17:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A29A40926;
	Sat, 12 Mar 2022 17:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBA21BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A011460E58
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sb6wvH2oZYFs for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B89260E5C
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A3FEF82AA4; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e3ff4c21bafb562cf12ffdab93bb40bc5aae395
X-Git-Newrev: 9af9dfa543907c46091c706b0f3a0eb89445ae74
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.A3FEF82AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_conntrack: bump to
 version 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af9dfa543907c46091c706b0f3a0eb89445ae74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...r_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch | 38 ----------------------
 .../libnetfilter_conntrack.hash                    |  4 +--
 .../libnetfilter_conntrack.mk                      |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch b/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
deleted file mode 100644
index 0b373d9261..0000000000
--- a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 93bbd7e56cefc8488a61892b3bf5df63a175d20d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Apr 2020 14:05:15 +0200
-Subject: [PATCH] libnetfilter_conntrack.pc.in: add LIBMNL_LIBS to Libs.Private
-
-Since version 1.0.8 and commit
-c1c0f16c1fedb46547c2e104beeaaeac5933b214, libnetfilter_conntrack depends
-on libmnl so add it to Libs.Private.
-
-Otherwise, applications such as dnsmasq will fail to link on:
-
-/home/buildroot/autobuild/instance-0/output-1/host/bin/arm-linux-gcc -Wl,-elf2flt -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnetfilter_conntrack -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnfnetlink
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
-api.c:(.text+0x34): undefined reference to `mnl_nlmsg_put_header'
-
-Fixes:
- - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: commit e94172f09e4d]
----
- libnetfilter_conntrack.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libnetfilter_conntrack.pc.in b/libnetfilter_conntrack.pc.in
-index 857f993..fbd7132 100644
---- a/libnetfilter_conntrack.pc.in
-+++ b/libnetfilter_conntrack.pc.in
-@@ -12,5 +12,5 @@ Version: @VERSION@
- Requires: libnfnetlink
- Conflicts:
- Libs: -L${libdir} -lnetfilter_conntrack
--Libs.private: @LIBNFNETLINK_LIBS@
-+Libs.private: @LIBNFNETLINK_LIBS@ @LIBMNL_LIBS@
- Cflags: -I${includedir}
--- 
-2.25.1
-
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
index 19520aa3f0..205eecf1f3 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -1,5 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.8.tar.bz2.sha256sum
-sha256  0cd13be008923528687af6c6b860f35392d49251c04ee0648282d36b1faec1cf  libnetfilter_conntrack-1.0.8.tar.bz2
+# From https://www.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.9.tar.bz2.sha256sum
+sha256  67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8  libnetfilter_conntrack-1.0.9.tar.bz2
 
 # Hash for license file:
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 0a5a94be8f..e10bdd02e9 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.8
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.9
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
