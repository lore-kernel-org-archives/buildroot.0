Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 18:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F3360A61;
	Tue, 23 Nov 2021 18:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoKmy8FsS3wE; Tue, 23 Nov 2021 18:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B800D60A5C;
	Tue, 23 Nov 2021 18:15:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA3511BF39C
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9439140169
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPLZKgRvo9fM for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 18:15:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A2744010E
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 18:15:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so3144091wme.0
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qf9jq+BC+L7dhMQZFTZ1MIijv/jA1dbrfMGGvqiTQFw=;
 b=qhnrF7iHmbGgKunHx8Ew5qZS+3L1BtkZp3B4q6Ahvvzu/c6UttHTOXG5X5w2PAGs46
 XnwMBS14zfY1FHN9rBzgoKATOYM1zaUal1WLkKOSv3cardHWx8NHOTPpocSDhFho0ipK
 aWhc8oR/7FwiObbIjAKzaklHoNpqauN4EUSoc3mhvTgO3qDWez1ayzKGnzDIDGInlzQk
 TNRWb/ikGiSjSVvDgbJi6JUnRtU9OGqDLEMu9BWGlpXhMlLg/nScPfrnx6hVvZ2akUra
 A9EBD2U47vt6CMV63LKjDfkKbdGFF3Ru9QGpTD0Y1S0NNPnmEMYmAvoujnaGOXGaEfbX
 vaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qf9jq+BC+L7dhMQZFTZ1MIijv/jA1dbrfMGGvqiTQFw=;
 b=uOFAwxnDJCwCebW7o+O+0KVEbpmM4bavtC8PLdEJrMrSOfgVCO7Tkw8iQHo9abek2O
 1ep8/RCiDnpX8fhcys5HURGrdf9W6AOKq5CcYZQH+5A6UmG9bbUvdxnKDYT/Zn+C4HNI
 I6EZ2bnILKSQP1tW4AiDxNqMhaFQY/nDK+zk7pjrlt3021vIjGYHsd8NYFwbqqLHTUvc
 EJIfnlt3xg67e1aAAkm7JI/nU4GstJx5uNtv8kXv+yVKGfGx1/RQerh42268S19+2NH0
 WQSG0AQxQmbHxI1AfMa64gCawLGbIqFlJH53JkCFf4H11FZ4RxhyFGL2jbmIWtl4aQHc
 sSiQ==
X-Gm-Message-State: AOAM531B+CLTIuzED2KwXl6OM+U/q1nOXLKuEQiBrSW1ajdpge9U7/B7
 MtvAjoAjd7lXOx/iTrfliV3Ro18KGqI=
X-Google-Smtp-Source: ABdhPJyH+/K8A1rtmcHskxv2VboZU+i1A+HOgSB3JgyOLrLwPOk/9ONQ37CLUn3K1VKd5f2oHpn9gg==
X-Received: by 2002:a1c:1f53:: with SMTP id f80mr5622144wmf.129.1637691338075; 
 Tue, 23 Nov 2021 10:15:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id v15sm12605165wro.35.2021.11.23.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 10:15:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 19:13:07 +0100
Message-Id: <20211123181307.3752043-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: fix CVE-2021-40524
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Pure-FTPd 1.0.49, an incorrect max_filesize quota mechanism in the
server allows attackers to upload files of unbounded size, which may
lead to denial of service or a server hang. This occurs because a
certain greater-than-zero test does not anticipate an initial -1 value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ad-file-size-when-quotas-are-enabled.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch

diff --git a/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch b/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
new file mode 100644
index 0000000000..b269e6cfe7
--- /dev/null
+++ b/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
@@ -0,0 +1,33 @@
+From 37ad222868e52271905b94afea4fc780d83294b4 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Tue, 23 Nov 2021 18:53:34 +0100
+Subject: [PATCH] Initialize the max upload file size when quotas are enabled
+
+Due to an unwanted check, files causing the quota to be exceeded
+were deleted after the upload, but not during the upload.
+
+The bug was introduced in 2009 in version 1.0.23
+
+Spotted by @DroidTest, thanks!
+
+[Retrieved from:
+https://github.com/jedisct1/pure-ftpd/commit/37ad222868e52271905b94afea4fc780d83294b4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ftpd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/ftpd.c b/src/ftpd.c
+index d856839..be2fd78 100644
+--- a/src/ftpd.c
++++ b/src/ftpd.c
+@@ -4247,8 +4247,7 @@ void dostor(char *name, const int append, const int autorename)
+     if (quota_update(&quota, 0LL, 0LL, &overflow) == 0 &&
+         (overflow > 0 || quota.files >= user_quota_files ||
+          quota.size > user_quota_size ||
+-         (max_filesize >= (off_t) 0 &&
+-          (max_filesize = user_quota_size - quota.size) < (off_t) 0))) {
++         (max_filesize = user_quota_size - quota.size) < (off_t) 0)) {
+         overflow = 1;
+         (void) close(f);
+         goto afterquota;
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
