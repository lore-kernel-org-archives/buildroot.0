Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D158C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF17406DB;
	Wed, 26 Aug 2026 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2Fp8N8zDvaa; Wed, 26 Aug 2026 21:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787781116;
	bh=4wR6umBt+O2vRI2Io00cYg7IbXsNLTkfHClbSrpHgR8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=heMNjtRax1b1c1MaL19ePEzh4Z2+8IDFXw5uUribg6eC+nW4H790MR2GTwKALFDnk
	 hhMr0vN6E+v6LvXQuLpyzB6xPaxzK9trvl+UqWmI3U5I2vQAFD82cuL7d8oVHfysBv
	 f9hQ0z2iX0UoIO2N7DjwgBOW0IudRmTwAuoELcKYM6jdgYLZS8gnYtyWnMrOKzq7/+
	 1/KmFM+8A7Fk/UMlJokirHcpeC3Vu4hr7b1U87Jslh07qog3xgjQnNV6nOvouJN7NX
	 jvEeGGgb8Yeop2TTs/8htGriyMVMITCj6eDqdZeXS77FiMMC0cGaWz42oMCB1B8bsg
	 ZDnko6+EG075g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07097406F3;
	Wed, 26 Aug 2026 21:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C85D3A4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52861809E7
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnuaIDr_RXS5 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3519809C2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C12292114; Wed, 26 Aug 2026 21:50:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 23:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23fd881bdbe9849dc95d3e8e3517b50085309029
X-Git-Newrev: b4b1de1f7f1865af25f5dc47beac06a37b929c4a
X-Patchwork-Hint: ignore
Message-Id: <20260826215058.8C12292114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestMdnsd: improve test
 reliability
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4b1de1f7f1865af25f5dc47beac06a37b929c4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mdnsd runtime test can randomly fail on slow runners.

It's hard to reproduce locally (only one failure after a few attempts)
but we can reproduce it easily by removing the while loop entirely.

It means that the "sleep 1" is not used on the Gitlab runner.
The timestamp of the failed job seems to confirm that [1].

07:06:55    [BRTEST# while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done
07:06:55    [BRTEST# echo $?
07:06:55    0
07:06:55    [BRTEST# mquery -T _http._tcp |grep -F buildroot._http._tcp.local
07:06:55    [BRTEST# echo $?
07:06:55    1

So wait a bit for mdnsd to be ready.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152862

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 214eea7dd9..2637af7c12 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 import infra.basetest
 
@@ -30,6 +31,9 @@ class TestMdnsd(infra.basetest.BRTest):
         # advertises the bundled _http._tcp service from /etc/mdns.d/.
         self.assertRunOk("pidof mdnsd")
 
+        # We wait for mdnsd to be ready...
+        time.sleep(1)
+
         # mdnsd only answers on multicast capable interfaces that are
         # up, so wait for eth0 to get its DHCP address before querying.
         cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
