Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DBBC77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8ED281FE0;
	Wed,  3 May 2023 02:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8ED281FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43YCoQ7W15WL; Wed,  3 May 2023 02:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E87B81FB7;
	Wed,  3 May 2023 02:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E87B81FB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48ABB1BF860
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F950410E5
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F950410E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfCeuVm9SjFI for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17025410A7
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17025410A7
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:39:34 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so4056900a12.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683081573; x=1685673573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtD7vjhoYmDz3zSXcWIQpVGN2HtyBMAgUAkcjcKdi+4=;
 b=Nc8sXsNaYWv/zP8EqQymr4jlXJMukaMJfVr+rwTBuruYW8gn+HA4pXhGTPxwRbWFB0
 xfFZXNpp56DoYE94um/NtMBhc72EU4GuBun6GFsiT5UosGAh2grEblvqqZyqlcDB25SU
 ho0/7UAH1ioEF8DQlgbf2WmgsHpRxydCT/JkWhz4uKxGZyxCEdYvHNFUOkajsQbNzHql
 iuskl5yk7niW0/UOvCu3aA/7vpvdmI/7Cx/Y67yEtd971fsxtNFnr/dHrlUDw7Gitaea
 z/GrT4Xaz3RgN6zg5vBR8e9BhL4r5oJTbD2W8s5Yod1WRrR8oC4ObFnoxF7MspsSvWac
 30GA==
X-Gm-Message-State: AC+VfDzxGn/r/3er85svndhSC8Jb/gwo+mBmEDfObzunTUFua4UDMSTL
 VT4pfMzx/eo6t8wgCMn9ByHVmVLx/bsbhA==
X-Google-Smtp-Source: ACHHUZ4bqqsbC4oxdCLS6SLlCAgieIkH5jvgW3T1kgKql6pyZDzq0VsrE9bHiVDVDtrKBJzK28g+hw==
X-Received: by 2002:a17:902:d485:b0:1a8:1e8c:95f5 with SMTP id
 c5-20020a170902d48500b001a81e8c95f5mr535239plg.69.1683081573296; 
 Tue, 02 May 2023 19:39:33 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 bf9-20020a170902b90900b0019f9fd10f62sm20457499plb.70.2023.05.02.19.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 19:39:32 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 12:39:26 +1000
Message-Id: <20230503023926.587412-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683081573; x=1685673573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dtD7vjhoYmDz3zSXcWIQpVGN2HtyBMAgUAkcjcKdi+4=;
 b=sIgzJoWWdCNDx+tUHT/j8+Kq0lqg2HkMVS0/up3HysXGVz9ZcJz/SaAxS2GDa2FTlL
 jvwLwatk+gXKJ339kIovUmU+Y/OXyySjqlA+gjsufy+rSpTsgEjazFCc/YgBY2Uh02qp
 s9r71JnYGJPQ2crevYl4ZyB/s8e6nsqSr6U1X2Spj9xY4Qgk7a4qXolNGO/y7pzMK+LQ
 rxtLAEXbC/j7XfZOcVqi+9GIJkZaBYwi6Eml9LIt4sERHfMPf32svcQ6g84Ln1HFiEap
 x14MXPfADFkV93laXDEdDvYZJ6++QhZOcWr8KKG1fydDX1ZcOgP/jOeKbB1/m07iAq8X
 ELnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sIgzJoWW
Subject: [Buildroot] [PATCH] package/cmocka: Ensure we always build static
 libs
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages that use cmocka as a dependency will link against the
static libs, so let's build them by default.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/cmocka/cmocka.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index eafb4898e1..e21296921d 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -15,10 +15,6 @@ CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
 # cmocka only supports out of source builds
 CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# cmocka always builds a shared library, but you can optionally build a static
-# library as well
-ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 CMOCKA_CONF_OPTS += -DWITH_STATIC_LIB=ON
-endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
