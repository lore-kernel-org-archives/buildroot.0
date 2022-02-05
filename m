Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E667FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9764D8139F;
	Sat,  5 Feb 2022 22:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Capb9Irgx6E8; Sat,  5 Feb 2022 22:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E21E181324;
	Sat,  5 Feb 2022 22:23:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2C5B1BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F6160758
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKATIpTyt_kq for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:23:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DC2260608
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:23:42 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id s13so30525883ejy.3
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9IIJHNtCUfIYkzf9O6YdvxNZVXCtoKSOIDJM+tRvrg=;
 b=SJ/TgAV9HgLGyKdDQT5NrNHcUH9yMZjzogmthgK23ZdInHb6PWANCxfGcFztfTBfmL
 mNRujqpm2OHaE5wQgGj624VI9NTQnYf7xXq2UC+punbcdK+2dU56aRoGKd0xN3GCEbIG
 6j6XAyTJO/smvZJHMd1L28geMYL4V20Awx9rR+1dzz3jj7Jrnj3T8XlcRZH+jb+g1Cj3
 LJq7KnIGvB/NeNjt2ZNgx7RFhgslxGMGLEuYPHHpe8bCr4ZeJzhqr+fGwPUtNIWxNqii
 SiiVEgL5EMf/XI95/AH6F6sCsS5eV1UyxDMQft8c0wK8cc/EnQXlVOiIcS3QkapbzMIv
 1HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9IIJHNtCUfIYkzf9O6YdvxNZVXCtoKSOIDJM+tRvrg=;
 b=0pezPHRbJLroq3Vua5SGJ2S4JIWjg4T8hUYwd/MRQuvAedDr/Yd+tXWyns8V/TU7pp
 wJMaBr5haWuHYgmTrKx87odQlucaayuSX1Ff1gD0dSCEwvyoiXK2e3XPutJOCnc3dyVW
 E93QOSsZsS24ZsMo/7bRQSAJfblUwdCjWgbTcAwdqiXgXoJCumvWXqm3SxWBj5vujCxp
 xgl8v530TYrIv7QD2f+Rkbp1hQ1rcgYGaKQ+iteNEPejzS9rI8fnLtAzebTrYQdRqy62
 Qo8P7s/VqWxX2hwHh3KsaYu0CEa9l03a00vAhUzmOx74SMtqNeKylxS0f6N8MZMr7NJW
 fNag==
X-Gm-Message-State: AOAM5308z9yopYQ5cl2a0tx/s5RFYCg41bLyDwv/SIGSkzF8hJDb25h+
 IR3B5Sua3j3crwro5O5DG4leekr6JPiIYw==
X-Google-Smtp-Source: ABdhPJwf4T0JKrjZuax8rtI2Ur2181fYlrwdYq4Mww6bZwnXSvi/sDNvGPsD21tMyZv32fETjOcU+w==
X-Received: by 2002:a17:907:1b15:: with SMTP id
 mp21mr4372967ejc.533.1644099820189; 
 Sat, 05 Feb 2022 14:23:40 -0800 (PST)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w8sm2018426ejq.220.2022.02.05.14.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 14:23:39 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 23:23:31 +0100
Message-Id: <20220205222331.3432353-1-arnout@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/manuali/makeusers-syntax.txt: add caveat
 for upgrading
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the change of the range of UIDs that is generated from the
automatic ID (-1), it became apparent that there is a potential problem
with these automatic IDs when upgrading: they may have changed, which
means that persistent files that exist outside of the rootfs suddenly
have a different owner.

Add a caveat section to the manual, as well as an explanation of how to
work around the problem.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/makeusers-syntax.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 3d1013f447..cebc6240ae 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -90,3 +90,17 @@ This will create this user:
 - +shell+ is: +/bin/sh+
 - +test+ is not a member of any additional +groups+
 - +comment+ is: +Test user+
+
+
+=== Caveat when updating Buildroot
+
+When updating buildroot or when packages are added or removed to/from
+the configuration, it is possible that the automatic UIDs and GIDs are
+changed. This can be a problem if persistent files were created with
+that user or group: after upgrade, they will suddenly have a different
+owner.
+
+Therefore, it is advisable to perpetuate the automatic IDs. This can be
+done either by adding a users table with the generated IDs. It is only
+needed to do this for UIDs that actually create persistent files, e.g.
+database.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
