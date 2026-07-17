Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3938BC44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0546081172;
	Fri, 17 Jul 2026 15:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KI-DbyL7Gh_i; Fri, 17 Jul 2026 15:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E3981183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303173;
	bh=EPW57jzbW2laj/wVTR47dHHnLefe3g+ypjh8gfmamJw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PuJfj/Tr6F8g8++vuux1mFf/KB4rU8ioh8CAx1xnjnJqvOgZpMjDpSCiMhs8Mr6xN
	 Rt904ojid3pLpaPwIh20ZMhQYglkcNSIhovmxrG90ixAd96SHM8CT2O8Tv+s4+zaHH
	 gDD20yfjPH0E2CjRY/IDFfTX8/dzbOx2yn2jXC/1ZWLGt12QWZCQSAK6p4X7yVKk9P
	 X4/4Tflnlg0kekbA9xMAkYUbFq2Q7VPQHSDzufOzydS6UyZqJLxgbnico5R6r0CPcg
	 /P51n66RmO+oPEBwmj2A5Zqwsg1sFQXXDTCnmW2SNk3+mLd3A/N2NUaBmaDpoJdE7c
	 8QPnewfEoMM7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E3981183;
	Fri, 17 Jul 2026 15:46:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2141F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E3F60732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6nLbl3bf6Hs for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E2860ACD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66E2860ACD
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33AB588E51; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:15:14 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d7909644fe1c00dd13055e5b93c83bbdcaea91aa
X-Git-Newrev: 23a7737609b694df80c42270d957d3816b31430d
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.33AB588E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/stunnel: update
 download site
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23a7737609b694df80c42270d957d3816b31430d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fix the download site, which seems to be changed after
a new release. Use the more permanent /archive.

Fixes:
 - https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
 - https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9f7c484b4ab0190765dc81fb79083ae8e2be211b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index dc61f6d5b9..572f226861 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
+# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
 sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8bd680af32..adae204148 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION = 5.78
-STUNNEL_SITE = https://www.stunnel.org/downloads
+STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
