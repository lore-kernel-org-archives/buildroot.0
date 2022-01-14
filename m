Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C0EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4344783FB3;
	Fri, 14 Jan 2022 15:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbKOlYVGybhF; Fri, 14 Jan 2022 15:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830F683E3A;
	Fri, 14 Jan 2022 15:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 382DC1BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3486260B3C
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vujfck30SZdT for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F080607B4
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 631DF83545; Fri, 14 Jan 2022 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:25:13 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0fa9874a4a82fc0e3ba655c2b3a1be5f6d6b8ee2
X-Git-Newrev: c1c56be8a0cd9cdfefe15dc9897d41c56b007546
X-Patchwork-Hint: ignore
Message-Id: <20220114155011.631DF83545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/python-charset-normalizer: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1c56be8a0cd9cdfefe15dc9897d41c56b007546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

A host variant of the python-charset-normalizer package will be needed
for the host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 07fc2fb1a5625ea18c76fab906b8da83ac1f49f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index e1b805fbfb..7fe9f96996 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -10,5 +10,7 @@ PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/3
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+HOST_PYTHON_CHARSET_NORMALIZER_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
