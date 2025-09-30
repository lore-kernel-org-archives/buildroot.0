Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2A0CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630B441459;
	Wed,  1 Oct 2025 20:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ky62hragahh; Wed,  1 Oct 2025 20:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A25541481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A25541481;
	Wed,  1 Oct 2025 20:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1427072
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F60F41423
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSt6bydk6335 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB0E41374
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAB0E41374
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A692386703; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:10:17 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4aef99b258a55baa740350118fe05939e002c581
X-Git-Newrev: 584055a4a67b01eafdd25f683f8881231df6248f
X-Patchwork-Hint: ignore
Message-Id: <20251001205232.A692386703@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/syslog-ng:
 security bump to v4.8.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=584055a4a67b01eafdd25f683f8881231df6248f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

See the release notes:
- https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.2
- https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.3

This fixes the following vulnerability:
- CVE-2024-47619:
    syslog-ng is an enhanced log daemo. Prior to version 4.8.2,
    `tls_wildcard_match()` matches on certificates such as `foo.*.bar`
    although that is not allowed. It is also possible to pass partial
    wildcards such as `foo.a*c.bar` which glib matches but should be
    avoided / invalidated. This issue could have an impact on TLS
    connections, such as in man-in-the-middle situations. Version 4.8.2
    contains a fix for the issue.
    https://www.cve.org/CVERecord?id=CVE-2024-47619

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7660818b4bbe3aa2540f76ed4d75fcd99c8c8bd9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 4ca6a3e33e..04f33926d5 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e8b8b98c60a5b68b25e3462c4104c35d05b975e6778d38d8a81b8ff7c0e64c5b  syslog-ng-4.8.1.tar.gz
+sha256  f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7  syslog-ng-4.8.3.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 6f608eed0d..fa405ca5cb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.8.1
+SYSLOG_NG_VERSION = 4.8.3
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
