Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8210AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402B783E0C;
	Sat,  4 Dec 2021 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVt3G13cYrkc; Sat,  4 Dec 2021 22:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5ED8345D;
	Sat,  4 Dec 2021 22:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A7F1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84B683365
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8VzcRpBs8_S for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:11:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BE483211
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:11:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u1so13643714wru.13
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9jn29U4+DeATHnJQ9kLgTv2jGc3nYkfk0NqHZuELq0=;
 b=nIhHdQ8NqrgqcflG5DScqhmG9pDpnXf1Jiz/1GA1iJxIf6zYv7k5O/qNsR4ZbTmT6F
 CwvHjqIvw2eKBWvNUra6moY78Zgz1vcJV+kssfzqEfrcrgr1+D+kQ/6WuKHysirot98K
 7W0lkm8izO0pRLThaGyfA1nOS0m0dpaBKcvIxmfa+KrdNtmb6M6IhC2RAoeZUfGwHj7U
 BYmYSukXH6JyNiI7UaaEbx58bKqWaPhKEXYQoFVf5vXnVkKwPD9UiQXcii26by0sTKcj
 aTndVRJ4Q31LNgow8dKuuwbrAyJRb9XUZxrPKv3RFynNorWYYPhr2onludOgjXB6TIE7
 Nkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9jn29U4+DeATHnJQ9kLgTv2jGc3nYkfk0NqHZuELq0=;
 b=kVAi4vwEg3XreSN4ODzHWzxv49r1/LpcCyrfgI7yA2TErIFOg1E1LTnPxIbqgPXsee
 djN5NOUfhc3oDQ+mGiVSRmTwtEVRRuI/sp2aw0h6dcbneNzGdjhjIbD3KgeYegcrom23
 EzgSmQYFn/PgOHls6Axpy6l8PLZoke/5aUmIQvPHOy9N3Jk8fTdxUuNnQB1iSY2fxtMl
 E39Gx8+hazHAQh8VF/qKxbRBau3GkayRQuRt0EF682+2hd0DP+LSeNC4qtfIAqWnV2ki
 MbiT2DV6sbaSRjX24ABtrABWlo/Ckpi67FXxYKTEyjpeXVkSV+4MFIZULLuZcTp50fLs
 cEHQ==
X-Gm-Message-State: AOAM531teKM7eGWY2ljWsMaU7W3syPvskB0WW/LYZzwl6X+X33YGKbXx
 revQR56oyDAFHmkBhI5roUUez0A4aB9a7w==
X-Google-Smtp-Source: ABdhPJwKqWskoLMbJNTgS7PpCaPuIvYRLmJrw8tywfjLOMw9BlO2iWiXbq4HlCf1ZP5cKjRqzp6u8g==
X-Received: by 2002:adf:f489:: with SMTP id l9mr32526679wro.268.1638655905414; 
 Sat, 04 Dec 2021 14:11:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u13sm9993724wmq.14.2021.12.04.14.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:11:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:11:53 +0100
Message-Id: <20211204221153.2021568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgee: add LIBGEE_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gnome:libgee is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibgee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgee/libgee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 0a05a63635..64beef30df 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -12,6 +12,7 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
+LIBGEE_CPE_ID_VENDOR = gnome
 # We're patching gee/Makefile.am
 LIBGEE_AUTORECONF = YES
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
