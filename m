Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCDCC04A6A
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C896F417B3;
	Mon, 24 Jul 2023 17:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C896F417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLNcY0SUsFVT; Mon, 24 Jul 2023 17:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF1C8417C5;
	Mon, 24 Jul 2023 17:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1C8417C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FFFA1BF42D
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58CCC417BF
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58CCC417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNbJYgD9FPAZ for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 17:24:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB699417B3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB699417B3
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E6DF913F892;
 Mon, 24 Jul 2023 19:24:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 19:24:26 +0200
Message-ID: <20230724172426.49958-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690219474;
 bh=PN5X9aZYL/dMJci0l7kYaRGhUTHoR5/iJ7MzMOwN4EY=;
 h=From:To:Cc:Subject:Date:From;
 b=oFN9kFfRj+roV0QUOAE9omp/vacdZmc+EmPOeF+BdqOxIipH2fUxu6PFY2H5EhhR8
 KdjAFD+MJ+p6PD+89N2CUT9DYwnBR01p2AH6uMrCE9bbja4RkCF4rLrZKeYIz5qu0Y
 6WZqxlRmqm2+ezXKFhwkqRNxirefooPuQ/1IBmSs2tXd+aIfUHswallcVZnBd4rYbB
 VTzC0zQTbV+X2fa6EUfjR2xPeVffgmm4pgyhZBlcJFLMDWCpoziXj20FcT+FTFQYBQ
 Nrd4Bc70nDHdiqW2sBMbgRdJDP3lqHnMbjK6QX7LjytDuLveSw98yVrHMt3oCFw/DM
 /ImhIwt0iAobg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oFN9kFfR
Subject: [Buildroot] [PATCH 1/1] boot/edk2: remove superfluous =TRUE in
 DEBUG_ON_SERIAL_PORT macro definition
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8e9c8e624f "boot/edk2: introduce a new _OVMF_DEBUG_ON_SERIAL
option" adds a build macro definition with a "=TRUE" value.

edk2 OVMF readme suggests to define the "DEBUG_ON_SERIAL_PORT" macro
_without_ the "=TRUE" in [1].

The example build.sh script calls build to set the macro _with_
"=TRUE" in [2].

The "Build_Utility_Man_Page.rtf" documentation in [3] does not specify
either what exactly happen when a macro is defined without any value.

Looking at the "build.py" code in [4] shows that a macro definition of
the form "-DMYMACRO" is indeed equivalent as "-DMYMACRO=TRUE". This
was also tested with a qemu virt x86_64 grub2 EFI boot image, to
verify behaviors remain the same.

This commit removes the superfluous "=TRUE" as requested by Yann in [5].

Removing the "=TRUE" make it a bit clearer that it is the macro
definition itself that will enable the feature, rather than its
value. Defining, -DDEBUG_ON_SERIAL_PORT=FALSE (OFF, 0, or anything
else that would suggest the feature is disabled) would do the
opposite of the desired effect, and enable the feature.

[1] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/README#L95
[2] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/build.sh#L252
[3] https://github.com/tianocore/edk2/tree/edk2-stable202305/BaseTools/UserManuals
[4] https://github.com/tianocore/edk2/blob/edk2-stable202305/BaseTools/Source/Python/build/build.py#L2531
[5] https://lists.buildroot.org/pipermail/buildroot/2023-July/671059.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 95cbe415ef..f49258ecb5 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -19,7 +19,7 @@ EDK2_BUILD_TYPE = DEBUG
 ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
 # DEBUG_ON_SERIAL_PORT is only tested to be set, so don't disable it, as
 # it would still be set.
-EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
+EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT
 endif
 else
 EDK2_BUILD_TYPE = RELEASE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
