Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F9CFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7717040374;
	Sun, 30 Oct 2022 10:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7717040374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1TJnAjV441I; Sun, 30 Oct 2022 10:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6D1F402F7;
	Sun, 30 Oct 2022 10:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D1F402F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71CE41BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D77B402F7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D77B402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjHxX0W7O7bL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D6C6401A3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D6C6401A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ACC88745F; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:41:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06a9dc3528847ec6c12a9b6188d4106e086eabe5
X-Git-Newrev: 4ed6d61c03bf9e1ce7830bafcfeca683e6c93592
X-Patchwork-Hint: ignore
Message-Id: <20221030104205.8ACC88745F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: support building
 kcapi-dgst application
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ed6d61c03bf9e1ce7830bafcfeca683e6c93592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just add a new Kconfig option in order to support building kcapi-dgst
application.

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkcapi/Config.in   | 3 +++
 package/libkcapi/libkcapi.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 8243f6b738..8f2cf7ecc4 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_LIBKCAPI
 
 if BR2_PACKAGE_LIBKCAPI
 
+config BR2_PACKAGE_LIBKCAPI_DGSTAPP
+	bool "build dgst application"
+
 config BR2_PACKAGE_LIBKCAPI_ENCAPP
 	bool "build enc application"
 
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 30d500696b..c6e58c6a9b 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -17,6 +17,12 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_XMLTO=""
 LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_DGSTAPP),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-dgstapp
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-dgstapp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
