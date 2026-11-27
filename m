Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99498606A32A
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 04:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KO7R8KGt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468B6811FE;
	Fri, 27 Nov 2026 04:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2tmwuk7jjk8; Fri, 27 Nov 2026 04:54:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79D5281150
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795755266;
	b=nDBDn3ewtj+gTeNUdJ35fEy7HzCkap79QoyvdTZSxeQxtZmNFKTPlgyqcoMa4cLFo19p
	 DeU7MUec/Ni0GQvylTRDOb3RS0+VDpNrrR1pf6p9hUYxb5m4NoCudmPLB29rsQZsHJau1
	 Lm8SQI8Kd3hvV7qlvVdacb6djAATU9DhqurXJWPO1eU3kdzPr+nj9N9Ahi/uJQKjwcfrx
	 jNnKLe2voFIySbwYDbfBzenR0P4yjIw2hJtRAS9O74A8ew2TDe0A+P2c6rO1hp5zkIhLw
	 SoFHRR0FxKWP5fyd3/SSOXWhIe3izoy6dKodV1hU7a/o2gREVkmAHSKiXAjXerZPg2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795755266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y8wfaOGaVKQCZRUCZAyfeIBPl1UWqAyNMVgWMmEYRgg=;
	b=JM/E8kVx7iUFWA+rhhd3IloC6TlxPyOn6+0B/llap5U5UMO/NS7Z92XbnUSvMaUz+Rws
	 c25Ml4pGuXih3IrUQN4ND7PORsllnyiC0uy3doriUKN62beVybM7JH5jaLm99Uxs+kwWy
	 lGrB6RmRqgWgAHJbb9xrW4RC1C0i3UNtx4z+9HPEeCNwaDZS2eAaB1tXUngy/gzCNOx6Q
	 glnSC9z7Ne1I9qAkhO/E3ozzRn+ld0nOkQV2R1zA0wYh6wxCTwvN8ajlFNFmrBN4HD8ZR
	 9swQBBACzOrwOOIFnvWxm1OSUCwqk7eZOLv2r5R9LTwrCgxwmI5iFetiIoxJkUvyQ8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795755266;
	bh=y8wfaOGaVKQCZRUCZAyfeIBPl1UWqAyNMVgWMmEYRgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=KO7R8KGtrVZdSYSnJ9CIkdttIX6cKLMMuVch7bKHKW2ZoOv1S9IQitLYTlaP8K5cp
	 vfFxPYaUfXM9D3ZBnJyNjOfrdMvtTSkArIpRrZEIHkg5rz5XbWwH5tSgLyFARvd7EG
	 +emqZPBXFye8egVpNF1oJEnO0ALrzjoiWVABOkXBFCWN0WIbGOT+ItWx60XK63j1kv
	 c6qRa1N24d1VjAcmJeNRkXB7HGloLbe6E866vo1L81MagEYDR/afuaFdBknho1nbNu
	 w1R4nTnILCBDUxRIyv8q7UioIGONE5W7ypWgDQnjab2f/ErUJ8oSvxZoFPBCdVGttf
	 NviIHL+NXsUWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D5281150;
	Fri, 27 Nov 2026 04:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C98FC266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF50881150
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1ra_-SBrcMj for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 04:54:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5492C8114E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5492C8114E
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:54:24 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c515369b627so820050366b.1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 20:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795755262; x=1796360062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4wc7kXqSPnDnb3cUfGD5CpDU+UuXShM5384s4OkaHo4=;
 b=JQZlFgTwLUtyZG+Fu4zbtyXD75sVmmsaa0ElyqAeGnPVsQHdia1OFg17d1wib6Bc2E
 h97pbGaiROQh218D9KtF8xayelvYdMkTtI1+E7PtrpAK0lr63DnfPd/CUKNrlrBdxH1R
 CpjsWFlx04H7XUPlWPe8ghyDdc8e808pWoXobWwsqmBiq4biwBIJY6sMzWE+zNABwAHd
 1DTF2mDv1HPg5M441AlUjJIoX9XFA823/uWsWLZTJ8zi/SRm/3PRGqpQIjK2SKHgFBK9
 wrEKg9k4gOjZypqwtzgmoQpNLGyOSnQ74tXTkH0BtaJLX2uSNRzlLAPuYPcMxnekPNwB
 2OkQ==
X-Gm-Message-State: APuU4Z/u9OVNA6FQ7p0pfqGJETWZ2xsSfSEXjJmsjyr/WZq8BOw2T2GP
 mhAUJU7n0stDT37OsmPhttkRPmE8p7eNA0nOQjIKeny1fucPtxSLetVbwCdcjg==
X-Gm-Gg: AZFdTZeWtq1/+KX071Hq08mLOsHFRfI/fYm+RgtsYbdAHNv797ZNtPd7nvegKyz1m9C
 oClWBruRHmsDazULRS8B+BnJrAiiI5eHcyldvH3lrj7LmfaVyFyNghYvVLEpuwaDzM5BE3t4u89
 WCSGJJRpATAcIBRTZGhq4yhWOBAVGIHqis+gy9F7OI8rpBeG91/+Y2CO8IEwSZN38tkZwUnduTm
 OkDyQ63Cns+2lSMnlGj/nRa6hA0BXXG0iI1ulwlMHy7YUmslbrBjk3wH01seWiw8Pv3Glqv0dTE
 KUf+LlcG2QUiNgCJo+2+tHvHd8Gu21/HLgfVHAOhqnJ+ewOb6USG06MmGkSa2ENaGh9xZ4oXjYy
 N6RLr9mVENKM7VHwWcDLS4vrYQd5cq+QwHsqVo7wZ8L7S8coOqzjwL0tdsi4vabV7M/diI4YMzg
 mAJe9sx4Nj2q7jetKyAk+MNc0/SBpCqHAYEWj7N+xmYH/cYe0xcL+0Zb7Bf+0jS/V/Pmk3uxLxG
 fRPOmXScL9Iwwgbc6Wift8GePoeXYk+1ueUC+c7h1280K1GqJkS3e+dVgZNl1k6IlrsYdvnoZhI
 zIsvGKKPA7VHNulriR3Yethrd1a0kosbjE6bxeSLRrJYV+wH6CNzXztwqUL4nShHizPp6Owxrxr
 2EgIvBnuh
X-Received: by 2002:a17:907:940a:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c513acbb4a8mr1870912066b.43.1795755262155; 
 Thu, 26 Nov 2026 20:54:22 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae8f70fsm827497966b.40.2026.11.26.20.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 20:54:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 27 Nov 2026 05:54:20 +0100
Message-Id: <20261127045420.1541484-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libroxml: switch to GitHub
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

download.libroxml.net is broken: it serves a certificate for
*.blunderer.org and answers every request with an HTTP 500 error, so the
download fails:

  HSTS in effect for download.libroxml.net:80
  [0] Downloading 'https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz' ...
  HTTP ERROR response 500  [https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz]

Fetch the 3.0.2 sources from the upstream GitHub repository instead,
which the libroxml homepage links to. Apart from the generated autotools
files, their content is identical to the release tarball, so autoreconf
the package. configure.ac uses PKG_CHECK_MODULES (for the optional
fuse helper), so add host-pkgconf to provide pkg.m4.

Use the commit the 3.0.2 tag points to as the version rather than the
tag itself: a GitHub tarball of the tag would be named
libroxml-3.0.2.tar.gz like the release tarball already on
sources.buildroot.net, but with a different hash, which breaks the
download from the backup site.

The download site has been used since the package was added and only
broke recently, so there is no culprit commit; all maintained branches
(2025.02.x, 2026.02.x, ...) use the same URL and are affected.

Fixes:
https://autobuild.buildroot.org/results/54c4c3522ae4e337ef7818988866dff2e961027d

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
- Use the commit of the 3.0.2 tag as version, so that the tarball name
  differs from the release tarball on sources.buildroot.net (Thomas).

 package/libroxml/libroxml.hash | 2 +-
 package/libroxml/libroxml.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
index 208272f2fa..8f4d3cf821 100644
--- a/package/libroxml/libroxml.hash
+++ b/package/libroxml/libroxml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de41c88952c896e9a43ca630e88ac75e24af74a8731e21858b12e3cb2385c3f4  libroxml-3.0.2.tar.gz
+sha256  3ac23695f4aaf42050a261481d0986bf7910613e9ddb5dcf159ff9424c07a553  libroxml-ec1f9155471abb28724a21d14223a0467204aa04.tar.gz
 sha256  fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387  License.txt
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index e658b82d15..e350f3026c 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -4,7 +4,10 @@
 #
 ################################################################################
 
-LIBROXML_VERSION = 3.0.2
+# Git commit of the 3.0.2 tag. Using the tag name would produce a
+# tarball with the same name, but a different hash, as the release
+# tarball formerly downloaded from download.libroxml.net.
+LIBROXML_VERSION = ec1f9155471abb28724a21d14223a0467204aa04
 LIBROXML_SITE = $(call github,blunderer,libroxml,$(LIBROXML_VERSION))
 LIBROXML_INSTALL_STAGING = YES
 # From GitHub, no configure script
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
