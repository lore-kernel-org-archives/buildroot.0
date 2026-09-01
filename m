Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897FC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DFD80E5E;
	Tue,  1 Sep 2026 19:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMII8yQh7sjt; Tue,  1 Sep 2026 19:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788292133;
	bh=IapKSMy6KzzjxtG6cWDqWnIVTcEOOcEswuvh37QPqIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fRar1iOzjqmNP6hKkot57xZNpBJL9fY0jVmdaH0ajyz47svOuIn1+nRdJsN1Bn9HU
	 10XKV0oGQaudRFalmAwDr2WklvmyKoPaToJ7me6ZmrB9opYpPtT2hNB10NfgA+mTEe
	 KlE7mTY/jIheMa1NBR9qXVXqYKn3iMv+u62pUIixu3Gxip4aWQt/WowHCjcMuvZUpE
	 L7xSxQj5ipbtbF54Ot+vbUR/dpKitrKADlM0WUla2K7Q9wHzXcCOEgu+7Nio47phqO
	 o4CVlBhNhT9Ix6hpKa5w8fDahqKcQ7iD9xQwzI1P7irkzmyP6B4j5hfQKqFwLn+hM0
	 pKZVNIcy1xHCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B440980E5F;
	Tue,  1 Sep 2026 19:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D37D8334
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE30B80E5F
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2MrCR8fL2QF for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2144880E5E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0736D9356C; Tue,  1 Sep 2026 19:47:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 21:31:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e56c6b32fdae124cf898ef823177ad7892b30538
X-Git-Newrev: 45636d67c93e3722543e181900bcb74a52b01bbb
X-Patchwork-Hint: ignore
Message-Id: <20260901194753.0736D9356C@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45636d67c93e3722543e181900bcb74a52b01bbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mdnsd runtime test can randomly fail on slow runners.

It's hard to reproduce locally (only one failure after a few attempts)
but we can reproduce it easily by removing the while loop entirely.

It turns out that mdnsd is started by S50mdnsd before the
emulator.login() change the system date:

  [BRTEST# date -s @1788032864
  Sat Aug 29 19:47:44 UTC 2026

Since the minimal rootfs.cpio generated	for TestMdnsd doesn't have any
ntp client installed, it start with "January 1, 1970".

The date change may cause some issue to the mdnsd daemon which blocks
any response from mquery command.

When the problem occurs, "mquery -T _http._tcp" reply is empty:

  # mquery -T _http._tcp
  Querying _http._tcp.local. for PTR (12) ... press Ctrl-C to stop

To workaround the issue, restart mdnsd manually.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 214eea7dd9..ebb8971e38 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -23,6 +23,10 @@ class TestMdnsd(infra.basetest.BRTest):
                                     "-net", "user"])
         self.emulator.login()
 
+        # Restart mdnsd after setting the date in emulator.login() setup.
+        cmd = "/etc/init.d/S50mdnsd restart"
+        self.assertRunOk(cmd, timeout=30)
+
         # We check the program can execute.
         self.assertRunOk("mdnsd -v")
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
