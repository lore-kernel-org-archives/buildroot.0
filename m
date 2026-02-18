Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17B0E9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3A061069;
	Thu, 19 Feb 2026 17:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ew9ZvyZLFhxR; Thu, 19 Feb 2026 17:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F187461047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521869;
	bh=wPFVfDlSSNQUMCLa24FKb73eH2LOwSB+u28gmnQsX0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DWBhrK6UGDN13pDKDUniyMSgJIKf/rVBeTq0UnB3YGS6H3qHmZAcL3bBiumC+V6bS
	 BsSKXWOzkAWpWca1nCgMRkXXtwEQVwWRN8CGoN03Nd1rwJQy/KXvvS1CzP89JxnAbc
	 I98+nQV89db2wTpnGFHV6KP+QS2JWjjGwJ5EpFX+u+GM1euDGQr+nuXi4Ior4NYbNV
	 87e1gEan6BG5vEP7fBYqxDCrlvgn6EMxnh0rzR8EYOLt/Oyt4UYg9piZiD3c42evNR
	 xjvZ3JBl7YpvDh3Qmyh4NXupLXQcJMA0zFtN0CRFm53Sp8u7Re9tGAINorkHmcnU4z
	 rtNK+Ou1loa6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F187461047;
	Thu, 19 Feb 2026 17:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 324AA1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E8640C78
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxdfLLYcgZp3 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D867940CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D867940CE7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5A7A86FA5; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:22:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8a6b3556651f14ccebe638562038dd6c08f1e9e0
X-Git-Newrev: b79b19a3e32a19ed240d509415d1f511ab9efaf8
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.D5A7A86FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/avahi: update
 _SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b79b19a3e32a19ed240d509415d1f511ab9efaf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The github repository lathiat/avahi now redirect to avahi/avahi.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 60d00e3548e0060bd819e2efcee28f206f01f713)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1efc05c025..9074b374f6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AVAHI_VERSION = 0.8
-AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
+AVAHI_SITE = https://github.com/avahi/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
