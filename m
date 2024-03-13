Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FFFC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0A7B40B7D;
	Wed, 13 Mar 2024 09:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evb7FdyC7BsT; Wed, 13 Mar 2024 09:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEEFD415BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEEFD415BE;
	Wed, 13 Mar 2024 09:15:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A23421BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 909B8813FB
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mS9aRqf2sZTV for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3F7C81346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F7C81346
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3F7C81346
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-513c53ed3d8so871159e87.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321271; x=1710926071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPo1Sehd6UintLUGSNYVY1J0TvI51WXQOnDlxN7V4sE=;
 b=X+E9IS+c/JhzdyODP1pRB1dslLdEIVDZgg3Q+Uwu2hBcrtIJvlzszvfZf3AEeGKszu
 G0FbFG8r1jg+xCHZds5qx1SjZ7WKruJrH+nRlDL2pGwMrlyZ2yoAuMpdAR0ojbHpMbFL
 jCoRdj4MJhxmkwAQzZWvdH04nBqU5j6KoEQiXkXXCTbsz0Y2AofWrEUzRZxtUFJGq0gQ
 IiQEiFKkjOU1F0rvtdTRhs2xu68OWYlNyfHHqoWW6P9xp4x9IJknXRw1Yfo8oIwy0L7X
 ksMBlvg7TRD3dCCxhhgVyglGEWj9YkQ5G0FQ/i/ZLy8yyl2O4mCQixBdvlI6Qmk0vak7
 7r8g==
X-Gm-Message-State: AOJu0YytBqfFwWjuMILU+G7nNLD0L0EngmmVPuLEeC50E+UvxsZCnnp1
 DmeG1hi0e1FHTwZevnxF3WQOU8Htakle+6GLOgNZUa8fH1t5LJjh22XwEhN0xWQ=
X-Google-Smtp-Source: AGHT+IES08aEfaoLDjaippT41oPf3/HvYFG4HcAoYOX4Ci4hiaDLu9DNSvQBrfsPh5WSBOZ9MmGOiA==
X-Received: by 2002:ac2:47f9:0:b0:512:bf43:d786 with SMTP id
 b25-20020ac247f9000000b00512bf43d786mr1604359lfp.10.1710321270689; 
 Wed, 13 Mar 2024 02:14:30 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:58 +0100
Message-Id: <20240313091412.20865-17-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321271; x=1710926071; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPo1Sehd6UintLUGSNYVY1J0TvI51WXQOnDlxN7V4sE=;
 b=cQKE/BQ9HWZ8wMAJYIxKxLmjSweY8Mah9UXFeLE0bhI2tsPPUXPpz3HSyVJq46k0zh
 9tYbx4LRHiU/Vg2OanBBlul6eCkDrE71h3CHEKrcBys+EQrB0AIYSnNwXvm9CrxoMw9k
 9y+OyHlqVqlfZNNEAsABbMkDdU8fPUTcAtHhd1M3Ox7iNmWR585eMA2qz8aclSjBLLMc
 J29bYqAqI95KVbjwQFdUenpwSfIGsFm93Nk8fAsPUTeZ/Lf6HxbJz/QbOz3RGbtK+cxu
 qjJf0EbfI/4KNnxBbHL4klAZq2PzA2NyZJ0yQd9csG0wGVVLT2SpYjfIF/FNUxWoJ5of
 sfZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cQKE/BQ9
Subject: [Buildroot] [PATCH 17/31] package/kmod: disable busybox depmod,
 insmod, lsmod, modinfo, modprobe & rmmod
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/kmod/kmod.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index d83fb85a3..1f3bc0424 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -86,6 +86,15 @@ else
 KMOD_CONF_OPTS += --disable-tools
 endif
 
+define KMOD_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_DEPMOD)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_INSMOD)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_LSMOD)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_MODINFO)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_MODPROBE)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_RMMOD)
+endef
+
 ifeq ($(BR2_PACKAGE_HOST_KMOD_GZ),y)
 HOST_KMOD_DEPENDENCIES += host-zlib
 HOST_KMOD_CONF_OPTS += --with-zlib
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
