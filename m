Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63722409EF;
	Sun, 27 Mar 2022 20:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCDSdykSQEzp; Sun, 27 Mar 2022 20:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33687409E9;
	Sun, 27 Mar 2022 20:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11B61BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ACD98139A
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qP8xQ0RQGLsn for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93F5481395
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:33:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so17655910wrb.7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujKU1j7/cW4qYdlTFBPkxCB+0Y2WGgfnrx6UDNxulAg=;
 b=XL9AjXU8YQVCclPh0axlKyFnHdhioqLpPbDZf7VscCtS96cKy7xOqj7gfNGdwG2YeS
 jjMMYko3jQlIvKhTlJDRaaNNiWPJqKm5nWUzPE5jNiXl9tWqUk1btINRZpRrF3+Y1sMB
 wnGpB0xzn6lRaZcWcfoWCG5NTzcATRRcN/0N+RKRX3h6ZAS9FTrWDjEW6PpkkS19rRcY
 9AUi1zQGHEzCvGeUyCKD7LmW3AoYsMQM+tSRn3ZQGO3GY5u1K7/OMR0UGoXn6noMtNme
 uuzOxrOZQINDNe0yBcXWs2modviz5ZPxJdHuATBO6fKBO4VNM/2ki0gZE2j3mr6+GY/X
 ZWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujKU1j7/cW4qYdlTFBPkxCB+0Y2WGgfnrx6UDNxulAg=;
 b=eyHPBfQdf1CLZuTW3mD+XiWD8EsfDzzMn4O9jVRUndbEGig1HAMKN6gGM+cULwGQ4D
 f/XkkDvsfhP+urQao6TkhZgpmaysqbK16shcNDzdP5/W8PYxyGr0svZ+ckKFR5KqWVoD
 f+AsR/1TBkdNgFg1TrXoxSocbhz8PeFm39WbpBmdRfEieyt/repSPHRskaV2veCQrtFD
 HaazKxdDm56pEQBs0Bn+wxGfkvYGcQp3gF/KWd+N2b/T2gIDyUOpqbDoaUvBY48Or1SU
 bOqElLWTWYwvSCtfTSjhDJy6s8Z3CBTX18gSEfMoQOQkVSQBbHDcJ8wZM0m+z496mn3d
 9AlA==
X-Gm-Message-State: AOAM532acPxhbhgvB8BkAel0BzpWlA6vh4D+m4ZDHlUp0XNJurlnSHiB
 RAH/V5meKBHNLjfocNhLjwpy1vfMAZs=
X-Google-Smtp-Source: ABdhPJwr0EcWUfAlo0rXTg2bA2LF1qaXTqr6jMgv/ztKoDFHIOsUAVhwOOF/7m7ic78ZnYOtsrrIRw==
X-Received: by 2002:a5d:4245:0:b0:203:dc49:2604 with SMTP id
 s5-20020a5d4245000000b00203dc492604mr19795025wrr.32.1648413229514; 
 Sun, 27 Mar 2022 13:33:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm13846875wmq.21.2022.03.27.13.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:33:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 22:32:18 +0200
Message-Id: <20220327203218.1331528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/matio: security bump to version
 1.5.22
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed heap-based buffer overflows when reading (crafted) MAT file
  (CVE-2020-36428, CVE-2021-36977)
- Update hash pf COPYING (year updated and contributors added:
  https://github.com/tbeu/matio/commit/a3730c09797372a5919140b4618f217bb54bd1a1)

https://github.com/tbeu/matio/releases/tag/v1.5.22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matio/matio.hash | 6 +++---
 package/matio/matio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 4dd05dee07..4634074ca0 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.21/
-sha512  b00bcad807e6a7e10afa656eb77a0e3e9fb08d9cecc3e94ba41ef91ce60367d6686e6d387a874bbb83eb2f895d4a97caac554a70e7f5f6f5cb750052702d411c  matio-1.5.21.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.22/
+sha512  33fd3991413e94dfc9aba13ffd08b09ddcbdb9dfa579124d981449e195a8c61a3dc95b55e46bba360d48456c117cf36403af1c3448689c26b8aea5fa9cf38323  matio-1.5.22.tar.gz
 # Locally computed
-sha256  69143d4a8f1933022bb909327df1ce812dd2420ed57949812dd8f370856bf2a1  COPYING
+sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 236466d4d9..d282852d37 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.21
+MATIO_VERSION = 1.5.22
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
