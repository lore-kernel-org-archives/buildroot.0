Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F890C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BB3408AE;
	Sun, 18 May 2025 08:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNESIovyTcnh; Sun, 18 May 2025 08:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FA540B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FA540B3F;
	Sun, 18 May 2025 08:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA4D204
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56439409BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOjYkluN4XLS for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FD70409C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD70409C3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FD70409C3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 793CA432FD;
 Sun, 18 May 2025 08:57:37 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:10 +0200
Message-ID: <20250518085723.23020-18-thomas.petazzoni@bootlin.com>
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
 bh=6x0OqCmhDXn5W1FYlmEFB+CztCfrIaOQrGu98iUUF9I=;
 b=WfQGk9UKk383vCJY7Aph02TkTH3xsyHEBFN54wykX/jf1XQFHzyGLMA+e7KBdUE+sKpF5L
 8Gwc7WFgf9mXAUfF7b92AJQ719wFCXCyEcghQHnn4v/b0sPs3klpQTAehabQOwg/+UoJBv
 0o9m4jPZ/SMSJzria1qBEA20+txAb1DPyCV9LhpqudbGt/innYCu+U262qvwtECk+skXEY
 SFI81vm2187YLhj3TpylCyM48STkN00K6yAaIOXZlMnbwZKCo0hYpFL+nasQzLlThGPu3C
 taEqEEJfJ6pD9rAH7h9flQoAc1ecLO228Q6aK9sZldAcPFo4WU4qlLeBKqlvnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WfQGk9UK
Subject: [Buildroot] [PATCH 17/22] package/sox: add fix for CVE-2021-23159,
 CVE-2021-23172, CVE-2023-34318
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

This fix is integrated in Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sox/0007-hcom-validate-dictsize.patch | 38 +++++++++++++++++++
 package/sox/sox.mk                            |  5 +++
 2 files changed, 43 insertions(+)
 create mode 100644 package/sox/0007-hcom-validate-dictsize.patch

diff --git a/package/sox/0007-hcom-validate-dictsize.patch b/package/sox/0007-hcom-validate-dictsize.patch
new file mode 100644
index 0000000000..722b64675b
--- /dev/null
+++ b/package/sox/0007-hcom-validate-dictsize.patch
@@ -0,0 +1,38 @@
+From 54455f59305d9ce94cc73100bc2dd542865fed4b Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:33:16 +0200
+Subject: [PATCH] hcom: validate dictsize
+
+Bug: https://sourceforge.net/p/sox/bugs/350/
+Bug: https://sourceforge.net/p/sox/bugs/352/
+Bug-Debian: https://bugs.debian.org/1021133
+Bug-Debian: https://bugs.debian.org/1021134
+
+This patch fixes both CVE-2021-23159 and CVE-2021-23172.
+
+Upstream: https://sourceforge.net/p/sox/bugs/350/
+Upstream: https://sourceforge.net/p/sox/bugs/352/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/hcom.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/hcom.c b/src/hcom.c
+index 594c8706..9e8b03c6 100644
+--- a/src/hcom.c
++++ b/src/hcom.c
+@@ -141,6 +141,11 @@ static int startread(sox_format_t * ft)
+                 return (SOX_EOF);
+         }
+         lsx_readw(ft, &dictsize);
++        if (dictsize == 0 || dictsize > 511)
++        {
++                lsx_fail_errno(ft, SOX_EHDR, "Implausible dictionary size in HCOM header");
++                return SOX_EOF;
++        }
+ 
+         /* Translate to sox parameters */
+         ft->encoding.encoding = SOX_ENCODING_HCOM;
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index eba166f68b..6ce9ed3508 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -64,6 +64,11 @@ SOX_IGNORE_CVES += CVE-2019-13590
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 
+# 0007-hcom-validate-dictsize.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
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
