Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519DFC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 08:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D859D60ADF;
	Mon, 22 Jan 2024 08:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D859D60ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sim0Dgl8LLT4; Mon, 22 Jan 2024 08:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5F960A98;
	Mon, 22 Jan 2024 08:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5F960A98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB0951BF401
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 08:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F16D40189
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 08:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F16D40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_ugb6sabxRS for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 08:06:04 +0000 (UTC)
X-Greylist: delayed 592 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Jan 2024 08:06:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BA94011D
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4BA94011D
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 08:06:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AFDE5C0102;
 Mon, 22 Jan 2024 02:56:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Jan 2024 02:56:10 -0500
X-ME-Sender: <xms:mR-uZX2RfCYTlqciGbsD92XbZ-GGPy2MZzfKkm9u4xqccB0PiXUlKA>
 <xme:mR-uZWFc8hp0hHO7g7LGI2X3QrvHfwWZgMfhLTaDN2QEv6-GwK6DZFa-SIrD7eOGT
 FHShPHMW7uOOy6qs54>
X-ME-Received: <xmr:mR-uZX7T_Hb0JevSVKqq4uVwakD79KAz2clP7O_ykvUapx2z9fx6xmbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekhedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdeftddmnecujfgurhephffvvefufffkofgggfestdekredtredt
 tdenucfhrhhomhepuehlrggtkhdqjfholhgvudcuoegshhessghughhsrdgttgeqnecugg
 ftrfgrthhtvghrnhepffdtheejjefgfeekvefhvdeiieffvdevhfeigfetgeffkefftdfh
 uefhieekgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepsghhsegsuhhgshdrtggt
X-ME-Proxy: <xmx:mR-uZc2stFCSpYDK_Lv66_Sadzxx0QUAbqFFTz5Q7ispLl2RNJoX-g>
 <xmx:mR-uZaGFbf_bEq7cPswBx4Xf4Mj-_7WPeTAMegvSFDT1eRk9TdkgDQ>
 <xmx:mR-uZd8nA3czyWGB-r6uNt6rPspH4NLoWg_YhXci_ssne6_do3IOog>
 <xmx:mh-uZcOklQYgLpfyheh7O2Igr27CMHnINbzFNRuaBvSBqTPqEU6c-A>
Feedback-ID: i5e494642:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 02:56:07 -0500 (EST)
From: Black-Hole1 <bh@bugs.cc>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 15:55:51 +0800
Message-ID: <20240122075551.2477192-1-bh@bugs.cc>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bugs.cc; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1705910170; x=1705996570; bh=eeZAYxzyYLF5Ogc51ukuJ
 HO5mens2RLdltbYnlojwR4=; b=RwSrmY3TjHqGZNJ1Fi3YbS1xXmYji2Zb/zKUX
 9DWzyYl99SW2yeCyJ4qGqlh7NDkPu+Ze122wOpenyY2D6ENEuKtOfXYLnuUyEXM8
 DuNXsKQbD/r8s1Aaydw86fbNLuKQIQ/AXhy8C2ruHrjG3OHYIpJx2eG1BpZ0eg6J
 TbAbqEQeGUwkc74b2ckzk66L/CpBm7hy3pcUIUNcTwWGlXMigyAmEqHTKolFK8/S
 1EslE/NoryuBOfoCCSaaJDnK0AU+9cu494qSsLVZytzMkgaL6Kj8n3xSj3l9qsd7
 jrxsUel8e+ayOFBaPwhbcHrjy5FGJipdiw8XqAnLhNSCVNYLg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1705910170; x=1705996570; bh=eeZAYxzyYLF5Ogc51ukuJHO5mens
 2RLdltbYnlojwR4=; b=k3vXS+iuVgvS6jlAxxUApytNPCJm7s1CAWicZF6noqq9
 23b0/OicLZWuZdM2DXxpwblgFmGSB1uh54WoP6MfijZZuYIml9RW6khh8U79qfD+
 F+64+ekHgkXlY0Wdt3v1F+lPamoAM2q+7zmxSqxeBLyBHEmHXc/DHABu+2XvGUC/
 ZEKqJmU/baNgDt7jdPzL+0fDOywK4VL3z0a2MidYXVNUB5jOs3mX2vXOLvbTAOyb
 XrV6nQkIYxJUhRO6/6XMbV+W/p4ya/KWasdVRfa1oOw+umSgX4Obdirl79PcG7MK
 WI7wsnus3SvanKhFU5X0JWHbThY9IJqem8xqhr+jJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=bugs.cc header.i=@bugs.cc
 header.a=rsa-sha256 header.s=fm2 header.b=RwSrmY3T; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=k3vXS+iu
Subject: [Buildroot] [PATCH 1/1] package/libxml-parser-perl: bump to version
 2.47
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Black-Hole1 <bh@bugs.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Black-Hole1 <bh@bugs.cc>
---
 package/libxml-parser-perl/libxml-parser-perl.hash | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index c3ef1016e8..4b91386573 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d  XML-Parser-2.46.tar.gz
-sha256  6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2  README
+sha256  ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8  XML-Parser-2.47.tar.gz
+sha256  3bedfe79fbad08a2b50e1b2b6123e40c68b58b1988d53763b63b6fd295bb0f90  README
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 37cef2e418..06bbd3b1ad 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBXML_PARSER_PERL_VERSION = 2.46
+LIBXML_PARSER_PERL_VERSION = 2.47
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
