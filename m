Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5B7C5DF8E
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1C84098E;
	Fri, 21 Aug 2026 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m739tGaya3pa; Fri, 21 Aug 2026 19:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787341552;
	bh=+6ajqTpMAYZCPfWECsUVP3hQJYsxpv1PB+bqLlwhd70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UPA7Nd/1gJDeCHK0QVLmrmKp0Ji32ixPARtC7GwBYubFm9tYtntg7VNayi7zCyt7H
	 aYGwzx2ZPov93YXssm4V235tx+MJ3DaFps0huiAYZr2h/1VGd4FKjSJdJA18u0OVEW
	 Ib6owrPV8knSBti9cjvkvmEZGEoke3UD4pefYSrLYtucxc3PHEM8lSpxufXstSq1my
	 GSeo5a7cFFqMyauVJV9dW83V8mLF9xG08W+1vkCVA8Cuq2g6mueye5iywFokrDrSfd
	 tCIKRSgR0isS8cIeoTJz2ehNYdgjJY7jheY6B4546YNsyc474HUDeBvnKkNWDRo7do
	 r2kIHFTgsFhUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 006DD40995;
	Fri, 21 Aug 2026 19:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF0E3336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A581660619
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqxhrfVIRt3C for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCC5060614
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D0058E113; Fri, 21 Aug 2026 19:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 21:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4788039a894ed8a8041a5719c6acf1c2b3faa8d1
X-Git-Newrev: 2f6b34f8519ad7f47814edbf3c49869213aef423
X-Patchwork-Hint: ignore
Message-Id: <20260821194455.0D0058E113@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove TestGdbArc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f6b34f8519ad7f47814edbf3c49869213aef423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Arc specific gdb version was removed by commit [1]
but we still have the TestGdbArc that was testing this
version of gdb.

We can now safely remove TestGdbArc.

[1] 0b3d526226662af8b16525aecec7da5ff0e5fa1d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
