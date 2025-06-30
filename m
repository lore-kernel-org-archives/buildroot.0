Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15626C83033
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCBF5613FD;
	Mon, 30 Jun 2025 20:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZXCaafYKyny; Mon, 30 Jun 2025 20:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9531613FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9531613FE;
	Mon, 30 Jun 2025 20:11:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17189223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F15E440BB1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj993RVnNGUX for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 20:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083CB40C8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 083CB40C8A
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBAFD84D8F; Mon, 30 Jun 2025 20:11:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 22:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d593a8144ad8890dae4ab6fd235eef700d3c144
X-Git-Newrev: 0c1fa0bce14b2a75e7ede0d6bf6be52d7807684e
X-Patchwork-Hint: ignore
Message-Id: <20250630201104.EBAFD84D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: security bump to v1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c1fa0bce14b2a75e7ede0d6bf6be52d7807684e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2025-48174: makeRoom in stream.c has an integer overflow and
    resultant buffer overflow in stream->offset+size.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48174
  - https://github.com/AOMediaCodec/libavif/pull/2768/commits

- CVE-2025-48175: avifImageRGBToYUV in reformat.c has integer overflows
    in multiplications involving rgbRowBytes, yRowBytes, uRowBytes, and
    vRowBytes.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48175
  - https://github.com/AOMediaCodec/libavif/commit/64d956ed5a602f78cebf29da023280944ee92efd

For more details on the version bump, see:
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.3.0
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.1
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index b26e678abf..c53e0c9f50 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
+sha256  0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1  libavif-1.3.0.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 0c2a8e4dae..4357566ed1 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.1.1
+LIBAVIF_VERSION = 1.3.0
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
