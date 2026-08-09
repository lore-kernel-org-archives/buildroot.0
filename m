Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D123CC5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A202280CC4;
	Sun,  9 Aug 2026 15:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lNbxn07gkzF; Sun,  9 Aug 2026 15:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C3180CC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786288060;
	bh=meVBv+4Wwhqg9is8qaY61gOOUvMtc7Nj982rAQnXxPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aGZaZVoLmVSYKlOvESp2xQsAJ8WPxhBhp7lPbU1dfUDnSrbzMR4rbGTOZRaGYx31i
	 LmzpwYrO524V7uuXmOA4bWE2VkTCq32NO5VjGM38k3q0jmDhnTvYk/9oKJh+Qgu8PW
	 +uQTMSu6f3YiwP3BHuWCP0Cr/Em5B8rmu1l9PEqtinB6thmoVsoteHe+mxPjZXkA5G
	 CULrdW7+3KLGF4hJjUdEOVI9M0++Dfi1Q8cnYTOby6p4UGtR5W8X2+VLM6njRsVrkd
	 m0ht2WgSSvJ8Y9ZAcr2/8iBXPsLVShygZ2yL5FMTJBvuJmTkFHNTBc4JpUSKggC3FO
	 qvr0fxr4tlZWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C3180CC5;
	Sun,  9 Aug 2026 15:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B26296
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4044D40539
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPIMPmLrjum9 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9DC40536
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E9DC40536
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C022D8D239; Sun,  9 Aug 2026 15:06:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 17:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa86d079d7afa6bce8ff213fb992900b8c27c71
X-Git-Newrev: 8b6eea299b3e519a6dac908e5ceed49cc43c4698
X-Patchwork-Hint: ignore
Message-Id: <20260809150650.C022D8D239@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: security bump to 5.80
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b6eea299b3e519a6dac908e5ceed49cc43c4698
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes following CVE's:

CVE-2026-70368: Fixed an out-of-bounds memory
access triggered by logging attacker-controlled protocol messages longer
than 1,024 bytes (thanks to AISLE Research and Clemens Lang).

CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
destination filter using alternate local-address encodings and
interface-scoped IPv6 destinations (thanks to AISLE Research and Clemens
Lang).

Complete Changelog is here:
https://www.stunnel.org/NEWS.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 572f226861..f966e19f05 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
-sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
+# From https://www.stunnel.org/archive/5.x/stunnel-5.80.tar.gz.sha256
+sha256  6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513  stunnel-5.80.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ef93dc6073..a8eb652bff 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.78
+STUNNEL_VERSION = 5.80
 STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
