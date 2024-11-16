Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485A8D68BD2
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 09:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0555981205;
	Sat, 16 Nov 2024 09:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCG2ruuf5GW5; Sat, 16 Nov 2024 09:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC38E849C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC38E849C3;
	Sat, 16 Nov 2024 09:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62015B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C714291C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5tqtMUCGZ4g for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDFA42977
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDFA42977
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B874086381; Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Nov 2024 10:47:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 649b31fc6d29d4fc5788ab13e32d704de63b2a0c
X-Git-Newrev: 0416ae0ed5853cd7da4b34e9f8cd17baabf503f0
X-Patchwork-Hint: ignore
Message-Id: <20241116094926.B874086381@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: security bump to version
 1.21.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0416ae0ed5853cd7da4b34e9f8cd17baabf503f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the change log, see [1].

The license hash file changed, due to the year update.  See [2].  This
commit also adds a comment in the hash file about the pgp signature file
source and key id used for the verification.

Fixes:
- https://nvd.nist.gov/vuln/detail/CVE-2024-37370
- https://nvd.nist.gov/vuln/detail/CVE-2024-37371

[1] https://web.mit.edu/kerberos/www/krb5-1.21/
[2] https://github.com/krb5/krb5/commit/fec2c44ee93bfd3282bed99509a941d56a6e2c21

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 6 ++++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 02c0e3396e..0403b3aed0 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491  krb5-1.21.2.tar.gz
+# from https://web.mit.edu/kerberos/dist/krb5/1.21/krb5-1.21.3.tar.gz.asc
+# with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
+sha256  b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35  krb5-1.21.3.tar.gz
 
 # Hash for license file:
-sha256  0d5373486138cb176c063db98274b4c4ab6ef3518c4191360736384b780306c2  NOTICE
+sha256  7601361a275aadbe35c90185519323c28730d60c553683e56fd06cf9c5f749a6  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index def627d422..e57a2b98a2 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.21
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
