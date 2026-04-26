Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D7FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A389984B60;
	Sun, 26 Apr 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7q44G86PEz2; Sun, 26 Apr 2026 18:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3F684359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777229801;
	bh=pGCz+GaO0+RJwvCI5OR3F+n/RECHfb6gxNpy4GedkwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ww4L9/+0TEwyNvyqkNwSC+rhVhV9/mvUuewzrajiMkajYYbOGnHPDWGal093+WgI9
	 lllKwDO9Ful2bDUvXw1TK5e62YQ43NEayVuCBNz4zTmiFn4QxsupheRh+gNiFbNAgV
	 /RaGQzImgZStn8Dt1udQ4ByvtHiBI7++TXS1st8s7G3+G3YR5GxjGT6qoACwRV1rTL
	 TzBS/2zAsTTzC0jBdNrGMsBhq1+mKoYVygcVcYciGlzi+J9rCf0ZsbOwLs1Jra6aNj
	 h7dw9niGMc1jpp+Q/8pA3WeEb1AliTmP9BD7IMAYrPrExhHLPD+Kqrd7RvLDr34Wyp
	 2yjt3+rvOTjqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB3F684359;
	Sun, 26 Apr 2026 18:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3857231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5662422C7
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5-wghelUDlY for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3664E422C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3664E422C4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAE4A836EA; Sun, 26 Apr 2026 18:56:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:45:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45d056e7bf69aca4a036aba83e2573301996e9e0
X-Git-Newrev: d96eb2f7daf51d96602b1076ed8399e3781569e8
X-Patchwork-Hint: ignore
Message-Id: <20260426185638.CAE4A836EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: bump version to 1.9.17p2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d96eb2f7daf51d96602b1076ed8399e3781569e8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/sudo-project/sudo/blob/v1.9.17p2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 3bbce74cbc..340d155346 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
+sha256  4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb  sudo-1.9.17p2.tar.gz
 # Locally calculated
 sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0aacd8207d..8602e62b0b 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUDO_VERSION_MAJOR = 1.9.17
-SUDO_VERSION_MINOR = p1
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
