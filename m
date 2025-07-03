Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A22C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16080611BF;
	Thu,  3 Jul 2025 17:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsz34A-_xHN3; Thu,  3 Jul 2025 17:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A83F611B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A83F611B4;
	Thu,  3 Jul 2025 17:42:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4039975
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4171E4021D
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qFneyLjdD_N for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914C7404BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914C7404BD
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829B485C5F; Thu,  3 Jul 2025 17:42:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 19:38:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31619696b96a79972553c74450b254702d265245
X-Git-Newrev: 7c0e9d795a4896fd29e533bb4e0f55ec7b76421b
X-Patchwork-Hint: ignore
Message-Id: <20250703174202.829B485C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: ignore CVE-2024-3566 that
 only affects Windows
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c0e9d795a4896fd29e533bb4e0f55ec7b76421b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For reference, see:
https://www.cve.org/CVERecord?id=CVE-2024-3566

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to CVE in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 01166bae64..a049d90fde 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -15,6 +15,9 @@ PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
 
+# Only affects the Windows operating system
+PHP_IGNORE_CVES += CVE-2024-3566
+
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
