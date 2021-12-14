Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCFC80C21;
	Tue, 14 Dec 2021 21:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOjbVgqxc6DA; Tue, 14 Dec 2021 21:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766A680C1B;
	Tue, 14 Dec 2021 21:11:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EEB11BF3C8
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B9CB80C1B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8L35mRFq8xlt for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 21:11:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 869BE80BE8
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 21:11:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j9so2506582wrc.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 13:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3pd2yWG/7O/vqLF9PpaeZGQ0HPRqz0Wzo6StOVqKQE=;
 b=J+Z+i1GU/2icFsq8SEoWlu08fU+dGz7lSA/17t2ln3zvd3OaibeTpATvgAHGXiWG/y
 ayYrd46Dln7t5iBFHdES+BgEK/g/48v/8RUdEKO5UmHberyPrqmm4F8eWnWr4eqlnIpd
 Rsq6seKIeGlM6XD0xwbn2ZPA5MKjl72XltUOk0X5XLRX8cbqx5T93SVMs38rHsshOmJF
 25CCX4rZbvQ7OxPNBPSytvoLcHcabLlmcW/6RlJh/yO064FNHfLSBS4Mez9ootCP42Ou
 vnjw5SKBxwmX7T5OWidxV9D5iFeShpJhmpkbu8k4k5ijZwhFceusXjnHfebQI95Jj3xX
 Ct7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3pd2yWG/7O/vqLF9PpaeZGQ0HPRqz0Wzo6StOVqKQE=;
 b=uLFBZMqRlPTi7Jx134ZCVS33IsrCPffUEGmEf3oG+z0oQ3QDsBrdZU51z96BNMBh3E
 P1pFgqaNiI8tHvHHTpio2DJYQzVS+FweWhZCVR+QsWs4qYAQ7AYvJnePrSc7dDvOz2ED
 k32ym6oL61wLkHmHQmMWiNPDTD3H1tpv146uLgn+gcUWEKVvpNnBFvml0yYymraabqvt
 EYH+h5+FVj2hHlEbcJY4zJzN0apnH9kEY2fe2ZSs02AHJv5PhiPc96jlWDhcmusv0E1c
 IopXA9no2gN/nMBGnJV1YisfMXDn9Lg2CSq7efw5bT42K2Ym9UeY2g623B+PcMd3pNmI
 hKbQ==
X-Gm-Message-State: AOAM531cT8qpdiQezeAE2ksvvYg5sdGQJc0Zg1VUBjAfMHFeICJNSHBV
 nOY0ZJL+HBMD9isDGC/IWQB4qHk99Regsg==
X-Google-Smtp-Source: ABdhPJz/LJtFzTf7BvCkSlEXNVC2bnwUCc2bHxajclmfDJxYAjtQ+RMuPigYJC/1z217/2r8xws2UA==
X-Received: by 2002:adf:8282:: with SMTP id 2mr1512742wrc.519.1639516301477;
 Tue, 14 Dec 2021 13:11:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id w17sm27042wmc.14.2021.12.14.13.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 13:11:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 22:10:51 +0100
Message-Id: <20211214211051.2220248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: add libcap support
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e707f50ca1..49b4a190f0 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -29,11 +29,17 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--enable-user=frr \
 	--enable-group=frr \
 	--enable-vty-group=frrvty \
-	--disable-capabilities \
 	--enable-fpm
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FRR_DEPENDENCIES += libcap
+FRR_CONF_OPTS += --enable-capabilities
+else
+FRR_CONF_OPTS += --disable-capabilities
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
