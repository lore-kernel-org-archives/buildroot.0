Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB1AC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF5260608;
	Wed, 16 Apr 2025 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uethTZxCNXjN; Wed, 16 Apr 2025 21:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE096071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAE096071F;
	Wed, 16 Apr 2025 21:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC70D20E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA0A60BBA
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPN2j9gg7NL9 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38C3660B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C3660B94
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26B63856EE; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:51:21 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 4cbce8e3d11dd80b6ac7f39b22819fe5fb3f8d08
X-Git-Newrev: e1a65c261dee4f2aee7e88d5856dd4d4254fa84a
X-Patchwork-Hint: ignore
Message-Id: <20250416214823.26B63856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libarchive:
 security bump to version 3.7.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1a65c261dee4f2aee7e88d5856dd4d4254fa84a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following security issues:

- CVE-2024-57970: libarchive through 3.7.7 has a heap-based buffer
    over-read in header_gnu_longlink in archive_read_support_format_tar.c
    via a TAR archive because it mishandles truncation in the middle of a
    GNU long linkname.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-57970
  - https://github.com/libarchive/libarchive/commit/82912103214506316bd9990d73f33d743d55f570

- CVE-2025-1632: This affects the function list of the file bsdunzip.c.
    The manipulation leads to null pointer dereference. It is possible
    to launch the attack on the local host.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-1632
  - https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532

- CVE-2025-25724: list_item_verbose in tar/util.c in libarchive through 3.7.7
    does not check an strftime return value, which can lead to a denial of
    service or unspecified other impact via a crafted TAR archive that is read
    with a verbose value of 2.
    For example, the 100-byte buffer may not be sufficient for a custom locale.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-25724
  - https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532

The patch added in [1] are still needed for this version bump.

For more details on the version bump, see the release notes:
  - https://github.com/libarchive/libarchive/releases/tag/v3.7.8
  - https://github.com/libarchive/libarchive/releases/tag/v3.7.9

[1] 9ac63a3360 package/libarchive: fix uclibc build with libiconv (again)

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fde0b3fe1c99207436fd0c25a94c09856d1ee552)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index c0b04b0f4b..d132664e17 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  879acd83c3399c7caaee73fe5f7418e06087ab2aaf40af3e99b9e29beb29faee  libarchive-3.7.7.tar.xz
+sha256  ed8b5732e4cd6e30fae909fb945cad8ff9cb7be5c6cdaa3944ec96e4a200c04c  libarchive-3.7.9.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 70123ee2b1..7fec01a040 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.7
+LIBARCHIVE_VERSION = 3.7.9
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
