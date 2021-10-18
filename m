Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE4560F25
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE4560F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B31764047D;
	Mon, 18 Oct 2021 20:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLS8MzPqJt6a; Mon, 18 Oct 2021 20:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE7340474;
	Mon, 18 Oct 2021 20:31:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD0EF1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5DB440505
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HWzjpI2Lso8 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:31:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18D93404E4
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B278387A37; Mon, 18 Oct 2021 20:28:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:30:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d469858cec937b61335088c407eecca9b6f2be5
X-Git-Newrev: 1217817ac20bad1d62ef9322084f6268a9084a87
X-Patchwork-Hint: ignore
Message-Id: <20211018202851.B278387A37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: sample_python_dbus_next:
 ignore F821 flake8 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=1217817ac20bad1d62ef9322084f6268a9084a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dbus-next package uses the Python type annotation for dbus types. This is
not compatible with the python typing assumption that flake8 makes.

Exclude F821 from this line.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829
partially:
support/testing/tests/package/sample_python_dbus_next.py:17:36: F821 undefined name 's'
support/testing/tests/package/sample_python_dbus_next.py:17:48: F821 undefined name 's'
support/testing/tests/package/sample_python_dbus_next.py:17:56: F821 undefined name 's'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_python_dbus_next.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_dbus_next.py b/support/testing/tests/package/sample_python_dbus_next.py
index 1fcb76f45a..710bfa8c04 100644
--- a/support/testing/tests/package/sample_python_dbus_next.py
+++ b/support/testing/tests/package/sample_python_dbus_next.py
@@ -14,7 +14,7 @@ class SampleInterface(ServiceInterface):
         pass
 
     @method()
-    def ConcatStrings(self, what1: 's', what2: 's') -> 's':
+    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
         return what1 + what2
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
