Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14505E7718F
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 08:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B9F403E5;
	Sat, 28 Dec 2024 08:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtlElMMoSOLu; Sat, 28 Dec 2024 08:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DEEC404DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DEEC404DF;
	Sat, 28 Dec 2024 08:51:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A299757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF07A402ED
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsdzgcbfPINu for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C794048F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C794048F
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D063A874AA; Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 09:46:47 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 41bd9a5839abc69458d0bf7e7263c72436313ac1
X-Git-Newrev: 0ee60ab4d3d1b2e56331afafe85cb6cf7141ffe5
X-Patchwork-Hint: ignore
Message-Id: <20241228085107.D063A874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/opensc: security
 bump to version 0.26.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ee60ab4d3d1b2e56331afafe85cb6cf7141ffe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security vulnerabilities:

0.25.0:

CVE-2023-5992: Side-channel leaks while stripping encryption PKCS#1.5
padding in OpenSC
https://github.com/OpenSC/OpenSC/wiki/CVE-2023-5992

CVE-2024-1454: Potential use-after-free in AuthentIC driver during card
enrollment in pkcs15init
https://github.com/OpenSC/OpenSC/wiki/CVE-2024-1454

0.26.0:

CVE-2024-45615: Usage of uninitialized values in libopensc and pkcs15init
https://github.com/advisories/GHSA-3q68-hm47-94vg

CVE-2024-45616: Uninitialized values after incorrect check or usage of APDU
response values in libopensc
https://github.com/advisories/GHSA-2mjg-798r-mxwh

CVE-2024-45617: Uninitialized values after incorrect or missing checking
return values of functions in libopensc
https://github.com/advisories/GHSA-cf2w-h975-2fpg

CVE-2024-45618: Uninitialized values after incorrect or missing checking
return values of functions in pkcs15init
https://github.com/advisories/GHSA-f2v6-mw6x-qmwc

CVE-2024-45619: Incorrect handling length of buffers or files in libopensc
https://github.com/advisories/GHSA-9vxw-3j77-cj78

CVE-2024-45620: Incorrect handling of the length of buffers or files in
pkcs15init
https://github.com/advisories/GHSA-9c2g-6v5v-57qg

CVE-2024-8443: Heap buffer overflow in OpenPGP driver when generating key
https://github.com/advisories/GHSA-mgc5-p43f-72pc

Release notes:
https://github.com/OpenSC/OpenSC/releases/tag/0.26.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1f4b4ccde7ceb379010aeb93458792202622d64b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opensc/opensc.hash | 2 +-
 package/opensc/opensc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
index 232222062c..e12d2d4bfa 100644
--- a/package/opensc/opensc.hash
+++ b/package/opensc/opensc.hash
@@ -1,5 +1,5 @@
 # Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
-sha256  24d03c69287291da32a30c4c38a304ad827f56cb85d83619e1f5403ab6480ef8  opensc-0.24.0.tar.gz
+sha256  837baead45e1505260d868871056150ede6e73d35460a470f2595a9e5e75f82b  opensc-0.26.0.tar.gz
 
 # Computed locally
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 008de9d4c2..11d1507d45 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSC_VERSION = 0.24.0
+OPENSC_VERSION = 0.26.0
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
