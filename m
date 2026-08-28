Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D93C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2109081170;
	Fri, 28 Aug 2026 14:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NvZdD_PXftc; Fri, 28 Aug 2026 14:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927990;
	bh=566diuVA8AB5x8iWaA3YZX9WZbJ+OGQFUArowk+pOIQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EMyB0ytgPJJr9kL8L28r3QvTNTxYSWIi3TwYAsV3ACi4E7RoqHu8xw9E8bFg/yXfe
	 muYh6q2cWKhAR+6E/WHklzMNk1olTIvVDSY2V+pbpEM0QvD6q26fDqhPZ/s3mi95br
	 z8x5AArTiAa0yGewPCNmN53TLctyY8YApWHSVgSOi9vl2kJ+DJpDUUo7kh+tvOI2xX
	 3gYN2HaUcyQb3BIjDUdT/N/xLk0yLAYEGcPSJimwmSmzrni1+8jWsDW6AaXiZufbQW
	 Zb25wBbEQV2F+aJtZTqu0bCL3uVg41Ri1xxybjlsaZ2WxaSZj5B8CM2eLkpoTNcPRN
	 Phe0/a/Ytz9Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBC481172;
	Fri, 28 Aug 2026 14:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1CB478B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED336084E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqCo70G1PUIr for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A93F16084A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F600921FA; Fri, 28 Aug 2026 14:38:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 16:35:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4013d1965ef6236305e70050daaddffaeb23aa09
X-Git-Newrev: b555d3a79ba758805e2fa2f512455b2cd6e1338f
X-Patchwork-Hint: ignore
Message-Id: <20260828143850.8F600921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc-bare-metal:
 add patch to checkpackageignore
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b555d3a79ba758805e2fa2f512455b2cd6e1338f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The commit [1] decoupled GCC from gcc-bare-metal but by copying
the patches the patch [2] wasn't ignored in gcc-bare-metal.

[1] 367133ac70 package/gcc-bare-metal: decouple from gcc package
[2] 0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index b2642b6e23..42973a5311 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -420,6 +420,7 @@ package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc-bare-metal/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch lib_patch.Upstream
 package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
