Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 11:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78BC83E90;
	Tue, 19 Apr 2022 11:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOqFJ81aqESV; Tue, 19 Apr 2022 11:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF8F82B51;
	Tue, 19 Apr 2022 11:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 731DA1BF8A8
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 11:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6109E82B51
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 11:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUgpzjYCdKwo for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 11:17:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A19682ADD
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 11:17:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4KjLqk6d65z9sd5
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:17:22 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1650367040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5KMkg/Dkb6DfpglH/5oWgBOkrFMF9SsEVSbb1rb5fMA=;
 b=zoWqz4Tn2ujRjy7TDwsJwYSQF6l00aTqzkJtiumxvrQUHlfUZI+1KNtC6dY8dZqxwE6oa6
 0SJeWV9k24BB5pR6unmH2sPVJQoM5a56R0Wt1aGv20jjaV0p6CYjU25wQ0cImCXCwrRwiK
 5DyLyGzyF2onBv8aPrTSJGUS314J6b4k8ImSWmRXzeINqypb421F7B4CTuEiHj11+zmqrC
 raHfglksjAt8E8VauVddAZy54XIRPojsD3747P0iZK9V9i40g4P/kdAj0yKuhldt8SqynE
 h73sc2PEGl7IB/9WtAKmOujH8paJEPTWyxojInP/Ret/u0zQeh7tOHiObvnFeA==
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 13:17:13 +0200
Message-Id: <20220419111714.1647112-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gzip: security bump to 1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2022-1271: arbitrary-file-write vulnerability

zgrep applied to a crafted file name with two or more newlines
can no longer overwrite an arbitrary, attacker-selected file.
[bug introduced in gzip-1.3.10]

https://www.openwall.com/lists/oss-security/2022/04/07/8

Other changes:

** Changes in behavior

  'gzip -l' no longer misreports file lengths 4 GiB and larger.
  Previously, 'gzip -l' output the 32-bit value stored in the gzip
  header even though that is the uncompressed length modulo 2**32.
  Now, 'gzip -l' calculates the uncompressed length by decompressing
  the data and counting the resulting bytes.  Although this can take
  much more time, nowadays the correctness pros seem to outweigh the
  performance cons.

  'zless' is no longer installed on platforms lacking 'less'.

** Bug fixes

  zgrep now names input file on error instead of mislabeling it as
  "(standard input)", if grep supports the GNU -H and --label options.

  'zdiff -C 5' no longer misbehaves by treating '5' as a file name.
  [bug present since the beginning]

  Configure-time options like --program-prefix now work.

Release Announcement:
https://lists.gnu.org/r/bug-gzip/2022-04/msg00011.html

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 1cf73ff912..80b86f4797 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907  gzip-1.11.tar.xz
+sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 92588fcdb8..2092df363c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.11
+GZIP_VERSION = 1.12
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
