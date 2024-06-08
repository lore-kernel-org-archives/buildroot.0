Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B59C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A637F42808;
	Sat,  8 Jun 2024 07:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU4ZjT1zkL6y; Sat,  8 Jun 2024 07:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466D442742
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466D442742;
	Sat,  8 Jun 2024 07:53:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEBE51BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00536606F8
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPU_05GeDfBc for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC5560760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC5560760
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AE1C87D7B; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:18:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1669a9efc0ac16f9b3c4a1cb816055eda43af3fb
X-Git-Newrev: fb1b33c040b787fd5f674d8c62fa40838089a887
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.1AE1C87D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libkrb5: security
 bump to 1.21.2
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
Content-Type: multipart/mixed; boundary="===============3429896324145249327=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3429896324145249327==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fb1b33c040b787fd5f674d8c62fa40838089a887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

- CVE-2023-36054: lib/kadm5/kadm_rpc_xdr.c in MIT Kerberos 5 (aka krb5)
  before 1.20.2 and 1.21.x before 1.21.1 frees an uninitialized pointer

- CVE-2023-39975: kdc/do_tgs_req.c in MIT Kerberos 5 (aka krb5) 1.21 before
  1.21.2 has a double free that is reachable if an authenticated user can
  trigger an authorization-data handling failure

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd1ea28b07e9b50facbee4aee0254631b9b4fe14)
[Peter: mark as security bump, add CVE details]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 2 +-
 package/libkrb5/libkrb5.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 22178d0dec..02c0e3396e 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  69f8aaff85484832df67a4bbacd99b9259bd95aab8c651fbbe65cdc9620ea93b  krb5-1.21.tar.gz
+sha256  9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491  krb5-1.21.2.tar.gz
 
 # Hash for license file:
 sha256  0d5373486138cb176c063db98274b4c4ab6ef3518c4191360736384b780306c2  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index c58763eddd..08bc74eb34 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION = 1.21
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
+LIBKRB5_VERSION_MAJOR = 1.21
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others

--===============3429896324145249327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3429896324145249327==--
