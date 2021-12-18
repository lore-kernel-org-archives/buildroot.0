Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C542C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 23:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6585400AF;
	Sat, 18 Dec 2021 23:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECbdfSGGyAbt; Sat, 18 Dec 2021 23:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F33403C4;
	Sat, 18 Dec 2021 23:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7BB1BF306
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A63241F70
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2I_RiVZ4Uql8 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 23:11:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 547B041EFD
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 23:11:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v11so11568946wrw.10
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 15:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmFwwOamyD22Qa/W+bRpeSVqXBzA/PH4/9ufKhvdmLk=;
 b=YHZPEHeMi6aciBq4Vkn3O+U9H1NgHsltmQt6Ih6+X/A2isV4h16j6q5Ev4aUYIElgm
 i3Jm+WGRAuxHEvahrUALi6/U/206qGPvpCtPKmXttcWGivRXjYUSsVt2RB1la6w2DxBh
 57j1ETJRznTnBHpQqma3Wm9SYhSHdMPnjuNO57G1JZtMKjyofZrjHNGAjAh5JrCEuji4
 MTvIEbicl11JSxUrCmVYkin+zfhLqk1A50J3HyReelr76q61r0xDcLq5QLTi++ojDI4I
 6csmmak6t3OS0Pd87HGyYX/I70toJoqylRp/nTtqu6WB9EHOYz0hIgHK+Yl7s5RV2JmO
 oatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmFwwOamyD22Qa/W+bRpeSVqXBzA/PH4/9ufKhvdmLk=;
 b=VAODOH/q1Yu+eRYc0999Eek0u/zFZbr9X9xraV/hthr9C9f5KUiUNKzIs8wf9wbbaI
 tpv5/6s9o5Yv8XIueKFovIcAtp24L6vfZInIxTa/BwpE3XIlXQV2QcpR1TnKEB9OpwAn
 WYl1pPs8wC/oGFdqa27rwavYDMLO83TsUrncnEbevIFMa5pNOiYSVkjAorDFZEbzQJty
 otVSRi0R6fWhtVFXOCsPf+E0lb6nACE8psZI/Y1nfzSv4lNAjB7WiV0inrNNgPC79X4a
 MHkJmQnwPF9LpBLw1TLG2xVQ/fqZcBgsJnLAw9uyEJ/f75Ffxa9NkkBX4qJbourYHLEk
 M/yA==
X-Gm-Message-State: AOAM533KvkRteTPyxWI1nMB4Mu2XEguJMtr6XmOHiIWinLnNdgYhDoSv
 YTaRKvrj/Q0hmBcoRGlOmNsgjxred0DDVA==
X-Google-Smtp-Source: ABdhPJxH5bR6Zd+5Yhg+3fk5dVALwiCumtZ2pkZ6pnnXmLJXvaOPEWX/0BSSnPGsvM+4otYUl/+fQQ==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr7567584wrm.697.1639869081398; 
 Sat, 18 Dec 2021 15:11:21 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id l5sm14833342wms.16.2021.12.18.15.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 15:11:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 00:10:47 +0100
Message-Id: <20211218231047.665943-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
References: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 178/178] package/imagemagick: host SVG support
 needs host gcc >= 4.9
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

host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
build failure:

In file included from ../src/hb-serialize.hh:36:0,
                 from ../src/hb-machinery.hh:37,
                 from ../src/hb-common.cc:30:
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/89e1194c1659d7e1af9db8ffe5feee770c448f76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 671b0995dc..fe0ad9a748 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -24,4 +25,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
+comment "SVG support needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
