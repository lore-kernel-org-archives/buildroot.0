Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 09:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95FE460BBF;
	Mon, 10 Jan 2022 09:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxQ02cDG6tRM; Mon, 10 Jan 2022 09:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87DB60601;
	Mon, 10 Jan 2022 09:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 762941BF3D0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6436482681
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbJ0aKMAGQQZ for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 09:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0E4C81760
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:10:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so9285649wmk.1
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q4imBW9//vcmDUGJL8BGdzxrR7/fOmoKXTaoVc5XjtQ=;
 b=p1kgTKw6pyT0GWpqb6tpsLSSjn5Nubzh4/IC+5GzwaTdwczlHgpf8T5Y0BXGzIYsrE
 XKT4SFGDpN9+pYT4dDNbuNwETOu3eCayntu/t0g+9djc0Vhl8quCbyduDLvBrSv5WtKl
 kPujgnnBMxjC85DvnI4vXUoWoXwEk0kftilmDGe1xbmdnH9vz13fHifDEAsQ/JBw/mi+
 F3TGwcUpbfo1HEgcKHzGch3zbvKdWIgvlwzHXomVOIxZgZ5FoWvN/5UH0UEAi5xiUv/q
 ey29Ul6TxFFd7+mayPZJy6+c/OQj+eqzlpjCi9ZlgrokuXM1myxF1lzRs/m0PaQULvlM
 yPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q4imBW9//vcmDUGJL8BGdzxrR7/fOmoKXTaoVc5XjtQ=;
 b=p32XlTSZSDiaBHsJPjpbOeKegBsfAMO7LW4MWtUWo6niDE05mi0vin90rfZ1L/2297
 dbu57INGlVxcUMtHn1TxIUWG4DuxHCWk67KnYzsE1C/Dgfpfe8DUOkC/y0MH5EGniKwe
 tex3LgNHagWw2Jmd9+gMw2Ej8uTjg3IWLjUZhHBrI5qMhSvbKOQy4soTUCwrtPDEgAt/
 TJ1wjkAxdC0hg8XRK5Z3ORUfqAUfMDuRJLca33oB1/vw/15rAlrrlfYzwxmiTpY8F0EZ
 bom/p2IhHvG9sr49NL7PY0Yr1osrtusKURgqdRHzx+E48CSoocX+GEv4c5Jg/2vmmxi4
 rxGg==
X-Gm-Message-State: AOAM530cI6rh5TnX0xB3giIXLxsUo3YtrhNINpQA3vmqu8Llsg2mfird
 Lfas1lL9c5D/8+to4mu8CV/c2VSul3Y=
X-Google-Smtp-Source: ABdhPJyQJU1OAHSkzM/4/AuuveJuUZAj8oBzgFTTGixtQuF+j5xUhAtIsk6xgyyn+X/kGPcEKxkGMQ==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr16083730wmq.63.1641805852870; 
 Mon, 10 Jan 2022 01:10:52 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 by smtp.gmail.com with ESMTPSA id j16sm5427729wrp.76.2022.01.10.01.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:10:52 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 10:10:36 +0100
Message-Id: <20220110091036.4165679-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110091036.4165679-1-yann.morin.1998@free.fr>
References: <20220110091036.4165679-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/musl: disable LTO unconditionally
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent commit b7a00b39bca0 (package/glibc: force -fno-lto) only catered
for glibc, but all C libraries, like musl, are impacted, for very
similar reasons.

Disable LTO unconditionally for musl too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 package/musl/musl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index d4f26b50a7..b89945e3be 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -26,6 +26,12 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# musl does not build with LTO, so explicitly disable it
+# when using a compiler that may have support for LTO
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+MUSL_EXTRA_CFLAGS += -fno-lto
+endif
+
 # Thumb build is broken, build in ARM mode, since all architectures
 # that support Thumb1 also support ARM.
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
