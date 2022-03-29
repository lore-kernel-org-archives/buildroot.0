Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE14461022;
	Tue, 29 Mar 2022 18:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWSzUp0xIe0I; Tue, 29 Mar 2022 18:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7CB6101D;
	Tue, 29 Mar 2022 18:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69DBD1BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55C998430E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHmFfqjOnLyR for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:51:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D38BB84303
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:51:25 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so2031654pjo.1
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xabvM/RKKURkaDVx2RJ5jURBx6anj8ibjJkpr5RiBvE=;
 b=GjMSEcKHk9WvpeJ9/ssCeOtN/PoI9+Jm8avgPkYCCbn5FviAnrMYvT+NmzSInE7+Cs
 qJvk7Crbnn5Rqz4D1ROzL/JhOx8Hb0g37aVQfb5nRr6kCx0kVqVKI1bu5G+phXYggwk2
 dUxSsq89mGKdccSmtMN/+6XfLjH877rX32IGAhJQxZF2O8T62Brxo8408uOCIQdTW9Ih
 cLa0MRC7yvKYM2ajAgZ0bi+f1synTsgvenZ20TPnUwnP2/WystqlF0abFBKDH47itEaf
 yp3oy4lW7mB3BwTL0APAVmAde2bemLTQkNp05h39HIGZqCZDK6+WGgWpe2dkUO8AkKup
 Obdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xabvM/RKKURkaDVx2RJ5jURBx6anj8ibjJkpr5RiBvE=;
 b=z8apNLkiGahb/gPX7NLkITj+LglAaOOeah4Eb++fiM5A1zgrOU7WhyLwKsQrSTSMOc
 KiwVg43svtDOpYwImcH5lvJekCkVHk9PO+Ac6zDNJOYVspcR4JJRZp2714yh8dXcsxPv
 +RqemRuFvZ8al8pHCkU3Twzcii9qasLIvOR++xsmV08oUI3hqlTqJ5jwyTqWqfyDG0Fd
 Dx19xmYNBnVKIGsgPvRAJl08CaLLCnAFZHmEn6mXbfcjzRMaaqc7u0ahp8h6cPXke3DX
 MQae8c4y2pdf1eW41i+9PNcCDNO0IJgAS5sljv/hDThOc99eCkb+YHyRINgM9LILPZPB
 2OvQ==
X-Gm-Message-State: AOAM531Tw6NBByVJyy8uKCGZ1ZteXCR47WRZv/LxOIeFBsnO9ucaT5kZ
 FNnReadbjxhVw2zHClWId7/XG7nSLbiJjA==
X-Google-Smtp-Source: ABdhPJxZEuUu6xfGoO+TTcjWnvKstzptlEWBhQkCv1XBwnJtlOpi6rP7XHL0L6/4GmC2O37liT9p4Q==
X-Received: by 2002:a17:90b:2242:b0:1c6:80e3:71b6 with SMTP id
 hk2-20020a17090b224200b001c680e371b6mr541532pjb.152.1648579884855; 
 Tue, 29 Mar 2022 11:51:24 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm4836774pjl.3.2022.03.29.11.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:51:24 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 18:50:59 +0000
Message-Id: <20220329185059.943889-4-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329185059.943889-1-alseycmiller@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add Alsey Miller for libdispatch
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
Cc: Alsey Miller <alseycmiller@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..555ec0175b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,9 @@ F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/xen/
 
+N:	Alsey Miller <alseycmiller@gmail.com>
+F:	package/libdispatch/
+
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
 F:	package/libxmlrpc/
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
