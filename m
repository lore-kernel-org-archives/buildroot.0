Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBCDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA61660FC1
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA61660FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF5F46068D;
	Sun, 31 Oct 2021 17:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e90UezCBMJ2h; Sun, 31 Oct 2021 17:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA84605C7;
	Sun, 31 Oct 2021 17:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 653301BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 556D440105
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOwRLVxr9NzR for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:43:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 920EA400FE
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:43:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3ECE9890FB; Sun, 31 Oct 2021 17:39:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 18:42:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3f75837e24bd37067519713c117cb43bbb7ca40
X-Git-Newrev: 8b4a6758541daef4fe3d29425817c58860612a34
X-Patchwork-Hint: ignore
Message-Id: <20211031173935.3ECE9890FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix the TestPythonPy[2,
 3]Incremental test cases
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b4a6758541daef4fe3d29425817c58860612a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent python-incremental version bump (commit
fd03cb5a12981a9c34b0025ff3ae4b8456342724) added a change/fix
in incremental.Version().

python-incremental 17.5.0 return: "[package, version 1.2.3rc4]")
python-incremental 21.3.0 return: "[package, version 1.2.3.rc4]")

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552692
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552693

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_python_incremental.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_incremental.py b/support/testing/tests/package/sample_python_incremental.py
index b6e2aa803c..efab8b2067 100644
--- a/support/testing/tests/package/sample_python_incremental.py
+++ b/support/testing/tests/package/sample_python_incremental.py
@@ -1,3 +1,3 @@
 import incremental
 v = incremental.Version("package", 1, 2, 3, release_candidate=4)
-assert(str(v) == "[package, version 1.2.3rc4]")
+assert(str(v) == "[package, version 1.2.3.rc4]")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
