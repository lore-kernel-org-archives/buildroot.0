Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479F2C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:10:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E49D60F39
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E49D60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D136A4039F;
	Wed,  3 Nov 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XWoZUm4Mvqd; Wed,  3 Nov 2021 21:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2A634038D;
	Wed,  3 Nov 2021 21:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D602E1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C66C180EFC
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIgKVep4lf4g for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2358380EF6
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F6308A444; Wed,  3 Nov 2021 21:06:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:07:20 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0c05b5d825e6965987df3510cf71298210a92d8a
X-Git-Newrev: 28763417d20fcf567fef76fe7fbbbd301641f1f2
X-Patchwork-Hint: ignore
Message-Id: <20211103210625.7F6308A444@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/bind: security
 bump to version 9.11.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=28763417d20fcf567fef76fe7fbbbd301641f1f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes the following security issues:

- CVE-2021-25219: Lame cache can be abused to severely degrade resolver
  performance

For details, see the advisory:
https://kb.isc.org/docs/cve-2021-25219

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e4bf1cf09dcf909629cce4649acb7f27a84ce05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 12b80149c5..70299f1677 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.35/bind-9.11.35.tar.gz.asc
-# with key E9AB6E79233C0416E8993F450C03AFA90A5967C4
-sha256  1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562  bind-9.11.35.tar.gz
+# Verified from https://ftp.isc.org/isc/bind9/9.11.36/bind-9.11.36.tar.gz.asc
+# with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
+sha256  c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681  bind-9.11.36.tar.gz
 sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0d95da209c..ba32d6150a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.35
+BIND_VERSION = 9.11.36
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
