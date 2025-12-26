Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C2E8FDB4
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D2980956;
	Fri, 26 Dec 2025 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLm9__7RANiz; Fri, 26 Dec 2025 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BD48096A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766778666;
	bh=28ijteVrHpRdzf0r3rKwtv0w5pe6R91X7wpsEvAfKrw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OCqeadyJctsER96nbRUXWoFDEQ4yct7h65ZOfCMNRY9Nr2ep+Po0r0pOZga98CVcQ
	 fRA4eBUPapMTD6kXGIkTOOgtb9UBSUhGm3DPcVdJ8253fg+GrG0dh/8bsHQPXz2yB+
	 KL94YKmAVND5lfqZwpUiGkEofNUngMQrbMR4Z+u7ZFpdk5vzlzs+c2gZpf4g7GIuP2
	 ZQPbje1ER0jYynUiz5zj4hjLu/4pzMBtRgoLydQH2MB+CIoMlCDnGBqO9gyspzAp1X
	 VsdAxypvUTzy/pOR/BuhL/5o4q9ymnfVPQ1+FiboSkaAftM6IFxIffMzubZCZ04P4X
	 BSmCN7zzyP5zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BD48096A;
	Fri, 26 Dec 2025 19:51:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1461CEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE9E9400B0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS_fPTgt8GaM for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 19:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BDD5400AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BDD5400AD
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28B318229B; Fri, 26 Dec 2025 19:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 20:47:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74e84b5cdebb94ef0b8ec9d42125fb257449326f
X-Git-Newrev: a62bdee61253e9556e746c479eb2c7f16452d830
X-Patchwork-Hint: ignore
Message-Id: <20251226195103.28B318229B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: add host-vim as a
 dependency, for xxd
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

commit: https://git.buildroot.net/buildroot/commit/?id=a62bdee61253e9556e746c479eb2c7f16452d830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of bpftrace to version 0.24.2 in Buildroot commit
97e2f63bdf4cc992787c570b17b099c41c5535d2, the build of bpftrace fails
with:

CMake Error at cmake/Embed.cmake:3 (find_program):
  Could not find XXD using the following names: xxd
Call Stack (most recent call first):
  src/stdlib/CMakeLists.txt:1 (include)

This is due to upstream commit
df21d917d9cced77ebde1202c1b3508a169f46a0, which was merged in 0.24.0.

There are no autobuilder failures for this issue at this point, but
the following defconfig exhibits the issue (of course on a host where
xxd is not installed system-wide):

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_BPFTRACE=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftrace/bpftrace.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 4d7033eb9a..7b1b41781a 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -15,6 +15,7 @@ BPFTRACE_DEPENDENCIES = \
 	elfutils \
 	host-bison \
 	host-flex \
+	host-vim \
 	libbpf \
 	llvm \
 	xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
