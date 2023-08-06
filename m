Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BBDC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 395E060FC6;
	Sun,  6 Aug 2023 21:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 395E060FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaN_9Vn0bqAG; Sun,  6 Aug 2023 21:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8153F6100F;
	Sun,  6 Aug 2023 21:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8153F6100F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 278951BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 938A1400CC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938A1400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD9zEhySRtfc for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D579140438
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D579140438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C308784633; Sun,  6 Aug 2023 21:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 23:40:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ae04a4d116afffc84d8e3615acdafe7b9a78615
X-Git-Newrev: 8367c14188986f1387677f029a615998b2500868
X-Patchwork-Hint: ignore
Message-Id: <20230806215216.C308784633@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fail2ban: switch from
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

commit: https://git.buildroot.net/buildroot/commit/?id=8367c14188986f1387677f029a615998b2500868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fail2ban/fail2ban.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 7ad22d02d1..828dfdd6e1 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -10,7 +10,7 @@ FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
-FAIL2BAN_SETUP_TYPE = distutils
+FAIL2BAN_SETUP_TYPE = setuptools
 
 # 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
 FAIL2BAN_IGNORE_CVES += CVE-2021-32749
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
