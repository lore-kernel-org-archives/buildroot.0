Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AB7C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5002D60EA4;
	Sun, 18 May 2025 08:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvZi2fi0jbOw; Sun, 18 May 2025 08:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83ADE60EBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83ADE60EBB;
	Sun, 18 May 2025 08:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37762223
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6B6409BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQoPN5beyftC for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3389408FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3389408FF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3389408FF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D4973432FF;
 Sun, 18 May 2025 08:57:36 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:09 +0200
Message-ID: <20250518085723.23020-17-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueefteegvdelueelkeehgeehvddvgeduueeftddujeefieegfefggeefjedujeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdpuggvsghirghnrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoo
 hhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmbdfecU8LUHL6fis+UeU2iuhcIde8SCfXAcS1BkuW0=;
 b=VNfOneNHU27l4gq1uEZ30RA0nP0fsG40MyZpaa69Bfvxn4SDW2lQ+z2qoASogiLmDE9G9a
 3qUzsuMwaiv+rVq4kFW2WT4TOnH8NxemL/6uuD9nZOTGwuO1QqQp1x7GXkCygRhFmDmB7C
 UmB8BWbjm4TJ7LFABslinkP4HJbT1874VHYWWi5rFTjJmqNyUgkUSkJLijSMbzF3TzFQ7w
 8nPjB6wsVr2ha0xR5qH4NifWL7poTuM98dpvagTlGIs7u7nps8+wMQXhboNx4KELP2VsY0
 C2GPyjNxai4F7a1mvobU58/sB/8fgdJU7hgVCz84VNmLmaebfWPJ2Pyw5NqRVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VNfOneNH
Subject: [Buildroot] [PATCH 16/22] package/sox: add fix for CVE-2021-3643
 CVE-2021-23210
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fix is included in Debian's sox package. The CVE is not reported
by pkg-stats because the NVD database has associated it to the
sox_project:sox vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...hould-never-be-0-to-avoid-division-b.patch | 34 +++++++++++++++++++
 package/sox/sox.mk                            |  5 +++
 2 files changed, 39 insertions(+)
 create mode 100644 package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch

diff --git a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
new file mode 100644
index 0000000000..94298b7ae5
--- /dev/null
+++ b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
@@ -0,0 +1,34 @@
+From ad8ecfbdd9ff184b60600a115247a6aa947d0215 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:10:00 +0200
+Subject: [PATCH] voc: word width should never be 0 to avoid division by zero
+
+Bug: https://sourceforge.net/p/sox/bugs/351/
+Bug-Debian: https://bugs.debian.org/1010374
+
+This patch fixes both CVE-2021-3643 and CVE-2021-23210.
+
+Upstream: https://sourceforge.net/p/sox/bugs/351/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/voc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index a75639e9..0ca07f94 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -625,6 +625,10 @@ static int getblock(sox_format_t * ft)
+         v->rate = new_rate_32;
+         ft->signal.rate = new_rate_32;
+         lsx_readb(ft, &uc);
++        if (uc <= 1) {
++          lsx_fail_errno(ft, SOX_EFMT, "2 bits per word required");
++          return (SOX_EOF);
++        }
+         v->size = uc;
+         lsx_readb(ft, &uc);
+         if (v->channels != -1 && uc != v->channels) {
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index d8a0d7d1df..eba166f68b 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -59,6 +59,11 @@ SOX_IGNORE_CVES += CVE-2019-8357
 # sox-14.4.2-44-g7b6a8892
 SOX_IGNORE_CVES += CVE-2019-13590
 
+# 0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
