Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13501EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C292083947;
	Thu,  7 Sep 2023 15:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C292083947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUPBLzXQjKsD; Thu,  7 Sep 2023 15:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DBA83955;
	Thu,  7 Sep 2023 15:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DBA83955
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 297F31BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEB341DF3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEB341DF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7Ezf4G55N6M for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76DFE41DA0
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76DFE41DA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 616A386A27; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 23:40:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae04a4d116afffc84d8e3615acdafe7b9a78615
X-Git-Newrev: 8367c14188986f1387677f029a615998b2500868
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.616A386A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: switch from distutils to
 setuptools
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
