Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E39C4332F
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D22460F90
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D22460F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CC35403F9;
	Tue, 26 Oct 2021 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgeJ85LcFwtE; Tue, 26 Oct 2021 19:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 698204022A;
	Tue, 26 Oct 2021 19:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1391BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D37040560
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e69Lfn-qfvIk for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D986040535
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ED2F288F04; Tue, 26 Oct 2021 19:34:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff94c7220477bea2e1c8a287a4a255334a5a5354
X-Git-Newrev: 0514ced833ae082a8d4eea39afa43af5bcc17f0b
X-Patchwork-Hint: ignore
Message-Id: <20211026193444.ED2F288F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_python_rsa: increase
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2960278182534052233=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2960278182534052233==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0514ced833ae082a8d4eea39afa43af5bcc17f0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some developers machines, the default timeout (5 seconds) is not
enough for the test to succeed.

Increase it to 20 seconds, to let more time for the rsa keys to be
generated.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_rsa.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_rsa.py b/support/testing/tests/package/test_python_rsa.py
index e63d63e1de..5ddfb51314 100644
--- a/support/testing/tests/package/test_python_rsa.py
+++ b/support/testing/tests/package/test_python_rsa.py
@@ -9,3 +9,4 @@ class TestPythonPy3RSA(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_RSA=y
         """
     sample_scripts = ["tests/package/sample_python_rsa.py"]
+    timeout = 20

--===============2960278182534052233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2960278182534052233==--
