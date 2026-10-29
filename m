Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87912606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=feml7SiS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA1540A85;
	Thu, 29 Oct 2026 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YC7bKiboiTrP; Thu, 29 Oct 2026 20:23:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5928840A76
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305417;
	b=bu1dGjW0vtsROULZNl32BZDAEWRFqy3GrUNbsvaAD4GuQBSTFsi/WztuRTd5gUL3dpY8
	 vRcX4zov/NNTcvOZi+VYdToJdn0kU2EErfc5KneJI0DmFAIByIcfJWJ8ffZ1V+8ZnknNQ
	 jcHVVhyrpjUp2BK0eyZQKNIara6utB7Fs/BZTiLwd1h+t5q86tfpZm8KS1ltrV1vjN7Da
	 /Ek/bHtFG+ukaHShOPf4/ikKFgc3VSeIu0IRsXpYRyRamy+4RHI/wY/fHAYE1/fE4z5FY
	 Q02Cy9f+B+9LhnXgPB/vueEu8f+7KjzbJHMgz4r8s9S5/8s2gatkSKwUy2iga1eVzJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Il0dXEX6+gRFQBcjgUXxR8DI9qFAt44aSadkgEACr0g=;
	b=E5K8we3mh/+XClUDwS7s9Yd1Zmqy36rz9WAgVVknL3LMf9mJP/VBzbZDIZY7VIo8KYXh
	 oTobHiqylfTZFHQo2KrNpMJJSwUqVQz/In/X/P7oZHUiK2IigOZu3S2+KEMoeM605ol0V
	 6tOc5bI5Lfm92zTn0DSd5kpE5Ek83f6YY+pfxmIFBRRytZmT2K+Ek0ePO3Iewy02N0kU+
	 7dRK2B3wA2B4vGwGTIUF6MUOL9VaZhUmq1igHXCykXuBLNqBY2RJYuEMm7d1iPkLcqDcx
	 xnLmQ7YwWWOa52H71Zhc80cG+xCGW7gA4xyh4ttanIbo8EHMq0RmYNACIJzQunZ+UKw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305417;
	bh=Il0dXEX6+gRFQBcjgUXxR8DI9qFAt44aSadkgEACr0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=feml7SiSSuw1n0cWxWMjwl/7Rl1O+3aRPlwjMe+WRcGr6GJEQksus2NuNgrpen13S
	 qlYyIUX8YSudE01jj58nQZ9jtFuWkcaup7DFx94uStgo2W2IDNgrvncx8LhZ5FOweg
	 PihKYt7wRdMKencFMQd14cnEZKq9iB2pPUEMzzYJ1nK9VNc3ZezptZqPDT9ssOOhmg
	 SZtYR8gAuKsNJUjk2Hxcy+woRV1x15gcPa0y0o5uVR9hxLg0D+1K1uMTOTYT7lzce1
	 oTZ0Gc8hOHcUq4fH1FtJTHlmJK2CvZ4RRrEe2CAHtvZJYhRXwltANfaGDbWPtZ2V47
	 B0W7R4TKbWBzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5928840A76;
	Thu, 29 Oct 2026 20:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 261D73A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 048ED40A60
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_5N5swwwyXD for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D943C407A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=QLi7/7MAHsfJRdYAsL7krPmJX6aX8OqJrD8ImO77JuBUPmgVVg+H7VWV+7XJ37IHXerp
 GSudQQIPmq9rmiiWr58z9Q9bg54SP6gNfUuJBjOTZ5TEXxP4sTSSqzC6bYLV41FrTJXiF
 uVzRElor7P8BrCZrFyq0oSqr8Jzb6jAaVBqgvdFj96lSi9H9429ClMuCl9Ich54kaIzTM
 xsLlDhG6Ju04Yata+3JfOMpXVRH7BEkgl3Tzrm8SNt+Gu3DnNrof4ydQKYpfvTeZxCRqE
 cHK08mtuWAwr/q0W0tIjQi5Usk44RWpnzUZ4lcPfe2it4mUMiuRq2pX+ooLjHxQPKIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CdS8czUdnKm+OumJw/Vs53Va1kgZn9awwbw/Om0aiPU=;
 b=Ri9ZRLCTLG6FfWZS9+IoHAjTgo5SHRJYEPIIcnJlavR1+iKOM8CKT9FoX4bICnX1mKRI
 dZhRIGC6tQRn4ZD6svI/+Rt3MNuKzbIa0iXF594YUHdMzoqr+LSD0WquX9TGTpSVEuf0o
 KUtx8MqnBLgcoecTn0ubkQyo2ZizE3OYHEG1W8C6/oXzKNV5d+UtGYz02YKMaXia0MjUO
 zHyMMqNEEIw6jv1LBDZjXdYC/u8Mypv02cVa6N02pYZdT6inaqra9l6B51Lsbdi2Hc1mf
 3qYP6wR8ZBe2qBs8Y9uunCRZvm9+Nory0AlRXYEyFRbRvYCwiGQKF27NPVxE0dV3i4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D943C407A2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA729D2EE; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14e2f2c9894fc2dd699276cf7c12c0959f7e9808
X-Git-Newrev: 3634ac3c1d052141398dec4cd529ed10c53fce86
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.4FA729D2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: bump version to
 22.9.6-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3634ac3c1d052141398dec4cd529ed10c53fce86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-hts/0001-gcc15.patch  | 26 --------------------------
 package/kodi-pvr-hts/kodi-pvr-hts.hash |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
deleted file mode 100644
index a62c5f836b..0000000000
--- a/package/kodi-pvr-hts/0001-gcc15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 00:19:15 +1100
-Subject: [PATCH] Fix build with gcc-15
-
-Backport upstream commit to fix build error with gcc-15.
-
-Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tvheadend/HTSPVFS.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
-index 1fbf9d18..80f9fea3 100644
---- a/src/tvheadend/HTSPVFS.h
-+++ b/src/tvheadend/HTSPVFS.h
-@@ -9,6 +9,7 @@
- 
- #include <memory>
- #include <string>
-+#include <cstdint>
- 
- namespace kodi
- {
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index db2c69e67f..153d1c8d1f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c98e29433bf4a007662b20279748dccd95da7817ab73b7e78c0b45fbe31c22b1  kodi-pvr-hts-21.2.6-Omega.tar.gz
+sha256  36e04924b200700f8c4ab58f5333ff739e7ddbbf36fff642807f50babc7d9f48  kodi-pvr-hts-22.9.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0e34a4bb09..23e3ea0138 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.6-Omega
+KODI_PVR_HTS_VERSION = 22.9.6-Piers
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
