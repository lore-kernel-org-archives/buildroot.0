Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73138C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 01:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022046101A;
	Tue,  5 Apr 2022 01:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDF8pWvveQUz; Tue,  5 Apr 2022 01:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1551C60FF9;
	Tue,  5 Apr 2022 01:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA0D61BF2F9
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 01:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D809D4091E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 01:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0TW4LTqkMyd for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 01:21:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE46140918
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 01:21:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z7so13519103iom.1
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zv5DpiauJFPJXNGR8Gx+DXB95Tgd/b0fdyztAzWlUVY=;
 b=JNZhtnagcqp8NNETZEnSCiHeamAXexGd620YGlSj5wv5oRo6YJcYRgIjOAP7U7RaZC
 GPJr8aVFilsTZB8QRjGBAOlXrWsuvSSlmfNXDPHF7C5+GM4Rxfykieuftc5w8O8T/xFp
 zAFCYcdkRFAXjm9yZd/Ij4A8NVMtYJQuiHHW+fgW1kcJVnZDU9OUftJ7AaOy1DQq64rb
 NM3X2txsVqGJnwECwKMtG56HBtbrLbswO1d9XVCuGyONNssam53CqHejFwFa0FfgHsAx
 ewwy4O5LDGYRWo0R/wjnZqH5IUC34a35dDf/ki1TsX0hi3SattrsdmyvPATdl0xuj1ax
 IiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zv5DpiauJFPJXNGR8Gx+DXB95Tgd/b0fdyztAzWlUVY=;
 b=nfQKy/kQBKt3v2yNJfrN9SbiFM0ekbBmhYuaaIIUulW8Fmi6hzsh3CpfDmY0TX43lv
 /NrJ33QJLDmq/ZRUgKzPBskYX1ccUbPcXtSO44DUU0qS95ISHLxtc6CcLVPNF2cszD9y
 wTRJSwntddJN2khnfxU8XGNKEcy87WpqPqXnGbpJPC5HCD+sa//LGtvNsWisfgROW5Li
 3tqFpsBDxy/5M0mGA1zg/V8Dh2mPL5nEPZRHBUFoywpn7b7HRkWNnca2c0D4ZBphNAqp
 EPxXo91NTo7d5ySfFo9SEfP79I9VfNEcsNOfK/rcni1vuKA3mx0+yyK2u3Vif9dPTBgb
 CwVw==
X-Gm-Message-State: AOAM530H7UJLPGk9KPEjQYoFp1pz0Vg+s1vaWz97E4K2YEg5N5/iN4sn
 zSfE1UqPkVaTsD8dHM5JaLshkdDx4FlJKA==
X-Google-Smtp-Source: ABdhPJyEoN0nKB2MkuZwYKcGoOsMAx+S4/53d81SL9UgwcSi4DyftZ0jMyFuW0ZFn8+DkfXK3Yv/Jw==
X-Received: by 2002:a05:6638:258e:b0:323:e519:4b64 with SMTP id
 s14-20020a056638258e00b00323e5194b64mr705494jat.16.1649121662541; 
 Mon, 04 Apr 2022 18:21:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 k11-20020a926f0b000000b002c2756f7e90sm6414034ilc.17.2022.04.04.18.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 18:21:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 19:20:59 -0600
Message-Id: <20220405012059.2680327-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: ensure custom kernel
 version is set
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
required.

Fixes:
http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 102b7a15d4..7ff7b05042 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -566,6 +566,12 @@ endif
 
 ifeq ($(BR_BUILDING),y)
 
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
+ifeq ($(LINUX_VERSION),)
+$(error No custom kernel version set. Check your BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE setting)
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 # We must use the user-supplied kconfig value, because
 # LINUX_KCONFIG_DEFCONFIG will at least contain the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
