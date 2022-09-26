Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDFC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC741824DF;
	Mon, 26 Sep 2022 12:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC741824DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq56mFcF1KhR; Mon, 26 Sep 2022 12:10:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1165982437;
	Mon, 26 Sep 2022 12:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1165982437
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 920481BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E15040BC0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E15040BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8KIVo0f2LP0 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A699540B97
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A699540B97
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 912548638F; Mon, 26 Sep 2022 12:10:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:09:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15f48d57f73da375ed28e582ab68740704b499fd
X-Git-Newrev: 27f6c1ab383ce27236d75526ea881d7c789331a4
X-Patchwork-Hint: ignore
Message-Id: <20220926121027.912548638F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: drop have_mfpu_neon
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

commit: https://git.buildroot.net/buildroot/commit/?id=27f6c1ab383ce27236d75526ea881d7c789331a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
