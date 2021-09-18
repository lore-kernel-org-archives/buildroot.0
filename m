Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4B9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C1B610A3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93C1B610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201134016B;
	Sat, 18 Sep 2021 17:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OThrZgdR66Cf; Sat, 18 Sep 2021 17:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3070B4014C;
	Sat, 18 Sep 2021 17:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E326E1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D22B040825
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPAlvbKq76NH for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 17:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6EB407F2
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 17:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 82C928B67A; Sat, 18 Sep 2021 17:42:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 19:42:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edb6d5f00b3563a8987a5d424f9149b39ce5eaf9
X-Git-Newrev: e3bdcdd596f916458f86aafc628608ba977d953f
X-Patchwork-Hint: ignore
Message-Id: <20210918174213.82C928B67A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to version
 12.22.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3bdcdd596f916458f86aafc628608ba977d953f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-37701: Arbitrary File Creation/Overwrite via insufficient symlink
  protection due to directory cache poisoning using symbolic links

- CVE-2021-37712: Arbitrary File Creation/Overwrite via insufficient symlink
  protection due to directory cache poisoning using symbolic links

- CVE-2021-37713: Arbitrary File Creation/Overwrite on Windows via
  insufficient relative path sanitization

- CVE-2021-39134: UNIX Symbolic Link (Symlink) Following in @npmcli/arborist

- CVE-2021-39135: UNIX Symbolic Link (Symlink) Following in @npmcli/arborist

For more details, see the advisory:
https://nodejs.org/en/blog/vulnerability/aug-2021-security-releases2/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 1552e937b7..8d39ef489d 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.5/SHASUMS256.txt
-sha256  f927ff6c2ac5a7234596031b18ba03febbcadd2650d375f1a3fd02426687fd14  node-v12.22.5.tar.xz
+# From https://nodejs.org/dist/v12.22.6/SHASUMS256.txt
+sha256  c2022f16b8f689620c3472c2b5261fdabbd0ab976bf9ac3b7db6747a2e9b0f7a  node-v12.22.6.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 39099b53dc..38e8936986 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.5
+NODEJS_VERSION = 12.22.6
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
