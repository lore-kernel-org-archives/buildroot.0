Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73695C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 22:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0429E42529;
	Thu, 19 May 2022 22:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EjNyQoYgXlZ; Thu, 19 May 2022 22:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B368B4251D;
	Thu, 19 May 2022 22:08:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2413F1BF59C
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1205D401D2
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FJE3Dq8EBXM for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 22:08:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FA8F4012B
 for <buildroot@buildroot.org>; Thu, 19 May 2022 22:08:00 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v10so6178790pgl.11
 for <buildroot@buildroot.org>; Thu, 19 May 2022 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dB0uEOTAaTNFXd5gBFNl59IaJKISwT+f3avI6x15twc=;
 b=nK4DLXvSRbjB15Fl/fsl8tqG6emwKGo6UGBYaxvAc9Skl9QFsXqZeqkiK4p9GLvER/
 Ru8w3KFl19olJ7xVwZ56s6dyAN1eWGH3iQ7yYoosI+ZHrnNvGSQpTd+WZytSBhmpCGce
 p0jUg/pHqkaWely0MZijOqNlJD9i16E5FUhP7ZdPp3znWt6/6XGL+nBpWNkRrUUjkFHC
 pdxlevTqfUcS5ms4QBIVzJk+VVGXxpEhCSA+3Ob/dgdiw3m6ElUATG60889X6czInMQA
 af5XBVlHMWvzlKXH0e72bvEwQTB5otHgFwx63DEDDTMZSHYLTcyz5XuMOvlZy6ElJRp7
 0fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dB0uEOTAaTNFXd5gBFNl59IaJKISwT+f3avI6x15twc=;
 b=S40QpsfOMj33PHVviBNm3b3zRkwhhaieK8CaFnhyYO+TLcG3GP5aAlVxj9BRFGVVM/
 R+S0U18r2BN9ho/2viAI7jo9v9SPC+rNcwBNW/KlL4u3oGezV93AiepsKGzuMutB7XrY
 WcKlNEzFu+bXHNtgUkrWL2K968judnqWV7Ho7BsilypLopS71jObqTSXVv/o6UATR18y
 yRni++nyKsEoYlKRU97+4KG2jDnjJ1j6Rky2NtUM/o6fqWcNyiRFInwFvahQML7qexWd
 805J38HUQgV1XYw0CMTGhnqInL5orAnFcZl/2RxZc0gKeklI6m1NSY7swQR9uvC2ZwSi
 jSLg==
X-Gm-Message-State: AOAM532sZz9UAd2DLYW+QaHd+q1ZIX6S8om3bPSmqA8gKPskN6ZfWLfI
 0ZeCox904VHxB0rIii+ynsd4pYGPS8k=
X-Google-Smtp-Source: ABdhPJzBFd414bF+RlLZaUBUpbAvgNKes3oRvi9dGiY3QNm2S5XP5a0ygFkwt9OeeK79Qc/q7lPwSA==
X-Received: by 2002:a63:5c02:0:b0:3f6:4b48:d5e7 with SMTP id
 q2-20020a635c02000000b003f64b48d5e7mr3259881pgb.229.1652998079053; 
 Thu, 19 May 2022 15:07:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b00161455d8029sm4290075plk.12.2022.05.19.15.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 15:07:58 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 15:07:46 -0700
Message-Id: <20220519220747.455528-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/cpulimit: Backport a fix for an
 infrequent crash
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport the fix submitted from this pull request:

https://github.com/opsengine/cpulimit/pull/61

to fix an infrequent crash.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../0003-Fix-an-infrequent-crash.patch        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/cpulimit/0003-Fix-an-infrequent-crash.patch

diff --git a/package/cpulimit/0003-Fix-an-infrequent-crash.patch b/package/cpulimit/0003-Fix-an-infrequent-crash.patch
new file mode 100644
index 000000000000..a19fb6e304d4
--- /dev/null
+++ b/package/cpulimit/0003-Fix-an-infrequent-crash.patch
@@ -0,0 +1,26 @@
+From 512998f967a9dab5e98010e1043985fc855d9f4e Mon Sep 17 00:00:00 2001
+From: Pavel Timofeev <timp87@gmail.com>
+Date: Thu, 14 Jul 2016 13:50:35 +0300
+Subject: [PATCH] Fix an infrequent crash
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/61]
+---
+ src/process_iterator_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/process_iterator_linux.c b/src/process_iterator_linux.c
+index c8cdd07adcbe..93b44bab1755 100644
+--- a/src/process_iterator_linux.c
++++ b/src/process_iterator_linux.c
+@@ -98,6 +98,7 @@ static int read_process_info(pid_t pid, struct process *p)
+ 	//read command line
+ 	sprintf(exefile,"/proc/%d/cmdline", p->pid);
+ 	fd = fopen(exefile, "r");
++	if (fd==NULL) return -1;
+ 	if (fgets(buffer, sizeof(buffer), fd)==NULL) {
+ 		fclose(fd);
+ 		return -1;
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
