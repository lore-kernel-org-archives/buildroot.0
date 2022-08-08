Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68920C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF136608D8;
	Mon,  8 Aug 2022 20:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF136608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oF5GjKu4sogQ; Mon,  8 Aug 2022 20:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CC1607F4;
	Mon,  8 Aug 2022 20:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3CC1607F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE77C1BF316
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F914091F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F914091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfUx-H_-eqEX for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA81408E5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CA81408E5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:14:35 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.26.40])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 30CE9780518;
 Mon,  8 Aug 2022 22:14:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 22:14:24 +0200
Message-Id: <20220808201424.196176-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807165538.850640-1-ju.o@free.fr>
References: <20220807165538.850640-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659989672;
 bh=zdrEGIB+CoRzTi4ZyPFR7pSlx8KnCvGu+Q1BMTxIuow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VxwCunpQnp9tWYjX4IACVwUVm0rc2u3Pv7m0ONXb+lTq22rCxLAuZZu/hHXKl6h0O
 3mTLh0zgDTMjFV2U0VnfeYF33gPlTi2PqW6RfOlGMLHpqeJxRmYPyesF7xGGWIicdV
 Fqf3Oj2otwjN45chIcrNIawol0Pfb0Z/9WbA2e+g4Kgjs543wSxNtQnxfYJEjGcTaq
 dwh8CWiJzJedcY06CHyc/I7VSmXjy9ew9tjq6s+qa8mIIbiMi4yblUWLMAeEgpZvkl
 pxfMrQRyLF5qr6wLnToZNvRDvY0z2qWPvuubrzae0v11juZ6iQQAmeWWyE8evsjZZ0
 SJRbSw6vuozkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VxwCunpQ
Subject: [Buildroot] [PATCH v2 1/1] support/testing: octave: increase test
 timeout
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Octave package test can occasionally fail due to timeout while testing
some octave modules. This commit slightly increase the timeout value
to reduce those failures.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- removed tweak of self.emulator.timeout_multiplier,
  suggested by Thomas.
---
 support/testing/tests/package/test_octave.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 82a70e09c2..cdbe2688df 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -76,4 +76,4 @@ class TestOctave(infra.basetest.BRTest):
 
         for mod in octave_modules:
             cmd = self.octave_cmd('assert(test(\"{}\"),true)'.format(mod))
-            self.assertRunOk(cmd)
+            self.assertRunOk(cmd, timeout=10)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
