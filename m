Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CEFCAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A022A4235D;
	Fri, 26 Sep 2025 19:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3NjLFCBmb4S; Fri, 26 Sep 2025 19:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5D741970
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5D741970;
	Fri, 26 Sep 2025 19:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 823AD198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6868B84BB9
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUElQbM8oXSr for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 19:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E7184B9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E7184B9F
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A6F386509; Fri, 26 Sep 2025 19:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 21:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e67ae519feeb5449329ed950878b91ac2c945c4
X-Git-Newrev: 800dcabe6568001503dce30644978ad82c332424
X-Patchwork-Hint: ignore
Message-Id: <20250926194050.8A6F386509@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: security bump to v0.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=800dcabe6568001503dce30644978ad82c332424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more details on the version bump, see:
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=301d0e16dfa8a5cac1cff956b6880ca90eb82864

Fixes the following vulnerabilities:

- CVE-2025-8114

    A flaw was found in libssh, a library that implements the SSH
    protocol. When calculating the session ID during the key exchange
    (KEX) process, an allocation failure in cryptographic functions may
    lead to a NULL pointer dereference. This issue can cause the client
    or server to crash.

For more information, see:
 - https://nvd.nist.gov//vuln/detail/CVE-2025-8114
 - https://www.libssh.org/security/advisories/CVE-2025-8114.txt
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=65f363c9e3a22b90af7f74b5c439a133b1047379

- CVE-2025-8277

    A flaw was found in libssh's handling of key exchange (KEX)
    processes when a client repeatedly sends incorrect KEX guesses. The
    library fails to free memory during these rekey operations, which
    can gradually exhaust system memory. This issue can lead to crashes
    on the client side, particularly when using libgcrypt, which impacts
    application stability and availability.

For more infromation, see:
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=87db2659ec608a977a63eea529f17b9168388d73
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1

The v0.11.2 already had a fixed for CVE-2025-5318 but the NVD reference
mentionned wrongly the version 0.11.2.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 161d5b1e58..1c15d77a45 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.2.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.3.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  69529fc18f5b601f0baf0e5a4501a2bc26df5e2f116f5f8f07f19fafaa6d04e7  libssh-0.11.2.tar.xz
+sha256  7d8a1361bb094ec3f511964e78a5a4dba689b5986e112afabe4f4d0d6c6125c3  libssh-0.11.3.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 7bcf077929..3c7e77a206 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).2
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
