Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F8606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 23:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EEnKtcvT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258A040E08;
	Thu, 19 Nov 2026 23:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxO-hIcQPN0J; Thu, 19 Nov 2026 23:07:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3DD0F40E01
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795129662;
	b=hjzR8hyQm0Ex2zoCGVoEpKdF7y4vjhaeuzeMyIn6OsWOkHwy3Ricz42q2VM6XMKWPtzS
	 qvYAnMjx4vwU37G5CAzWTg3qoUviIbLo2ZYG4CtP/AHDy/COHlhYAXqgGnI/cJaI706OE
	 m1Q1EOaCnqvZkwsuObGgSXMaBpimJ5zQbQT24/yNkEq3mjVEKFd9Uve/DtlRozkOhBusA
	 PZIUH6RD/sHK7MnDm5uXQLWkFOBl1S4F/mSNWIctMVQQf5h97w3EXhpEeTzmqlp+TP0U8
	 KFFTd16kcV5qOLToKkzxTgxYT/zzWNJYsKATjPNLb7JFqYtrmk5pHwXCtsL7sjqoctQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795129662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ChZ9WZyyAQrbnmRPpa2ahNuWf4w6dVptOA4NxC4qs0k=;
	b=CWvEwUm853tTGvDJKORId75Z5MAG23mpqcroI1YpK4faTJ25Fkay8uoXKQHbz7alnMhO
	 pMH3EeNI0xLi+veGWTc0KrF3ow2ULqBwOss89kNfgTIPRbzdDm/kWiqKSLk//EJpMcCat
	 xqLe4XROFm878XV955K3FKuMdtG6/Yw5OYkvNkSPEUxJJwsY9L2vOB+bCyT5a+xlqQSu8
	 WhPsYPs4QBLO0wFST1d8CXt0gP4WuK30pccZoi0ZYKjfHhNfFwv1e0Mbvti1N+ToQmeWQ
	 gEe/hGNBc+izC6XzDXfE0ejs6XbEzuDFJbSWD3mnMUsIb4y3EQ6oogITRCJmDgfvxIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795129662;
	bh=ChZ9WZyyAQrbnmRPpa2ahNuWf4w6dVptOA4NxC4qs0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EEnKtcvTVaXmS6m/tosHuj5Bm1O1zaXrmYlyElRh8QGEEYD7NUeR2jWjnqkpp1Gjo
	 OMtDxuS2EPDkwFr8qj+X6gREyEO2k/TtdS1kwKUV6NAE3HuQudOIjJiY2ZTX59BTQ8
	 hR7Odq3esJj14eYshhWe0XTZPBhWihkFay+nlPNX1MZ3RRqgNRUZpDcTklBwlP+vHs
	 wGy+V6hOE12hjV+Bu/oA15xUBcyM8bUSFCugHkUNJhm+bVRYfsD092ndsHKM5NYG6K
	 OrxeAC4fj5g1pI0C4YV+H0SW7kJhKTmjHjHK9in58jlQXPdzs97HHCbWbO1unjAglR
	 GseGqjeeQCovw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD0F40E01;
	Thu, 19 Nov 2026 23:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90D593A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8288640AAC
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8G3llB9dWGy8 for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 23:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F8C240E01
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F8C240E01
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 23:07:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c5133831027so45697366b.2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795129657; x=1795734457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sz6YwcEzur3MsYFinGxEddVA2EI/yl9uqCLYoT6fULg=;
 b=xVNlaULXGB9U2CYYCVadUavCLloEsdh73cxikLLa58InNyRam7lA7b1TuH5YRj32k2
 AbEP/gnHWtp8ht1t7rcoSF4Zomi48z+VPa5VJvMRVPl6Ct3FSg9KjClpRRlPWA/btll9
 bD0lFtEZVNi04Fr1nIquPj8a2bMKU98IpaKqwYLk51jFYQtio0ZR3C56ggl86Bb2KPOs
 f4Hc/YhZXLanUxahmaOoyUnrbPZ5uAugmtFzmfisND5AiaZwsWfj/s9SKp8zbTgviLp7
 cVEyTVKAvrWbeY940RaP0Q6/HKBnuf2bUcVdYN8xMRZ2ErK2EgoLyOcxn3EDC8DuO769
 m4qg==
X-Gm-Message-State: APuU4Z8jcghkUCV5wxtFN1Ahr2+EMBfLFo0V1M6i8wDiJ+T6awSWm8qY
 Sv81i101cc5ucfOADiEx4Sfpmg7lnVRTwjvgBzlmWZmLKUHNSp7LXArGbt13Fg==
X-Gm-Gg: AYBFou3Tu6NekaR7oEDqu5ajPbwx9kD8w/pBcyhG5VvZLJ13coB3PZh1HJh69kZuCNI
 ZkMwuThgvGPTZn8AghmScF90l9Vk3+1cdHyBWr5qQiJ8xW8uLUcmiPGZlw+c70yqkJnM564qNhT
 O7dmYC7OGP+61j+GgoAC1CnQ2UF3KNeEhPQ0PjttsdkMSQor/lXAlh/u+Jil1EMyLUL1/os7e0g
 d8bXaKLg60QrBureX17a4c41tvv4lAwiuDoPyM4vPCep/qcR2/8kF8tbzYTvSa37QMrJgV7R1Oo
 Sq9YQ8GtdlVTLgVp/4djIvKIAi/XR5H1zWrbs4r0pyw0rAhRSBX2MkyrCTQ1jprFoenFQh8BrM2
 0Hc32ct5gbYFUOl3yse1VHjc65IhnrtbjR6NYHs6f3F3M4MOT8huZdS7FOoBi7HRd2t6D1OOk70
 ILlC7w7ALgQPXZfkeBUH/VKcx1iMOWEDEg09JKo9GLhxvdzJprRmtscyr7HC2kMXOXwwUbf108N
 qL2Gffp3inwsLkbyGM4kD/EjAhLokK9JjLdXxJmk6fylvVyHRdSDNvU7vvtjG0Fl7cOsdwF63Ea
 Ndz51s8QueFmTMaceLtuLQhlq37rWad96Z+yv8c+Ji52peYJw/n1AvaUCzIXIH6XYyKak97TozG
 ZWbo6h1JkbA==
X-Received: by 2002:a17:906:9c84:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c513a4347e4mr142675866b.2.1795129657146; 
 Thu, 19 Nov 2026 15:07:37 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea6e29sm39226266b.43.2026.11.19.15.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 15:07:36 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 00:07:36 +0100
Message-Id: <20261119230736.2981576-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zstd: fix libzstd.pc without threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Without thread support, zstd is built with the lib-nomt targets, but
installed with install-pc, which regenerates libzstd.pc with the
multi-threaded defaults, adding -pthread to Libs.private. Linking
statically against libzstd then fails, as there is no libpthread, e.g.
for gd through tiff:

  ld: cannot find -lpthread: No such file or directory

Use install-pc-nomt (or install-pc-mt with threads), like for the
build, so that libzstd.pc matches the library. With threads, -pthread
now goes into Libs and Cflags, as upstream intends for the
multi-threaded library.

This issue has been present since commit a5cb0ff4c90a ("package/zstd:
bump to version 1.5.1"), as zstd 1.5.1 added -pthread to the
Libs.private of libzstd.pc. It therefore affects 2022.02 and later,
and all maintenance branches.

Fixes:
https://autobuild.buildroot.org/results/713077327702dc2b8bb127fa8ad5c8e62f23a58a

Fixes: a5cb0ff4c90a9fcb068d41262946ef6a9aef9f7d ("package/zstd: bump to version 1.5.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/zstd/zstd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index b0fbf3a1a5..0c7ca13d21 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -100,10 +100,13 @@ define ZSTD_BUILD_CMDS
 	$(ZSTD_BUILD_PZSTD)
 endef
 
+# install-pc regenerates libzstd.pc, so it needs the same thread suffix
+# as the build, otherwise -pthread ends up in it even without threads.
 define ZSTD_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
-		install-pc install-includes $(ZSTD_INSTALL_LIBS)
+		install-pc$(ZSTD_BUILD_LIBS_THREAD_SUFFIX) install-includes \
+		$(ZSTD_INSTALL_LIBS)
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
