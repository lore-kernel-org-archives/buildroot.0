Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ECDC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0E740605;
	Sat, 15 Oct 2022 12:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0E740605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4y5WmHfIpMOR; Sat, 15 Oct 2022 12:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8F0040522;
	Sat, 15 Oct 2022 12:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F0040522
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC8B1BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17AF581D70
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17AF581D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHFSDP_4t0FI for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441D281D67
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441D281D67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33DF286631; Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:43:57 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d805244ed2bc014ed2d170a4c3e31e3836fc722b
X-Git-Newrev: 0fed79d6c7f3d1027da7801926758b4ba57b693e
X-Patchwork-Hint: ignore
Message-Id: <20221015125023.33DF286631@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uhd: drop
 have_mfpu_neon
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fed79d6c7f3d1027da7801926758b4ba57b693e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop have_mfpu_neon which has been added by commit
b07de37540ee34e4e5fa8586ecc40da1586cd940 but is not recognized:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_INSTALL_RUNSTATEDIR
    have_mfpu_neon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27f6c1ab383ce27236d75526ea881d7c789331a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uhd/uhd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index e8f197f9dd..2a5b69cefb 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -36,7 +36,6 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 UHD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -mfpu=neon"
 UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=ON
 else
-UHD_CONF_OPTS += -Dhave_mfpu_neon=0
 UHD_CONF_OPTS += -DNEON_SIMD_ENABLE=OFF
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
