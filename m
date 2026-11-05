Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD949606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yyb/Czig
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC774608AB;
	Fri,  6 Nov 2026 15:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvcXmxhFRk8i; Fri,  6 Nov 2026 15:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B80F6605A7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980723;
	b=O1zZxAKAJYe18t+FDdSgLBaSdOhvc3OjXoboODjxbeZXX7ANUfQkSGiXD5moHartU1/I
	 pj2G21Q5d21IGY3eeJ6uGow72yXDZYgnLWEEHP5t0rOjw2tnc2vyLP38cUwe4DvP7Hj8B
	 ZGEOwiL0zqE8J8qoXj/BkrRrvX37r0+8kKkg5rKQlMfHHO8gEJMXyQ8t/bSLOBq+FfidH
	 bTMTEi+UFl8G4EzxVpV3ehOIeIPmIhPtlhXMFnDdURnNLMyEgI5t9i1plddurok1eirmg
	 PBvB4xLdvs5pQzkkPfvMBGD46yyYPFlDAAGRI8EFP3B8242zNSbd1PUiwZThN/UKOEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gwnnyk/qVbENrQYVr9t0PYu56UbaS3u/xh1Vc6hRx2g=;
	b=WzTIWvjZr34y0stoLTLGrG1lUzzMboPai4tKz7s0V5J64MRd5AyYQtLg/uXRRCIWOLm5
	 LLVUnTUOy3MXLBF6ECZKcf7FgWwNRSGuOQqJvLPPf4t5nwDMA+zi8MdlMYQoI/gOSesT7
	 APwXLDvGq2UVKbnT7pmqtht85gDmhs7DFLoEB0hIjv3KkS3GmdGIZmGkIsgeAFHCh43Tf
	 1WGQ34jQrT+/PL82yP+NYYI0zvRc1iC0rCfLRXLqfTw0KEQZ4J9DkCBK8Ik+/s0ojLivt
	 VuzzjeTarKfg0e+CNBoxotaHiorr9XH2JCKc3JCfTy4sCNStN5ndukPpCISvjeAsKdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980723;
	bh=Gwnnyk/qVbENrQYVr9t0PYu56UbaS3u/xh1Vc6hRx2g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yyb/CzigcsST0hKhWkGEd9l67+03C8zAnQZI0gBIQl8qGzISkeI1nj731CYa+8B/b
	 tMUbD6ELZC3Q10bTZiPH4byg/YA8Aty9XBKzGxoJFnjfoKXvm22RLv3njdFFC+x3ec
	 yl272LfUMXWvxf3ni2cUbBQCyrRblHD6eKNL0GNOqZlO/XEadrU09/p1iOVGSyenrW
	 44SACv3rVy4P2zHeTeYSbo0Msq7E564WM5JPk6KVFfFt+EK7wJZkkNr6qqMrk0gdqI
	 45Ccqb9SG0Ay89FDZh8i0oiwjUTSOtUH1dgvfexHxWKoRTOxSvXRII8IPVcp9MX885
	 a3b/3ef30v8QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80F6605A7;
	Fri,  6 Nov 2026 15:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB41D36
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABB540949
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4A21_LRs_G3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4721F40911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4721F40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F3DE9E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 10:31:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ceb557bb180db934a51132d860aa28bd19064bd4
X-Git-Newrev: d07e0a9bfc73981dfe2975cfaeec72e5be8d8bef
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.7F3DE9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/suricata:
 security bump version to 8.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d07e0a9bfc73981dfe2975cfaeec72e5be8d8bef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315

Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761

https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391

Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228

https://forum.suricata.io/t/suricata-8-0-7-released/6467

Fixes 67 security bugs, all CVEs are pending.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 510003c0411a915d71709417e53d2bd62be9f999)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 15f7e666b3..a5b7807d60 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
+sha256  a9d46a9c8f40e81f8a6df3ecc2c5a9a8e8da985876299108d92da547c013ba8c  suricata-8.0.7.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56bbc0c89b..d77652162c 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 8.0.4
+SURICATA_VERSION = 8.0.7
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
