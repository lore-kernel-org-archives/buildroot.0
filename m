Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140D2C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFE64097D;
	Thu, 12 Jun 2025 20:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3g_s5MINRTK; Thu, 12 Jun 2025 20:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23804409BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23804409BD;
	Thu, 12 Jun 2025 20:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29ED91BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 106FE80BC2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pHo57itzARQ for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0D980AF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0D980AF8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E62EB835DB; Thu, 12 Jun 2025 20:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:11:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fd8aa43dcb067a4e2a6e670dc4ed4b38878c2abf
X-Git-Newrev: 105442445d9ec58c2d3dc769a4a53729bd57bd3a
X-Patchwork-Hint: ignore
Message-Id: <20250612203114.E62EB835DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: drop
 _GNU_SOURCE workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=105442445d9ec58c2d3dc769a4a53729bd57bd3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This was needed for 8.14.0, but got fixed in 8.14.1 with:

https://github.com/curl/curl/issues/17512

So drop it again.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6567881e46a6cdf5dc8758992bd447e58821d4d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 68d638609b..8501910ac5 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,7 +14,6 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
-LIBCURL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
