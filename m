Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408F606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KNfBAXXQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOSvuUgX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD2060679;
	Fri, 30 Oct 2026 11:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnvdNsSWwtaw; Fri, 30 Oct 2026 11:57:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BCDED605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361472;
	b=SoDdvjOmlWzpCnnPul2gm3zSqLDCsnJQV9V26L+CUKdMaGH+XyfvUDnk/53v+m9aXwAk
	 fox7fzRo3oto2ri4k4ANjjxCbGEhN1sgFi6ELwCu5ziY2xXsYMgZ1/jx6onLCxCaoqcYp
	 cLhCVILnOrcbbwBGsSASB1yL994KAryF5MbTD3myqliSY+EAuqxeq+yGOZXFfexwb8w1t
	 USRkFMfwH0y9AXacVx/A4tBT/ghUy1sp1e9KhXDvB9hYHfiF0Q60GF2IGent0EaAQVbMN
	 owYbYOssgiz1QHqi7Doqt+Yi4BzZIhzzTOfHBte+AHwU30fLaiJ7ZiA14T+iQRX6z9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vp3Wk5EuuL4GKQpJtCY1/eO3Mykd4+7tKLpFcJ0mZzI=;
	b=WTwzKdru7wM5SnrQnYn/TRZkFDU95pIwg+UuS/AoXxappBcyjgYjwyy+jK+ipXBCP1jr
	 /AdZdMxFuLROGHhivu3F6J7Y+D3HBaDAd/NQRjyPVmq3SfSGewt4KxAjDbMB4WF4gidn6
	 6XMjHMd3x/mDDe82UQTcX9d7WDhDup5sDefheVJVzTZ61Y5a4FekrGMB8NepfVDYIVLsV
	 CK0GbVMSnSdxSOZiwt8SwHKynRZ85XC7mna5JN00FoDKSgAwJqI464Kp0MnUxlazzKfpt
	 +JmSEvfFeKR2PuBJyCQAC0T59LeGGoJ/Jc1ngiayg9OmllINAmX78M2rpe5aNlPp40A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361472;
	bh=vp3Wk5EuuL4GKQpJtCY1/eO3Mykd4+7tKLpFcJ0mZzI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KNfBAXXQCEES3LfICU9bcnk2BOPqWb//qfy7DUMFiRrkpgHh28OJonhELZgr6bApz
	 pjWOp77Oaaje5QXBWThO80QxqyYtGPhXrkflvqjJsjA0X4njTIrUYhbrfjL1mrT3eM
	 7bwKyUFZkYzeiYn1+mfKfODxu5xlr0uManKZGQroVicxfaz8Pz/lJv48qXIKSIKmku
	 w64pbm7Ry3de3WPuTsFcmaFtpZ0RlQzVqddmjEihTPhwt9N0GtnZmCYA+/I8my10+x
	 lJe0XkMp3LkEkLYGzydtERz3xXnQY9kxLeo4oIWi7nLiYk1aWPH8ybI9w3GM/R9irX
	 fhAlx63Su1d8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDED605F3;
	Fri, 30 Oct 2026 11:57:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDEEE529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDC1481107
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ditQaX7Fo5x9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:57:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EBDA81105
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361469;
 b=HIUaNjRcF92cH7V2VuuVXJnMrzadMLPlQP6ML36A1yVjGA9pxTzF8jJ5wbNKZs+Ij/L3
 WmN82S2tQJlsl+irsLSauwLwlpRxPL4yLeCwphPaoeBefWy/4ZQIeqc6hj3dqKy9pHqf6
 og2QE5hyURpCG+PsRQZQ3hzpfHyTN5L64OCzmPos/6l2/IRRMP+F3jzUjUGQv4X9zR5Du
 iGpQ3cXozrK8Fc8bT++oNoqmgY16IfXoF2EnwUnJjS6tHKZDsHwG33rOWs7Q8Y25IDC/5
 BgF6aU5XR5+1bdu8JMJd5e71V3ipeQsW+QuJJ/i68zSzLrMnuzhAgPsfxM7WNjtPHsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361469;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=j6hTXiWaVgMyJaFwGaCgjS8wLg+n5kv3IftzDTP0FLI=;
 b=FG3y2en3w59QcKEP97zcAaO5dXAD1UNvaHvTGoh6v2jje9ZEi+sL06wEWwUXwephxLmu
 m2Dy5MlFBMtiza1YZuk3HnxH+w6XTnWKcHHitIqFgQpgyxAwoX2xyxOwq+me+bFfKGxFN
 MWVGAkpVES9VXmZSccb7KzgMxKXlKDI4OGslsIubaZD/+TVqFGTpLs0Ox/iOxjDwE4qFk
 gGjODUZ7Bhc9f63HRv8BJGD2HCuCUurbwEO7fIpPKFWhk8NAKB5uERlzOHgULIDPmThdt
 x/E2ZoTluYWVxEI2Nvp1ItmWzMnFpatzkS/S2LWN/7a9n5t/s9PbbupblbsJ3UW4wmA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=oOSvuUgX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=oOSvuUgX
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBDA81105
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:57:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so3431675e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361466; x=1793966266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j6hTXiWaVgMyJaFwGaCgjS8wLg+n5kv3IftzDTP0FLI=;
 b=oOSvuUgXBOEnH9rgs2dy93LMOxePeaOqmVvmVdPFmju0PoZwWyA5kSw9NwjDBCLYB4
 7nypA5BKuvxX0ZD9UI9n6kvpUPbIFPIu9EcfdadrUdKCv7G9iy4ILpMwCe4SHvNniNXh
 zcpevLToWgD2KSpRAWLMrgvuQToZzCiyT3d2srUAv/37a9VQQ1xJ3ZqQH3F1YO11c9++
 xMhMoss4cnhbzUkq88JRh2GdoWEsn0lKhEFUuS5rXi+61SdJnyThP6xomzOjP2inH2PM
 gTJn5WA4Pz7vqMAwSXUdCrPAKTBgWZh44KOzBhgBC1sPeKULduaAExhHRiNrkTtgyFok
 VQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361466; x=1793966266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j6hTXiWaVgMyJaFwGaCgjS8wLg+n5kv3IftzDTP0FLI=;
 b=xSNujAuV56yhULPWgrGTmwGuwRhRsssFMoIrwcHfUnTTEQNMuRUGRWnai0hq2XM+y5
 psVxQbPuX8RDMteJWrvMUc0cqTCmsR6JYHNY8i1Uawv5SjFSMkIDtq2IwkCm4T5DqUW5
 O9BOgVYi9qJIMade0tEpPQxw0HNurxQSwsPbTw7KHf0urj26x1tHnWfrqrAnQISrKThl
 5Bxn6XUwlzwgxW/7yCgxucIalkOOq3wjGWBTDEoeJx16y+67yAar/4hyd5lUwDfnVheA
 ISs8ZpS6fPtAmxkFKOfQSldCAVag7sm0NHZ2UR8vNqlrxyFvgfjQaGYxqQ8Mm/D3MEzw
 tDnA==
X-Gm-Message-State: AFq9FYKiLWJ+BUHwmi4e8axBufNrs3YKVkiS8ktLwiAmvrRTqOVeti7r
 /6PVmYYbz4OaeleIZKB6dmNBB+B4bjD1Ho5M2alfN18fg8vsAqhRsUxISbeGRw==
X-Gm-Gg: AYBFou1ULNgQJ1MRHeCm9SvfKN03uGFHK97xcWGJJmBNnDKjZPh1dOZDU5Gqklm2zSr
 2NH5NPLnxkCCgj30gtfRmFCQO2sLNomWsMwooIXkGjBI4AiOTIEUZy+U/wdmKp8Prx21aNvp7PG
 NtiVbNfWV8d/wrJW9XOLegFCmm2wssWLM3IpsZgOjiWYGRqXQdNN9WTPcHqxGirW9ej/vnP/Zw6
 d4M4LVLpM0m9XddpeRWWzRQG5VTW8TIW1sVcw+Pag+Dgqnob2uxRokZ2x7ZcEoKeJGpgTC6rOk0
 Wtnb4ax/5xbFCEh6HOZ6ggMymDqhJER9PIiVuLG8fZV8TJLInEuBo5hJLn+0U7MF4gAl1RYKz05
 fs7x97YEAHZVtDjexe9Lsnf/nCTqYvyy9J/yGLG2+KUG8P2TqKAqy8C+d/OMNqd+LFQcRChO/Nr
 FBtH+Ix3EkOO9XIOShZ398xa0Kk23bHqfv8nt5TFCTnhRKb+vBL52DH91vUomRqx2J0n9IkvNh4
 I0jj6vAAprw0mpk/LTNFJK72DILFMbfM115MWdVP0QCvo3wlOka8CrD73C8O5mPMDoRn9NZmoP1
 7ZV83xFO6UQexdet+xHH47Z/L8wMTEqXr1abE7jNO1SuAELNliLIB96y6wC2NLCW0RJo/MPzsng
 =
X-Received: by 2002:a05:600c:c16a:b0:4a1:fbd2:f689 with SMTP id
 5b1f17b1804b1-4ac16fa352emr43498425e9.7.1793361466033; 
 Fri, 30 Oct 2026 04:57:46 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6e63e0esm73659075e9.12.2026.10.30.04.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:57:45 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 12:57:41 +0100
Message-Id: <20261030115741.3139047-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fail2ban: bump to version 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop patches 0002 and 0003, merged upstream.

Regenerate patch 0001, as one of its context lines changed in the new
release and patches are applied with a fuzz factor of 0.

Release notes:
https://github.com/fail2ban/fail2ban/releases/tag/1.1.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...001-setup.py-fix-data-relative-paths.patch |  6 ++---
 ...lter-for-openssh-9.8-new-daemon-name.patch | 24 -------------------
 ...shd.conf-ungroup-unneeded-for-daemon.patch | 24 -------------------
 package/fail2ban/fail2ban.hash                |  2 +-
 package/fail2ban/fail2ban.mk                  |  2 +-
 5 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
 delete mode 100644 package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch

diff --git a/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
index 75bd9aafac..922df9c578 100644
--- a/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
+++ b/package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
@@ -32,10 +32,10 @@ Upstream: N/A [breaks traditional setuptools installation]
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 91f71cf2..99ba2e32 100755
+index ee8f392..26181b5 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -238,26 +238,26 @@ setup(
+@@ -220,26 +220,26 @@ setup(
  				for f in w[2]]
  	} if with_tests else {},
  	data_files = [
@@ -68,7 +68,7 @@ index 91f71cf2..99ba2e32 100755
 +		('var/lib/fail2ban',
  			''
  		),
- 	] + data_files_extra,
+ 	] + data_files_extra
 -- 
 2.34.1
 
diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
deleted file mode 100644
index 9841d09240..0000000000
--- a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
-From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
-Date: Tue, 2 Jul 2024 07:54:15 +0200
-Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
-
-Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- config/filter.d/sshd.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
-index 1c8a02deb5..a1fd749aed 100644
---- a/config/filter.d/sshd.conf
-+++ b/config/filter.d/sshd.conf
-@@ -16,7 +16,7 @@ before = common.conf
-
- [DEFAULT]
-
--_daemon = sshd
-+_daemon = (?:sshd(?:-session)?)
-
- # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
- __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
deleted file mode 100644
index 521d899640..0000000000
--- a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
-From: "Sergey G. Brester" <serg.brester@sebres.de>
-Date: Wed, 3 Jul 2024 19:35:28 +0200
-Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
-
-Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- config/filter.d/sshd.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
-index a1fd749aed..3a84b1ba52 100644
---- a/config/filter.d/sshd.conf
-+++ b/config/filter.d/sshd.conf
-@@ -16,7 +16,7 @@ before = common.conf
-
- [DEFAULT]
-
--_daemon = (?:sshd(?:-session)?)
-+_daemon = sshd(?:-session)?
-
- # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
- __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 8627e01f05..abb1ca19b3 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  474fcc25afdaf929c74329d1e4d24420caabeea1ef2e041a267ce19269570bae  fail2ban-1.1.0.tar.gz
+sha256  4be0ea0488e32de260058462a44a040f0542cd26a9fb6fa6d2514f9dd8ec1609  fail2ban-1.1.1.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a77e5fad6c..4b9188ad86 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 1.1.0
+FAIL2BAN_VERSION = 1.1.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
