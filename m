Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA552606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fm4zwFtI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A0B40BFE;
	Fri, 30 Oct 2026 14:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX42eilJRLOH; Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA67940BF3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369260;
	b=HM1MzgRk7+SzYjFAlMihokyUGcCmi6f5hAcgi5eLbWdVFoD5Tmr8cJOlob7nWQM0knLx
	 /7mOFKDSHpkHeRRd7y0tL561lOI3KkvG5E3vvqWEPYGSQio9XrCLKcXDJbMQQYWJUeJTd
	 jsjDPUXySFrCyqMgTy4rzshk/wckC8Vcu54+yLN/ZmYaw76L+bWe5MJWLwaJTTVHL6GC5
	 55F9gsGW0PyjioHGYRStzr7ET3milJj0wl0U2g1o4VEMfw/EF8vvDLa/OCyFWUWPJO/81
	 udmbll83eDepwnIbJNSFo1W/rVi+K87gojZtbXk+X6QuigkZvt4hwnMZ0Wifg743AaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=j5+EWkM8YEgv/rjhQRx4zUvREp9tXhN36qg/5QrpHSE=;
	b=pOInOXFS/HmbG6Q+TUbY5J/ETH0KSaEYCbnHUPx0tnRTD9eiXLoALEZjGTEKKHr19nyq
	 BIAVOqCjBy48oUCu53m/1AXo83CAhLZr0qnp1k3LirYSq/y1OR1vGjUaCJnaC0u4G3zXX
	 eyHzsynWrldx1WBsdIuO7YBqm1Dkkz4PT7eoBAPl9LqO4d/1TKZe+mH8Y2F9Yq8HZTVoG
	 whAd8Mu3T2JpBsTDpqEaynuSIEbc8x6jaDpNZd7Cv3/0Mx/s+axr3zMGaetmk4i3ik93j
	 bjoCC5zrBzaMjAZwluGjzNy9g/qEFy8iW/0kwULFncNAb7zsaoKXFGJxpqE/fuFl5jg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369260;
	bh=j5+EWkM8YEgv/rjhQRx4zUvREp9tXhN36qg/5QrpHSE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fm4zwFtIA7oh8aamve5yind6MKD0lE+0GliWliZJY8/vashJ5D2HzvKixqWZQRFDE
	 60ceP7FwHIkLpWpt/UNfO9Fz9XYwPG1z48QkYh9UeGWz1IrMoGVGwF+HJrVrI7tjY2
	 8TD7eTfiPkFDAofWyfo9vZeFng4ct90qQasySUCkXkjtMSy8y2PppyHIrKexAiaVTE
	 8Hz0PFPKvafJ4RhcSBBdtTm23mgvF3P7xv/GJ8s9W8HL4P4wiGnDjA2C0mfs2+JUaw
	 qpS5olPlXrqBLWGVkqEPhbShszfAAEHQqk/PqDdmhmrxylyC4lBJ17OiVCiBRWMkfK
	 GbyXzduLlczew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA67940BF3;
	Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5F55D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F4060AF3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJpmsUKBu0HB for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3AA060AF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=XJA3iGPjyycPPHx4j21cVkMfB5TTyPkZXqJa+DNt7RT/5seHBM2aF0fGb/cPq4hct39C
 lWsDnsilbHXchvppa6Y7ECSFSDXp0jHCWfh/Z2wn/2uN8HH8N9gqVKaJC9kI8a40S9ixY
 e3AMErriXJN6pWCFUYxPsm+mzRQZNQm2gQ21uyWbIc9HEcWri/RH+2rQAUPLEW1hrTSfB
 fzhd61NsHh6iPfbpGjf8GI57YLUA7TDyasXzrSrvhG4foXrNkFcO6p8GrburNcbfZlnUw
 ghc2q2TXBM3g2VDjxNEgr8gcPUN7C12JPAhgGHvXPyCm9oF1aH/w0WYyB2vX8y29vIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qgJbsot4mWNbqROPJg3OO/AkLCGJIFuHbvxFwRie+0M=;
 b=VabsWGsB6hA40HvZs3T8+cBDb/8Wti9GHrRtR1JjbeXKO1WLKIUwsyPch/B1b/yQfVDz
 Nu4lBmjx379zPIyFSzbdzPcCS8xY//EcRjrYCUC8lp5kv7g4RF62sJJK9uOqg/Lt7Hdlb
 eDjHk2Qvf3HEB/Y5+xwhn21jZx6vAs9ldglLhRMxfbX6LKxdh/XQmKfjPmdBIn31Dp37R
 ZvEGeLOIc/DkOl5ROiamaxEaA1LLhu1UKe/ETIabyEBxyb65/A6feR6CDHlD++wHds5I7
 /yrtCq7Iv9RdBUC/9+Xg/veixIRQYyT3Zx1UAKquuMjbQ7i67//Q4T6J2wWBc1qVLyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3AA060AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02BC9D38C; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8d226856b25d69f540afcb0ce46e554e2211b61f
X-Git-Newrev: d7b7aae5600b6752de3b0e400737410268c722d5
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.E02BC9D38C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.112
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0006662419203678440=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0006662419203678440==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7b7aae5600b6752de3b0e400737410268c722d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_112.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2688f40ffb83d1f5d03b4882517e0aa5c9a8ce71)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 03e91e4212..00bc5baa45 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_111_RTM/src/SHA256SUMS
-sha256  5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6  nss-3.111.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_112_RTM/src/SHA256SUMS
+sha256  33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68  nss-3.112.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1ea6af4fd8..ce267a2adc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.111
+LIBNSS_VERSION = 3.112
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============0006662419203678440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0006662419203678440==--
