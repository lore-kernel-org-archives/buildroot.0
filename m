Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74270CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4422342F1A;
	Sat, 30 May 2026 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3V_yN4296YQ; Sat, 30 May 2026 16:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2210042F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158314;
	bh=2+aPA5cQQdApc6wkICeH1RRwKBNSzkNTJXCBXB73bZA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ca6JV+g4AcsKOrai+K1OSH97ETZsMWyw2fFr4sVv5cHiY1PQSBGBRdtEHGZTxOLHR
	 Bw2c1SS0yq8ZXo3HFrh0o9JvzAK3LQWsdZ3mIWRDdFNjvnTELdeyiVGViizqZeAXCu
	 FArYtU6yteq7MUpi1SP6QkWsA03bqnWcD42HFVzZG5jQvQczdqNirNRzIAPKjhVmJ+
	 1VWRHeom7P18yRKZ3vloxuqS2C+5rTHKczTmRZZU9yUXppxG5770UEOQdIC9+56hzM
	 TIKDYGtqwL2wWAgODflitoQVrSis+zPSuimNB+kpZHw8SpXjkcc2AkBPz6rDM7sUOq
	 JK/fRte+72P0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2210042F28;
	Sat, 30 May 2026 16:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74A1B12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2BB06F579
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4sm35reVOOA for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E9586F5B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E9586F5B8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 029478752D; Sat, 30 May 2026 16:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 18:01:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7716db8a1254b15f06f4c17e27faa89d3d30a2d6
X-Git-Newrev: f07fb2bcd2ece6b7a85763858a55c2bdf7d1e6de
X-Patchwork-Hint: ignore
Message-Id: <20260530162456.029478752D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: fix build with
 per-package directories
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f07fb2bcd2ece6b7a85763858a55c2bdf7d1e6de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83 in 2021.08-rc1
added the libbpf package which contains the usage of the
'install_uapi_headers' make target to update toolchain headers older
than kernel version 5.9.  This does not work with per-package
directories.

Building this defconfig that includes all packages depending on libbpf:

  BR2_x86_64=y
  BR2_x86_rocketlake=y
  BR2_KERNEL_HEADERS_VERSION=y
  BR2_DEFAULT_KERNEL_VERSION="5.8.18"
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_PACKAGE_BPFTRACE=y
  BR2_PACKAGE_DPDK=y
  BR2_PACKAGE_IPROUTE2=y
  BR2_PACKAGE_HOST_PAHOLE=y

on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0
is broken:

output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
 function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
 bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
 const bpftrace::BpfProgram&, std::optional<int>)':
output/build/bpftrace-0.24.2/src/attached_probe.cpp:1435:30: error:
 aggregate 'bpf_iter_link_info linfo' has incomplete type and cannot be
 defined
 1435 |     union bpf_iter_link_info linfo;

libbpf overwrites kernel header files installed in $STAGING_DIR when
they are too old by adding 'install_uapi_headers' as make target. In
the case of per-package directories these header files are stored only
in output/per-package/libbpf/.

When output/per-package/bpftrace/ is populated, the content of
output/per-package/ from other packages overwrites the header files
installed by libbpf because the list of rsync'ed packages is sorted
alphabetically:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/package/pkg-generic.mk#L796

To prevent this problem let libbpf install the updated kernel headers in
a new directory.

Other packages need to find this directory. This mostly happens through
pkg-config, but bpftrace doesn't use that:
https://github.com/bpftrace/bpftrace/blob/v0.25.1/cmake/FindLibBpf.cmake#L9
Therefore, use a configure option in bpftrace to set the correct path.

Please note that libbpf will add '/linux' to the path provided in
$UAPIDIR:
https://github.com/libbpf/libbpf/blob/v1.7.0/src/Makefile#L169
so the headers end up in the previously non-existing directory
$(STAGING_DIR)/usr/include/bpf/linux/:

$ find output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/ -iname bpf.h -exec ls -lao {} \;
-rw-r--r-- 1 bernd 26434 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/bpf.h
-rw-r--r-- 1 bernd 283012 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
-rw-r--r-- 12 bernd 160166 25. Apr 13:08 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h

bpf.h with 283012 bytes is the update-to-date version needed for bpftrace:

$ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
union bpf_iter_link_info {
$

$ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h
$

By adding '-I$(STAGING_DIR)/usr/include/bpf' to the CXXFLAGS of bpftrace
its include finds the correct header:
https://github.com/bpftrace/bpftrace/blob/v0.25.1/src/bpfprogram.cpp#L3

  #include <linux/bpf.h>

The dpdk package uses pkg-config` to detect libbpf and will use the updated
.pc file:
https://github.com/DPDK/dpdk/blob/v25.11/drivers/net/tap/bpf/meson.build#L7

The iproute2 package is not affected by the problem because it contains
"matching sanitized kernel headers":
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/README?h=v6.17.0#n44

As a host package pahole is also not affected.

Fixes:
https://autobuild.buildroot.net/results/d8b/d8b416e40bf7bd019cd93e6f2d42c98fc12d4160/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/bpftrace/bpftrace.mk | 1 +
 package/libbpf/libbpf.mk     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 35c8dec29c..f530d4861b 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -28,6 +28,7 @@ endif
 BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
 	-DENABLE_MAN:BOOL=OFF
 
 $(eval $(cmake-package))
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 3a728867d8..a4bd270cbd 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -25,7 +25,12 @@ endef
 # toolchain.
 # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
-LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
+LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
+
+define LIBBPF_FIX_STAGING_PC
+	$(SED) 's/-I$${includedir}/-I$${includedir}\/bpf -I$${includedir}/' $(STAGING_DIR)/usr/lib/pkgconfig/libbpf.pc
+endef
+LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
 
 define LIBBPF_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
