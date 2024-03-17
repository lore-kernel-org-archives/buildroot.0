Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E17C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 10:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 305164016D;
	Sun, 17 Mar 2024 10:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ihU3sVOG313; Sun, 17 Mar 2024 10:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D2004035D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D2004035D;
	Sun, 17 Mar 2024 10:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5A51BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AEF74035D
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBiB4fnjndYQ for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 10:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 132E34016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 132E34016D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 132E34016D
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 10:55:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4140727912cso7730525e9.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 03:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710672936; x=1711277736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqRfEHoZ2DbnwScwLV79JZvH+1bgcXp3DehLiraJP0M=;
 b=N+PdIZGVxks13WGgJOyRFsAK3NfBkVH+jWhYwUiBP43j3uECFrwomORuzRIPcmOCl/
 4yyOePbu/KuO3DAQiTgeI4ceRBNSUGTNoQfCoC0oy2TUKm8bN7vI3DmfI/OlSZCvhCzw
 HC50IoM4E27KlRqK4/mgeRmPwNl+JN4doE7jR/YNKbohAGxoUlKPZSQU6667F0181k6B
 PP4w7Q4xbQm/183azzw7gqXQZP1qOwRjHEvwbMMvA7Ck7bzzkSuLVJ4WnPVPKW8ZbI45
 gcXqA+MgYQPwsy5MUjeVljlQ5w2dRBYgvlfSCME/c3qbF84B18OD8ot+D4R6p3zUmL6r
 Uing==
X-Gm-Message-State: AOJu0YzEG3Co30LHbEJFSZ/7gJUAqeucKgQ5wqsf3g2o9ncyFU3XlcsS
 PPLI2FWaxNBGDtMUI2W+wfAwLrSlVMhtvgSWuM0LMHyYBiEGgUZtMPZNuJj+
X-Google-Smtp-Source: AGHT+IEMi6XD0KSbTV4Duhz+ayXwHqG0ibZ9EUZy4X/Ah70KWnowsCG7EsYFGX/4+KHwOm9SukkNfg==
X-Received: by 2002:adf:e444:0:b0:33e:726d:e963 with SMTP id
 t4-20020adfe444000000b0033e726de963mr5617261wrm.17.1710672935546; 
 Sun, 17 Mar 2024 03:55:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k4-20020adfe3c4000000b0033e48db23bdsm7275794wrm.100.2024.03.17.03.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 03:55:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 11:55:29 +0100
Message-ID: <20240317105529.253562-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710672936; x=1711277736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eqRfEHoZ2DbnwScwLV79JZvH+1bgcXp3DehLiraJP0M=;
 b=M7Et6w4krEVKkqiG9wlWsHk4CWEosrBrVmKaYJ0+ZMJhKBDt+XIq6VWSWtr1NUhuP2
 ILXzp3Rv/3ucX2bst8SC4vKpahmu3sY146cZAVBtOrWudhS+i8WBKP0ydxxqxg11msmI
 NkNzpaFy94qcAggceFIL59j0lEkWf1FFK3b6d9kg8Zwteona5A2kKqtSxOAUK+7WlqSI
 fsGId0iIYjljj9HB8Pwcaq7tv1sWU5fpsthUPw+Z4FfE3fOshqJOHuheJPj5PVZ+uC0+
 nX20vA+pNPN1X+9frf9LdSLiwWcyC9eD6L5D1o5m+YdS7DnRt+A+zvkf2mKhXklfv2uW
 aYXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M7Et6w4k
Subject: [Buildroot] [PATCH 1/1] package/libunwind: fix libucontext handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 6ea2a27f9047696ce1c463ad55fb4a78df136954 forgot to add -lucontext
to LIBS resulting in the following build failure with zeromq:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libunwind.so.8: undefined reference to `setcontext'

Fixes: 6ea2a27f9047696ce1c463ad55fb4a78df136954
 - http://autobuild.buildroot.org/results/893defe1588b2ca03c115b59b47be3f4aed438fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 15c4e4863f..94e9bbd1b8 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -17,6 +17,7 @@ LIBUNWIND_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
 LIBUNWIND_DEPENDENCIES += libucontext
+LIBUNWIND_CONF_OPTS += LIBS=-lucontext
 endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
