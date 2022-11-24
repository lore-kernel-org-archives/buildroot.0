Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D179C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 13:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEF49410BB;
	Thu, 24 Nov 2022 13:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEF49410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3RUMtxKN8Ur; Thu, 24 Nov 2022 13:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D1E9410BD;
	Thu, 24 Nov 2022 13:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1E9410BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2461BF419
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 13:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E9341976
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 13:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E9341976
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlT2cCMBqcLO for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 13:53:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003C74091D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 003C74091D
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 13:53:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2E6C60009;
 Thu, 24 Nov 2022 13:53:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oyCfX-000f8W-AS; Thu, 24 Nov 2022 14:53:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 14:53:34 +0100
Message-Id: <20221124135334.158081-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libkrb5: security bump to version 1.20.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2022-42898: In MIT krb5 releases 1.8 and later, an authenticated
attacker may be able to cause a KDC or kadmind process to crash by reading
beyond the bounds of allocated memory, creating a denial of service.  A
privileged attacker may similarly be able to cause a Kerberos or GSS
application service to crash.  On 32-bit platforms, an attacker can also
cause insufficient memory to be allocated for the result, potentially
leading to remote code execution in a KDC, kadmind, or GSS or Kerberos
application server process.  An attacker with the privileges of a
cross-realm KDC may be able to extract secrets from a KDC process's memory
by having them copied into the PAC of a new ticket.

Bugfix tarballs are located in the same directory as the base version, so
introduce LIBKRB5_VERSION_MAJOR.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 2 +-
 package/libkrb5/libkrb5.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 2fce24b45b..94dfa2ed6e 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7e022bdd3c851830173f9faaa006a230a0e0fdad4c953e85bff4bf0da036e12f  krb5-1.20.tar.gz
+sha256  704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851  krb5-1.20.1.tar.gz
 
 # Hash for license file:
 sha256  cfadcf7b2ead2f3af793c25c00638c9908ac0023b101695f40cb9a03b16811dc  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 5e547470ed..9bacfaee58 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION = 1.20
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
+LIBKRB5_VERSION_MAJOR = 1.20
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
