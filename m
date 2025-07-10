Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AC8C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2ED83BDA;
	Fri, 11 Jul 2025 10:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GeVrp7VZvzB; Fri, 11 Jul 2025 10:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F72783C1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F72783C1C;
	Fri, 11 Jul 2025 10:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D98C199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB4140DC5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntl9rV1XMSkX for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E8740C25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E8740C25
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 814EE86380; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:31:30 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1fba91af016cefa3c55a426d87c40be2ada89303
X-Git-Newrev: be116329164676659bb56ea002993bfb468734cb
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.814EE86380@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libavif: security
 bump to v1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=be116329164676659bb56ea002993bfb468734cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit 0c1fa0bce14b2a75e7ede0d6bf6be52d7807684e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
