Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F54D2A538
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A7EE61C5B;
	Thu,  4 Dec 2025 20:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh5oH_J6Wm-O; Thu,  4 Dec 2025 20:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0E161C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880773;
	bh=evXQYKTlkcx+jmj+7Rlpnlfhe2EP3Be9KhGwsk++ick=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QIgLFfcP7hnyHZYy6Mr+rQVQoiZDJ/Oig1MVhZ8l11JdmDFRiAhemxuiLahVDQUUy
	 ooDxx6hXK9uFT7iMz7Wku9+gz0pZl/7g9DDYxqSrvZnggbP24w8fJpM9cpy2fbY2SN
	 ll9TAb13WmFlCVfLS4wJpyU4wak4ED9B3YT0mykdHcQIPbPspLnSvyLi/ioB5/WGzv
	 5r5tkNthsUWhVk3XHH9LfXQheYQNCs9/SBtoyE5dSwfaLTBekWXFwZntKeF0OJ1qGJ
	 LAc2Ray/m4rdQkoCDnFMvDq8lw7MeKLenr6DolW1BgC7J/IgK9pjNZsVnN8TINpu1p
	 0q8fEmqLn7oMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0E161C79;
	Thu,  4 Dec 2025 20:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21BDB345
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A4088448F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9yK-kvzdUqD for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB27D84391
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB27D84391
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB76B864DA; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:12:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9639e6c246a86f98b6e6509bc2a0579b2d87622d
X-Git-Newrev: 11e5e88ad14c027728ebfe33ea44f37a325967aa
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.AB76B864DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{neard, sdbusplus,
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

commit: https://git.buildroot.net/buildroot/commit/?id=11e5e88ad14c027728ebfe33ea44f37a325967aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
