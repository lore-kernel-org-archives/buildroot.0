Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3DEC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D2A360F16;
	Sun, 18 May 2025 08:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbOcuOghm_Pr; Sun, 18 May 2025 08:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816D160EF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816D160EF9;
	Sun, 18 May 2025 08:58:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE70DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A666960E4B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwvPcX3F9ioS for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8946F60E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8946F60E1A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8946F60E1A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B4B7843304;
 Sun, 18 May 2025 08:57:38 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:12 +0200
Message-ID: <20250518085723.23020-20-thomas.petazzoni@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1747558658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD6+IYdVXk89Yeuqz/hp3MRqunPRtdB6vUkKwjkUu8c=;
 b=G0Q8gVvFKIa5bkDxOzvXLAPby/KDG4W2awFWgIqaPPoZfheg8Zb3yV358b1FGEqhx9p+3S
 NyvnSaopTt4x+0d55cPotuGKs1VJNwQvM/ZuFQr5H2jjlcFZRMs01052eHfpACj8c9zAdK
 Y1mb7fLjpaSOAymixr2QZzQKGzpIyXJKf/JS6RecttjCkBZh3LqSjqO2iZxS3iFDdYPjxC
 7Ct4bHBajfCdUOJzI4b1xwAnLvo901EDxAjz9u4h82qEQUcyPytGeEr6S8gPJqQ5L1VMT+
 0q+LA7DHPIPCoNyuN7cVEJDhzjKgwWN+EytlT7MyUhQb6pKHji4g8QYip8vLdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G0Q8gVvF
Subject: [Buildroot] [PATCH 19/22] package/sox: add fix for CVE-2022-31650,
 CVE-2023-26590
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
 ...ect-implausibly-large-number-of-chan.patch | 63 +++++++++++++++++++
 package/sox/sox.mk                            |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch

diff --git a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
new file mode 100644
index 0000000000..fd1d210da1
--- /dev/null
+++ b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
@@ -0,0 +1,63 @@
+From 452bfd55096e24ff5eb4a5eb491c70125ce05be8 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:55:32 +0200
+Subject: [PATCH] formats+aiff: reject implausibly large number of channels
+
+Bug: https://sourceforge.net/p/sox/bugs/360/
+Bug-Debian: https://bugs.debian.org/1012516
+
+Upstream: https://sourceforge.net/p/sox/bugs/360/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/aiff.c      |  5 +++++
+ src/formats_i.c | 10 ++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 3a152c58..6de94f32 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -619,6 +619,11 @@ int lsx_aiffstartwrite(sox_format_t * ft)
+            At 48 kHz, 16 bits stereo, this gives ~3 hours of audio.
+            Sorry, the AIFF format does not provide for an indefinite
+            number of samples. */
++        if (ft->signal.channels >= (0x7f000000 / (ft->encoding.bits_per_sample >> 3)))
++        {
++                lsx_fail_errno(ft, SOX_EOF, "too many channels for AIFF header");
++                return SOX_EOF;
++        }
+         return(aiffwriteheader(ft, (uint64_t) 0x7f000000 / ((ft->encoding.bits_per_sample>>3)*ft->signal.channels)));
+ }
+ 
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 7048040d..6a7c27e3 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include "sox_i.h"
++#include <limits.h>
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <stdarg.h>
+@@ -60,9 +61,14 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+   if (ft->seekable)
+     ft->data_start = lsx_tell(ft);
+ 
+-  if (channels && ft->signal.channels && ft->signal.channels != channels)
++  if (channels && ft->signal.channels && ft->signal.channels != channels) {
+     lsx_warn("`%s': overriding number of channels", ft->filename);
+-  else ft->signal.channels = channels;
++  } else if (channels > SHRT_MAX) {
++    lsx_fail_errno(ft, EINVAL, "implausibly large number of channels");
++    return SOX_EOF;
++  } else {
++    ft->signal.channels = channels;
++  }
+ 
+   if (rate && ft->signal.rate && ft->signal.rate != rate)
+     lsx_warn("`%s': overriding sample rate", ft->filename);
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 384d012763..f76a338661 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -74,6 +74,11 @@ SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
 # due to the change of CPE ID to libsox_project:libsox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-40426
 
+# 0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
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
