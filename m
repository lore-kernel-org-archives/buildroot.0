Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7354C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A316A83508;
	Tue, 30 Jan 2024 22:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A316A83508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBhS3RlFnQC9; Tue, 30 Jan 2024 22:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88AE83521;
	Tue, 30 Jan 2024 22:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88AE83521
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 467B81BF5DF
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C22A41BB3
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C22A41BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeWh054yeafG for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8503C41B23
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8503C41B23
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7209186736; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:56:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dfa4c56fe5dd1b584791b3c0c61dcf0b623aad5
X-Git-Newrev: 2953cd264489229adaef5f0a1f307900dcc3e425
X-Patchwork-Hint: ignore
Message-Id: <20240130220739.7209186736@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/joe: add JOE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2953cd264489229adaef5f0a1f307900dcc3e425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:joseph_allen:joe is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F530947-2060-4842-92B9-5BC61D9C5430

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/joe/joe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index f0cac402e1..9346ec1fd3 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -8,6 +8,7 @@ JOE_VERSION = 4.6
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 JOE_LICENSE = GPL-2.0+
 JOE_LICENSE_FILES = COPYING
+JOE_CPE_ID_VENDOR = joseph_allen
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 JOE_DEPENDENCIES += ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
