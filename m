Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08533D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0A361747;
	Thu,  4 Dec 2025 20:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbaoQ_-sj_mr; Thu,  4 Dec 2025 20:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D4E61CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880852;
	bh=PL5aZ2tQsiHdwCcP7G/+jhqOfANee4MB3xUwQIUFcaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E2pifTZGTsAHRRRVUlgkrJ9D7KFK61eYgw1+wBz7ylJruEhpR3uVzzKKsqt77eoDi
	 Cm+vSkSnF6khrko19bwbRNsdbyTNa39tUQjsXlcRziB5PfOcbIsW/miueZ+krKiy3S
	 LdV+8onsKBvrXWSRauM6iW+UmGpP78MA22JzloTIVsneGF/VPqnFoMp5E8mi6ViIo6
	 LQ62SpZNBpCEYKFYiBTTYKgtGMLmE1fwXxqIUAWpM9+kq5hi4CHEKbhvupkFbmC5z2
	 AymWl0N9ThwqlBoIeHQG4s6YYBX9mtc88H5xFIqkgNIbEb1Esanvty/A9S8mnJcRf4
	 zKRoIS3eLjPWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D4E61CB0;
	Thu,  4 Dec 2025 20:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D481A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CE4940797
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jykhjeQuWkOd for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64486407CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64486407CA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 525E88651A; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:12:31 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: b85474755beee348eaa8c64414b4cb61705ed1e8
X-Git-Newrev: b72b6047f3f09755ce2579faa93c98ad4471aa24
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.525E88651A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/{neard, sdbusplus,
 thermald}: typo fixes
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

commit: https://git.buildroot.net/buildroot/commit/?id=b72b6047f3f09755ce2579faa93c98ad4471aa24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 559bb4dd7b9533344e7aca8cb6c8311c87d36d5c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/neard/neard.mk         | 2 +-
 package/sdbusplus/sdbusplus.mk | 2 +-
 package/thermald/thermald.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index c1804c48a2..e79ed278b4 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -16,7 +16,7 @@ NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define NEARD_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index 498b835052..207243b14d 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -23,7 +23,7 @@ SDBUSPLUS_LICENSE = Apache-2.0
 SDBUSPLUS_LICENSE_FILES = LICENSE
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define SDBUSPLUS_CREATE_M4
 	mkdir -p $(@D)/m4
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 9faa47683b..4e3d897bf3 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -32,7 +32,7 @@ endef
 THERMALD_PRE_CONFIGURE_HOOKS += THERMALD_GTK_DOC_HOOK
 
 # Autoreconf is missing the m4/ directory, which might actually be missing
-# iff it was the first argument, but unfortunately we are overriding the
+# if it was the first argument, but unfortunately we are overriding the
 # first include directory above. Thus we need that hook here.
 define THERMALD_CREATE_M4
 	mkdir -p $(@D)/m4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
