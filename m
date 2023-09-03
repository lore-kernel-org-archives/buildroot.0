Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69DEC83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744584150E;
	Sun,  3 Sep 2023 19:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744584150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cardlkOA6Y4L; Sun,  3 Sep 2023 19:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1DE4149F;
	Sun,  3 Sep 2023 19:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E1DE4149F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAE531BF865
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8446B60E91
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8446B60E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lUiYhM2yWGr for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3AB60742
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD3AB60742
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AE8286930; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Sep 2023 21:32:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2397349fa99787a4ccbf75917e113087fa1a67d3
X-Git-Newrev: 57229c22f17fa892c18dff1e424dedc7e3d05358
X-Patchwork-Hint: ignore
Message-Id: <20230903193434.9AE8286930@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: ignore CVE-2018-20225
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

commit: https://git.buildroot.net/buildroot/commit/?id=57229c22f17fa892c18dff1e424dedc7e3d05358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://security-tracker.debian.org/tracker/CVE-2018-20225 for the
rationale of ignoring this CVE. Things basically work as intended.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pip/python-pip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 35ad7bede2..040767930e 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -12,6 +12,9 @@ PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
+# Disputed CVE: things work as designed, and only affects the
+# --extra-index-url option. This CVE will never be fixed.
+PYTHON_PIP_IGNORE_CVES += CVE-2018-20225
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
