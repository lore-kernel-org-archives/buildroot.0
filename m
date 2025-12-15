Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E6D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265AA60F0A;
	Mon, 15 Dec 2025 21:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFW2Y1SusutX; Mon, 15 Dec 2025 21:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B32460F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765835666;
	bh=h+BxYIp3WjAZXOUrglBze9vMRF3OSmVC73sDOb4pYz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tm8QQmbnBK0sfbdz68e5p9V/gE8k3MvY9ykoBfKgqmi07olodrt217YNMuN8o45pQ
	 1r4uX7Y8fwUv0/l9FboHuyN6wi9hbNJ/gPnx8fDkzPowUPEmMxpWuhIDBPGlyynEWi
	 rQdNyhdIE3KFCcjB2/sQkjBc3mfOir1lBNXRFpzWENdpzNe9yc60DERj/jwK2/vdGq
	 loz7ObIubuu9B/y43q6vxBHFNMCU6MCvRizerJDNibnuKtqzqlxi91XWOHlcGaig03
	 bY5R0L9FGzSijLirDRr3lr3uZ0YMTgmSjQeEkXFsrn4BmUpEK8LfllrtjWz7oi+Kv8
	 FZtnwqVdFY27w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B32460F0E;
	Mon, 15 Dec 2025 21:54:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD56B25A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42E24044C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjFjJwRSE9hp for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0789A40176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0789A40176
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:54:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB5C386FD7; Mon, 15 Dec 2025 21:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:40:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6540a02bbb6855bf98a1b9e95b571b4bd74ebaa
X-Git-Newrev: 40e3bc696495809d5bedc523ad3be94178c1b069
X-Patchwork-Hint: ignore
Message-Id: <20251215215422.EB5C386FD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump package to version
 7.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=40e3bc696495809d5bedc523ad3be94178c1b069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING.txt hash updated caused by this commit (updated year)
https://sourceforge.net/p/dos2unix/dos2unix/ci/8379cf345bde0267398f0753173f926dbebf1636/

Changelog:
https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index d4d682cd0c..3e9bf7882e 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
-sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
-sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.3.tar.gz.asc
+sha256  28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2  dos2unix-7.5.3.tar.gz
+sha256  bff21c3509fe7348c8327745b2f80d8847b04868073c6d0861bf8c773db66515  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index e30fc999d4..4c57a4de5f 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.2
+DOS2UNIX_VERSION = 7.5.3
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
