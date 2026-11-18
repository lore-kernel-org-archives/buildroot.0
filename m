Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46FA606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UNsme0oj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aR3mm8pA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841BD80F6D;
	Wed, 18 Nov 2026 18:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyonnuApYv57; Wed, 18 Nov 2026 18:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 997FD80F4D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795025663;
	b=ayRS716NGSDlj7RjAWAHj9xqiWFNcRam4JGG8Osp2HPXLXVI3XsojNolrTk6zHZ+aBuC
	 EdnDGMIJxQx8YgYapxUnvdAR8CKqJ+tVIItqCv9IlZhxEuH02ImAAao4JE21aLYbpsNva
	 jlqVzhaIMl6UDjUgkBMtEPposz/sZ95wWoLrUl1SUhfJCFAsOlhBmduwLFtnX1Tz4/Kyh
	 vxwO3gnL/tptIXJXXfD7kDj1ic+JVuUYwvmu0B9AVMmO8To1S1M3aqcV9k8Yc77Y9XT0L
	 Q57D8FDnirm5ePZWPOiyyR2JUHDugL+SZF4xkkfqIepNdgAjEJuiIOlxMuvq/IO14kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795025663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Krlopk/ZImruwcIQrT6NViF7g8EI0wMF3Xp1b2GDiAo=;
	b=ApaAmxhFEBiJ5UFVL4uRL4GBx7fDwHLCdyvz2h+HFHwxIvFH6KW8umhOzMLenyvqbEjs
	 QbqOhqWS4n+f+BN/1MuhsfvfWYdNXVD4etQLZuLNXOzjbDkJJYVTqreX9qc8bOHbaqO5V
	 qIs48XADxF+cR6Td2dyaT8EPCe2gxRRCvumUrwYEw3opFsDvQ4buINoKyfkCyGruByOnq
	 gLZCwI38R706xfs2D1WaUzyhUw86IZFfOqlvEydwjPl4eWlllaBGVB0clE5esO/ZSwD0a
	 haWOLq1Zd4Hqtg0uZTKKOPdKUNNWOfEf6TdMSc/a4aAd8ZoLqA2Eu6SM+GScW0BeN0A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795025663;
	bh=Krlopk/ZImruwcIQrT6NViF7g8EI0wMF3Xp1b2GDiAo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UNsme0ojFhCf5vNI4YfBe0CJMYSWdamynVbxVoBlNxNsGR9t0VZ2kCzeoog1lil2M
	 L52ZFTWrzH4Skb8w9KzXD80bPb4UlEObY20tIiKpHEakgWGNADHIYRLpQGJIGrs261
	 UQEWx/e+4ZOngri54GLNU0jmTtusS6zDrc9B7swW7Wl3o+x5iX+8lprCrOyh7yXENz
	 2MdI07rSttaUIIyIF/PzwocTmDPKEzi+oyIlwN4b5+zD0WqFGypp81DUYujgZm4gYy
	 aAmHosndcucoSlp35tGuPfPV2vL/OAma7l7WK89LSRYLviyh+ExUVhFlf29BxYZJXl
	 DNqrFMe40HXNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997FD80F4D;
	Wed, 18 Nov 2026 18:14:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA5E861
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC1076068A
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxIAQiGMaRed for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BBA916067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aR3mm8pA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBA916067D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795025657;
 bh=LcFeFH2yCaX+ko0//iEv57W+UkWyyTsGAE74fSJofnI=;
 h=From:To:Cc:Subject:Date:From;
 b=aR3mm8pAt/gYsLhDxXtkeI40/jX4EJkkQSc19/1O+Jig7iLtDze1jODNRIBrkbkG1
 kZl3uUpX+IzP7+kUXTGexiW7h8yBnzdMiYEx+yeTzEulEpVBxtUI47x4QN0mLi8vAm
 4HPLCC98RgFZflc8yRjEnGwiKxAAvecf8I6t/SUR1p4ZDvehCNpy+DKFtBz/4Dt2S5
 5anlZzVgIqzTdTHKiK0ls7SCgQ2n7hDh7elaqT7f1Vmuc5rwtusQWmu6pCcHSspP0D
 7WpPSq4avhm8c3sw6iJPs/LXwrRzzJ0cSywTDYewneQ2NDrDed5yLkKBOalplVVdGc
 RJqpJFYV3IY3g==
X-KAS-Sym: v3:f51bdf72230551df:uTjvsLqhVvxkSox0d7Y5XZZ+Jjs78wyiQr9ZCKThLAoe9
 MtImAfJOaooxayjLNYA7mkEcmfce5S8OQcbG5wiMB8cjcZTc4L2N5FwLT3KKCmHjLyfzy/66vc3
 49pBdsohHmgFCw7hkF7m9M0zJItreE3fgdd8CvdrV9qQyFHFtvSaRUi6TOJDbz7LkJCMOiPYwJC
 KInrMQEWkIEWvviiDWvso5J3ESIX5WW4Ox3bz4THxUx4/uYdZX64R1GDXns3hoHkczEFNsbPRI5
 m8UJWOfELDH7JXbo80HDAHW0Rav9B/ads+yiSaL3JwtUKH9KV9nJJ30SMO+PoFxMzAdfZSrg==:
 hjEvTdaB1s6B+eIEm2LHHcXyXfc0vL7RwE2Hgnb614C7RswMEbHGKtZMo91SpaUyOw1FBp6W9mp
 kIjRHnsTCgwhTOOLjTvzAYRdfyOI/dI9uTco0VXZXysoKdRf94jvf7FwEXRh/9PuFb/5iyx4avp
 kOHhChpwFrbO8BDXwAzS+/+j2cX+Q91k60fDFKiyMQaHUHcWoAUiMoghE6lA9HCFwgpIPVX/IXP
 sox+GEKmLMyoS/sKRfF2yGxHz9+nGgLUKtGdk3jnP6zEDCDUXd/11TcS4pO1nmI7OZcKK+jSnQk
 th++L3Z5tR/EfaJvVP7VTMDxXXjuVls0jld8nIX86iiNAsv1sPPHnPSj1LjZY4kQyhRLFZ+FW4K
 XE3uCdvizdTBpDxyBQksBG9CSdAcdE0TvsyxnN961cSLTkriumV3dKXuswzMl2b2R48XDHVKfrX
 qtR5glNFlpt3fQyfim2A6UjyPVB4bYbcowGJwO8iN1ESNDpseP2DpPqk7OhqwdCezVGtqrjgfBS
 J8zR7CuPlBgZpCkUcVtOMV3dAmTEBZ+Zz4al7WgeLmvFqCuyayxY1SHqPHTz4N1X/Wv/qq3Pb/F
 Bin7JZGeX5NKp1u+acVYszefjkRB94Z0KNIE8jMobxqm/Y56G2vSR9mVrnTFv3LF9mkHb8GZWFX
 bprqjOQpBkPz7i8NcIu+rCrPU
Received: from fli4l.lan.fli4l (p5b3a00de.dip0.t-ipconnect.de [91.58.0.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DFF9A4C4DB3;
 Wed, 18 Nov 2026 19:14:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43784)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTkAj-000000001Xq-04G8;
 Wed, 18 Nov 2026 18:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Nov 2026 19:14:17 +0100
Message-ID: <20261118181417.156927-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.20
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/mm2/Little-CMS/releases/tag/lcms2.20

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d50e780fbb38cfe00cf7debe02aa783c821fb851

 package/lcms2/lcms2.hash | 7 +++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index f9a64b9527..22bd3b895e 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.19.1/
-sha1  b66f8317db40a775cb46cc465f66eb841c11aebf  lcms2-2.19.1.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
-sha256  bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8  lcms2-2.19.1.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.20/
+sha1  ee0aa46d5dfe750862c4f8c8fa26bc9c5ccdb246  lcms2-2.20.tar.gz
+sha256  18ff5504fa9cc8a2b1f3591180d90ead16c8a2ea78e530523b46eab70e1ca6b9  lcms2-2.20.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 6f99e3b454..a8bd1d948f 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.19.1
+LCMS2_VERSION = 2.20
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
