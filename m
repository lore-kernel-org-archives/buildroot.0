Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEB0C4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1AAF431AB;
	Wed,  1 Nov 2023 16:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1AAF431AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AtDdavauASd; Wed,  1 Nov 2023 16:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B6840180;
	Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B6840180
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5DF1BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3CE37042D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3CE37042D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bs7aJHrM9S1P for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6785870429
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6785870429
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 509FF86368; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:00:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7ef3c56c8912ae7edb3053b53fe7912d1a145b6
X-Git-Newrev: 6b8b5442cb94b0386021e85432ad22f1955f3b57
X-Patchwork-Hint: ignore
Message-Id: <20231101162447.509FF86368@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: needs host-swig when
 python is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b8b5442cb94b0386021e85432ad22f1955f3b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnvme/libnvme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 38394b9931..b393122c85 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -14,7 +14,7 @@ LIBNVME_CONF_OPTS += \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBNVME_DEPENDENCIES += python3
+LIBNVME_DEPENDENCIES += python3 host-swig
 LIBNVME_CONF_OPTS += -Dpython=enabled
 else
 LIBNVME_CONF_OPTS += -Dpython=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
