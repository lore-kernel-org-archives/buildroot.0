Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A2C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289E242A80;
	Mon, 20 Feb 2023 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289E242A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzEIu6u_6ZgZ; Mon, 20 Feb 2023 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE8D42AE5;
	Mon, 20 Feb 2023 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE8D42AE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 118061BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 218BA40C13
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 218BA40C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QTW51pi2E-E for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4754540C14
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4754540C14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 382D48648F; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 15:36:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45bb69c2bdee44346d6be5b58e46b2278e40a04a
X-Git-Newrev: f93c47fad847219e2d748570484ca800faa9d4eb
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.382D48648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libkrb5: security bump
 to version 1.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93c47fad847219e2d748570484ca800faa9d4eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
