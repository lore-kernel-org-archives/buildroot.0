Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24234606A325
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rA3v4I2K
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED19380CCA;
	Mon, 26 Oct 2026 18:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrAQUOdHb-Vk; Mon, 26 Oct 2026 18:29:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 175A480CF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793039352;
	b=dTyJClrfIMgRX/Q8bh/rlUUk4sqOGs8H4hmmUt7h/01c+ddiA8B/ES+QqOWUDFp7Rmz5
	 xHNNYoX9hLfce5wCHlWILm3T+TVMsQKITJ015UO+O0yH7QNCf1ygdtevNNuZOGlRyVUgt
	 7bdIbkIlmYDPAJN6fVTGawGaCClUYf697V4jMrk3Otj3WAYMR4iNoJCAKS6KTiKNoQgFQ
	 z/ZiHm+AnEqQ8qLVe3VzatgZm30bX+jZQZupA9RSnF2skYa/RcSU+Px/0y1yc2zkFNRBv
	 j1jRZxsPFRatauMgPAC5ICUe/aBP/0Not58gt23oqC7MP5UaMjzy6XkgwV0+UjK6vEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793039352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KjeouzrPRWgrU5431+/BkYfh3kixT1W4xLjgbiuu3p0=;
	b=CN+QJUqbxlDY1XarLad2NtJb8NwDi7WKPkqTR7G8OvyxwLWYASveehruGGuMfYxPTId6
	 Hmjy5lvLqJMMTVpL+C+aWZziThnPwY6K8N7LRzi2xtEeGZ83OPYO9f/mZF5hVKztrrpcR
	 pmqR3ja/TApFM/juQZY+n+lGkFMs76cW1Kp7E90EeZ/qMxIy2s80mnvyycF6C8YR3RbUQ
	 N2j+wNsdOOgWvT5TtVIVX4FX+tzUvRufeYdPtMgj6uYJewn+dMgMYm38kV3SvGx39n1bW
	 vm5d88Lm9fxKUIPH7AE06tSzg6QqamYL+TG80rfTqnHYe7rOGAkJXWPEafblZleDjhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793039352;
	bh=KjeouzrPRWgrU5431+/BkYfh3kixT1W4xLjgbiuu3p0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rA3v4I2K2V5v3mVmZpHUsucGmx4EJ5JRJ1W7yjSVS6DHEeJTKeTFWDPTCLs+Uhm55
	 0mLSZ+8G9IPG1XzQgCT0TWO6Rg70l/WX/PxbwNmdXRpYx15qWiLqQbSVQ9r+JCxhYh
	 TUaL5JqApz/OGcWAth80DKLVPY2VjAeM+qE++cDGzOFrfHPH7eQK78wtsfH6Ny2Zrr
	 FRnFtGr4hoh8rBB1Rhs+dpKlyc38n9SB9bQD/Hzu4hMeQGnuH8I817GJ7x8/fGFrKE
	 fqejsg2N8IIkB0fICGzE/O8UHHNU2Y7WiU8Praa0WcDkwObia1Oq74O10iyZDnbYXB
	 XoXXMHPEPu5tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175A480CF2;
	Mon, 26 Oct 2026 18:29:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3223535F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23FB1605EA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6U5zuSQkekMq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 18:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E70CC605E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793039350;
 b=Ls40Y0QaKuCve63NIq6Yy7YLf1c4DFhZWFNDRzKu9n4jZOKiMDRXyoDhDcd1zLeIi66w
 CNwhyMoYxEzL6VQHzf3/vq1BI7ZFQqFTdgXT2TAnvGdssvd2CQPVC3Pa5lPLmDw9p1sh+
 SyQzssmAjos5Vc6631v6LCKLl97nccnUDm2TAGqymdvO7k/gDrvNg/gQtahKiax4nwpG7
 BruorQad9wJR2CdWAqMB7ybG+MmSVkQBcCWIkRT5rF1ewHQDO71XTJsGdMCNapqL4t3u1
 tSn0s90rALH5FTquKrzevf3UIejItO+YtB6YKjNTApBCOAGURge2R0jxK1UYFzZmn2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793039350;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xprxOSF9xFV6xJoSYVApkhiMxaKwwINixM2SEDAg/+8=;
 b=QRu7QxqftQv+7raLCZXjLGz8WkYyabeQDmfPP7SjCVqqYlEJYP0sh59mU2dTBkMT0aPB
 qTlxNqg54NPb47hcXO8VxxjWaokH2+dgSNido9U2Sayg5UpkyE7qc03B0k2OqD9539O2U
 HXj6ik3pmt2OPjMgBpbJcrwzPxci9GqKQcoLXrcf9pqtVDHyaosu3kQfWop8k2E0t3ZH1
 W1x0c8KKN8zFOW8UipmXC5jc9WsKoG62ZNqWfbJ9nuY7jEKW4Ouel3f/VYfk+mDmgeU04
 P6np4Br/PeyX8t0T2eeJJ33iR4Qr7pOhVPnKZSEmWg5Q9eV6nVvR/anzHs6NAbyCpow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=telaak.dev;
 arc=none smtp.remote-ip=209.85.128.170
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.170;
 helo=mail-yw1-f170.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E70CC605E8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:09 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-8ab432273c5so27267807b3.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793039348; x=1793644148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xprxOSF9xFV6xJoSYVApkhiMxaKwwINixM2SEDAg/+8=;
 b=IkoymlxI27K1LsHoPoCnOtIHd4uqx2UrSUvB3Rs2KP7laf81mMOTy21SALvdXhsGeJ
 gQIxpSUJYB8dUgxgVbV4gpQQtA5NiqHHkmsb43eavlqjborcAk83zKdrwAhyTMU441My
 Eg5/3Dl6M2XOugPVh8jEV/D+JFPqhBnZJG4G5srQks+qse8irR9CzUd8TPoD7qVLtee9
 xxBNOjNhKu70Bxs7OVRgyga8C05xBvwN6oqLGz4k1gkVK0zhVsRUweE+LAeu3vtT9F5u
 O/fzIHKUSVS/STj6qcIZMOMQgkGz7LtsGVWIIiB/7mHaoLuDmM9RffO6ni4ew37dq7xj
 uxEw==
X-Gm-Message-State: AFq9FYLcN92FGzP/oWYDuOw07MCLXdx163x/j9r96unRnzaYQCEmoOgi
 jv2dzgUG97WUS9AnjeVm6Yo7CCFr/TnKOeyU/nTxnh0ViJkZBfQdjE21SPjxcryciQE=
X-Gm-Gg: AYBFou3YgbfRWxkjjV1k5a385+2eR4+nAu9Aj2NijcjEmBw7hQI0rTUtaj3FOVoQ4LY
 41RIYsri1LR8ecY5JFWYmjm2EsQ7NkXNFIKl6Wkdg6knIW2z2p0xCjPnMSnyfL8DhfL2+Nv8eSU
 s6jKyNmX5MR057X6t5AmMTUKHhkJPNN/0EMm2xwN7bjQEHFKDTFemhWVXUg22YyH1faLmLVNdeG
 l6GftI+phKPOsWaJzpIWszEfdPxRTnty+jsJTukkEuD+Rf8MWzgO4tDGi6cPzv9hXPoZWa1WFkE
 w281Dbe43sB571vIEhbKln/w17o1SYsz6aJag4J9CoI71GAIZ/+IigF0q8p86QaY+f0hjvlZRa7
 ew9qAgJJw1tSWFFzUi2IIh6UB+651lVrgluP4UO85I0AUkEwOAWCN3lzKYNr51nQ29ZjxxUqfPI
 VAJDHwDzAxW7Qzc0eltkoFbfLIqPlD6mengeC/YdWlWPHGykyv6HX4slguwbyrMm8GAujcPnjY/
 FheVcF+8s5UIhcWmcLYWSN4yQJSnTdVkdbXSEnW6Yso76KE7mBxSSda/Xj0/zdeilP9lzq1Hs3z
 0PKYXYtHI0GUkedbt1rKDHzT8io3dz4wS65/TE+3k0zgblWEuZYLsgXuCg==
X-Received: by 2002:a05:690c:e3cb:b0:8b1:82a0:ebe3 with SMTP id
 00721157ae682-8b182a0f85cmr30052077b3.30.1793039348377; 
 Mon, 26 Oct 2026 11:29:08 -0700 (PDT)
Received: from localhost.localdomain ([71.68.170.161])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b19e6198e2sm181347b3.38.2026.10.26.11.29.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Oct 2026 11:29:08 -0700 (PDT)
From: Joseph Telaak <joseph@telaak.dev>
To: buildroot@buildroot.org
Cc: Trammell Hudson <hudson@trmm.net>,
	Joseph Telaak <joseph@telaak.dev>
Date: Mon, 26 Oct 2026 14:29:04 -0400
Message-ID: <20261026182904.39575-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nqptp: bump to version 1.2.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 48e8a1f041 ("package/shairport-sync: bump to version 5.6")
moved shairport-sync to version 11 of the nqptp shared memory
interface, but nqptp 1.2.4 provides version 10. With the versions
mismatched, shairport-sync gets no clock data from nqptp and AirPlay 2
playback does not work. nqptp 1.2.9 provides version 11.

Release notes:
https://github.com/mikebrady/nqptp/releases/tag/1.2.9

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Not for backport: the maintenance branches still have shairport-sync
4.3.7, which uses version 10 of the interface.
---
 package/nqptp/nqptp.hash | 2 +-
 package/nqptp/nqptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nqptp/nqptp.hash b/package/nqptp/nqptp.hash
index a37f7149db..84cd8fdcf8 100644
--- a/package/nqptp/nqptp.hash
+++ b/package/nqptp/nqptp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1df1d5edd5b713010d6495b3abca4c1cf4ad8fa6029df0abeb9e4de8e0eb707a  nqptp-1.2.4.tar.gz
+sha256  6aa1d73b8ee760bf19378c319db0d0537a867ff961764b150e19f87d96a02210  nqptp-1.2.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/nqptp/nqptp.mk b/package/nqptp/nqptp.mk
index 70e7e72d15..f7d1f51083 100644
--- a/package/nqptp/nqptp.mk
+++ b/package/nqptp/nqptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NQPTP_VERSION = 1.2.4
+NQPTP_VERSION = 1.2.9
 NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))
 NQPTP_LICENSE = GPL-2.0
 NQPTP_LICENSE_FILES = LICENSE
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
