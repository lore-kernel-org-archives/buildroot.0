Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED34C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 17:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBF984837;
	Fri, 18 Mar 2022 17:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiyYfJOsgCAE; Fri, 18 Mar 2022 17:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28520847B9;
	Fri, 18 Mar 2022 17:37:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 542271BF34E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F6504016D
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzdFqokX0Mqw for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 17:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C86B840117
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 17:37:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h23so12037905wrb.8
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nw9IpBiGPIhh892/HEnK4UaFa+6becqFngBgbJuAJYA=;
 b=JNbr5cb+q9l0PYjB38cu0deu1WLwp2xa/n+g+PjwXMjf4+3vlg3cf2rPwJbHFvlH0J
 xrfBsrqBdSVClFJO3qnaDs5zF5HJtPYljmRmngEIFOGyjvLKB0jMB3eyCdmHn9vgiSDV
 M47tSBaqAm+IjRZ1qcDqmHJq65wNywqzYJh2i9P0dcVfk0J3HvrZgxUC+5Ylkju7QWdk
 sDwB6kDF8ZxVpAOEgCmfoCQf3WvKDmesPi3C3BhSguBYvAH5SDkbNKxaSRDqW8fQnYTG
 WA329mu+cXP4bZLRj4lxBL5SMHc7cXFbtikhzahOC1tGpo1eHr7YML1M+faV0Nd/hYg8
 s2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nw9IpBiGPIhh892/HEnK4UaFa+6becqFngBgbJuAJYA=;
 b=QdgQggMXDzrB7B/mhpSfp2jjST/fHtx8WcDVP9ywV/Cv+ZEVYCcyuzfsuUGptredsp
 Ju/YbcmsjHWQ1n3e7RvMfzzox91GeJYeSPphaKAulc2DkgHgoenuG/huAXQX/VEb4k9S
 XDpc/enz/wDy1le3FCjxVNpFckFz0Ws2jTt37Imoj6ND0FxqF9fzPUlZdq5P5JqLez9p
 hLPxeljn8YVhgS3aZBcxvQSYqPc6HN4yhbn8g3rCVMVFzdJ0MAxLBms/z4U5tcpDd88Z
 FfJ6qQ6kYPVmW4ew32nDOg3SjwU8Pj+n42V4u3iAWItG5Ozboj/HrOhafCNkPpt1KczC
 tR8Q==
X-Gm-Message-State: AOAM531yNNjqHvTLKu9GWrCneU7y/cE5vEtbUOaFRblzvcL4sB/U0bVJ
 QNN6qPtzcNcJ1bo4KEaGgeq+Of7cybM=
X-Google-Smtp-Source: ABdhPJwL1EEPhiEGYlRq+/n1e/XCXbnIl4wzaxoLB/GXLAsp1/+h7tRQde+OfprZTZD9tmnCmtFX0Q==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr8944061wrn.246.1647625051562; 
 Fri, 18 Mar 2022 10:37:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm9117275wmq.35.2022.03.18.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:37:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 18:35:07 +0100
Message-Id: <20220318173507.10160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libscrypt: fix CFLAGS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't pass TARGET_CONFIGURE_OPTS in LIBSCRYPT_MAKE_OPTS to avoid
overriding CFLAGS (and so loossing -fPIC). This will fix the following
build failure raised since bump to version 1.22 in commit
4542c6714d3951070c31739d24e4bd42b446fbae:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.36.1 assertion fail elf32-microblaze.c:1534
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: sha256.o: probably compiled without -fPIC?
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value

Fixes:
 - http://autobuild.buildroot.org/results/ba4234ad305badb5ce815080ddcad6727e8d51c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libscrypt/libscrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index d28bd4e900..193c963f76 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -11,7 +11,7 @@ LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
 
 LIBSCRYPT_MAKE_OPTS = \
-	$(TARGET_CONFIGURE_OPTS) \
+	CC=$(TARGET_CC) \
 	CFLAGS_EXTRA="$(TARGET_CFLAGS)" \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	PREFIX=/usr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
