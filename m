Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A353C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A85B504B9;
	Fri, 28 Feb 2025 17:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehUNVqpBZCD1; Fri, 28 Feb 2025 17:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E76504B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E76504B6;
	Fri, 28 Feb 2025 17:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D3A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FE8747999
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZg2Xt_kzXnY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A742E427A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A742E427A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F3E3867B4; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 13:49:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 903a1388952584509b02bad36dd4bf13b4b17251
X-Git-Newrev: 21f57ed4ed952d0d327903efe4dffc9044b1c43e
X-Patchwork-Hint: ignore
Message-Id: <20250228163018.9F3E3867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-periphery: add test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21f57ed4ed952d0d327903efe4dffc9044b1c43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../testing/tests/package/test_lua_periphery.py    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/support/testing/tests/package/test_lua_periphery.py b/support/testing/tests/package/test_lua_periphery.py
new file mode 100644
index 0000000000..5b93e36e39
--- /dev/null
+++ b/support/testing/tests/package/test_lua_periphery.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaperiphery(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_PERIPHERY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("periphery")
+
+
+class TestLuajitLuaperiphery(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_PERIPHERY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("periphery")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
