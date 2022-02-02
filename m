Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF431C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 17:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAB483E05;
	Wed,  2 Feb 2022 17:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i14igs5XqJpm; Wed,  2 Feb 2022 17:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9D0832D1;
	Wed,  2 Feb 2022 17:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 997511BF573
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BA6832D1
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRFNsFphA8Ns for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 17:35:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B4D2826BF
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 17:35:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h7so37523wrc.5
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a68U4X2etS2pUjM+Lsa76vU7b8AscDq20Hs3u1KNXco=;
 b=mBsztt9qKAZ11nnQqd+vcrItE7dIdpc7NIgAr5YqLiCSS1NiYsWr17rhK2vdDg4+ik
 buiMoE7lCPsRqh6wZI4g71bSjXl0FQZiH1XWZQkV7Ad0Mi+U9p9Kvl01wtqKgWcSmCKg
 mDEItfcCdiI6dcgmgkKC86BJae3fxzQAw1iGmC3jcTZJqALsZwPhLxs+bbX5STFab+YA
 YOxCQqpUxAbz0UrmnLqMy32g6Iafd1W7K5jhzHYfxgbvdjWu1kmQtB3VsVQF55FS1Rel
 ythNY65XJdwUJf6UblPw8Qti1PpxnWcDnAFi60QdrtjQ8VVjOyu1KD67oaxI6cZYtTfq
 6FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a68U4X2etS2pUjM+Lsa76vU7b8AscDq20Hs3u1KNXco=;
 b=ojkRDEFpliSbz/wYgcOYNsNHa5SDUxcgexZuKcngPqnPZ0sQxEEacmpVAa7WeeAJQU
 Ly3MV9w5d2tptRpmE7DX5xksMhnkp967kDQC1wXGzleFk3GAlRIOh2aiBAHl/FXe119z
 cLegntYx59ouZxfW4riefByRb7mGjpGTjHf6R7ui1ak919rugd1b9DnU1AWFppLqhxgM
 R2H72z86ldE7sSMKENJb6LvMvsCCCwRLIDQkzIQuxrCEOsdz2PIveaJ8X94IDBODAEzv
 o0tVrnoqweYjjEeiFdgn+lxgKdP4i6EUAjI1+UkLNu9vcMg3Q019HNhs4FxTHF3hL0Qz
 QA4A==
X-Gm-Message-State: AOAM532ks2S8hPQkPaBAw01aFKfP7p9mtGecJHi/OHHkJDHeKWkkhLRf
 D6hcZ3bWFNd304mxy4JUbJeCn21DF98=
X-Google-Smtp-Source: ABdhPJz81lWWULNb+coAK1RnP26jY2JtRA+t/B5brpxewszVdd4KQ1l4pq+QgGR5W97lBBgv4jiZXA==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr1127712wrs.528.1643823355550; 
 Wed, 02 Feb 2022 09:35:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm20685443wrd.111.2022.02.02.09.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 09:35:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 18:33:06 +0100
Message-Id: <20220202173306.42559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with icu and
 libxml2
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since addition of icu support in
libxml2 through commit 49d7c85421e87d9d762be9352805cb47a2f0bbeb:

In file included from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ptypes.h:52:0,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/umachine.h:46,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/utypes.h:38,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv_err.h:88,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv.h:51,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/encoding.h:31,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/parser.h:812,
                 from conftest.cpp:61:
/home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: error: 'noexcept' does not name a type
     LocalPointer(LocalPointer<T> &&src) U_NOEXCEPT : LocalPointerBase<T>(src.ptr) {
                                         ^
/home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11

Fixes:
 - http://autobuild.buildroot.org/results/be043792e6e5501631517881b10096291a654364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/sconeserver.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 17407c29f5..2b28f8015c 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -29,6 +29,8 @@ SCONESERVER_CONF_OPTS += \
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 SCONESERVER_CONF_OPTS += \
 	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
+# Needed to fix build failure when icu is enabled in libxml2
+SCONESERVER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
