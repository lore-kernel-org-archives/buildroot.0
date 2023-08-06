Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE48C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF5D81BC0;
	Sun,  6 Aug 2023 17:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF5D81BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOKQBzv23bl1; Sun,  6 Aug 2023 17:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FCB80B2B;
	Sun,  6 Aug 2023 17:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FCB80B2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4515B1BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FEEF401D8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEEF401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cA7kx8mPJjni for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B96340142
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B96340142
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 343778454B; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0d8c70e93d1835c97d797ce1f390e6acc0adb225
X-Git-Newrev: 1cc378b004ddbb1bc351f12ab374a19fe6c8d90c
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.343778454B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aiologstash:
 switch from distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cc378b004ddbb1bc351f12ab374a19fe6c8d90c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiologstash/python-aiologstash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
index be1c40b714..de0ed820a0 100644
--- a/package/python-aiologstash/python-aiologstash.mk
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOLOGSTASH_VERSION = 2.0.0
 PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
 PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
-PYTHON_AIOLOGSTASH_SETUP_TYPE = distutils
+PYTHON_AIOLOGSTASH_SETUP_TYPE = setuptools
 PYTHON_AIOLOGSTASH_LICENSE = MIT
 PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
