Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1998C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6495400C4;
	Mon, 18 Dec 2023 19:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6495400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMUvH3MVhRuk; Mon, 18 Dec 2023 19:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D017841B67;
	Mon, 18 Dec 2023 19:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D017841B67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB2981BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1C8F60D90
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C8F60D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imqPpr9uQpVd for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:23 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 147C960B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147C960B50
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d3ae590903so10944555ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928421; x=1703533221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOczXic34xnntGjZcffuj/A74JlADInrPE1rW36ak8M=;
 b=WSyiaO+WdmR+B61LNLRaJo2eLZW0Zs4MLKKyvDXfYWJt+UKu/lj1OWROqlkAMmnnct
 rgaKidNkjzofYNRxKgG1Fo+45WfvnrWex4x/lWqNU0FJ7J7QLOh0HZLFmPNfORpM/S+T
 IWZGoC07aKNgNgoVW9G95DMX/jLrEHyHN293GDkSc3BBlcDbZglKDIYlysH5RjTQ9eaQ
 +gjY5pQkgFXZSXdtwDHhjMCwG0uvNu+FMiu1dgtn9cU9UjSptCFNRS5AJG1RL0bY+Us0
 tBS4NPTpGzBJSghOJYFTL0K3pjNIRaH5+QWiJFxIKkWsrR/YbrD0/I+pUlyJe92NDzJx
 WzLQ==
X-Gm-Message-State: AOJu0YyHBqfFcNOyfQ38xRUHb6f8dCXA1mQclmmHi8PPmNt5bqYv/eKK
 jz5WLcz4WOeFHcIitc9nAnPVPvVysMa7a9/OKNg=
X-Google-Smtp-Source: AGHT+IE2MMX/yp3BwVSsnzdCUGUuQltcw+uCppBWwehWCr8M1uUSGp7BgIOG1A4YVUEkb+a+0ikDsQ==
X-Received: by 2002:a17:903:24e:b0:1d0:4759:bb60 with SMTP id
 j14-20020a170903024e00b001d04759bb60mr23088300plh.26.1702928421626; 
 Mon, 18 Dec 2023 11:40:21 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:59 -0700
Message-ID: <20231218194001.544887-14-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928421; x=1703533221;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOczXic34xnntGjZcffuj/A74JlADInrPE1rW36ak8M=;
 b=kihbHbxC3KTQC1npsHDfHIb/KVmQNYq9dVNLwfM9nUhO+glfgYncvCyInikj0amLym
 /AjbNsBJJC1UFbuNv0y8M3u7RFyEn0mBklhmXp8gM6O7SIWPKDBJewGCCRAYTcJamoWV
 FXDw1ajUR89iDi7P7DgZm7my1Tyjvz9wraI5w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kihbHbxC
Subject: [Buildroot] [PATCH v2 14/14] package/sway/Config.in: Add a help
 note about the default terminal
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default terminal used by sway is the foot terminal. Add a note in
the Config.in explaining that if a user is using the default sway config,
it is recommended to also enable the foot package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 5481c2c4e1..07e0641413 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -21,6 +21,10 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_XKEYBOARD_CONFIG # Runtime dependency
 	help
 	  i3-compatible Wayland compositor
+	  Note:
+	    The default sway config uses the foot package as the
+	    default terminal. If you plan on using the default
+	    config, it is recommended to select the foot package!
 
 	  https://github.com/swaywm/sway
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
