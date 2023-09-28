Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1906CCE7B10
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 09:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC0A42C79;
	Thu, 28 Sep 2023 09:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC0A42C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSx_FD8G2-Kg; Thu, 28 Sep 2023 09:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A72042553;
	Thu, 28 Sep 2023 09:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A72042553
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFCF01BF990
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970F840449
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970F840449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKYHY5yUjU6p for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 689ED400C5
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689ED400C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5733B82A35; Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 11:20:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0876080307ea6a2077492957ccda8bd56628b934
X-Git-Newrev: 725580a26ecbd554567880e95b8533b2c9baa5f9
X-Patchwork-Hint: ignore
Message-Id: <20230928092844.5733B82A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-c: bump to version 0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=725580a26ecbd554567880e95b8533b2c9baa5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable building apps thanks to variable added by
https://github.com/json-c/json-c/commit/bef40a342e98d090afff35ef565b41b22ddaa9a7

https://github.com/json-c/json-c/blob/json-c-0.17-20230812/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 44d068a8b4..c9bb8c708b 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b  json-c-0.16.tar.gz
+sha256  7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6  json-c-0.17.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 9af7f9a83e..517acee4db 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.16
+JSON_C_VERSION = 0.17
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c_project
-JSON_C_CONF_OPTS = -DDISABLE_EXTRA_LIBS=ON
+JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
