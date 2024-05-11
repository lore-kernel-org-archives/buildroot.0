Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C538AC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8167161656;
	Sat, 11 May 2024 06:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWPaxiN6-UBB; Sat, 11 May 2024 06:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73056615E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73056615E9;
	Sat, 11 May 2024 06:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A92FF1BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94F444259D
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuH-VzaATPuQ for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDDEC4257C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDDEC4257C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDDEC4257C
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:22:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41fc2f7fbb5so14080525e9.1
 for <buildroot@buildroot.org>; Fri, 10 May 2024 23:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715408519; x=1716013319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASAxpmkOSqGf7RasqwTF3EG3xRJzsV0V+QaG6pFvDrM=;
 b=frESJBV+FgsHW4mYW1Inj2bToBMOY5k7LhoAAlRv3ktuaboGHe45nFrqSocMqFXfz/
 oJpApyr7TixMDN4lERU92oOkU5IlTaNZfLzdVBxuNiW2r1RR0NDTgWdvuL2JziugJA1i
 iEoJIO6MAuVm8joQcxiS/Zu1zt5t+JSVd4ON03I+WA8290tXMUlcm8wmFmB1TT8Qhs3H
 +/62uJvr3sSSA+aIkUyx8zzo8wjxYAntriIHQrgmVlJdMsz0fr5wEf3cEEoFZcmcpsQP
 SDEcWt5/Alz39NLFDTK0r1JVuJeYOyKER9xN+gB+RUFExCuW0tKHGK95tYeO6xWJpbMZ
 mMTQ==
X-Gm-Message-State: AOJu0Yw2QtnZwT/0P9up16Xi7Cl/Mm+uXVUmwxA29QVrm2PRh/Q94fJb
 LnxrnNEzwzWQXD5G4CqUIz+T8Cm/Nxw7LWQoivwXf5NCCrMrddU6ROFhCg==
X-Google-Smtp-Source: AGHT+IEAJMgaxp5J06kxNVGI4NnSbyqYK5Ncwd330mvsq2CjhXVA1LYJXcm/3WlRw8toA5V27963iA==
X-Received: by 2002:adf:ff8c:0:b0:34c:e0d6:bea6 with SMTP id
 ffacd0b85a97d-35049bbf670mr4131718f8f.29.1715408518706; 
 Fri, 10 May 2024 23:21:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad0casm6256103f8f.86.2024.05.10.23.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 23:21:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:21:56 +0200
Message-ID: <20240511062156.145055-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715408519; x=1716013319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ASAxpmkOSqGf7RasqwTF3EG3xRJzsV0V+QaG6pFvDrM=;
 b=nbsZVyTUEki+rGxdFvr2Ls8mnFQYsreooZcqTgQQ7uip/p2OkLrHtojDSh4hNbBB32
 gWHnM0kY7umSAgsLDilCXN9VjNKe0TZ3o3A2lVCHjNzIoOVl+KMrRCpZBJQeem+U4mNL
 PGFmPNoXSNmFcMoDpAiHhCc0LApVmU3Q1wGiUgNZNNomLhcEmFxqtvYT154n2a5UUFTW
 7uhDEBSImwQeUpjkpOoLmK4ls4gMPhKixm77Gp9sMYvZYQh9C05X63mS/OSNA5Z9mNCa
 pqaJdCM0UZSeYYTC7OjWw5EW2C4wMLJxCcjHTjOkd98qo6dBEQ4HoRDS6pLrd8pnwf82
 nmPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nbsZVyTU
Subject: [Buildroot] [PATCH 1/1] package/ledmon: fix musl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 1.0.0
in commit b3819b761f4a06bc75fe33b785e5ff2cecc5d211 and
https://github.com/intel/ledmon/commit/bcb90426a156fcb3147b5722ed78ac8cf26f2976:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'

Fixes: b3819b761f4a06bc75fe33b785e5ff2cecc5d211
 - http://autobuild.buildroot.org/results/d535e03f6ee0f43ecea34fb29ea148a4cdc01169

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...l-ledctl.c-replace-on_exit-by-atexit.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch

diff --git a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
new file mode 100644
index 0000000000..4e1536df4f
--- /dev/null
+++ b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
@@ -0,0 +1,40 @@
+From ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 9 May 2024 10:04:38 +0200
+Subject: [PATCH] ledctl: replace on_exit() by atexit()
+
+Replace on_exit() by atexit() to avoid the following musl build failure
+raised since bcb9042 ("ledctl: Remove enum ledctl_status_code_t")
+which partially reverted f08dd2c ("Fix build with Musl libc (#139)")
+
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
+ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/intel/ledmon/commit/ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401
+---
+ src/ledctl/ledctl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
+index 231253dc..95db2d86 100644
+--- a/src/ledctl/ledctl.c
++++ b/src/ledctl/ledctl.c
+@@ -230,7 +230,7 @@ static void ibpi_state_fini(struct ibpi_state *p)
+  *
+  * @return The function does not return a value.
+  */
+-static void _ledctl_fini(int _i, void *_arg)
++static void _ledctl_fini(void)
+ {
+ 	led_free(ctx);
+ 	list_erase(&ibpi_list);
+@@ -1101,7 +1101,7 @@ int main(int argc, char *argv[])
+ 	if (status != LED_STATUS_SUCCESS)
+ 		return status;
+ 
+-	if (on_exit(_ledctl_fini, progname))
++	if (atexit(_ledctl_fini))
+ 		exit(LED_STATUS_ONEXIT_ERROR);
+ 
+ 	status = _read_shared_conf();
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
