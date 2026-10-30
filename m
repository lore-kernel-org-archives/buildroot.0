Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57EB606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q0SFmJnH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C83D605E9;
	Fri, 30 Oct 2026 11:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9Sr1xyt_Dz5; Fri, 30 Oct 2026 11:35:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7975660667
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793360120;
	b=BHlcct0wC3K35C++1f23VsPAJovvC3S5p8fr5vilFZgMVVrhriWGzW65m1AaIKYg6Ivz
	 1PFl7dVpPJbPc7AIBRUBWPJ1Ygd4JoFR2mRf9nspKKbiFsc0HkBTRGwWjYt6GAmMvfPXN
	 kfRcqJuPBAIfAvVRZ36e42RPWZ5s3hRqGwBOujLmrez9nJoyWrLo6vELmPkE4lRWnaeSh
	 igZM7VQB/gL3VL/s54aX0GigZfbRCe9fr84E5TtAU4FCTO9YLZn2+6hlPLlIL6gHLo9hQ
	 A64ND0Y8lYnaRxK3vitrqtW7LnuNsgv9FlY26PtpUixEzvuremu9Mqlw7R8i6dLCcOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793360120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q7Eo87YPy0VcxjTdkXoZeswvni+yRj+IOe0sHDAEmnA=;
	b=cRL6vt+TP1sCyfhwjb8Yanf5DyIr0AvctkP92ce4vIa4TSHLDiXX7F/CXIY6MATNlGfc
	 kCEPvkJCvGQtptacNFhZgChlJJDOoZXUdr5ZKdTG8ciVHOfwJPqTxTK9gcsh89GEbeWp6
	 3wETf5rWmVgsKpql1gb2NOpF0GUgcgaTDPO73ydkdyqc1KL5r+Zq33qn1qjiCOIcsPgSG
	 IoChKLsuh77YEiCwXHCHst9lFBuyKPE2UtRinKYoXPuJaSjNZM/+zfCoG32cGoun4qdlt
	 Xh/YiuFvjUXwcEEO7Ot2XXCwTgkFY+v2dXWdi3IL4lUFb7Z7OHX8q1MZumizOvrAVdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793360120;
	bh=q7Eo87YPy0VcxjTdkXoZeswvni+yRj+IOe0sHDAEmnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q0SFmJnH3MnBK3ddxLsM1qcJJYgeqlDpcHgFdl+BXkt96k75Np+Zy2iK1q263wngH
	 29s5ljiQ88t7vOWLfDshU+R2EH0uB0ZQFUtVL1tKzUmN3+CtJSB7H/Q2aXQn+Ja1pk
	 dXlmZeKG4Z98EK/iIb9gbFMHNh+9dmbnsAwVLi3uX/CYL0PNzbLwco31gg69ao1b1T
	 KMGIqkYGuySu/RrZo6G3YEljne40cUce/4a0UP0Xs/uolaMoMCzXnTpO6mXrch84XJ
	 tSQcKH1KrF1+uzunAaMzfg5enDgr6dwGPooicE7lIBWQfmkzc0mc9TI8X4FbkuHx3Q
	 E+kfT1PwrznSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7975660667;
	Fri, 30 Oct 2026 11:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A691DE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F3660667
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5uwwY-oRr-2 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 236FE605E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793360118;
 b=Tk5La77SA8wNYdbKMrFVR2XAQGaFDGsh4hKUztMF7OD6HfgJXOdHrbVcHWGAbuQTHdeh
 MuFUBwVShUzGOpCkUp/Rh8HWYtFIi1GTaetAc9+kAr7zphr3UA9ENL6yOSKMjy1pf/HFn
 1J/jbT2IWzI19NQDic5z69Nk1Xww7SZk71ed8CR5S4kPptuMqKYT+l6R9246z0VRzZIkk
 zK9gm7lpghpTbUhv7C18AR/SRbM0/54r9kqEC99zCFGtgB0hmZ6CCTkhy6lFlqfjBaNjE
 3Wp48Qe5mSWRrpsruIO0B3wGHm74ZAKCVndJfQVdF5KXT82S9culYmN60knoz7bpbbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793360118;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wvN6EioxEGG+vla/RzI76Pkz7/eTFZnkWj+2OrkKfck=;
 b=li5j1lFfHqFeFh6yjzME15VLu5ZtiVOlKRqzYeVAt8c3AEKIWByAYjwKmbIkVDWaGO2O
 tSjcUzx9T4U8a98+hiWKfYswGRi23UCKFfmOLZtvQUgbKyx/qqXhSm/KiqGKs78FFF+ks
 HVFiLw1UNMAKbC3WZid5O8vbq3QZmkEvviFDh3P/8XeZSfGf5SpMyv9TRCdHPZv+Cx/Db
 gDIPHwPdrVMc3ENDoJGqzjRxO1AanStxVRPjGfyHjKvMpscPawhBl37WicCqV1kauAsNr
 Q+PYW26LNsxkAmkF+kBtaJc7HYEjW3TJXF/8gKcQ0GqHDpMg+dgFhZarOgb/k4KZbyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=zq73HeKy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 236FE605E9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:35:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so728363a12.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793360115; x=1793964915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wvN6EioxEGG+vla/RzI76Pkz7/eTFZnkWj+2OrkKfck=;
 b=W0rKeaAmX/fOeXkTELNAHMa57MBqlmtuHjAosAbSdkzQoJ2BYao2DhLAFFz+kTEshM
 JpOBj0zsNiNl6sVr1nTocg5UWRe5xAYmObYEX1EIXnxEIXC8H3U5AwonGcY7WDIRFMbs
 NjZ+AK8yDCrHjVBt0UBWTN7/n9HroIF8GkUZABL/WvnfoF96PLTlqcg5TjW9TyGbvZjh
 5HQayoz9ta/6IItOgG/LSzIxdnOpRWyClQzsfHfkW0tBYsNF1oHIIBY9HUn9HSI1J5PB
 vFiYXnkRI4EZkf2qjb2FfOuyjrxpfr7L5YlAVUXLladrJOtzHL6k332i2evHQyY3eNbG
 CYAg==
X-Gm-Message-State: AFq9FYJHbJd/wYJRgw0zjvA9910sETYmdnlsSxEh/JvR4vH3nLwx1Axi
 opM3YlJCQyHtsOnyyxwpOxktK7Q5NyzXG9h54Qq2NHZiv67UtYc3RHRVxQtzPw==
X-Gm-Gg: AYBFou1KeorXP9CNX9UVLoXiVPme5BXWczLlhysTinYTqp/V+L67hoGb577XE0UrbPk
 c9ZfQLhH8wbrMtN5OgTRnM8xnO8Mx37F9Y3Fy7Eq4PUAwLHaawr+0LZyy1zXFpDLP/CXVunsSXh
 qVLhKtyut8fNGOnPu2zRLHpb3jEw7e/F1lQAzHJW9hGJUAOxe6owmDu00ES1bVufcSbcdTwB9I3
 WLHHl09JqjOoGS09oQccOpZBwU+mdyKLFZcDz9D/9N7vm9DBttjepI12pkJUmnNU8K0ZsgrWg7o
 maw0wCPhSoWzNRvc/mC1qIiugXi0KPY4onkQoQk2qmh79QnoDvvYkKrrO3boVmFhABVVjiwpKOv
 Sjl3LSgmur9bAmauG6Wa9kZGAEFSl6Nesegd9P8JgGpoA+Iw/1v8qGSux75kLZnak+fMMM1sspe
 lR1+lV36qSOmz7cd1l1+Od7ymKUBFcQW+nWXDF4Ro84OvZ8eJD/VWVrS/3k7GdFsTdQ1yudrTJo
 rTUbx6IXAapdSEI6ndppzvpzj5jmES40aNTwNhiF6IXMvLCq0xaSwE04pKH7J8iQW8t2aBbaB3r
 elgtFk2Icc9XoV4WVCfdqEyN+7yNv5eedzPgFL7mpiW9mVJytI0ycBSwk0gVs9oI3BtKTYDXG6/
 txf0q6S1m
X-Received: by 2002:a17:907:3e0c:b0:c37:c0dd:6642 with SMTP id
 a640c23a62f3a-c4ca7ad13ebmr183919166b.37.1793360115204; 
 Fri, 30 Oct 2026 04:35:15 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cab9dc577sm57195466b.0.2026.10.30.04.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:35:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 12:35:13 +0100
Message-Id: <20261030113514.1090450-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/newt: fetch from GitLab
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pagure.io was shut down in 2026 and is now a read-only snapshot that
no longer serves release tarballs, so the download fails:

  --2026-10-29 19:13:23--  https://releases.pagure.org/newt/newt-0.52.25.tar.gz
  HTTP request sent, awaiting response... 404 Not Found

newt moved to https://gitlab.com/newt-ui/newt, which hosts the
releases, and Fedora also fetches it from there now. The tarball is
identical: it matches both existing hashes. As the CHECKSUMS file on
pagure.io is gone, note that the sha512 also matches Fedora's sources
file, and update the homepage.

This is not caused by a Buildroot commit: newt has been fetched from
pagure.io since 2016.11, and all maintenance branches are affected,
whether they use https://releases.pagure.org/newt (2025.02.x, 2026.05.x,
2026.08.x) or https://pagure.io/releases/newt (2025.11.x, 2026.02.x).

Fixes:
https://autobuild.buildroot.org/results/929378a23fb9a936487332a6c92aef78ee64d96f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/newt/Config.in | 2 +-
 package/newt/newt.hash | 3 ++-
 package/newt/newt.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index 42a9eca729..b1d2d382d6 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NEWT
 	  Programming library for color text mode, widget based user
 	  interfaces.
 
-	  http://www.redhat.com/
+	  https://gitlab.com/newt-ui/newt
 
 comment "newt needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index e8c945e4fe..ea76730335 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,4 +1,5 @@
-# From https://releases.pagure.org/newt/CHECKSUMS
+# From https://releases.pagure.org/newt/CHECKSUMS (no longer available),
+# sha512 matches https://src.fedoraproject.org/rpms/newt/blob/rawhide/f/sources
 sha256  ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82  newt-0.52.25.tar.gz
 sha512  23f239ff599f63fdfec83ba32256a4b4e081d84fe7844a32a9770a0776df7e200315f794d031bca0f7c3526a9730fb3f62973bad40bf96618de6e336e97a8096  newt-0.52.25.tar.gz
 # Locally calculated
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index e74f87d01c..78620b5cc2 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION = 0.52.25
-NEWT_SITE = https://releases.pagure.org/newt
+NEWT_SITE = https://gitlab.com/newt-ui/newt/-/releases/$(NEWT_VERSION)/downloads
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
 # Force to use libintl, otherwise it finds gettext functions in the C
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
