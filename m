Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B02DC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E147606A7;
	Fri, 28 Aug 2026 11:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vhi52UEderE7; Fri, 28 Aug 2026 10:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787914799;
	bh=Xy66cYSqp2Oa5yll4A12iaPJW7eBaMFyoXtsSWMW7Ho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aLrFtphqGg1gEqSpZgE8+UwPuHQIejusgtQoztLloPoZ8iTi+ENiWBJbLaps1B5mS
	 nuC+GGLOeREIrhUAq6fQiJhwYDcljGBLqI9kNtKzRmji4ysYvWb7cKITljHhPEv21h
	 5MCT978I6rivVD5qXLS3IZlKVQgW/vBqTiCTihc+zizWHmsSsv5rz3lZtylFtoS/so
	 KcdcwzAceeCjUOIc7M6RW+qNJBYge2UDxAyruVYjUVX8eIsIRFA2RlkVDZSKK0qxsZ
	 RiPNYCPHtIsbKi/VIu0QTN5uKTiZVGcF0+uLBnbp+H/Wr5/xxrZumOoKPPnjkgzsNs
	 PduEjKY/1XeiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34191606B0;
	Fri, 28 Aug 2026 10:59:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1918D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE4560708
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88rbPSROQwyV for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 170BA606B0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13266921D4; Fri, 28 Aug 2026 10:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 11:47:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a51521cbe6971df8a6d6a1d7d8d33a2e8d01f926
X-Git-Newrev: e9c540ddd27e21e0156a3ea67e75117c44271dcb
X-Patchwork-Hint: ignore
Message-Id: <20260828105859.13266921D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: update UAPI header
 installation work-around
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9c540ddd27e21e0156a3ea67e75117c44271dcb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

bpftrace often needs very recent kernel headers, more recent than the
runtime version actually needed. We already had a workaround in
libbpf making sure that if the kernel headers are older than 6.1, we
would install the libbpf provided headers instead.

As we are about to update bpftrace to a newer version that uses
BPF_TRACE_KPROBE_SESSION, which was introduced in Linux 6.10, we need
to update this workaround accordingly and ensure that the libbpf
header is installed if the kernel headers are older than 6.10.

This is necessary for the update of bpftrace to 0.26.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbpf/libbpf.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 5a6d574331..0683ec12c1 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -18,14 +18,12 @@ define LIBBPF_BUILD_CMDS
 		-C $(@D)/src
 endef
 
-# bpftrace uses bpf_iter_link_info.task that was added since kernel 6.1
+# bpftrace uses BPF_TRACE_KPROBE_SESSION that was added since kernel 6.10
 # so we need to update some uapi headers in STAGING_DIR if the toolchain
-# is build with linux-headers < 6.1.
+# is build with linux-headers < 6.1.0
 # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
 # by the toolchain.
-# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f0d74c4da1f060d2a66976193712a5e6abd361f5
-# https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1),)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10),)
 LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
 
 define LIBBPF_FIX_STAGING_PC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
