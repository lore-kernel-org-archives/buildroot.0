Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFBC3ABDD
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB49A60E3E;
	Sun, 18 May 2025 08:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkuNFRW3SkdW; Sun, 18 May 2025 08:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA9D60F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA9D60F23;
	Sun, 18 May 2025 08:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A965E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975E8409ED
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g775y6pLPaCb for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43794409C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43794409C3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43794409C3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id ED414432FA;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:14 +0200
Message-ID: <20250518085723.23020-22-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieetueejheefudfghfdvvedvueelhfdutdejiefgjeevhfegkeevgeeufeelvdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdprhgvughhrghtrdgtohhmpdguvggsihgrnhdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughro
 hhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVepe59AsJICOVSTzEgTTzesKll/pWyI8Ss8nN7fvLk=;
 b=CwpZQgrWqc9OqVbcYb4xhu7W21tKVv93hvoGj/JTsGurcKmX4BfxgARxxhV+i+JgxhSJ1f
 s/GjoLxxKqZxBYHnGkIsOoEtmeEpc11KAst3ees/J+1mA7f0tvWq3tMpSPjFTHT83KHIMu
 1S+L46ECYGWCzbk3z8X22p3V9SBCVsPpIorzfdmRYlIm+Z27EepMNJNvOiVY+NhN7DsO7t
 tTjRPWYQh5/NQpiosqv8eaFJTCWt/ohpeRbiC+tvOPIv/hjLIsbcvvkipA5lVLEfLjbnWm
 ByLwpRAs5TUGKiXwIe6R92Mo9U+BLEI3YCmijgVtEPaNqLBTeRdeq332GnF4XQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CwpZQgrW
Subject: [Buildroot] [PATCH 21/22] package/sox: add fix for CVE-2023-32627
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

Patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ilter-null-sampling-rate-in-VOC-code.patch | 37 +++++++++++++++++++
 package/sox/sox.mk                            |  5 +++
 2 files changed, 42 insertions(+)
 create mode 100644 package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch

diff --git a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
new file mode 100644
index 0000000000..b67d23c12d
--- /dev/null
+++ b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
@@ -0,0 +1,37 @@
+From 2ab4f13af84f224cfbdd997e027c7348156de463 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 23:07:34 +0200
+Subject: [PATCH] CVE-2023-32627 Filter null sampling rate in VOC coder
+
+Avoid a divide by zero and out of bound read by rejecting null sampling rate in VOC file
+
+bug: https://sourceforge.net/p/sox/bugs/369/
+bug-redhat: https://bugzilla.redhat.com/show_bug.cgi?id=2212282
+bug-debian: https://bugs.debian.org/1041112
+bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2023-32627
+
+Upstream: https://sourceforge.net/p/sox/bugs/369/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/voc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index 0ca07f94..d8b982c5 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -353,6 +353,11 @@ static size_t read_samples(sox_format_t * ft, sox_sample_t * buf,
+             v->block_remaining = 0;
+             return done;
+           }
++          if(uc == 0) {
++            lsx_fail_errno(ft, EINVAL, "invalid rate value");
++            v->block_remaining = 0;
++            return done;
++          }
+           *buf = SOX_UNSIGNED_8BIT_TO_SAMPLE(uc,);
+           lsx_adpcm_init(&v->adpcm, 6 - v->size, SOX_SAMPLE_TO_SIGNED_16BIT(*buf, ft->clips));
+           ++buf;
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index c0d903f9d4..3c9c939e8c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -84,6 +84,11 @@ SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2022-31651
 
+# 0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2023-32627
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
