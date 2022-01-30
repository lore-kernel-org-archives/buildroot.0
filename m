Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88137C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 10:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D863A4088B;
	Sun, 30 Jan 2022 10:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41cj7sWFPIRX; Sun, 30 Jan 2022 10:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2992440892;
	Sun, 30 Jan 2022 10:55:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6493D1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 10:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A6C4087E
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 10:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEiFQcS8XlF4 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 10:55:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B450C40871
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 10:55:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j23so20854076edp.5
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=PwUDDrBYcyXJgGcnprF21nurbK1oPo0EcYSfkIgoFR0=;
 b=AWYWdvmU+CWE2/UYO2vnf9JaQ9mSPNtFhTEoygjo+1jBaGGvoxhxUjH0vIoL+kfLcp
 djek4R0ML6pbJw80f5fF/YT8WuzV7+VW7RuL28dCTtj3In4yXE5d+WLGyDYqoAFsUw0m
 uiTHBsSvhxSzyiZK660DMwRnXhGkvKrsYLBvErmfoxP0qC6Ye6GcSj0qW650nKwXiSIZ
 fhY3B7Ovba1mObDOgibNB2fYS5FgF2xrboncaRqav5UPeZ6anoDm5XeDz+7H610yZ1Wp
 1NNMCc+AO9p+cdrRPtf7S121r0pumTvgCqDreigx63u0y8f1gKLy8k0yN+I9SFacK5zK
 qaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PwUDDrBYcyXJgGcnprF21nurbK1oPo0EcYSfkIgoFR0=;
 b=VFDiel94Lxa+4c6TvVDmYRLoUr+ZKguHRwKk7epz4vQ4wlLu2uRJ8O6oG9jF/kU4lN
 dwP+r2Pl+2nEhnQUZuo1+LDCgPiAAy+fIx3roMLiz2IWOKEbdaB+q85jw1rBPJ9jRuvy
 7IH8jdTZPjUfeN/1/iRrfxDsU2roiqR+m1jDP8ckvaJIx9zudNGgWhgMX7FrClGg6r/e
 xh3WQ8rE4N9lwUyGnYyxntQF7/tQBxgo4XqF+Jzy1v3z3+JAkAD6+I97fN6oRDgZGYRH
 55VMdl/PNbJWZZBMhAXD13VbTik6XwO12ZdnwCKT8GBliJ1qGHFTTKX8zeMj7LYTmzsb
 QNsg==
X-Gm-Message-State: AOAM530vhUzvqhWx4FUyLWHkDjEkTBwZT6wFLhltRFMDFXaqpIjb6T0R
 toKJ054tUBLgxX2BEuIFeICb9OAyluvEPA==
X-Google-Smtp-Source: ABdhPJw3IC7QYbjPLqr51POrQ1VD9O+YW7vNM5qkPMTEqrRUcSiNJs9WS8vPimAkg1QWel8ACZW4Bw==
X-Received: by 2002:a05:6402:2376:: with SMTP id
 a22mr16193822eda.3.1643540102832; 
 Sun, 30 Jan 2022 02:55:02 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id op20sm12124509ejb.68.2022.01.30.02.55.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Jan 2022 02:55:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 11:54:59 +0100
Message-Id: <20220130105459.19339-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for libqmi and
 libqrtr-glib to Yegor Yefremov
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4b4fa2f70..e17803f38a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3002,6 +3002,8 @@ F:	package/libical/
 F:	package/libmbim/
 F:	package/libndp/
 F:	package/libnftnl/
+F:	package/libqmi/
+F:	package/libqrtr-glib/
 F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
