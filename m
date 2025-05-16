Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A47C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A60070DCE;
	Mon, 19 May 2025 11:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8lz_yeURyew; Mon, 19 May 2025 11:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D7670DC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D7670DC1;
	Mon, 19 May 2025 11:00:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26FD9E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3C1B41117
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOaHdV4V5cMD for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68DDC4177A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68DDC4177A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61EE6872E7; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:36:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a127b7e999586a83bd59655635caa621ce8d256f
X-Git-Newrev: a32a1e9a840403ee8e0cab0e4f50f83b4b0536c1
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.61EE6872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rauc: enable JSON
 output in host package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a32a1e9a840403ee8e0cab0e4f50f83b4b0536c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

JSON output is useful for building integrations, e.g. reading bundle
information into other tools.

Host-json-glib is very small / fast to build compared to the other
dependencies, so enable it unconditionally.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Peter: unconditionally enable JSON support]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 6bed5ec129..d20b0121df 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -61,6 +61,7 @@ RAUC_CONF_OPTS += -Dstreaming=false
 endif
 
 HOST_RAUC_DEPENDENCIES = \
+	host-json-glib \
 	host-pkgconf \
 	host-openssl \
 	host-libglib2 \
@@ -68,9 +69,9 @@ HOST_RAUC_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
 
 HOST_RAUC_CONF_OPTS += \
+	-Djson=enabled \
 	-Dnetwork=false \
 	-Dstreaming=false \
-	-Djson=disabled \
 	-Dservice=false \
 	-Dtests=false
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
