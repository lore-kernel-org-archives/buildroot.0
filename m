Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27696CDB46C
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D44B56F62F;
	Fri, 19 Jun 2026 09:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQGJwSUdI6UF; Fri, 19 Jun 2026 09:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A6A6F603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859923;
	bh=hD9sO3SQJ01zG3PK96SbeNibmns7TwIWVrhFeFoN2co=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zs5EMkibLYduF1znKdIMneNjFzEkRY4QizB1Y8SFm/lv3jDv36EKcu9j9XSZRk8Od
	 2EDaa0P7/laCk77QxKZeRHzxpYn9PQUuLB1oVeR5zvRVvJiBdiA5j5TZ6Ji9A8eCsT
	 jj7EQU4DmrKhGVPdRu+woZ7zyasnhNDGavnEzO4i4pP2ydf23iB6hSQ3c2PDpl8yik
	 RGJIYizE/Fzhkmkh6ttH+48yjJ69Jtg+K9EP+dkImbG0YqE8yO/fk28PoDP6cPhOGj
	 C/Vn1H7eq3KxXKyoA8ahA6sIyNvTIe0G69XA8mbw/qD79ktKIYPOhD5FTAdrlqrsRw
	 auDOu+wgB9vrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A6A6F603;
	Fri, 19 Jun 2026 09:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01AC8367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E792384CCD
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWbIeq5QGXpU for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C700584BDF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C700584BDF
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52C05815B6; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 830e0f49bbe42ba3acf0d91ff1a65748c434c46d
X-Git-Newrev: 2889d0f05277cf22fe10268026aa2f551739e2a9
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.52C05815B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_connman.py: use
 assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2889d0f05277cf22fe10268026aa2f551739e2a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_connman.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
index 6fef95104c..2e53135208 100644
--- a/support/testing/tests/package/test_connman.py
+++ b/support/testing/tests/package/test_connman.py
@@ -47,8 +47,7 @@ class TestConnMan(infra.basetest.BRTest):
 
         # If we try to ping again the qemu gateway,
         # it should now fail.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
 
         # We ask connman to re-enable Ethernet.
         self.assertRunOk("connmanctl enable ethernet")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
