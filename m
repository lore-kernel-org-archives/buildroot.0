Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB97FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36F140774;
	Thu, 26 Feb 2026 20:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QalM2Be6Iryi; Thu, 26 Feb 2026 20:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E956540798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138647;
	bh=qWrdb0PtxprltKqhFJtt4YwW4NkyQSllvOsYPzIvgds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GC7SiwmwJvVXEx3H/g6zXZPo2gszkH7XtoRMW++laTtDS9tb3WjY1EqQi/dDXCOUn
	 Ubl6LHtiAycDeH6DOKrWjIcMoX5S/6EIxMSH0kWGKGvfDcc4fPLdMsLX3hbOCEP6nm
	 JR8PrESa7zGtu2fhFD2E/H02lmNMUMhS4iZP5rQYUxb19pDBPTBJ9trl8UjlwYw5qR
	 JpfshBBTuKg7gjVzhfX9M5/60kVfdKk3Ouvd8KGNRsWW54KEk8yHwV63KruJQHFbLw
	 /hsbq/IupS/MXr/In6J1VjZaNysA3kmgYTMyfUC8nUmP3RTC8G59gsaLc5CD8nJnjG
	 c9gwd1RnH088A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E956540798;
	Thu, 26 Feb 2026 20:44:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 183BD1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7114640234
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBGaxQC1krOd for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1935C40246
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1935C40246
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F8958750E; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:37:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 28d9b4568fb90aff658371a14645ef23564de5fc
X-Git-Newrev: 13443f49697565097c092317c8ddcf19cf32d1f7
X-Patchwork-Hint: ignore
Message-Id: <20260226204357.0F8958750E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/c-ares: security
 bump to v1.34.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13443f49697565097c092317c8ddcf19cf32d1f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information about the release, see:
  - https://github.com/c-ares/c-ares/releases/tag/v1.34.6

Fixes the following vulnerability:

- CVE-2025-62408:
    c-ares is an asynchronous resolver library. Versions 1.32.3 through
    1.34.5  terminate a query after maximum attempts when using
    read_answer() and process_answer(), which can cause a Denial of
    Service. This issue is fixed in version 1.34.6.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-62408
  - https://github.com/c-ares/c-ares/commit/714bf5675c541bd1e668a8db8e67ce012651e618

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bed675a240de6643792edd879cbe187b2ee6e0f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 1c28d91e97..7bf4163e55 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346  c-ares-1.34.5.tar.gz
+sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
 
 # Hash for license file
 sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 090147d0e9..1653b16c28 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.34.5
+C_ARES_VERSION = 1.34.6
 C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
