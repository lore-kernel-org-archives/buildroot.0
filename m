Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A2C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1C481E6B;
	Sun,  6 Aug 2023 17:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF1C481E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHWkDTshM7iE; Sun,  6 Aug 2023 17:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A438175B;
	Sun,  6 Aug 2023 17:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A438175B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109EE1BF2BE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13DD581A6D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13DD581A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYWn7F77PSpv for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8466781776
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8466781776
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B8284551; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 464c37e350d85a97d1fb7c68ebf20eb0d4aa6956
X-Git-Newrev: 5c9e66d87517bd2fadd33993741bb03b9b79a50d
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.73B8284551@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-iowait: switch
 from distutils to setuptools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c9e66d87517bd2fadd33993741bb03b9b79a50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iowait/python-iowait.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index e327053e8e..028001d7f3 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -7,7 +7,7 @@
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
 PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
-PYTHON_IOWAIT_SETUP_TYPE = distutils
+PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
