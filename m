Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB3CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695E481468;
	Sat, 10 Oct 2026 08:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AanfgW3BGHY; Sat, 10 Oct 2026 08:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EC75813F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621128;
	b=CuLcP2tfw3QMVn8ow9AXcZH7I03YjAJGsHBH0Biqusyi540V6U8J+SVWjRor6UbRp6lt
	 SfvTKtJwRPAsu4R/m9sYqqnz2M4qdhfFdSLeKLuzuPLwBG8GyJSte9UG2LpsXRU3gAn4K
	 SZV5AgDNxTMH99VH3LKhym0Lha9DFABtkM9+oF50cd4UBBBo9BbetYM0BUdAGBXGIKGQi
	 hF4q0gU+t/3BnPEQf/wanBv3EAobqNa5SgRK9b/eo/N7xOz/6APqJGvBF+yj1GY+4lsSG
	 bfYXsJ+TY95U3W4GNRlK/LRvYYZHpcWdmXAJwD6m2pRD2GEzHlJISzL9v75R8UUBJrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pq2KbYwEqmOKbh5dYexEktq9Zkc3y4pVZl0K0y0AVFk=;
	b=cda1LL8e5zWPKYNQvB83ccnf640m6s4vYpHDrIJ06grou7ADzMVCVHjq6JfO6uqET+1x
	 KbP21Z2zWxOc1z1LU64W2i6IHjRYlrP/OEm5ZWldFuJ+3EICaZORCcFn2tgIQWbHZFG4I
	 TF2SwMtwtyNonCY9POhtpuwkdUX5an72eY4od7rsqYtZOQbcGGroWNkMEI/hYoIRV0pTz
	 YKQ7LP/xIkB2Nj+E2xs2d8DwJdW+VncZWx92v3J6Q1Ud1/0o3aKfoe89B226ALtNKo1PZ
	 wFep5xiA6fc9L3SgOJBHvjmhzF9Niks1dIn8RjHM6NR7iOxkuTGLj3k6uAz9t2WaS7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621128;
	bh=Pq2KbYwEqmOKbh5dYexEktq9Zkc3y4pVZl0K0y0AVFk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LZRgXP44QgtyQ8G4UkcnfqIXJ4o/HnsPK9MknuPqfyqjRb2jxsruFOB6ZF0Jc8Oqn
	 SLIWh+LTkgn7IjtPJWXMMVKndCK0ljbXeyG3M/t6M2dXRwIqO9Yi1NpjM+iDesHk5v
	 vzEXoMeTSbgdidJjWL5UvHlGYyuaWG7q+rJtIuzSDklP2VI3vW5Mv/hABgC30FWZ7e
	 b6dzZyQk4gjE5JBzNR+6kY6B/pqsBElFonRo4lPyHTCa59DR0ZSGvSqt5Jnef3jnOH
	 GC5DAfXyULUhPLvZJU8F6NlfohYLvn7qpYFG5jpzXCplNrhTxbeHMAj3t5RREHLWVL
	 1Z+n/BawnN9Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC75813F5;
	Sat, 10 Oct 2026 08:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9556C1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F29813F5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88VkWYT4IYda for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:32:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9C36D813A9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621125;
 b=obTN9MjD5V4cYaV7JL/F053HrWUuZbG2HwYbLo3UDlkuvTBJDvP+a8lwNJAT8w8P4M8d
 9eA86TNd6EcOjdPrVQMJFElneIp14mwpv0MYzyI0luA/Qq2qrTWeGWkgHUWFDARyojRqd
 HjhrhO6e1L+U9B4OTVC3IY0XscCUZrV1klh+6IY6o0HsO/udBC3KxLgz4zYJ2UviyN2cX
 2O3J1gfiq8IqAXArlSUC4QyJcpxnzpm0SeGcGF8c0raWCfQpwFxW/SxnBCsFLMd+ERSxM
 qBWZ0y9RDEyWaHCm5Hr+NXsv4WUb/FVtkCRrUMWQ2Qe10okqrTIH6ZVsTa8TiIFrfvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621125;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BdI01BKT8DGWLed+VKFfwhaYpWAOdQR6BkLSw2bGw5I=;
 b=K9d+34uarsLKs3HteWfO6AtsOuq9IQqryNNXMJ7rXfEQaeiKAEktwDLvlD94Rw8ItY6M
 PcOvN66e7AyrbBr0uN7sHkANwtdZ7MGfo6H4jNHY5SuxMTWciLG/AZO8GsvjaQmRx3jLq
 E1lMy78uCYpbcUg+GYNHaKnplWRYICDoQ1lfeAVhaGZo1afnnLPFDWfXyZJ19t8tBJIe/
 /GmGrr7FBwuhyQf1DCKEZQcZNTply3YJXKc2VKaPA4BiLUFW2ClHd7u2Z/TLEseBiNiik
 VvEU22xFJqEteOZjUx/+2t5yTQLQmR+1BkUPqdI+9blxSG1ywV2f3VeH1J4ENF92WCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C36D813A9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E7F8EF63; Sat, 10 Oct 2026 08:30:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:28:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 237f432e3a02e6da95242a7409f60f7d7660e321
X-Git-Newrev: caf363495a2b5b94fcdd3add3ffe982f49f55540
X-Patchwork-Hint: ignore
Message-Id: <20261010083047.77E7F8EF63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaunbound: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/caf363495a2b5b94fcdd3add3ffe982f49f55540
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

a dependency for prosody

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/luaunbound/Config.in                     |  7 +++++++
 package/luaunbound/luaunbound.hash               |  3 +++
 package/luaunbound/luaunbound.mk                 | 12 ++++++++++++
 support/testing/tests/package/test_luaunbound.py | 25 ++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a82e369aff..33568a1b16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -790,6 +790,7 @@ menu "Lua libraries/modules"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/luasyslog/Config.in"
+	source "package/luaunbound/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
diff --git a/package/luaunbound/Config.in b/package/luaunbound/Config.in
new file mode 100644
index 0000000000..cc4e06818e
--- /dev/null
+++ b/package/luaunbound/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUAUNBOUND
+	bool "luaunbound"
+	select BR2_PACKAGE_UNBOUND
+	help
+	  A binding to libunbound.
+
+	  https://www.zash.se/luaunbound.html
diff --git a/package/luaunbound/luaunbound.hash b/package/luaunbound/luaunbound.hash
new file mode 100644
index 0000000000..dbf1c602ea
--- /dev/null
+++ b/package/luaunbound/luaunbound.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  99f4fb8695327f06d37013bfe09cad5103158d803941bbc3caed9328ecafd5bf  luaunbound-1.1.0-1.src.rock
+sha256  b02daf9bb40ed6504df2bcc7b51d78abea4cc3fe7a9819bcdc01d122dd3ac5f0  luaunbound-1.1.0/LICENSE
diff --git a/package/luaunbound/luaunbound.mk b/package/luaunbound/luaunbound.mk
new file mode 100644
index 0000000000..d1523699ed
--- /dev/null
+++ b/package/luaunbound/luaunbound.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# luaunbound
+#
+################################################################################
+
+LUAUNBOUND_VERSION = 1.1.0-1
+LUAUNBOUND_LICENSE = MIT
+LUAUNBOUND_LICENSE_FILES = $(LUAUNBOUND_SUBDIR)/LICENSE
+LUAUNBOUND_DEPENDENCIES = unbound
+
+$(eval $(luarocks-package))
diff --git a/support/testing/tests/package/test_luaunbound.py b/support/testing/tests/package/test_luaunbound.py
new file mode 100644
index 0000000000..9446f946c1
--- /dev/null
+++ b/support/testing/tests/package/test_luaunbound.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaunbound(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAUNBOUND=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lunbound")
+
+
+class TestLuajitLuaunbound(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAUNBOUND=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lunbound")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
