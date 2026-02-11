Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E499ECD6D6
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19918401D;
	Wed, 11 Feb 2026 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDtzfqBdUPuu; Wed, 11 Feb 2026 20:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B608401E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770841030;
	bh=ZPnuy30ew+/Mcvi5mtUJb5aeQ5T5C0SCk418Yf41n7g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D3tShl0L9VMBAnqWTMoeqHREVWB7C2XE7fgbKf4aAL4v6w87jXWyCBCBebxnEsuAl
	 ufQbc7A2MwlEqbxFUkU2syhmmqeAEYc7VnwWF1Sli98eiNrraFvNrZ4s+m/MTpNRsU
	 bqAjdrTyamkw+syy/HAH+zWYDIzBVtR9jGVRTMxAXNHvR30EIka79TwLXk3skbz88z
	 Tgf57s5jfXCRmsALIll5NmGhxzm3QfpfssJKwGBobfwKVmneN14mwDDuP6n4iKxO45
	 Ff+k9F79n20Y4mdWfRV3uxvalXVaBDCjBQC+j9Dd+cBhSboC7UEi//lAXV2cHiZXeh
	 NFtOAGwwpqyzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B608401E;
	Wed, 11 Feb 2026 20:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B75FB23D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8956408F7
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sbk2e47W_apM for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BDF408CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7BDF408CD
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B640086C03; Wed, 11 Feb 2026 20:17:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 21:09:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8e89786f92ac65e10c76b8ce3b0d833cfbaf48f
X-Git-Newrev: 267fac241c80054bd1b96ed1f2b1a569a96f0985
X-Patchwork-Hint: ignore
Message-Id: <20260211201706.B640086C03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 6.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/267fac241c80054bd1b96ed1f2b1a569a96f0985
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated license hash due to copyright year bump:
https://github.com/strace/strace/commit/4d6755b556fb00fe5c33b09b08f951bad956c580

This bump includes two upstream commits
https://github.com/strace/strace/commit/bf9384561f295340f85c69deb307740fc9dc28f0
https://github.com/strace/strace/commit/822b5e840dbf4a80262eaea455d9bc7b6a00d245

that fix build errors introduced by the bump of linux-headers to version
6.19 with buildroot commit 566150745bf61fdc1aee68fcf319bc4e8942960a.
This bump is not included in any buildroot LTS branch so no backport
necessary.

Fixes:
https://autobuild.buildroot.net/results/7a3/7a35bfcae87b1fbe1d6e0c4271a364ce330c1d51/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strace/strace.hash | 8 ++++----
 package/strace/strace.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 268045ef1d..63c32a53ef 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature with RSA key from
-# https://raw.githubusercontent.com/strace/strace/refs/tags/v6.18/GPG-KEY
-# https://strace.io/files/6.18/strace-6.18.tar.xz.asc
-sha256  0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325  strace-6.18.tar.xz
-sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
+# https://raw.githubusercontent.com/strace/strace/refs/tags/v6.19/GPG-KEY
+# https://strace.io/files/6.19/strace-6.19.tar.xz.asc
+sha256  e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143  strace-6.19.tar.xz
+sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5230b4d60c..3f9e68820c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.18
+STRACE_VERSION = 6.19
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
