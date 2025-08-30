Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD6CA0FFD
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 13:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11916077D;
	Sat, 30 Aug 2025 13:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmgf0uDf_4RA; Sat, 30 Aug 2025 13:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E907E60771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E907E60771;
	Sat, 30 Aug 2025 13:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C791CD2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B92186077B
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5jZF-NLnoC0 for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 13:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9802960771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9802960771
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9802960771
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:11:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.106.177]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1v76GA3a7m-00Tnrg; Sat, 30
 Aug 2025 15:10:56 +0200
To: buildroot@buildroot.org
Date: Sat, 30 Aug 2025 15:10:35 +0200
Message-ID: <20250830131036.1295970-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830131036.1295970-1-fiona.klute@gmx.de>
References: <20250830131036.1295970-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4UqgzQzjy/iRHlnm1URYDO40upgUN9t+CPOP+ix9WdZpXOUqTnG
 dxT5H8G9XZEHLv6HQE+oWMqGbarf0kF07evH1kfWTOwLw/NXXMlSxW4BKASPh6eE0/1U82C
 NA7e9YLZHVVVHe/vmcfmgngrxBXikSL6ZVZooaMoD8OaL1EQwBorzvcRITXjRTRBNahS8Fa
 LGjp37tTmqzD6kLamUi5Q==
UI-OutboundReport: notjunk:1;M01:P0:XjSLba5JFQs=;xdH8O0vOc0dlYDHcDggAdVlxcnY
 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
 C9N2vCX1tJ4aVpc3qggqfAA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756559457; x=1757164257; i=fiona.klute@gmx.de;
 bh=7zH4rY4G+HJI/4FVrm/np1e8hMjBfDxK0cGaXE/aHBQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nHnypYT2HbNgDhytcBIKYAyHJV9ylPR3mpo+XdtN1D7r/huxgxLnO3Cl8wjWocy2
 yw8AnwtGLQbzf4V/myQLE8uYGJY/eLQeKcmmqd3omcwSbFUG+deuhJpFAbENA5ylZ
 M9b6TAu90lhyjbbnzONe/iDIXCy0DCUlWzqd/MtoOTIo5TDEbZ4O3ItQ9+DaBpSFo
 CES6CPtGH2IrwF0seAZnJJ9ReqMQG7Og9pPRkDEKkxMIb2yjc++aeCkOmBVs0bJ+R
 HyziOLv2x6jdPokfdJvF08lp/qdUoVTvo+YQd01r/2rmfwa9yg/bTPli64gXHJZUq
 G+eZinhzK3vWsZhXWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nHnypYT2
Subject: [Buildroot] [PATCH v4 1/2] package/pkg-utils.mk: include external
 tree info in show-info output
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This allows identifying packages from external trees, and the external
tree version allows identifying the precise version of the packaging
code independent of the package version. If needed, the location of
the external tree can be derived from package_dir and further
information loaded from there.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* Add an "external" mapping with external tree name and version to
  show-info output for packages from external trees (this patch).

 package/pkg-utils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..4c9861e946 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -111,6 +111,17 @@ define json-info
 	}
 endef
 
+define json-external
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(if $(findstring $(BR2_EXTERNAL_$(name)_PATH),$(1)),\
+			"external": {\
+				"name": $(call mk-json-str,$(strip $(name)))$(comma)\
+				"version": $(call mk-json-str,$(strip $(BR2_EXTERNAL_$(name)_VERSION)))\
+			}$(comma)\
+		)\
+	)
+endef
+
 # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
 # for json-info, above
 define _json-info-pkg
@@ -121,6 +132,7 @@ define _json-info-pkg
 		$(call _json-info-pkg-details,$(1)) \
 	)
 	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
+	$(call json-external,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR)))
 	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
