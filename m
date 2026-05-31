Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4DCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 13:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A9785039;
	Sun, 31 May 2026 13:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcEVXQMBAOVn; Sun, 31 May 2026 13:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9F685028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780234922;
	bh=9/yyA78rtfRazypi7yVFI3Rs2Z1q4mUTkSqP52Ik4I4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QIeylfVETIgdYoy+WEixs2vr6Rw0pboNX2uOkYtrwZ5B2zwefZ8k42WD4UIfoXxbe
	 UYoKoEBUTk2ohF/RUzu8rQAoTgkgCjThwyjZf5h95r4g5239nncOlvGySM6I50Q5c9
	 quFq71/UcD4Q96DDX05VZ1xoul61bGCBiA2WhV5zH6cW995n64Fpu6tMVRjDoNdZ/7
	 dtSVZluqabQWAfjh58Aa9fwtRWmkZ7lTWXuQEAwea6DwHJtHXrl48wdavPXk82bos7
	 nScRsMSVklE0pgpm9X6ZYUnQIn/85BB04ftzL1eduRgJ+beouLMsOaLhODM7h9TyuR
	 3IUYZPFAHEoKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9F685028;
	Sun, 31 May 2026 13:42:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD58257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81D1542A80
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHA665ei8qo3 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 13:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC8442A7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC8442A7F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:41:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59400876D4; Sun, 31 May 2026 13:41:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 15:39:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b7435c7a2e11ac2c52398c66cc3f5ae6ef854a
X-Git-Newrev: 50d772b66bb0ab281aef2bade584de39b4cd6da5
X-Patchwork-Hint: ignore
Message-Id: <20260531134146.59400876D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPppd: force the
 baudrate for pppd
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50d772b66bb0ab281aef2bade584de39b4cd6da5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the ARM AArch64 toolchain toolchain bump [1], the TestPppd fail
at runtime since ttyppp0 and ttyppp1 interfaces were not created
properly:

    pppd[87]: pppd 2.5.2 started by root, uid 0
    pppd[87]: Baud rate for /dev/ttyppp1 is 0; need explicit baud rate

The new toolchain uses glibc 2.42 that include a rework in termios
"implement arbitrary and split speeds in termios" to support BOTHER
[2]. This rework seems to conflict with pppd workaround [3] introduced
when BOTHER was not supported in Glibc.

Fix this by setting the baudrate on pppd command line (we already set
this baudrate on socat command line).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335920 (TestPppd)

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=5cf101a85aae0d703cdd8ed7b25fe288e41fdacb
[3] https://github.com/ppp-project/ppp/commit/d65f6713c8514b016629b87d44d5154d70776f7b

Fix-suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_pppd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
index 015f10f02d..0ba1ff7ee2 100644
--- a/support/testing/tests/package/test_pppd.py
+++ b/support/testing/tests/package/test_pppd.py
@@ -81,7 +81,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start our (fake) remote pppd instance, in our netns.
         cmd = f"ip netns exec {namespace} "
-        cmd += f"pppd noauth ifname ppp1 {pty1} {remote_ip}:{local_ip}"
+        cmd += f"pppd noauth ifname ppp1 {pty1} 115200 {remote_ip}:{local_ip}"
         self.assertRunOk(cmd)
 
         # We wait a bit for the pppd to settle...
@@ -89,7 +89,7 @@ class TestPppd(infra.basetest.BRTest):
 
         # We start out local pppd instance, this time in the default
         # network namespace.
-        cmd = f"pppd noauth ifname ppp0 {pty0} {local_ip}:{remote_ip}"
+        cmd = f"pppd noauth ifname ppp0 {pty0} 115200 {local_ip}:{remote_ip}"
         self.assertRunOk(cmd)
 
         # We wait again...
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
