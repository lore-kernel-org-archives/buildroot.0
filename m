Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A2C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 07:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91F881069;
	Mon, 26 Aug 2024 07:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXo_meL06PhR; Mon, 26 Aug 2024 07:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D1481065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D1481065;
	Mon, 26 Aug 2024 07:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6491BF29F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 07:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB2640200
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 07:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8monnJuieJF for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 07:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B66CB401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66CB401D5
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B66CB401D5
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 07:21:30 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7c691c8f8dcso2421616a12.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 00:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724656889; x=1725261689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+4oTnLVoZqIpgnP8LZUD+5OBOz11ozQH7cgn8KX7kY=;
 b=VVK41nHag72NRxyLBiZxUjiYkb5LEaqeERbqhbp2KQvQvxyxH3y2zg/fTe8ms4u2B+
 yTk3k/KYPbvf90Jkz8Zbdj6Ksd/0Z6P/pzyRSVDXnHdZrNvY92bKcbXTKOU7bPaaKvol
 GKO7ncBwnLuQ3PJw3HFBeCpPc0do9culNnX1lQLkCaFosAYBtcCvt3iA8hIOkrF9hZW/
 f3Da+MdJqvcllN/TA2kFtNhc/0CCOz5vnbryr6dpaoDXxHBbNlwOLkzwpbVXDXN0yD02
 rBibbBMSmOLZ+yw75Pz3qCPLyDx0ZrA3ZTNQp7LEClCj+TEt0P60OOhWT68KCGs/6a8Q
 EtOg==
X-Gm-Message-State: AOJu0Yy2NOYqMhU+mbRaFGb+Me2IkZDS8CaVlJT4RKiCadBvPPKHp86w
 9ewu5pio1i7DZ76Te8+16JQ2vy8k6SYuqTchbwh0bpD4TEc+vkm/o3yOmg==
X-Google-Smtp-Source: AGHT+IElhkD4V9ck56oENPApj612hGERqEg7Fj3ki/Umivt44BCqwEMWkoylsVz6yfTRTXbu/zlUZQ==
X-Received: by 2002:a05:6300:404c:b0:1c2:8f50:b450 with SMTP id
 adf61e73a8af0-1cc89d4d12emr8611429637.18.1724656888694; 
 Mon, 26 Aug 2024 00:21:28 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385609d6csm62499245ad.201.2024.08.26.00.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 00:21:28 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 15:20:48 +0800
Message-Id: <20240826072049.719043-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826072049.719043-1-fancp2007@gmail.com>
References: <20240826072049.719043-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724656889; x=1725261689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+4oTnLVoZqIpgnP8LZUD+5OBOz11ozQH7cgn8KX7kY=;
 b=LBp0o12TcfzGZ7Qs+qEfkcIOeH62u1SuWz0g+6nv9O1G4HhVOeLDST55BADURscPwt
 RtB/i7Jh5VDmRkQzrxCUiqJNV7zEsk1mL8A21pGQIR3qKJx4NkS5JNXjLUrnmSREphQD
 tGns5hh34rOtr64K+/p80BRx9oMJHV1wI3RRgGBKs1mkcqZe6aHoLYwARvmIKqnkIncS
 cd+7S7JZmQeFO/Ju/+SOmawkpLjg/kZfe013InCyCPPlBEyVtXct/Er3YmDGzqLzqMhy
 wmw02DLWGVnEzqeNuVbPfkw9PH8+gQFIM2nzVKOQK5bsYQ8V4at1F64wHW4DWwpCHa22
 Vkcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LBp0o12T
Subject: [Buildroot] [PATCH 2/2] package/postgresql: fix typos in init script
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/postgresql/S50postgresql | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
index 1ece4fca9e..f8077600de 100644
--- a/package/postgresql/S50postgresql
+++ b/package/postgresql/S50postgresql
@@ -6,7 +6,7 @@
 umask 077
 
 if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
-	echo "Initializing postgresql data base..."
+	echo "Initializing postgresql database..."
 	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
 	echo "done"
 fi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
