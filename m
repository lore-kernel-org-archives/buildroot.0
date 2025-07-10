Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26098C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F298560E32;
	Fri, 11 Jul 2025 10:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPkCto7tb5Wu; Fri, 11 Jul 2025 10:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0879D610A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0879D610A8;
	Fri, 11 Jul 2025 10:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 072111E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A56740C81
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_aWbdbircdV for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C7F40C73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6C7F40C73
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E0A86353; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:34:54 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: dd100567ed830d3186ba90e85659b98486cc1b75
X-Git-Newrev: 9f2b5a2304b072b090c11c091164606aa5314802
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.C4E0A86353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/x11r7/xserver_xorg-server: security bump to version 21.1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f2b5a2304b072b090c11c091164606aa5314802
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following security issues:

- CVE-2025-49175: A flaw was found in the X Rendering extension's
  handling of animated cursors. If a client provides no cursors, the
  server assumes at least one is present, leading to an out-of-bounds
  read and potential crash.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49175
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b2

- CVE-2025-49176: A flaw was found in the Big Requests extension. The
  request length is multiplied by 4 before checking against the maximum
  allowed size, potentially causing an integer overflow and bypassing
  the size check.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49176
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b32

- CVE-2025-49177: A flaw was found in the XFIXES extension. The
  XFixesSetClientDisconnectMode handler does not validate the request
  length, allowing a client to read unintended memory from previous
  requests.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49177
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96

- CVE-2025-49178: A flaw was found in the X server's request handling.
  Non-zero 'bytes to ignore' in a client's request can cause the server
  to skip processing another client's request, potentially leading to a
  denial of service.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49178
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54ce

- CVE-2025-49179: A flaw was found in the X Record extension. The
  RecordSanityCheckRegisterClients function does not check for an
  integer overflow when computing request length, which allows a client
  to bypass length checks.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49179
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca4

- CVE-2025-49180: A flaw was found in the RandR extension, where the
  RRChangeProviderProperty function does not properly validate input.
  This issue leads to an integer overflow when computing the total size
  to allocate.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49180
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b76
  - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c

For more details on the version bump, see:
  - Security Advisory https://lists.x.org/archives/xorg/2025-June/062055.html
  - 21.1.17 https://lists.x.org/archives/xorg/2025-June/062056.html
  - 21.1.18 https://lists.x.org/archives/xorg/2025-June/062066.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8b94ff6c6be6311d82bf59c3a13f6d0a886996a1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index abf1c83c75..7d373850d0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-February/003585.html
-sha256  59fa52b63f6f8747ee2c4716decb29ced249c4c574e2a18c96b7d3b1420f7fd9  xorg-server-21.1.16.tar.gz
+# From https://lists.x.org/archives/xorg/2025-June/062065.html
+sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
 sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index afb79b223e..f480c1c0ac 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.16
+XSERVER_XORG_SERVER_VERSION = 21.1.18
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
