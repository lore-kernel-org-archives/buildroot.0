Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9044DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352FB60E85;
	Thu, 12 May 2022 16:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J06KERTctdvB; Thu, 12 May 2022 16:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD4360806;
	Thu, 12 May 2022 16:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F183C1BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE87483F04
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVJFNVMJRK5A for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:01:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 448B083EF0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y21so6843493edo.2
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8MB2WetOh0IF/K/2ZM5SFgfRHxXeoTmTq4OLXiwReU=;
 b=CcwmjN39RGOUUTJkLU7hiL8tkRcGiJc+xEKGKzv5QYfdf9KXkp4FSLuNfymYJhwddI
 +/vkpcNUnCkSDHK9Qj4qlzO8omQAqNjVZIp82vgVzpy4IyBtI3WXa0aRIs1JLfA3RQrg
 3QY7TFpSlJXXAefaLLrupNXM2H6/Mm0L47gJKHWgr5JyeX3BXPESWipDGuomCXDUfbpO
 MBN6JOCs4RYDnszq6bpjd3ygsktV6chaAhMuQ4e6mmW3x3c5vOyi1T5+ueGkEUIiPlLs
 5QtF6knbbJHp29oImyuKQrbFu4HZoR5iNhEU1wsZxosXgPq+U39aK4HNOu0hTNMXc4ap
 +QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8MB2WetOh0IF/K/2ZM5SFgfRHxXeoTmTq4OLXiwReU=;
 b=UCmRQp9B0eLE/906R3jneh1PdpR/o1eFVDMsA+TcFoXnqQaf2rGqqmRx3SPQ8qGDfX
 sU/ycopFINrcXd5o49OSa/Rw/xM9xNhJN8p1o4/H92mrDpAyO5wkURNSwBMTqJAtXcaH
 G0d7N22nZAAaO7DoCZiP30ILz0aeudjWGLcrIv5HB3LUMl+TJBxnqfuFTHy9uie1QQmL
 DOa0oVMUE80Rpcz4SK7g3xeoanwYsGFPl889NHSlDpujFFGOd6pK4cz2AUKIGw/VG0BS
 kK6bF3+8reTyIRDAH2qENJkwdREHktrWWg1lc2xTQgvjf5/9vznTCSEVzElzQT4vhCvM
 9bUQ==
X-Gm-Message-State: AOAM5303mNJdavHon9KXLI3H4AfbAucFdTjirWyBrnAMAydN33UbkBqA
 GnsTZ9ZcHjiaVrMFSEVAORDPqb9jelkirA==
X-Google-Smtp-Source: ABdhPJzt3qsOvHHt4hEwa7kBgDrIeSog/gG4qexWwKN4a6h3bBOpIbpqWsysWAQ0be7SV7ZfA/6K0w==
X-Received: by 2002:aa7:c1d0:0:b0:428:b439:99f5 with SMTP id
 d16-20020aa7c1d0000000b00428b43999f5mr16509642edp.316.1652371279373; 
 Thu, 12 May 2022 09:01:19 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lb20-20020a170907785400b006f3ef214df6sm2312382ejc.92.2022.05.12.09.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:01:19 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 18:01:14 +0200
Message-Id: <20220512160116.2011627-3-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512160116.2011627-1-arnout@mind.be>
References: <20220512160116.2011627-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/gnutls: remove redundant
 --enable-openssl-compatibility
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The option is set a few lines below depending on
BR2_PACKAGE_GNUTLS_OPENSSL.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/gnutls.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 79e7d529b1..1d997781b0 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -25,7 +25,6 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
-	--enable-openssl-compatibility \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
 	--without-libev-prefix \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
