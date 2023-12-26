Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E7C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6280F80F73;
	Tue, 26 Dec 2023 20:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6280F80F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpD5NYszI5yC; Tue, 26 Dec 2023 20:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B933E81749;
	Tue, 26 Dec 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B933E81749
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFDF1BF95D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124F1408D5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 124F1408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqghNa1otNfA for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02BE74090E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02BE74090E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 786C483604; Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:23:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01689a9a65dceb15d453130b663a78ad9669aae5
X-Git-Newrev: 158edd5aa94b516cf8710e690431289da2545e40
X-Patchwork-Hint: ignore
Message-Id: <20231226202534.786C483604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump to version
 1.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=158edd5aa94b516cf8710e690431289da2545e40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A couple of bug fixes, including the following CVEs:
 - CVE-2023-49465
 - CVE-2023-49467
 - CVE-2023-49468

https://github.com/strukturag/libde265/releases/tag/v1.0.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libde265/libde265.hash | 2 +-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 9bb3f20a71..a21a8a1265 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  99f46ef77a438be639aa3c5d9632c0670541c5ed5d386524d4199da2d30df28f  libde265-1.0.14.tar.gz
+sha256  00251986c29d34d3af7117ed05874950c875dd9292d016be29d3b3762666511d  libde265-1.0.15.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 8624d2f949..62c22246aa 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.14
+LIBDE265_VERSION = 1.0.15
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
