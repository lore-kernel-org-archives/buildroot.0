Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E8606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 23:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UYYRxWD1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DzoXaay1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F1280CF0;
	Sat,  7 Nov 2026 23:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhV0-Vvix2FJ; Sat,  7 Nov 2026 23:55:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 372F880C94
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794095744;
	b=Jj7SlkW8/6hKkCuoCMLamGZpektp8kC5xicKuoFBX8MfAIwacjhLq5+HLgJL/kGIAum5
	 A6iKgFrBGQ6WI+czZSgSctDQ+qqxoEqAtpyH8pnF5kWsRXNi2WTW6KhETarvpIT0Bw1A8
	 k1EygqO01xRpvsOX/ZCbzAM6HLq4idIbkLu/8ezAvN6D8bBIdAy9GsTxkgtNs8Ecj84/S
	 SXi3VlPWS52anw98NUiWxbnYymArbccwygSwPAa7bLkxXngyfUsvwhWfbIMV5d2XPkIS3
	 RQG2yXAdrPgt7Q2x8nVFo1bZpW7ZMDZO0LSijQa36BDv8jkKEixFrbPjm/dAIT/QI7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794095744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gB9N6AnZBEVYBFWSAZ/RqH22+Bc082Hn6iRqlyCSMrI=;
	b=gPfsl99dGSrSoDNwQsEGHh/YPMGxBz/wxNAOByr3iy8Vdug2m1CeB2tujacHp4jXuXqt
	 tNfXIhX/ahGdbeMYbKwDOFVKPX8OY7cE3thdMatFKckV9+74v4Ra8FcjNjvldQCz2JTI5
	 byKOhkyaNjQ1Gjx6loNwJwKG3ktYL1JRjPl7CAn8d9fYXdygUfFe0AycIKw85iCNzc7GM
	 j3H6+XzqEcUYItqUAYXj2vdOrdEBD/Vp6afRpdhecha+/EQll4XlkzUzdqiJl26m0mWD2
	 Dly9hPYsoy8YcABCerNbE+nrZM2LusjYcQTHa8/YvgVFTK+PN+me+yMyWKA+PAic55g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794095744;
	bh=gB9N6AnZBEVYBFWSAZ/RqH22+Bc082Hn6iRqlyCSMrI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYYRxWD1zo2gbSlW5abPbIr+f2vA9dBCgeHsCeUUdaAMKxGyPmC5JjIxPPMol+I6+
	 CLMs8xXEgyPxdjfzoEF16VNtRWfEXZHPrS7mBAJAL4IEBNbbcKnjeymF5L3MiY6pJI
	 Ze50ZLQD5BeQC/A4vA19tO8WMpXbbaiwC9mYSTSZtJ1N/ZY3srzbdPvaruNke/IEFd
	 vBNsJSCqXba16xAhVzs7iAj45XiF9KaHi+l3EeSNInp2flaWlkzsa7aKSyJRjNDLSq
	 Q7uyDLXJPEENp/UPD4QMCXoM4IYRfflvmoc4rjJ48h4NVkJZrHdfR8ldlMPuMICDOu
	 wHo0xSHP+fBFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 372F880C94;
	Sat,  7 Nov 2026 23:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F673AD
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 23:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ADF260618
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 23:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6qusJ4MdeH6 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 23:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2629160609
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=DzoXaay1
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2629160609
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 23:55:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b561b60b78so1154925a12.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 15:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794095739; x=1794700539; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0mj+1Wfl8uVJKi5X5/QiTI+dPa6x0PiCbMutdECKjfU=;
 b=DzoXaay1gjimveep5Ae6FCxAbFaHZf65qo9/njDVejltfdVn7LkXbUpZhv+iY8/GhB
 I2aUFUsYia3JjUEmaBSGyAthemXNNeBU1yXs30rDScNsWH+cneqlRVHdlZkEDD1f00Bm
 5/mlmIclWMeiZIJ2EON52SWVz1hy7CK2uBmYXvm3KbFa0dGWZs1lqgT5gX9IwhfiENco
 7B8elgJK7ibC+CkEMd35OkfbOHw9KQQEDRed9tgz/L7HAYYf//5KqhaEBh3+vBAYj58Q
 SMLn8+tHHNe8Dkf9+iSJGdrG285PpfFqF2fhBFS4ssWd4GWuURD+hG5ePkrV43ZNxwNv
 IfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794095739; x=1794700539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0mj+1Wfl8uVJKi5X5/QiTI+dPa6x0PiCbMutdECKjfU=;
 b=TK38h0yoqwBgPhwrDKvkFaR6UcWEk9NraNPHmrBpK5D+rXyRuZFUyybXmVR3jRsp0A
 JRGNpCI0rOap9yyCfUNXp+dkfc1Mqq5jrPI0Tsa7GyKjYu46q0MvzvXCRJB9UwYjlDte
 v2o/KyPixYWNJ799A53/SBy3FygjyCwhc4hBrN9gPbXKrfH26NUHHzzLAT2DOcYqpu0e
 FBEUhgRxOrB39jc6TBIHGwA+B9vVfw0rS+uPUdnSFMGXpdazMFhuB/gHV7hVznSrMpF0
 YEpU5Gmf5MG4hZui/saSsTCXgRjPQ+4pRdNEwIHwHqZ6Vr6w/FVKgPeSJMqtn7pVpKPa
 Yo2A==
X-Gm-Message-State: APuU4Z8BjyqSnbYfkNHPyx8Ja2PnFrpKB5SN4NiaSZ/53OUfsZX9UNMn
 u4BlMxnXfsHLUIy74DGPbazO65Iy0mqWS0G7lM+CFyGyO97hAPP5TZk7yY5e5Q==
X-Gm-Gg: AYBFou38JtwhQxzLyGlbcT4wGBkLQF1jCtj8Qg1GU+rc+BXGanygjMgq4ercW5lS7xk
 43xUydm4JXOFo3ObowtK7YB+6znOvRuSY+De5basY0aBtG+VSsJ9DQrmVFVW/ojCzutXtcMFKhT
 /VZFYFw4q4D49n8FXYCCflO0GLL0S1Gst54cOlWuh0B9hnq2nR545uQZQk9jf8ZnDbaqaq0trCp
 Q3CLEKdBaB3zop14qNHgmy5W+NykYlAAz+U71zgispULUF6xHm/aD/0Fp7MyhBbdrv3tItxu/8v
 cPIA/kaRiuOT8UeG2VumdVSOr4hEjEp8+Tsnd0T0C6woPOCdBRPV57SBwDMBhP3ijUbmRADW1ok
 16kuf3NETbLWERFKLTjBY9xpVdo+v2Po4E1mNRGBySMoz4k4seTTZIDESJMuWxjbqmApsPo8KWr
 bJS/po0rVDQRlLBa9lhPA+RvjnXiS3o/we1iQioS6UpjPbbulM4ewrHVEF1MxUK0kzARwNtR3TI
 If4siln+/Kc4/OmHeHlZ4eEhUP6j2OXe6c4akMk9dVsnJDk5ZwLP8gctlmYhdlHJkd084qKabVN
 3FLyNv9ABlUt5NdRemwFD68o3imcKebeQ3cXa506WCtfOsIkzBTk+0viH7zZSboayNmcas79IUS
 wZHfgWlMy
X-Received: by 2002:a05:6402:540c:b0:6b1:e072:763b with SMTP id
 4fb4d7f45d1cf-6b6fb939315mr2102382a12.5.1794095738406; 
 Sat, 07 Nov 2026 15:55:38 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b721eedfd7sm97998a12.31.2026.11.07.15.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 15:55:37 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Nov 2026 00:55:37 +0100
Message-Id: <20261107235537.2546061-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ed: bump to version 1.22.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes in 1.22.6 (released 2026-08-20):
- Some changes have been made to the code to pacify gcc's static
  analyzer.
- 'regex(7)' has been added to the --help output and to section
  'SEE ALSO' in the man page.
- It has been documented in the manual that the cut buffer is deleted
  when a new file is read with 'e' or 'E'.
- It has been documented in the manual that using a regular expression
  inside the command-list of a global command may cause the "last
  regular expression processed" to differ between the first and
  subsequent executions of the command-list.

https://lists.gnu.org/archive/html/bug-ed/2026-08/msg00003.html

Tested using:
- utils/test-pkg -a -p ed

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 39a6ff5f22..acd4896fdb 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html
-sha256  56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc  ed-1.22.5.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2026-08/msg00003.html
+sha256  3f33b22135219c39c3c695f7b7171c2567d3e2a17c798c0a90607320cbb268f2  ed-1.22.6.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 6e1d5a3d05..32638ae081 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.5
+ED_VERSION = 1.22.6
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
