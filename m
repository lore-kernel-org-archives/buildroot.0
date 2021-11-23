Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F29FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 22:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FDA240374;
	Tue, 23 Nov 2021 22:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne-HKbbfOVTS; Tue, 23 Nov 2021 22:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41DA4400BF;
	Tue, 23 Nov 2021 22:38:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7F841BF317
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 22:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F292400BF
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 22:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bN7Y3d5D3TGV for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 22:38:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82AE9400B5
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 22:38:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j3so607158wrp.1
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 14:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oO2+pMohLMrtDIyHCSFcyINJfjj42tuJulykdEiSy+Q=;
 b=ch6YHJJ5Xd6m/3GdgaefMfG9G1JAyVNjKa7xD8rlIq9U3ZrqUh29yw4O0ypNcR9821
 DrfpMQNS76j/kPENeJQ8zzwQKmq2sfxA3ExFW72mczV/YJfnbfI5sXkl3+OvxgbrGfYE
 GxjJ9DhaDryV1Dn/X5c82s5kcekqLnfyjnaWM1InzEkCh7L3bamL3kXFpO1PQMCiOGZD
 h3JczSW2vjWKRRYz04eMVXthbzegKiueUjyqHK4ahbFxp3G5vWgW9DiVOCPs95T0WuCz
 IokNbTg6lEsQmbtbOSnd5WK01ar6IMbcuvO32UFhh8SmyDLlXq80DIm+uWXLIFF2ftjV
 mttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oO2+pMohLMrtDIyHCSFcyINJfjj42tuJulykdEiSy+Q=;
 b=Q3JCgABvX08rb4QvIolcdX1IrnhgHLLnpPxuKU/c89EwuZFjFu24ySLFXyD4zOxOfZ
 97CnvnBWYJGfgoz0kO4nldnf7xiDS7X/JOpPlifG1A1OyaVn0if0uInLDN4EStvmlGos
 x79nB7D8KX0FAw4dG6lLWfUj38p/L6dUcEx2MKD251ZpsJQ3fizD09FlVF1z3YdOp5P9
 kKwakqWDLZO7PERoxFmMrTRDgby3AAYMaN93asvVWRcR/VAE34gJruWjV2jRNfLAUqoW
 Pw8tTWbV10XRPq0uK+l7e6kg2TbsEOXRqG2Na5xvEySyRSBuPjQ7n2LzZdNSpY0prGFq
 JilQ==
X-Gm-Message-State: AOAM5306HJO1Bf/awg6J76euwPW29zl9piOdWEK7jLoQhXP9Xy1Eu/lT
 U8zBPitkYp/T9hHYm42Mu7aHTO435JM=
X-Google-Smtp-Source: ABdhPJygixOJXVdTPkkl0YHAMoTGdHADuxwHzdgqhlaxR+9mSmtoEgIYGjiFHhZ5KXfbpGChKrtikQ==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr12300217wrz.127.1637707130425; 
 Tue, 23 Nov 2021 14:38:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n7sm13117822wro.68.2021.11.23.14.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 14:38:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 23:36:21 +0100
Message-Id: <20211123223621.3804258-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/pure-ftpd: fix CVE-2021-40524
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
Changes v1 -> v2:
 - Add PURE_FTPD_IGNORE_CVES entry

 ...ad-file-size-when-quotas-are-enabled.patch | 33 +++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk                |  3 ++
 2 files changed, 36 insertions(+)
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
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 7e3d18b433..35a1aac917 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -21,6 +21,9 @@ PURE_FTPD_IGNORE_CVES += CVE-2020-9365
 # 0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
 PURE_FTPD_IGNORE_CVES += CVE-2020-9274
 
+# 0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
+PURE_FTPD_IGNORE_CVES += CVE-2021-40524
+
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
