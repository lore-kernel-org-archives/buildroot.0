Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DD5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 10:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA42E60D66;
	Sun, 30 Jan 2022 10:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T87bR-_zhWdm; Sun, 30 Jan 2022 10:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 442B860BDC;
	Sun, 30 Jan 2022 10:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0CD1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 10:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0440E4087E
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 10:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbmZW6293lAH for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 10:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2704540877
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 10:51:34 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id d10so33435987eje.10
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=xsJlMl5YHZnX4nVj+qpzDYoIi78b4/5fnSiL7nWImUI=;
 b=IZDS75WPQ9QLY7ODE0zak1ufLygTmRswx2G8atbw+ntnpFlWb9lud3si5ThwUf6WXB
 8LF6dl67iHrIZH8dYRLsLJlEaahXFxAHFT/VIMbUJgK8ZnA7/z6kldvqCJ9QXslBvEfj
 dgF+NNiNZMDJ6EFsn6+93pfiJ0WQd5TMX2DwlBvAkeuRFqw/dpPpQGn18NA0Ok6XL1RQ
 dUqDqq20R2tb4U4ZSzkWbhkqzUsu5xtqZS/ElXgo80jv7N3CeWidhcYwIat4v+29uvPX
 AJUBi1ZtV3nr2x7fdtzn9TD0zgS/7I3nTEkAdM99a8A4Bmb6qqvQI/KR0YOeHdTmf4wz
 aBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xsJlMl5YHZnX4nVj+qpzDYoIi78b4/5fnSiL7nWImUI=;
 b=eujwL3OwjeXwR5yGR5QZGrq2zP0Nj5qFBK531Pr4KlED0O2bnXYO/cIYsVIERUEITB
 nofxlvMcF98tyI++6eJyMRR0pYaNVBCZC/Z4KtBTgymm0ZUDe0svhhQBanZRy2vYxpU0
 aAG2Gsjh7v9o2+GGW/0sR5nsCseji5uJqd5A03S81q19t8NfLXnVtT3aM5CjgAiViq+d
 +n2I05EnbbdThisOswHqZUZBXscBN7HfvUBkg/UZr6+6eLA8lJdObqp9BiTDUTkY7g2n
 8H6Jv2TWjnPtIhzKUAzsZ0Qt0hQt3bysOH+PYsgLnu+ui7EQlVmzgOrxduqPiIz06U/I
 K6jw==
X-Gm-Message-State: AOAM532BMSak021PpJq3++UJH2Z7LSKUYbKiSy+9bnGlw9zBFeUANFV6
 P3+V7tEcJAMuQIESdU3LxZBCJov8Zmnrug==
X-Google-Smtp-Source: ABdhPJw3YyR1SGbB46e3wtmgH4v3/KY3rt+ngtSobO0fZt/y1IjGDrhkWlRIzxA6W6BTHvIzHnoZcw==
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr13549368ejc.220.1643539892753; 
 Sun, 30 Jan 2022 02:51:32 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id s20sm3890401edq.55.2022.01.30.02.51.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Jan 2022 02:51:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 11:51:16 +0100
Message-Id: <20220130105116.18458-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for hostapd and
 wpa_supplicant to Yegor Yefremov
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
index fe8de1916e..a4b4fa2f70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2992,6 +2992,7 @@ F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
 F:	package/giblib/
+F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
 F:	package/jquery-sidebar/
@@ -3020,6 +3021,7 @@ F:	package/swig/
 F:	package/qt5/qt5serialbus/
 F:	package/sdparm/
 F:	package/ti-utils/
+F:	package/wpa_supplicant/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
