Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DE4606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NjmXVISN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=H35eOnHw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C506B60645;
	Mon, 26 Oct 2026 06:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdiwvtI8rZS7; Mon, 26 Oct 2026 06:36:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D57360623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792996611;
	b=r29TzJj68gbw79PhK3vaT707j84nLsChtVoU/Lc/yiA1pCUK9QANQI5ghKfeYRX+jwJI
	 HWi6SgdBkFWASciG/4JnmK4yhNn9bn37MAN1PT9xqVvXY0Qt00h6rh5rd6nIiGTi2B439
	 C1X6FC0ggIIMrpHUrfhfWiIqG7oGR1SGgeL/vhEOHai71E+gAy+/HRDfGoapGd5lLbHei
	 /u3K0iKfsWHhHFil2FJXZBdrk5PV4sf4zZnbKh/u773AJmLcpGCGLi2lK/6LzKIws+t36
	 t2NQHHfEd2gQ5C28eielJ50J+ngKWUzh/ME7wX2mP8nW9Oqz+dtwbq3D/thI7lhxRYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792996611;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dG1WJnNXSHAqsnREMZfVAhiVISvgrFmJJnxch+zIfVE=;
	b=S08+wteGYcSG0TVppDKpuT5BXJGgbdmt/WHOSdiJA3A+Wn1QttB6bntmeyEVZVlogCIN
	 NJmX/RU4h/u8DnVsPrScoJnu76cU8Rui2TWCUKjVXOnatoabEDY979c0mMjMTSiBQo5hN
	 gXLHJ6u17TOVINv8gX46grkN3m9I8AzrKDBjWTyZ17zgP9hz8ZUypNIJx374KWo0oIiI5
	 ypYv+bXydm1v5YDMIRgVG2Hw3fbHGKBlYvheVNB4SzMbAvDqE/RbuS3q1TaOi/WU1mQck
	 073f5fN98aZea3IyEoCbtAidN/fHciY/0e0oLuaOGc/fvoSfcMJMjeDFlrGxy+JDTyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792996611;
	bh=dG1WJnNXSHAqsnREMZfVAhiVISvgrFmJJnxch+zIfVE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NjmXVISNJDNtK5Rmp+q1YVBuWsHgEagaCkPae5vizw2QTMUvTLJSlTCxnLvxSnuRQ
	 msDgXMiA6JLMZfPLJHi24mozxVmuat4oBeKAq8f/pQAUPlWuF7uD5XEt/KByTwOlrN
	 wjFEYlwj+/PMhefdMeb8Hcl6o/yX/E1rtjcTA14QCxd0oMcR1wWBsc9ePAGS78RNXE
	 nf3pZO9GHJMbdrbV8aUV6GKOb9wTOUuLgrCfiwoZxiWuy+PV1gYjgklymkxJ9UKZI5
	 rWDY2Z5Y5OYG9RETou0kZd70UZXPlgWGbQfL2947Nr+NEEaRWyWIe7Y35knaBnwF/b
	 ju9phlwpNBSEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D57360623;
	Mon, 26 Oct 2026 06:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84324279
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C0080C8E
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otSsdBiWtKRV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 010B980D81
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792996608;
 b=Q26CStI4jU8SgVTkl/SQxZwNW2bJSpO/gcpuxjMCqZetcIGqIzpBwBaHARzmjtbM7/av
 fY9noecyGUQ9cFZp+qzU8DGyvvZPYmFJ6m3D+H1lOucq3zxOdBwD3gkCRQpC7nAPbYu0O
 5lNsRtFRyqlZBNNV62/AAamkXJpdNThlnzdH7COGYcIB3De1pq4pPduSR19aylmio58Uj
 tXpfUlwtCbwPHkpEjChyXqStDTzYllWiHK3yuHhY/MaX5obKeoejOb/7/WO2Z8LOrX4hb
 Qqllbi9K40sIoVgXA59NFM+amOD5LhhFOSAYZfEMm9/MIqSatVdi9s7tPRuyJVpptrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792996608;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=zkT90GmmQMLw609DxgOVacx6JQ434p8p8bSZOxnmKfk=;
 b=WwR27lMMKIqBlOURzyjhPUEafZBpSXzZWMFutZ7P70nlolj4nqdhkaikf2hqE6yGEtXL
 A0hyqvquDWKmcp8hgYLYMp/61RhZWuZsOE3PD8UMNgm8WYn5qZ/HQZEC2h9UyUyaSIQ8h
 b5SFEdNT6UlfMEEo9nEjdc5VAlFq7HCpixh7Ia9WtF9KhKmkfUQil1FV/HsVUDRllUAsx
 tSnyb9y5wRltLM0x/yqyhfWHOOwXl8lmPRNd7z2/htHviYnBvwPjyXf6jnEB6vEg3SDL8
 f8y3Zw02Zm7IytdRlBC/YKxNuYjra+SqLnHVBzIsrLE1irzd0M0AvqZ0JTg7qMUecqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=H35eOnHw; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=H35eOnHw
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 010B980D81
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:36:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=H35eOnHwn26F8K2LgQoRaLy+QMQ/YdbsohKFarFoZoNZMX/Bcg+WfLfsd86qq1OpZeeWQzZqoi91tvmlT6ly2oW9VmWayDgJTgWXqe4RI7UlZP3pKvgTAN4Il2BDMvfcOi9/asrzFMDPsYs1nYtHOh/gE+j15m4O9plVcHc4d43ud3eSJCc7BumxfD38of4vjv0lLvEztbdvbRLoxLjdzxO8fEr1ji5OA7hs72Ml9Qm1SgTLHVNPSR6Daa0o2kUX9+pwr9XMhI9sR1ismMfN8T0hKPxyFNKgiKQrBHYBv7WKBBftYtSbvW7OugbiANIkLqzp/qSmGNnUMyYq8kJZwA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0MvgwzbvsRIa8a/kJcEX1feka2GgdESeaGdF7qrIc70=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -151881027; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 06:36:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xLEJy-00000007xQR-1lzB;
 Mon, 26 Oct 2026 07:36:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 07:36:26 +0100
Message-ID: <20261026063627.1896640-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/rtl_433: bump version to 25.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

And drop now upstreamed patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-Update-for-compat-with-newer-CMake.patch | 25 ---------------
 ...-overflow-in-rfraw-test-data-parsing.patch | 31 -------------------
 package/rtl_433/rtl_433.hash                  |  2 +-
 package/rtl_433/rtl_433.mk                    |  5 +--
 4 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
 delete mode 100644 package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch

diff --git a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
deleted file mode 100644
index 81cb5cd094..0000000000
--- a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 42ac641452aa56afa04f7bad5a55f790ee639852 Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Sun, 30 Mar 2025 12:05:53 +0200
-Subject: [PATCH] build: Update for compat with newer CMake (closes #3245)
-
-Upstream: https://github.com/merbanan/rtl_433/commit/42ac641452aa56afa04f7bad5a55f790ee639852
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08f63eea7..6dc1f7910 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,7 +1,7 @@
- ########################################################################
- # Project setup
- ########################################################################
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 2.6...3.10)
- # Fix behavior of CMAKE_C_STANDARD when targeting macOS.
- if(POLICY CMP0025)
-     cmake_policy(SET CMP0025 NEW)
diff --git a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
deleted file mode 100644
index 6446fea0ab..0000000000
--- a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 25e47f8932f0401392ef1d3c8cc9ed5595bc894a Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Wed, 8 Oct 2025 10:11:15 +0200
-Subject: [PATCH] Fix overflow in rfraw test data parsing (closes #3375)
-
-CVE: CVE-2025-34450
-Upstream: https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/rfraw.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/rfraw.c b/src/rfraw.c
-index 9f4c9780c..71a1c365d 100644
---- a/src/rfraw.c
-+++ b/src/rfraw.c
-@@ -159,9 +159,14 @@ static bool parse_rfraw(pulse_data_t *data, char const **p)
-             data->num_pulses++;
-             pulse_needed = true;
-         }
-+        // abort reading if the pulse data array is full
-+        if (data->num_pulses >= PD_MAX_PULSES) {
-+            break;
-+        }
-     }
-     //data->gap[data->num_pulses - 1] = 3000; // TODO: extend last gap?
- 
-+    // expand reapeats as long as the pulse data array has enough space
-     unsigned pkt_pulses = data->num_pulses - prev_pulses;
-     for (int i = 1; i < repeats && data->num_pulses + pkt_pulses <= PD_MAX_PULSES; ++i) {
-         memcpy(&data->pulse[data->num_pulses], &data->pulse[prev_pulses], pkt_pulses * sizeof (*data->pulse));
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 30f60a82f7..f3b68f6d82 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5a409ea10e6d3d7d4aa5ea91d2d6cc92ebb2d730eb229c7b37ade65458223432  rtl_433-25.02.tar.gz
+sha256  d283ec7a41a02d398e8918b20b65df3bf684cf4478371830662004005dadcdd2  rtl_433-25.12.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index fc6c2bece2..bc5e47dec1 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 25.02
+RTL_433_VERSION = 25.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 RTL_433_CPE_ID_VALID = YES
 
-# 0002-Fix-overflow-in-rfraw-test-data-parsing.patch
-RTL_433_IGNORE_CVES += CVE-2025-34450
-
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
