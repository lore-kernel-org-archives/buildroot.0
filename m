Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A751C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB1440B5F;
	Sun, 18 May 2025 08:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qwY5v90nWw4; Sun, 18 May 2025 08:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD66040B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD66040B6D;
	Sun, 18 May 2025 08:58:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41C8AE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7426E8196A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruqT5Xu-XjK2 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48A3E8179B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48A3E8179B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48A3E8179B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 555B0432FC;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:13 +0200
Message-ID: <20250518085723.23020-21-thomas.petazzoni@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1747558659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbnTB4sGzA8jbmFRojDkdcG9/3k3rbS4pZffliUlNTE=;
 b=OWtjPF1JF4eXHUfO8jf3Yn9tkynlGL+1QcjG0zTLj0qb5hVHr8T6+OWV1uIZsW2HRWTrxS
 c3T56QTFK1deZEDCJ5nJ8B22yp5LobvpDGpIEbemhXbtDxOwVn+eptmC54mryoJSoyngSg
 h+6Y/Hpg+/X3AyFj+9iVPn35dYw1U8nN+3298nB7n8UJhbrt7rkPsv5D3U1RYJub/zALKf
 GR0Y7asVE/WtVY6fsQxAZ74Nc55xG4KvuCsLd4uLeZKKd8ghlhtxPIzYZtnbUnV+WVktWr
 Z3oeH1MF66T0ctWeMwLK9si3cW0XlBFn1MV6aowk38e9sxffUKh69TnNCE01Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OWtjPF1J
Subject: [Buildroot] [PATCH 20/22] package/sox: add fix for CVE-2022-31651
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
 ...0010-formats-reject-implausible-rate.patch | 39 +++++++++++++++++++
 package/sox/sox.mk                            |  5 +++
 2 files changed, 44 insertions(+)
 create mode 100644 package/sox/0010-formats-reject-implausible-rate.patch

diff --git a/package/sox/0010-formats-reject-implausible-rate.patch b/package/sox/0010-formats-reject-implausible-rate.patch
new file mode 100644
index 0000000000..5e60b62011
--- /dev/null
+++ b/package/sox/0010-formats-reject-implausible-rate.patch
@@ -0,0 +1,39 @@
+From 6af0a8b32df4d7a83fd52a963a20e6e321f10fd6 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 23:05:33 +0200
+Subject: [PATCH] formats: reject implausible rate
+
+Bug: https://sourceforge.net/p/sox/bugs/360/
+Bug-Debian: https://bugs.debian.org/1012516
+
+Upstream: https://sourceforge.net/p/sox/bugs/360/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/formats_i.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 6a7c27e3..5f5ef979 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -70,9 +70,15 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+     ft->signal.channels = channels;
+   }
+ 
+-  if (rate && ft->signal.rate && ft->signal.rate != rate)
++  if (rate && ft->signal.rate && ft->signal.rate != rate) {
+     lsx_warn("`%s': overriding sample rate", ft->filename);
+-  else ft->signal.rate = rate;
++  /* Since NaN comparisons yield false, the negation rejects them. */
++  } else if (!(rate > 0)) {
++    lsx_fail_errno(ft, EINVAL, "invalid rate value");
++    return SOX_EOF;
++  } else {
++    ft->signal.rate = rate;
++  }
+ 
+   if (encoding && ft->encoding.encoding && ft->encoding.encoding != encoding)
+     lsx_warn("`%s': overriding encoding type", ft->filename);
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index f76a338661..c0d903f9d4 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -79,6 +79,11 @@ SOX_IGNORE_CVES += CVE-2021-40426
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
 
+# 0010-formats-reject-implausible-rate.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2022-31651
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
