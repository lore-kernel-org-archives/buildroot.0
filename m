Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9132C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1E0B408B1;
	Mon, 14 Mar 2022 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fi1grnqqCvsU; Mon, 14 Mar 2022 18:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCEB94055F;
	Mon, 14 Mar 2022 18:14:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC451BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E593405CD
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmJVr2KmRkRP for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:14:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ruschival.de (mail.rolf-dv.de [168.119.71.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618C440157
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:14:05 +0000 (UTC)
Received: from i59f4bd7e.versanet.de ([89.244.189.126]
 helo=VillaStraylight.fritz.box)
 by rolf-dv.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <thomas@ruschival.de>)
 id 1nTpCk-0000XH-1d; Mon, 14 Mar 2022 19:14:02 +0100
From: Thomas Ruschival <thomas@ruschival.de>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 19:13:46 +0100
Message-Id: <20220314181347.190747-1-thomas@ruschival.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220312104402.33075-2-thomas@ruschival.de>
References: <20220312104402.33075-2-thomas@ruschival.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/1] Bump pistache,
 switch to meson build (test-pkg o.k.)
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
Cc: Thomas Ruschival <thomas@ruschival.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pistache project has moved to meson build and cmake build seems to be
neglected e.g. the cmake build on host did no longer install header files.

This patch switches to meson build. As a nice side effect newer upstream
versions already include the patches by Fabrice Fontaine so the buildroot
package does no longer need the patch files.

The upstream project now has a hard dependency to RapidJSON.

Tested with a full build for Raspberry Pi Zero W and BananaPi and test-pkg

                    bootlin-armv5-uclibc [1/6]: SKIPPED
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED
6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed


Thomas Ruschival (1):
  package/pistache: bump version & switch to meson build

 ...-add-C-language-to-project-statement.patch | 70 --------------
 ...eLists.txt-respect-BUILD_SHARED_LIBS.patch | 95 -------------------
 ...de-pistache-typeid.h-include-cstddef.patch | 38 --------
 package/pistache/Config.in                    |  9 +-
 package/pistache/pistache.hash                |  2 +-
 package/pistache/pistache.mk                  | 10 +-
 6 files changed, 12 insertions(+), 212 deletions(-)
 delete mode 100644 package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch
 delete mode 100644 package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
 delete mode 100644 package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
