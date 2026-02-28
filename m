Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D5DFEE4FE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 21:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799DE606E6;
	Sat, 28 Feb 2026 21:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSVlBUxyePCh; Sat, 28 Feb 2026 21:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA4E607B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772312503;
	bh=fD4sw1/mhuRx3Q6Xc8yWGFhOx6wsBSs9KciXvfr1d1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GlLjmvreh1wlSAfGkIvyAyJgfWhI9FSZ7BktW5Rus8E4gFoaIfhH8Mk0y9xJBQ+Yj
	 sSzpalAUiV5woh/nT6hCrohRb7zWX1kEd6ngcd4w0KdAjpEWEffJjLj5OiFpyq4IHI
	 peOYLMF1dByUMrzSnJMkI0YV3gSJ23ceJj3+V3rdjQscSx0HqmFyMDcvOvdsO5xD73
	 nrRsc315qinUU2GpFYEMzydMo8vffVn2jyoJkOdHXFSO67X3exXbufrIV/JwlDQPyP
	 /izw22ZfJuFbI1U6BTNmPcQocBwow4vU/KkreI88pDnmX+0d8zgIar1V1YRYJZ/9q7
	 DhsaEawjLqj9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA4E607B1;
	Sat, 28 Feb 2026 21:01:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E3EF18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10625607B1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGbPDMJUjXv8 for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 21:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A12A606E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A12A606E6
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27B6585C60; Sat, 28 Feb 2026 21:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 21:51:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f4e289aab9c2aa113d05589ba6b83778e60a0f3
X-Git-Newrev: 76135019544058a282ceed87e10e5d5e03ca5558
X-Patchwork-Hint: ignore
Message-Id: <20260228210142.27B6585C60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: add patch for
 CVE-2025-34450
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76135019544058a282ceed87e10e5d5e03ca5558
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

- CVE-2025-34450:
    merbanan/rtl_433 versions up to and including 25.02 and prior to
    commit 25e47f8 contain a stack-based buffer overflow vulnerability in
    the function parse_rfraw() located in src/rfraw.c. When processing
    crafted or excessively large raw RF input data, the application may
    write beyond the bounds of a stack buffer, resulting in memory
    corruption or a crash. This vulnerability can be exploited to cause a
    denial of service and, under certain conditions, may be leveraged for
    further exploitation depending on the execution environment and
    available mitigations.

For mroe information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-34450
  - https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...2-Fix-overflow-in-rfraw-test-data-parsing.patch | 31 ++++++++++++++++++++++
 package/rtl_433/rtl_433.mk                         |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
new file mode 100644
index 0000000000..6446fea0ab
--- /dev/null
+++ b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
@@ -0,0 +1,31 @@
+From 25e47f8932f0401392ef1d3c8cc9ed5595bc894a Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Wed, 8 Oct 2025 10:11:15 +0200
+Subject: [PATCH] Fix overflow in rfraw test data parsing (closes #3375)
+
+CVE: CVE-2025-34450
+Upstream: https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/rfraw.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rfraw.c b/src/rfraw.c
+index 9f4c9780c..71a1c365d 100644
+--- a/src/rfraw.c
++++ b/src/rfraw.c
+@@ -159,9 +159,14 @@ static bool parse_rfraw(pulse_data_t *data, char const **p)
+             data->num_pulses++;
+             pulse_needed = true;
+         }
++        // abort reading if the pulse data array is full
++        if (data->num_pulses >= PD_MAX_PULSES) {
++            break;
++        }
+     }
+     //data->gap[data->num_pulses - 1] = 3000; // TODO: extend last gap?
+ 
++    // expand reapeats as long as the pulse data array has enough space
+     unsigned pkt_pulses = data->num_pulses - prev_pulses;
+     for (int i = 1; i < repeats && data->num_pulses + pkt_pulses <= PD_MAX_PULSES; ++i) {
+         memcpy(&data->pulse[data->num_pulses], &data->pulse[prev_pulses], pkt_pulses * sizeof (*data->pulse));
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 08735be850..fc6c2bece2 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -10,6 +10,9 @@ RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 RTL_433_CPE_ID_VALID = YES
 
+# 0002-Fix-overflow-in-rfraw-test-data-parsing.patch
+RTL_433_IGNORE_CVES += CVE-2025-34450
+
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
