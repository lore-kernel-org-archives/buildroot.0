Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691DC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B606117A;
	Fri, 11 Jul 2025 10:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkwLOTc0zE71; Fri, 11 Jul 2025 10:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CD460F13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CD460F13;
	Fri, 11 Jul 2025 10:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D711E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E465340DAA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMg2cPCprbyq for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFBBC40C7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBBC40C7C
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDCC486377; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:34:58 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9f2b5a2304b072b090c11c091164606aa5314802
X-Git-Newrev: 1b72e438a7e59c039449d3a2e2d1ddf33a1ee5dd
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.CDCC486377@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/x11r7/xwayland:
 security bump to version 24.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b72e438a7e59c039449d3a2e2d1ddf33a1ee5dd
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
    - 24.1.7 https://lists.x.org/archives/xorg/2025-June/062057.html
    - 24.1.8 https://lists.x.org/archives/xorg/2025-June/062066.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5d5a4950b578fdc3c16bdb36e213f0e673584dea)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 4 ++--
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 2a23891752..6cbbea8af5 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-February/003586.html
-sha256  737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7  xwayland-24.1.6.tar.xz
+# From https://lists.x.org/archives/xorg/2025-June/062066.html
+sha256  c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907  xwayland-24.1.8.tar.xz
 sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
 
 # Locally calculated
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 47dc0b39e6..e3b6727c19 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.6
+XWAYLAND_VERSION = 24.1.8
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
