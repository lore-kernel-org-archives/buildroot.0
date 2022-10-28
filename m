Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D10C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFB381759;
	Fri, 28 Oct 2022 06:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CFB381759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vs5bhznPHM9n; Fri, 28 Oct 2022 06:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D581781493;
	Fri, 28 Oct 2022 06:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D581781493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC82B1BF9AC
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60D88174C
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60D88174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elLTJnj-_11w for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C594A81312
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C594A81312
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3EDE873E9; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a30e31a05e21461e73175c814ba858edb23a363e
X-Git-Newrev: 123fa2d801ab0b9a5dd025a083c6264271d79aaf
X-Patchwork-Hint: ignore
Message-Id: <20221028065611.B3EDE873E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump to version 3.4.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=123fa2d801ab0b9a5dd025a083c6264271d79aaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

3.4.4 Oct-23-2022
    Important aarch64 fixes, including support for linux builds
      with Link Time Optimization (-flto).
    Fix x86 stdcall stack alignment.
    Fix x86 Windows msvc assembler compatibility.
    Fix moxie and or1k small structure args.

https://github.com/libffi/libffi/releases/tag/v3.4.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libffi/libffi.hash | 2 +-
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 689b5da4f1..8d2349ec21 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8  libffi-3.4.3.tar.gz
+sha256  d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676  libffi-3.4.4.tar.gz
 # License files, locally calculated
 sha256  2c9c2acb9743e6b007b91350475308aee44691d96aa20eacef8e199988c8c388  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index ecfa120c7a..8f6844113c 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.3
+LIBFFI_VERSION = 3.4.4
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
