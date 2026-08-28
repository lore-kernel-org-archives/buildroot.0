Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47B2C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D1F60887;
	Fri, 28 Aug 2026 14:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DJ8RxYrvIrd; Fri, 28 Aug 2026 14:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927160;
	bh=53cvGTPpwim8mlNfU7Ws2luAKqR4jZgsZz5PM75G5Ms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G6jV21QOdpc0Th8n2WOU2mfnkOIQK4HAU3/YSq879DT6ltB5rqppXMfceQw0LP8TF
	 nCi47ZAlICrWQcT3W2qAHHUIPIlDsNosVLKv53dPjesEckCyg2/tn8HAyZAD3PuV+u
	 /h6FZvyZ1yM53z1iWB3Kd1ci4zjbNQn75/anBYQDA9WQJ/T/PJjW96jD7tUAni6gF1
	 C426oUegrWtNacgwc5IxGfq8RXNDQPF7K2WhPpJvujk0S+gisRVaD19DXh1O96+xzj
	 edsvd0gC6k6AjoVd6QMZfvlPJgWMdH2vR57Uv250LFfNFhi3Ifudnt9DmP3BY8X01E
	 df+JkR5B/GYmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBFA6085E;
	Fri, 28 Aug 2026 14:26:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0C2D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 114C580F75
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlNfotulh34F for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 293A280F49
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2798C921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d4463612924d3a8a4bd8cfe49a7e0d12d1f13e88
X-Git-Newrev: 424d201ab6b3b1ec72954564506ec3f1cfff6875
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.2798C921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing: remove
 TestGdbArc
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/424d201ab6b3b1ec72954564506ec3f1cfff6875
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The Arc specific gdb version was removed by commit [1]
but we still have the TestGdbArc that was testing this
version of gdb.

We can now safely remove TestGdbArc.

[1] 0b3d526226662af8b16525aecec7da5ff0e5fa1d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2f6b34f8519ad7f47814edbf3c49869213aef423)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/testing/tests/package/test_gdb.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 324052efdb..78395b1847 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -89,19 +89,3 @@ class TestGdbFullTarget(BaseGdb):
     def test_run(self):
         self.boot()
         self.verify_gdb()
-
-
-class TestGdbArc(BaseGdb):
-    config = \
-        """
-        BR2_arcle=y
-        BR2_archs38=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_SERVER=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb("arc-linux")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
