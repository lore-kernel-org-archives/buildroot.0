Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C6BC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C4D60A47;
	Mon,  5 Dec 2022 12:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C4D60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xPBhUUWmlQJ; Mon,  5 Dec 2022 12:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A0F60A71;
	Mon,  5 Dec 2022 12:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A0F60A71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 239A01BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E62E4063E
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E62E4063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOOtu6HhwyLU for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3680A40602
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3680A40602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32CDB85B9B; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e83212051cc8b79171a50a5bf965f8a2a32ec6f7
X-Git-Newrev: 610135d8848cb47fb0524b12887683b8352bcb45
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.32CDB85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytz: enable host python
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=610135d8848cb47fb0524b12887683b8352bcb45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required by host-python-babel.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytz/python-pytz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index ccf8e2179c..58f06e1993 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -12,3 +12,4 @@ PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
