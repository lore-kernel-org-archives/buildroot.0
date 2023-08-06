Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E69EC8736
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CCD8831F1;
	Thu,  7 Sep 2023 15:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CCD8831F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQy7HZ0aIuIf; Thu,  7 Sep 2023 15:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F8F83276;
	Thu,  7 Sep 2023 15:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F8F83276
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 157FF1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26CDF41D81
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26CDF41D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOLcy2G6gUNw for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A5FC41D91
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5FC41D91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 735C986A21; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2504365e1ef5684497ca20c266a9c7847ee57ca6
X-Git-Newrev: 19c12a521701035c166917919c220c33bf71ced0
X-Patchwork-Hint: ignore
Message-Id: <20230907145126.735C986A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crcmod: switch from
 distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=19c12a521701035c166917919c220c33bf71ced0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crcmod/python-crcmod.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index 1aab7f5084..c97f8808c1 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -7,7 +7,7 @@
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
 PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
-PYTHON_CRCMOD_SETUP_TYPE = distutils
+PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
