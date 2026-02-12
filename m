Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1CEEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF0161469;
	Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5hy-1jygs80; Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D9A615F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011470;
	bh=XlIQwy9Z+r0Ke8ki4WDbqwTxtzjH+8ne6xVcEam+X5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JPxWlJmRIQ68aHlQvGX7PywRsD+GFQ3z0YqClOahpF7PU+a8lEil07PQVHJUe8KvI
	 FIPzUJq/AFYyOJWFv/7upDHAhArCpTEmV6QUujqoaDw+ZWv73yCOGrF4n2gaLE4V9d
	 TXRnrCov0Fwrw7oNjdNNiQ2TsU+4z3G+N3dssWuQ++pTE3MdlMCwWoZ7ki+CD8xv3+
	 lIRffgPW6yItznO2+kDxaQ5KisUAADiSkDc4UhKHtTTqkpDVBEzeejN/C1E0NS4LhA
	 CWAMpmWwLVyhYb4SfDfRk+C5Yqs8aZnIxqbMaB5u3TohG1DgHkA51cpZGXOTsUIRn4
	 2d6pBYgRfzEfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D9A615F0;
	Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A94283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D9D41323
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRC-51YiOfaP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB41412CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AB41412CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 004D283593; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:30:48 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0184df5bb9074f3dfc12a02e760acdf36a9f7603
X-Git-Newrev: ace5081baef93fe82ebf3bd32ad3349534e8e79d
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.004D283593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] at91bootstrap3: Add
 support for custom license files
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ace5081baef93fe82ebf3bd32ad3349534e8e79d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The AT91Bootstrap3 package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Note that version 3.X of at91bootstrap didn't have an open source
license and no license file either. Keep that behavior.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d9999aeec913bbf8dedf96d8dabf07591838a0aa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/at91bootstrap3/Config.in         | 10 ++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 35bdb28162..b2f3e4e9b1 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -66,6 +66,16 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
+config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
+	string "AT91Bootstrap3 license files" if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "LICENSES/MIT.txt"
+	help
+	  A space-separated list of license files related to the
+	  AT91Bootstrap3 kernel package.
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 4bbe7cc718..2ed34f3de4 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -25,11 +25,12 @@ endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE = MIT
-AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
 AT91BOOTSTRAP3_LICENSE = Atmel License
 endif
 
+AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
+
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
