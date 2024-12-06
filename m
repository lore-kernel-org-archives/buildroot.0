Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE8DE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 11:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E9E612F2;
	Fri,  6 Dec 2024 11:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnE_FRwP5bxr; Fri,  6 Dec 2024 11:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA0EB612F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA0EB612F7;
	Fri,  6 Dec 2024 11:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C021ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 11:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BAF0407C2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 11:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRH4nrUAER-4 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 11:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509E5407B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 509E5407B6
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 11:52:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B7AC86A30; Fri,  6 Dec 2024 11:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 12:44:31 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ba7bd5efd05008cc0cbbdee1e80754c829bc7baf
X-Git-Newrev: 9bd1746ee41a864a2bd6c9679e6cfa3cc456e8b1
X-Patchwork-Hint: ignore
Message-Id: <20241206115200.4B7AC86A30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/frr: security
 bump to version 8.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bd1746ee41a864a2bd6c9679e6cfa3cc456e8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

8.5.5 fixes the following security issues:

- CVE-2024-31948: bgpd: Fix error handling when receiving BGP Prefix SID
  attribute
  https://github.com/FRRouting/frr/pull/15628/commits/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138

- CVE-2024-31950: ospfd: Solved crash in RI parsing with OSPF TE
  https://github.com/FRRouting/frr/pull/15674/commits/f69d1313b19047d3d83fc2b36a518355b861dfc4

- CVE-2024-31951: ospfd: Correct Opaque LSA Extended parser
  https://github.com/FRRouting/frr/pull/15674/commits/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a

8.5.6 fixes the following security issues:

- CVE-2024-44070: bgpd: Check the actual remaining stream length before taking TLV value
  https://github.com/FRRouting/frr/pull/16497/commits/0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 4a61084bae..86575dae8c 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
+sha256  5f3a32e66efdf2628548165d10327688847443c342788b31c4ea98368cfacbf8  frr-8.5.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index a4b4bccaf9..c794d91a4e 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.5.4
+FRR_VERSION = 8.5.6
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
