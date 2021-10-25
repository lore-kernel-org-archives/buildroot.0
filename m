Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE2EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C62760F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C62760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BD340385;
	Mon, 25 Oct 2021 12:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwEZEgmY-HGb; Mon, 25 Oct 2021 12:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 771B940384;
	Mon, 25 Oct 2021 12:12:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF621BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17FDC403DF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80RdgaIwiS-O for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45FA1403D9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5A04B88767; Mon, 25 Oct 2021 12:09:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:09:51 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: d22d09a033683fcc9ee9ebbcb88422ad20793f5b
X-Git-Newrev: 80e404bac36a72b3d05ce14550095dacd1d84965
X-Patchwork-Hint: ignore
Message-Id: <20211025120914.5A04B88767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/testing:
 sample_python_dbus_next: ignore F821 flake8 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=80e404bac36a72b3d05ce14550095dacd1d84965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit 1217817ac20bad1d62ef9322084f6268a9084a87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
