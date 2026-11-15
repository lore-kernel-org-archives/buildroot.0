Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8FC606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sqfG79UY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F909405D7;
	Sun, 15 Nov 2026 12:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38O0SgODSP7m; Sun, 15 Nov 2026 12:04:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35AFB405E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794744281;
	b=r6mkaCfYznaZTKQ/H/F4Q5qvx1L90nMCvDYI78dPQNJbIlLlaJdg0dUAUJLBhEiuWzVu
	 6W1+ZFoQRbYeqVZ2g7FIULlBBRS9FsJL6jEs98z/wRyjToAf4yyekEAMT1h6iQB6LjODm
	 bdPFVwoq4YuWuKVtHAd0aoFAo1iqI/J/MJ3kChTRtjIt4nJBwIKCojobBDGpGbDO49sO6
	 Dyo09nYwAak6UAmCYZb/vGYpEn85bvGGvY2Q0PZwiZOGfupCNg/jr5fSC3Dj9dlgZEQkY
	 /1EP4okHnJihCDJzfhwXKo5V3E2WCIfRCxuCr5OMh8gG6pmBcePtzL+JMyUbRtZyRkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794744281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aDrSqF/PKf3DLrlD5CJyiZiEAllloiDGsVb4xT1bGe0=;
	b=atVWGBipLwMxsrOr2GaO5P5nQ9VIbAtQyb5rDBu++I7j9y63D8teCGMvpFFWs7IRiiFA
	 n1SyFZm92e1epe1iTzTOxM741Pvrh39wCsYwpXx+NKXe+LXaUagjxZxHJMIJX4ypu6wqq
	 AVN8m1xwxd28rdQeJxfa70gmmlg3QcjNQBCgiNbKq6aRtkfnPqR6F6uIFelMEQDhzB8w4
	 zqOUyNWEU8FqF1l7yFbXzahK6HZ581LxxpDgZreghdAtLg7Du8OntVdin20M4gI9GiRGL
	 yalCekupoxtG+RELeqHZvoefOpjmS3yW7gUh1CIGMVpVvF+nKy+QXphk/JiBxi6UZBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794744281;
	bh=aDrSqF/PKf3DLrlD5CJyiZiEAllloiDGsVb4xT1bGe0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sqfG79UYVBUN2BLboSa2kXBGPycUpy54mEd35zs72pHgc8U1Ac6zbKrJapH1S83lL
	 gdCqBkkpKisN7Hx7QJI7gAhyGnHTaEjfQTCYpgZ4RSAKrFWCDRIemb6/mOqSvUwsWw
	 Yr8cICrNcH70PuWj3Vf3siA4z5NwXcv46tY41mJzYi6hFJxGEnHxpP039S4azk3nY5
	 rQR2C8O4ZeKOnMRUO+OajDgz+ne/em7FJwmc+6R8xNZQ54ws9OugJxk5FedgHl6nHY
	 3FJmhzgHmasWmX63RIpuXgL0snWjftnjXkxx2+/tB/yP1bGMMQiMj/+8FkYIG97Lve
	 5FlSfs00upX4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35AFB405E0;
	Sun, 15 Nov 2026 12:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E6A1A6
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 666F881063
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AhwCSatINCr for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 12:04:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 802E480EE7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 802E480EE7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 79B745FFC0;
 Sun, 15 Nov 2026 13:04:32 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 15 Nov 2026 13:04:24 +0100
Message-ID: <20261115120424.1235918-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115120424.1235918-1-ju.o@free.fr>
References: <20261115120424.1235918-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: test_grub: fix test by
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
update toolchain-external-bootlin to 2026.08"), TestGrubi386BIOS is
failing at runtime due to an illegal instruction in init.
The error on the console is:

Run /init as init process
traps: init[1] trap invalid opcode ip:b7de4230 sp:bfe26040 error:0 in libc.so.6[a3230,b7d65000+188000]
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
 support/testing/tests/boot/test_grub.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 92350d60f9..f006bdf7ce 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -29,7 +29,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
 
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
-        self.emulator.boot(arch="i386", options=["-hda", hda])
+        self.emulator.boot(arch="i386", options=["-cpu", "core2duo", "-hda", hda])
         self.emulator.login()
 
 
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
