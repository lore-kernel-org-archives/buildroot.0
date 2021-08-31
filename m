Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46DCC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E9D610E9
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63E9D610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182B980EBB;
	Tue, 31 Aug 2021 17:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8VNjBXwxDp1; Tue, 31 Aug 2021 17:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9E681022;
	Tue, 31 Aug 2021 17:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4B4A1BF866
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE7B780EB1
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FH4CpunpLG-H for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 17:45:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCB7180C4C
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 17:45:07 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7hwmvjpIIyy0L7hzmHsVE; Tue, 31 Aug 2021 19:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630431484; bh=Y0QBImDDQ4ZaxoFzey8vpMV4HUB7a3kxqlopXRA+joc=;
 h=From:To:Subject:Date:MIME-Version;
 b=DmYuNXVUyUaGLoTJD52lnPX7L5nFwj5P7ssT9LYs+ilBOZXuElN/J1f48d4YKdLOY
 zGPkV5rl4qhsmvfRPiQZK8S6mTbojWt8/ZO4sTTat0t0qg/FSHlMUFqa0wd82RVk9E
 Y6lfjcKPsn+ipfX/czz7TLh1TXizV0eCItr8pcdqW1AQigfgZKHC9RgSFDb+zXizYH
 n8CEJLRnshEFq8necFnUA576zOfEJ4V7Bi3y9mqO2pBSvdDRD3LeAgPRWI4o6hty33
 uKqa3GXxA3Yds7XtwpeTy6Yf55lsfSb1e5bXA3i1dFVtxnoJQ4AdAXV+y5VusyogOw
 niK3j5lbMqxlg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 19:37:59 +0200
Message-Id: <20210831173800.22088-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
References: <20210830235951.24b82f6d@windsurf>
 <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL+jlgp0duDJNJiO7ITLoZ+x6bGl30535thh/wINkVtH3avRK2oCGedNA+AoIssiA93MlDtv29nzLvKZkQGmYuGZZS0r995Vw5Djj4BGKNq0reWCyfeH
 fBG40cv0x56of+G07iwcGo+SkkwkAeAuAehHeo9E62IjbfQ6xuA30E5C0FEqkhUuvJt3S3EyO6J41xegbhrPJo/h7Rwcz3rOS78wdGZ2sSKTHQipr+k0sgds
 sZTlvfstWTriDMnNanHhGc1z2yMav35/a53ZWnL7MZ/6z14h5RWmtMvNvRBtsIR6CCo81ICIp3q0P0SDQDtpKhSLFCoRCMfIlYYiH5FXAgD+ihemYXysSDbH
 TJNmOS0ilvfrGDvrbWi/ARlUIPJym90vHpYii3HP28axu0sg+/MQEy8I9O3xXJla6z+//WyOvCloA4QWy4+OQSvmFnUWPw==
Subject: [Buildroot] [PATCH v2 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

ruby package fails to build for the SH4 architecture with optimization
enabled with gcc = 9.3.0:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

It's already been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143

Anyway let's assume all SuperH(BR2_sh) have this bug according to:
http://lists.busybox.net/pipermail/buildroot/2021-August/621906.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed bug gcc version condition
* introduce this bug for BR2_sh and not only for BR2_sh4
---
 toolchain/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf2bb3efe4..d6381f64a0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -133,6 +133,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
+# Error: invalid operands (*UND* and .text sections) for `-' on sh4.
+# This bug no longer exists in gcc 10.x but reappeared on gcc 11.x and
+# it still not been fixed yet.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
+	bool
+	default y if BR2_sh
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
