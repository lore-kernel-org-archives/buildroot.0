Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9A4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 10:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC2640547;
	Mon, 14 Feb 2022 10:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e23_YfW5-LKl; Mon, 14 Feb 2022 10:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F012404D1;
	Mon, 14 Feb 2022 10:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CCE41BF402
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8AF404D1
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 10:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOFve-zg04-Y for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 10:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E46AF4032C
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 10:28:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e3so26101744wra.0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvIOUncgqNpY70eS9V2GF4R1l7oUZUHg2ui37HfvTeA=;
 b=YexZ3ArRv/a/dsTFVDXGmUruZb1AcnZWL7YmJH1dVSu74xGKKt69+XueSEiONsO5Uy
 vSc70b7Lo34KIg8dAHr9FHZf3Gghvt+Ap+8LEQfq4mDNp9MFEOZ1sKfj/SvXkPYlZWq1
 3hvmEXccXzMrHxmFf/V/tn/OqtkbUgKRt4O2jQkcH+wBWntZvWtm/KR3NX7+MqRuGZUx
 kJOB3CI0W/cFb9SkXpDctTnouDeioNIzUKF6cv49oWCpXBYzJaHPkAuixBMBJwcTKLuE
 D8i3nY31AZ+HsC0s65Q7r7QSJ/U+szVXaJt8tCOdTW6p+Zgy1KIQOvNm7ZPjkLkPKcVl
 e2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PvIOUncgqNpY70eS9V2GF4R1l7oUZUHg2ui37HfvTeA=;
 b=u2xCW9Qrd9BsL+njQoV0BuYMjpcuUslRN9eQaWPtYxz9RYl5/qUHysvCCKbEeneIGk
 E4sD8r0MqjlAHkdEw9VwfWiqitowbyLnKdF4Zvyjo5tTvuFXj4PXBwKrzlhUfwVnFy0p
 unbFjQ+BIgu4iXTtV1Jw3ogK639MrGVM959a6FmUa0vjksz6tcjF7FPTR988APQewKsY
 s1U55JWIm9c0Xeh+Vr+zOw+oXLj8376Gaf3izgqiuYBRkz0+HJdwk+I74SjjuN452VMp
 synzVXeRCnCJmFcaaZ6aGDkYwfSIHxg0tO0acTpINViz4XZLkPC7jN3Il9DyZfzZsdmd
 5A7A==
X-Gm-Message-State: AOAM532jWWKMm8Prob3WKeHxeCvFpwL3/2QQuucOQ14SuOIHzla6pQYK
 38+YlN0n2pzNqC7+7SwQVMcfdeeD8kM=
X-Google-Smtp-Source: ABdhPJzOwMc5pOfH0hGxg/xII5u0J/bMFuU9XQcI0WHVo8gqEPC7WS9LHP7JXA0S+n3h1tIuIn8ftQ==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr10984354wrr.530.1644834514043; 
 Mon, 14 Feb 2022 02:28:34 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 by smtp.gmail.com with ESMTPSA id f9sm8815828wry.27.2022.02.14.02.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 02:28:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 11:28:29 +0100
Message-Id: <20220214102829.156331-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cryptography: needs cargo env
 when downloading
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
Cc: Asaf Kahlon <asafka7@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-cryptography is a python package, but it internally builds a rust
crate. As such, it needs to be vendored at install time.

Currently, we only pass the path to the sub-directory where the rust
source is in the package tree, but calling cargo needs additional
variables, most notably it needs CARGO_HOME to be set in the
environment, otherwise it ends up writing in the user's own cargo home,
which is by default ~/.cargo/

We do not really know what variables are used at vendor tie, so we pass
the full Cargo environment, that we pass when building target packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e642691bc5..a524f729c8 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -24,6 +24,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
 PYTHON_CRYPTOGRAPHY_DL_ENV = \
+	$(PKG_CARGO_ENV) \
 	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
