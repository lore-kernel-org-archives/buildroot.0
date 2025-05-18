Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2BAC54756
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A48A60EBC;
	Sun, 18 May 2025 08:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7p3gMQ_Tlwah; Sun, 18 May 2025 08:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2C460EBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2C460EBE;
	Sun, 18 May 2025 08:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F59E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A80B8179D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLCznsqkhpzB for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0306815CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0306815CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0306815CA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1DFFE41CFD;
 Sun, 18 May 2025 08:57:38 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:11 +0200
Message-ID: <20250518085723.23020-19-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeguefgieegffeuieejkeffjeeigeegvdffgfdvheefjeejhedvleevtddvjedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpthgrlhhoshhinhhtvghllhhighgvnhgtvgdrtghomhdpshhouhhrtggvfhhorhhgvgdrnhgvthdpuggvsghirghnrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtp
 hhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5vnoYfXmqZZIx4B4CBWWkNNUBoU5paeEMIcWc/bmoU=;
 b=AqOESxX7n6bln2CTHEf6nXXXeZK9A/I6nwXiFWX5TAlnZOY/Mkbc5A96t37+R+PUA4wkJj
 q1G2HHIVQBNqgRPB6QqDtmZmzg+wfT5Pl+l+6VZyWGyaqNyWCcAmOhJi+0z45cgzNMkQrT
 Eg8A/gQc3wWmdwaWyZhVZ9N/fWRDLZ0mmp2tjO/eD0hH4M1Ba82h9WDxXDBH4Firr3hZcu
 3bcLOkIfyF9oQZUaVmFOYMg1NJteyBZKCm53fzh5Xp4VfpOsoMl0qeEEYeB3at/X1tBr4C
 1INbiOTH3KLKIsIthp6tzno74Je4aGtgaIA//vkvkis3J6K/toL6U8/XMxu5DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AqOESxX7
Subject: [Buildroot] [PATCH 18/22] package/sox: add fix for CVE-2021-40426
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

The patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the
libsox_project:libsox vendor/product CPE. This has been reported to
NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0008-phere-avoid-integer-underflow.patch  | 42 +++++++++++++++++++
 package/sox/sox.mk                            |  5 +++
 2 files changed, 47 insertions(+)
 create mode 100644 package/sox/0008-phere-avoid-integer-underflow.patch

diff --git a/package/sox/0008-phere-avoid-integer-underflow.patch b/package/sox/0008-phere-avoid-integer-underflow.patch
new file mode 100644
index 0000000000..7c59896660
--- /dev/null
+++ b/package/sox/0008-phere-avoid-integer-underflow.patch
@@ -0,0 +1,42 @@
+From c49c81a3c4409e7c1979ec8cb341fb0c57220616 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:48:05 +0200
+Subject: [PATCH] phere: avoid integer underflow
+
+Link: https://talosintelligence.com/vulnerability_reports/TALOS-2021-1434
+Bug: https://sourceforge.net/p/sox/bugs/362/
+Bug-Debian: https://bugs.debian.org/1012138
+
+Upstream: https://sourceforge.net/p/sox/bugs/362/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/sphere.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/sphere.c b/src/sphere.c
+index a3fd1c64..9544d160 100644
+--- a/src/sphere.c
++++ b/src/sphere.c
+@@ -63,7 +63,8 @@ static int start_read(sox_format_t * ft)
+     return (SOX_EOF);
+   }
+ 
+-  header_size -= (strlen(buf) + 1);
++  bytes_read = strlen(buf);
++  header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+ 
+   while (strncmp(buf, "end_head", (size_t)8) != 0) {
+     if (strncmp(buf, "sample_n_bytes", (size_t)14) == 0)
+@@ -105,7 +106,8 @@ static int start_read(sox_format_t * ft)
+       return (SOX_EOF);
+     }
+ 
+-    header_size -= (strlen(buf) + 1);
++    bytes_read = strlen(buf);
++    header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+   }
+ 
+   if (!bytes_per_sample)
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 6ce9ed3508..384d012763 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -69,6 +69,11 @@ SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
 
+# 0008-phere-avoid-integer-underflow.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to libsox_project:libsox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-40426
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
