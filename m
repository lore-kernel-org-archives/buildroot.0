Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032F1C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 16:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8682760EE0;
	Sun, 23 Apr 2023 16:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8682760EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5TUDe0ASHMm; Sun, 23 Apr 2023 16:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C618D60A87;
	Sun, 23 Apr 2023 16:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C618D60A87
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EE021BF855
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 16:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3804E40524
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 16:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3804E40524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTXeurFHnS-s for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 16:01:23 +0000 (UTC)
X-Greylist: delayed 00:06:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15BB1400FD
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15BB1400FD
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 16:01:21 +0000 (UTC)
Received: from localhost.localdomain ([124.126.99.218])
 by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
 id DB2990E5; Sun, 23 Apr 2023 23:54:50 +0800
X-QQ-mid: xmsmtpt1682265290tac4eq6ro
Message-ID: <tencent_E605AD09EB02769EC2D19F376A1239F80406@qq.com>
X-QQ-XMAILINFO: OCYbvBDBNb9rIvQ9cdn0FfI0CHvVOybrrnp5LKuVriH3DNGClx5YUfm4R+8x9/
 MR9UOsfmmDB5odor31Z+uGFu85uFk5sMOGKVAj0Achic4AoQhD8KIbwFCm3db0g/ebO9lQ4jiZW+
 2HKAsinmfeNQHV/CZ3XW3YuRBsZu9Ds5u4GXtjSBNcaGwxt/8CY8hR3oXjrxeGuxyF/rYM6n5thm
 //ObDAuTMrtmp66aVoSJEaL7X0Nd7XCYR0o2WmmsWE16DeTWyjhb0pfLWy0agUVyBnuNLllHxCLa
 Wrw7IRM5hfEtI0O0XjQY7/fZA47XF9xFiZcI6l+JGhPOXcCU/ZD3jOqhgB8qw2spLmsby0EDNm8k
 XcMvXbFI89edIIA8Trk36yGX/oLM7H/G5Shp2KKtu7088jt5XKmlJ40p8082sewoupL8Hu5PIPq7
 HrkqzIPux2qOPJSIosWsDoaxrhP8wpqz5nbkTM5+7dAbRulKYGni9viXv/mFjUCAqtBMakwPj9m/
 ZOSDI7OsaM8gs0AtCGeNXFi2+gV9EpGzSSAyqtrS0XTrUov5JIxBYp793fbVHokev0NsHjFZAPkP
 9/9BtjGU0LnkYD6zMoS2cCIgqJTK+DcsIV2EzsjzeaytYM9VunCrsGzDXx6Y0iuqQn1dyi3ZOeMh
 52BsMweW1ndcqYacnD/BDMyX0T0W6pss8xj02UpCK+6FBfi9OwZYFPhUr3E3hemJ8EXBgT6w5/NB
 MfhZaYXdiqvHzNgwIjrj3FeA3iVPOp7lbmvS4o5Sv5VtVTnwJ6NXTHH+0BuhBpxR8fdd7HhBTrzS
 Wa8LzfpppID5UTsFfiPtVezF+w/2xodYFHDRPJldtCKdSsjNzpbm0CGbWOBrDJcQD7S2N36l5fCJ
 LFSqNTeHoZidsr23FzegQ5M1JuZm8dWlVHKtSiitb4mPrexSKkGnCRIa1Iq20VdyJRkZxJoBi1lb
 Cau/UKA8o1hyKI+DJ915VkV73JgPleUPXs/Qylvjq+wIf3yhEaUA==
From: MidCheck <mc.xin@foxmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 23:54:13 +0800
X-OQ-MSGID: <20230423155413.6106-1-mc.xin@foxmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1682265672;
 bh=AwRTEtV5qSEaA5U5rywq3b7C9wMusdw2mQFt0+rTl0o=;
 h=From:To:Cc:Subject:Date;
 b=GMXuRB32aRRrxtIB9eK2kx35AzfnHKiXeT7/HKz9ojSzuyfhyLPSI7bFcmn4ywjVR
 cFvdE8OIYdX/C1YLevlLAm3nmXIeHOq3vwHU+iEQsNWNJaX4yXzPTPBBKB0F1ePCVG
 5bDKXz50ca7VG3pNuxKDhRfu2rEgajqP1DkRMZas=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.a=rsa-sha256 header.s=s201512 header.b=GMXuRB32
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: add the processing
 when LIBPATH is a directory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When built with the system's toolchain, the output is as follows:
>>> toolchain-external-custom  Installing to target
>>> toolchain-external-custom  Copying external toolchain libraries to target...
make: *** [package/pkg-generic.mk:384: /root/buildroot-2022.02.11/output/build/toolchain-external-custom/.stamp_target_installed] Error 255

After echo the value of LIBPATH, I found it is a directory:
/root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.conf.d

So it caused the script to execute the "exit -1". When I added the processing of the directory, it was successfully built.

Signed-off-by: MidCheck <mc.xin@foxmail.com>
---
 toolchain/helpers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 24c482923a..e0ab991bec 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -28,6 +28,10 @@ copy_toolchain_lib_root = \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				break ; \
+			elif test -d $${LIBPATH}; then \
+				mkdir -p $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				cp -r $${LIBPATH}/* $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				break ; \
 			else \
 				exit -1; \
 			fi; \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
