Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3F7D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F8F606A3;
	Thu, 22 Jan 2026 19:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCGNhhlhaDK0; Thu, 22 Jan 2026 19:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91A1606B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109113;
	bh=6RukOllsbrVqQ49OlX8X+oNexdHE8QT9jfF/VGWOb1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IMeXdu0QvC8D8LLP3sibLqKYT+MVpmZC2wleBNUb+cOXtGGjwZS0JwFSm/mmgbLlx
	 pOSYcPViIJRQhYZ80ksu9vLEm8dJ3YeqNiGc0plz+ezFUj532IBCOVHS5FNtEOKNcN
	 HrCvtmv6BYlkVBo+z/OK9+dPjqwWBJ4QxrYak9oZgT8OBkahi8iF8lo4Ypy7z/fdiH
	 bxi1+WyFUDUG60x3xGG1FembQ+71mpP/yHnbDvomAextLhXJOAjyKT/9NXiNpivfYX
	 LOwtpU+lYNKsdhFb/0uUmaQhSKbH0HIeO1AcOSVziCvl0H5AG2uGSoh2niU5T50hKm
	 3TM7uJsJm6Kag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91A1606B1;
	Thu, 22 Jan 2026 19:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6155F122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52B9B606B1
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZ6zcQtMMKFe for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D78606A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D78606A3
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A13787537; Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:10:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa1bdd38ff6a868e28105cca75815fdbeb77b21c
X-Git-Newrev: 3b521d33078fc4ff67935dedf180532969db39ec
X-Patchwork-Hint: ignore
Message-Id: <20260122191151.6A13787537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: bump version to 1.0.53
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b521d33078fc4ff67935dedf180532969db39ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jedisct1/pure-ftpd/blob/1.0.53/ChangeLog

Updated license hash due to copyright year bump:
https://github.com/jedisct1/pure-ftpd/commit/bb162a22de772a810f802da61c7b103ae701c28a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 2c7a1849ff..b31afb2956 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b3b879468275e0344555458c8e62465dcf525205ecf9ad78c3f208557d0c1947  pure-ftpd-1.0.52.tar.bz2
-sha256  1ec531b1bc4035019545d6a83e260a5a56d3a6bec52895393e9f25965e608e85  COPYING
+sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index fb247f51ca..bf2599ecaf 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.52
+PURE_FTPD_VERSION = 1.0.53
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
