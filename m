Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AE606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LHx+bU93
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49ED66064E;
	Sat, 14 Nov 2026 21:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwxBnblYo3IN; Sat, 14 Nov 2026 21:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F013660653
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794691362;
	b=CCBQ48e84MOABqkq1Snl7FFWd2FhmBLLHm0XQNjQ0StTi3y1zxZvZc28D+BXl494dJzV
	 Klvqbi8tIFSBn+5YMa7R26QJQaM9AwKE81yHs+DQYd/Lxwf8WAkkc7Md3HDCQMMU28upl
	 U8FCg1jHKXSwOrufGQI7zVC7mofbfuAk/+lvMNZDfi0hmclenVl+gEfI0SUmZ++Xq7tmJ
	 PsDl8DuBd07CmGO69XA16oBekSChdTfR4lXTIsvRiu6tTsZrEQIxNEjcKvDmGGXmR6dcR
	 a0wQVs7ZcHt3+hF3Rnvbx+nrRBq1Iy2ubLQW/YsC0Mt+DrGLlDjNRHbZ9DYbws8pFYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794691362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BxRnWWq12t1oySP35GtRjMb3ItyvyeppM59NMHLeHOI=;
	b=qKWBMriaASFCAi4w/MNWk8zwTcSX/r0DWJdmlUsjq22TQvOPC0/Vvta1MxxYUTOWFm9F
	 PvpOh2YAH6X/nfSIeCndL37+I3nMyZJfdHmuk/4lcllsxd1Z51mL2y/3rd0sYrGGyE5xW
	 y3nLHgHF40S7DSuvvviTh4zuMkcEIkHDOaFWdElM9Om7OVM0cu3teLxUXmXAZiAGhoKHP
	 fXVpCS2Nf2VpI96yF3rXYODUC2qBN13yuAGmGEkoAa+QqPdbsuQYinSNSDshgTdmNEfnj
	 ppoZ+p7t2gP0jXQxzChzpxNUlam+Yl56dJAYhTUWwhjXjdRzbqn4/mU8MOq+uIkc8qA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794691362;
	bh=BxRnWWq12t1oySP35GtRjMb3ItyvyeppM59NMHLeHOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LHx+bU936FSGGUGj4UIZ9/pMV/7Ywo/wPZYmnOTMGkZnhsrWm6KXaTxpZEmdvK/m5
	 YiojBrCYOeo9SsixBx4YHo6DYHCq4Zl9OlCgpfmwiw8i+j5wkIT9ydIrH77jK9LjvY
	 Ti1fuPGb4pKCdUZ8vpfhJjfqMUhY6PSDdf4iXZ8RMvDzVpm8ShnTKwQzTtMne9nzr8
	 yz7nQG32rHdP65HcZnrs3Kp/SCkkYEiqDKyRUY/EulTvJnJqaDk7Aw8qfHf0sd7pm5
	 3AwdHiyYLYpPW/b8N4OooQr/d3zPwpELOkREjwowPOYXF2ySwTrhQ0OEMoYDFC8RpS
	 MJ1zcjpVo30gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F013660653;
	Sat, 14 Nov 2026 21:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D8C72D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A016810D3
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4nbXNIbqqKV for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E48D8109C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E48D8109C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:22:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 968285FFBA;
 Sat, 14 Nov 2026 22:22:33 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 14 Nov 2026 22:22:25 +0100
Message-ID: <20261114212225.1098201-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114212225.1098201-1-ju.o@free.fr>
References: <20261114212225.1098201-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: test_iso9660: fix test by
 setting qemu cpu
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit [1] ("tooolchain/toolchain-external:
update toolchain-external-bootlin to 2026.08"), test_iso9660.* are
failing at runtime due to an illegal instruction in init.
The error on the console is:

Run /init as init process
traps: init[1] trap invalid opcode ip:b7da4230 sp:bfffcbd0 error:0 in libc.so.6[a3230,b7d25000+188000]
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

This is because the test configurations selects BR2_x86_core2=y, but
qemu-system-i386 is started without specifying any machine or cpu.
The default machine is "pc" and the default cpu is "qemu32", which
emulates less features than a Core2. The toolchain update in [1] also
updated its glibc which is now including instructions not supported
by the qemu emulated cpu.

This commit fixes the issue by explicitly setting the qemu CPU
to "core2duo".

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/eeec7b495f6b6127f0cf7020674f7853814a6d06

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_iso9660.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 330a39c202..31d1792ae9 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -21,7 +21,7 @@ BASIC_CONFIG = \
 
 def test_mount_internal_external(emulator, builddir, internal=True):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
-    emulator.boot(arch="i386", options=["-cdrom", img])
+    emulator.boot(arch="i386", options=["-cpu", "core2duo", "-cdrom", img])
     emulator.login()
 
     if internal:
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
