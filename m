Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF20C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 12:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BC840235;
	Sat, 15 Oct 2022 12:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BC840235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HT8OoVKefnaV; Sat, 15 Oct 2022 12:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C904063E;
	Sat, 15 Oct 2022 12:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71C904063E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA171BF5F8
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC2B81DBF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC2B81DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BZhmNZWnjW8 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2605081D70
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2605081D70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12165864DA; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:44:06 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: c52157f6aabd1cc92026610efa48aae4fe1053dc
X-Git-Newrev: 678bf71778b102bcb88a5d2802ad8bf43d16fe16
X-Patchwork-Hint: ignore
Message-Id: <20221015124918.12165864DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/uhd: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=678bf71778b102bcb88a5d2802ad8bf43d16fe16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
