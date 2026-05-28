Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D61CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B6583BD9;
	Fri, 29 May 2026 08:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1Q7XwS-1nc6; Fri, 29 May 2026 08:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6D283BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043176;
	bh=wMz5lLugGl/YBkDQ+kTZYWPQFx/4vfzlh2P9el99Oe8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ls52ltlayn/LRqu0iTkrCym1uaGbxTyNN51t7nnu+L/gF++u6ZFmGmSZlINM9xoPF
	 q1FwHtp9gbh7zHflL9wIiOQCRfKQqrz09Fel883ZJ0G7KsI23H72PFnXv1BBiYt8aW
	 G4DRFhU9nTMq4taoNbDRO9EcJ7DQkHMsJtdBAXlQaIjSGjSUTftvMjczIpCtbTGnJt
	 Yjd0f0+LIdgZhzq2We4yWhM7tdo/i56PJcLPze9kdlAXw/FuVYlLhx/4Wyp/SUUsxa
	 BKJacMRAAg5aZQEVuhRw2tO5WQvd1910CwLxgrg9GYki+AeGoZ/czOGpD2zM87CmU6
	 DtmAHxTbuoNUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6D283BDA;
	Fri, 29 May 2026 08:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1162028E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63D6B41F93
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzFbIDyXS4R8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90DA41F8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90DA41F8A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78D5C87171; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:50:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d4e5a990a1488d6e13a530a4b98e5b9f833e78f4
X-Git-Newrev: b1ba7f0c8d715f509a88a237fa498a332731d054
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.78D5C87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/unbound: security
 bump version to 1.25.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1ba7f0c8d715f509a88a237fa498a332731d054
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://nlnetlabs.nl/projects/unbound/download/

Used new signing key to verify the source tarball:
https://nlnetlabs.nl/signing-keys/

Fixes CVE-2026-33278, CVE-2026-42944, CVE-2026-42959, CVE-2026-32792,
CVE-2026-40622, CVE-2026-41292, CVE-2026-42534, CVE-2026-42923,
CVE-2026-42960, CVE-2026-44390 and CVE-2026-44608.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74aed5e8619cd4674e12659ce16798851486e7ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/unbound/unbound.hash | 8 ++++----
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 19966d889e..46b88900e6 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
-# with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
-sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
+# with key: 231018690C4D903EF419146AA144323DEAACDF45
+sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index b435839020..fab6e67455 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.24.2
+UNBOUND_VERSION = 1.25.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
