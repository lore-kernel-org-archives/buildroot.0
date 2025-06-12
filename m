Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775EDC7114A
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2A940B41;
	Thu, 12 Jun 2025 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nytyOw5B5GAh; Thu, 12 Jun 2025 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C6540B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C6540B05;
	Thu, 12 Jun 2025 20:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0206B1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B225040536
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1_Z8jBU8HNI for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA9474097F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA9474097F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8F3383554; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7cf3df139eb5af51198d72ae0ff524e1d5d6f6ad
X-Git-Newrev: 1a93dc61f16db56a817cf529210b6a3e31733537
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.B8F3383554@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mongoose: fix
 openssl/mbedtls support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a93dc61f16db56a817cf529210b6a3e31733537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since version bump to 7.12 (upstream commit [1]) the openssl/mbedtls support
defines changed from MG_ENABLE_OPENSSL/MG_ENABLE_MBEDTLS to
MG_TLS=MG_TLS_OPENSSL and MG_TLS=MG_TLS_MBED.

[1] https://github.com/cesanta/mongoose/commit/0613cc62f4dbec6beb76e9ddece60d52171585c0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 77d69298044fdb781ef1627ccf84c4113130d00f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/mongoose.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index b41f6a054d..8316a8d59a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -17,10 +17,12 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
-MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_MBED
+else
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
 endif
 
 define MONGOOSE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
