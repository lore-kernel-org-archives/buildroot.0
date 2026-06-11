Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB63CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D492F41114;
	Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou1M6ru_Z5Ic; Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFE041144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263359;
	bh=RYj9NRg7AoVrx246xGsI8f0jfjLwgrnSXbEAcA+mJ5E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DTub7MKa4Ff7e32kB/EGB6F6pEN981vLKoi3p0QwN/HwXp1b7EntuPJcFHGcoam7+
	 yvXpgMm+iVEDWRhWlQgbHDVjzCTG134V2QGqJOVwJL+5wG/wNIBCOm4ESqOFzHAREm
	 VMAjbxuuFWNfuwrg1Lj0EjhFVpiWkT892cJUto85Lg6Y1ZLIqkN4cRoCuHc2tD7aC1
	 PDvHRrDUZLJBWQWC4quNllb7HGv1ZEYpp00Ui25aFKW1qU8npE8NJ75IS08RmjbgR3
	 hhXT6AjtNoa5PPshabpTU32i/EafU/vOL8XACRGiZw9oOb4q8wTaVI8aAhc+H+CB+v
	 iYdY/fNojcyuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFE041144;
	Fri, 12 Jun 2026 11:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 219AD321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F7724101D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_T1CAPPJjDr for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE294107D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE294107D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4420B880E9; Fri, 12 Jun 2026 11:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:30:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4978f6108f1977db3ae6272ba701ac934925515a
X-Git-Newrev: 43e62b5835049c012100819de0b1c8ce93c2a9bf
X-Patchwork-Hint: ignore
Message-Id: <20260612112206.4420B880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 TestPppd: force the baudrate for pppd
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43e62b5835049c012100819de0b1c8ce93c2a9bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 50d772b66bb0ab281aef2bade584de39b4cd6da5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
