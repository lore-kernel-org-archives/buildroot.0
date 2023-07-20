Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0B4EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F26611EE;
	Thu, 20 Jul 2023 21:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F26611EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-NsrrTQxryv; Thu, 20 Jul 2023 21:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1B760812;
	Thu, 20 Jul 2023 21:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B1B760812
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA3C41BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C444C404DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C444C404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3qfwIE71fgD for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:29:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEBE44049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEBE44049D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9810874CE; Thu, 20 Jul 2023 21:29:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbec4980061421c301d511ceeb57163079f07632
X-Git-Newrev: 83651e1833f3f1845132800ed286bf91321e54a9
X-Patchwork-Hint: ignore
Message-Id: <20230720212907.B9810874CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=83651e1833f3f1845132800ed286bf91321e54a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.18.5.html

Fixes the following CVEs:

o CVE-2022-2127:
When winbind is used for NTLM authentication, a maliciously
crafted request can trigger an out-of-bounds read in winbind
and possibly crash it.
https://www.samba.org/samba/security/CVE-2022-2127.html

o CVE-2023-3347:
SMB2 packet signing is not enforced if an admin configured
"server signing = required" or for SMB2 connections to Domain
Controllers where SMB2 packet signing is mandatory.
https://www.samba.org/samba/security/CVE-2023-3347.html

o CVE-2023-34966:
An infinite loop bug in Samba's mdssvc RPC service for
Spotlight can be triggered by an unauthenticated attacker by
issuing a malformed RPC request.
https://www.samba.org/samba/security/CVE-2023-34966.html

o CVE-2023-34967:
Missing type validation in Samba's mdssvc RPC service for
Spotlight can be used by an unauthenticated attacker to
trigger a process crash in a shared RPC mdssvc worker process.
https://www.samba.org/samba/security/CVE-2023-34967.html

o CVE-2023-34968:
As part of the Spotlight protocol Samba discloses the server-
side absolute path of shares and files and directories in
search results.
https://www.samba.org/samba/security/CVE-2023-34968.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cc7eee620f..1901707f3b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.4.tar.asc
-sha256  6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53  samba-4.18.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.5.tar.asc
+sha256  095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f  samba-4.18.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a14cc63c01..edc0fee286 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.4
+SAMBA4_VERSION = 4.18.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
