Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A434170D;
	Tue, 15 Mar 2022 17:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7_asWbUFpCW; Tue, 15 Mar 2022 17:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF41F416A5;
	Tue, 15 Mar 2022 17:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11461BF574
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ED0E84274
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7t1xzWLr6T7 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 17:35:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A37B384272
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 17:35:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x15so30048775wru.13
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TVpfB+sYyvceNdUUBDv8EcGNjCztSDt+efLAiXsnaA=;
 b=lJZzmNwKasgcFgfZSLIO+VsDqfyWElvwx+xhxK7pg1xLIl54vsIadZdGZYRI3I0J2b
 ir84WWl2QiogVMThosGSxwifu4Rr0JRTA/lRsmePl+6bnVqN2yPYQWwkycSgHP9KD1yw
 m2dfWcJ3TGdYlLb5IvLuqRynNd7OvuTRjDyfIovC36kOaci+qdPlRO+K+Hh5/+/wGNcd
 P6TQObVFNk5+Vkba5p7NfZoJW/snVJHMR7incj5pHapJy5O9w0622Z9mJ9pl3rX+1dHn
 HhESmTfoDwx8JApf+2BLebwdyac9TPIaEiURDkouK50eL8A7nXVzHjlP0CSAS8BfHc4P
 kClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TVpfB+sYyvceNdUUBDv8EcGNjCztSDt+efLAiXsnaA=;
 b=nhLsxVComCosMKHqTpl056XxcL6quJcX+JGUZxQLVTse21+tQ6cDd7AwYGrtbgcL/4
 K/Li8G9M50T7u6zBeKHBQvnSSzUZkCVQ/pRUgeIxRyaivJmjNGtkHzxgrv/0tfZA4gca
 ORlIMDZU90OdmK7z+XR8vNZxYp1g+w4iryJHmdGgXLWCnQlNp3aveTmK5n+KchreSn4p
 ec5VLYsWR5ju8cW4IvdImpJI/glt1vgMUrdL66Qc3TxYgCQ6unfXD10cn4KwHTozuP5w
 eGK2izi8iZRtqPld3RTNB/t7bPdUKlIbe6NPQ2flYEholTffWJI3zfHg/YlAzwPe4ZxE
 t8WA==
X-Gm-Message-State: AOAM531j3IVIm5vS2RwICwVrJy+Iu/0KsoX4ppKvJWcgHFeG6KjuEzTY
 mk/J9SjS6o12CPS8Y0VZHRblpx/NdU4=
X-Google-Smtp-Source: ABdhPJwVdpIwRXnw7NclnAuhca5VwtM/A9fXL4f9XmQ7th6TFlyGPAdQ51sL1EcFiNOyp41jgZ5rhw==
X-Received: by 2002:a5d:4392:0:b0:1f1:e683:de90 with SMTP id
 i18-20020a5d4392000000b001f1e683de90mr21971686wrq.551.1647365728545; 
 Tue, 15 Mar 2022 10:35:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d6707000000b001f067c7b47fsm26809387wru.27.2022.03.15.10.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 10:35:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 18:34:29 +0100
Message-Id: <20220315173429.1987326-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libiec61850: security bump to
 version 1.5.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Retrieve official tarball
- Fix CVE-2021-45769: A NULL pointer dereference in
  AcseConnection_parseMessage at src/mms/iso_acse/acse.c of libiec61850
  v1.5.0 can lead to a segmentation fault or application crash.
- Fix many other vulnerabilities:
  https://libiec61850.com/new-release-1-5-1-of-libiec61850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 3a024be7c6..a416ecdb4d 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b832c195ae9f42faa1ccfe1b82b9ff187103155ce45aaca08881be98459d164  libiec61850-1.5.0.tar.gz
+sha256  b6d7ffac831e7d9aec3470e45e2f1734071859c95cab4cfe99ffd1091776b3cc  libiec61850-1.5.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 6da782ad39..9bd55cb76a 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.0
-LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
+LIBIEC61850_VERSION = 1.5.1
+LIBIEC61850_SITE = https://libiec61850.com/wp-content/uploads/2022/03
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
