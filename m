Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8984AC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4908240EE4;
	Fri, 26 Jun 2026 14:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k90Q0ZRYN_X1; Fri, 26 Jun 2026 14:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D1740EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485401;
	bh=jRol1UuxtCFNhNRIwAMR/76z63fykw/F4tU+quJ9Pdk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gCTzojhrDlIAFHMDmv7K4gjJmcZ5Cco3Q09MY6m0Bq+tes9K8MHI75TRZRtKsW+9y
	 T8Q9nyS6J954EqskjTWjuI7OsLoPb5Z6jKNl1GFBNkYPM6SEbXRJ5WhAV3ZuV0gSsO
	 aLC8WJvDu5cW7QrLOgvVQDo6VtrTowDRlgwYltKzIDFXqIlxY6AxQrUPuoXXTmN7y5
	 pJE5FJ62KJ2un9goFR4EiLTUonfhEp4/y6LnWve2qa8EPNVAy41EGR/LDAVFQZn/LP
	 kaliVn7kzcPUsoov19Vr+me1nt11NsdiyBs+jyNMF36KSsSj+qdRz8OlWOIJL4Zw28
	 0KHKpcaklWzIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D1740EFA;
	Fri, 26 Jun 2026 14:50:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A9E4231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA8D82170
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BToE44eNXTWG for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 766B1821E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 766B1821E3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 774AF864A8; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:35:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2500d8534f72ed1d089dd5fe892c468e199a215d
X-Git-Newrev: 76c288661d6f0f673a89a0ed313167e7273014b5
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.774AF864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_connman.py: use assertRunNotOk()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76c288661d6f0f673a89a0ed313167e7273014b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2889d0f05277cf22fe10268026aa2f551739e2a9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
