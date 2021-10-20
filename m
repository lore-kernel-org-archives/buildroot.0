Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24C5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:35:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7595B6121E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7595B6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4806160BC4;
	Wed, 20 Oct 2021 21:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CC_MDzlRYWMz; Wed, 20 Oct 2021 21:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA0A60BC2;
	Wed, 20 Oct 2021 21:35:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A624C1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95DF860BBB
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrJlK_rwC4zT for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:35:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8507606B9
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:35:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C1F4388164; Wed, 20 Oct 2021 21:32:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:35:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffefa118819abe1870980ae233c514f8974031e2
X-Git-Newrev: 31cfaab3c9afc300c1c76e27a72a9d7c4860d969
X-Patchwork-Hint: ignore
Message-Id: <20211020213235.C1F4388164@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: drop httpx.py
 for python 2.x to fix pycompile issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=31cfaab3c9afc300c1c76e27a72a9d7c4860d969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop httpx.py to fix the following build failure with python 2.x raised
since bump to version 1.4.3 in commit
fd684ab9f38ad908013d09fe7e46cebfada4406c and
https://github.com/getsentry/sentry-python/commit/e2d0893824481c9a5dd3141872d90d0888c4c5f8:

error:   File "/usr/lib/python2.7/site-packages/sentry_sdk/integrations/httpx.py", line 69
    async def send(self, request, **kwargs):
            ^

Fixes:
 - http://autobuild.buildroot.org/results/fd651abb3bc2fa33c861238acf1c4ad49fdac160

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 5ccd2aff5c..556f03e137 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 # only needed/valid for python 3.x
 define PYTHON_SENTRY_SDK_RM_PY3_FILES
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/python*/site-packages/sentry_sdk/integrations/,\
-		aiohttp.py asgi.py django/asgi.py sanic.py tornado.py)
+		aiohttp.py asgi.py django/asgi.py httpx.py sanic.py tornado.py)
 endef
 
 PYTHON_SENTRY_SDK_POST_INSTALL_TARGET_HOOKS += PYTHON_SENTRY_SDK_RM_PY3_FILES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
