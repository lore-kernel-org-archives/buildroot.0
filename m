Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9306C77B6E
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773AA41766;
	Mon, 27 Mar 2023 14:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773AA41766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KY6iIMat-oWK; Mon, 27 Mar 2023 14:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B07408DF;
	Mon, 27 Mar 2023 14:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B07408DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD0A1BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB8540964
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB8540964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05IaJ_rvoDKa for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C3B408DF
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09C3B408DF
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t10so36670778edd.12
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679926269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qKVhK86upWi+BlUbNGyk5z/rlv1HUa2QjdSU7FAGn/Q=;
 b=rPcGhh4VTgK2ay8QqvoHPWj5vnBkuoOqN7OvdawxjP8IoZs7N9zQzjguzYIVzoJMmk
 DHgnehMF4nWAoLa0GRADM3A+pKvzjT3G4aHeNQhL07RKO2hNmYnFkQ6gXa76EGmQLy6e
 4EGe5PSPNV1zoPEVbCukKCkS6gt4cQUeXSwpRIi85Mh4XIrb3KWnsFBcxx/XTX9Txy7l
 zyRNCkpqKbGeDk8WaSveRe5Kbi6Giuk1XsO+61lDINJoOu+B2/jNALNWtoS38XIEVEaf
 3E3U7WPS5QYLAGzyeGRCvnC/zQ1bC7GXiu3K0A8l1FLlf2NjmsFyTJsZQfJSjvbDCRJ6
 x1ew==
X-Gm-Message-State: AAQBX9f42plcYrKYcfuaSe6+v+bitinFm1JgTLfRWYQF8+EaNzDWUZYY
 60yZkQkBEILUPpfUhyDXvr2Ctfcqtk+LmHDE
X-Google-Smtp-Source: AKy350ZUQEZB0zmF3KhROIaoHzHFh0PhyBYhMAVEMt2a9KI7jAVAV+KU7nXdcfwfKb4J9DF5xUGb0w==
X-Received: by 2002:a17:906:b159:b0:93d:b767:9fea with SMTP id
 bt25-20020a170906b15900b0093db7679feamr11032199ejb.31.1679926268877; 
 Mon, 27 Mar 2023 07:11:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:22fc:f856:23e6:784b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a50a402000000b004c4eed3fe20sm14824386edb.5.2023.03.27.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 07:11:08 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:10:57 +0200
Message-Id: <20230327141058.3669326-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
References: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679926269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKVhK86upWi+BlUbNGyk5z/rlv1HUa2QjdSU7FAGn/Q=;
 b=aLtw9XX/SNJ+Joz//ryUlHRnfOzEbe1eE4t+/AwNcvZWR1n9mxG814Mya+Qt0mQMSx
 lpYNJ3mJGzA/xZ/SiRk9dHg+Vcxx+AOY2kcE1WjE0YOzlJwE/LIZcUfA9be2sDPH0IBd
 7DtuAAy17i0po52kUZYXd/ZbOcchgxu1JJRDwZHCbWoHBUnen5QdoT/1j+Ub/TJCZcYS
 5hJv1iCbQQ2CQyfatShX1tRuAgqePd10ripVFMQThowBHT4n0PhUUhCzy7XywxRi1INY
 lK4atH0VbWfHk46Oil4HR/OUEg7En7x9GYa8rdHjdOuqFB/4sjU1tecTA3+uIQHiI/hC
 K9EQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aLtw9XX/
Subject: [Buildroot] [PATCH 3/4] package/fluent-bit: fix wasm uClibc support
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream:

https://github.com/bytecodealliance/wasm-micro-runtime/pull/2069

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...b-wasm-fix-POLL-RD-WR-NORM-in-uClibc.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/fluent-bit/0004-lib-wasm-fix-POLL-RD-WR-NORM-in-uClibc.patch

diff --git a/package/fluent-bit/0004-lib-wasm-fix-POLL-RD-WR-NORM-in-uClibc.patch b/package/fluent-bit/0004-lib-wasm-fix-POLL-RD-WR-NORM-in-uClibc.patch
new file mode 100644
index 0000000000..91a6b8adc2
--- /dev/null
+++ b/package/fluent-bit/0004-lib-wasm-fix-POLL-RD-WR-NORM-in-uClibc.patch
@@ -0,0 +1,47 @@
+From 286a59000d05969d00d908f187bc311a4f5b2a52 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 27 Mar 2023 15:01:49 +0200
+Subject: [PATCH] lib: wasm: fix POLL{RD,WR}NORM in uClibc
+
+Not defined in uClibc, so replace them with the equivalent POLL{OUT,IN}.
+
+https://www.man7.org/linux/man-pages/man2/poll.2.html
+
+       POLLWRNORM
+              Equivalent to POLLOUT.
+
+       POLLRDNORM
+              Equivalent to POLLIN.
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ .../libc-wasi/sandboxed-system-primitives/src/posix.c       | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c b/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c
+index e43ba8ce0..b0e92c3a8 100644
+--- a/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c
++++ b/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c
+@@ -2644,8 +2644,8 @@ wasmtime_ssp_poll_oneoff(
+                     pfds[i] = (struct pollfd){
+                         .fd = fd_number(fos[i]),
+                         .events = s->u.type == __WASI_EVENTTYPE_FD_READ
+-                                      ? POLLRDNORM
+-                                      : POLLWRNORM,
++                                      ? POLLIN
++                                      : POLLOUT,
+                     };
+                 }
+                 else {
+@@ -2756,7 +2756,7 @@ wasmtime_ssp_poll_oneoff(
+                             __WASI_EVENT_FD_READWRITE_HANGUP,
+                     };
+                 }
+-                else if ((pfds[i].revents & (POLLRDNORM | POLLWRNORM)) != 0) {
++                else if ((pfds[i].revents & (POLLIN | POLLOUT)) != 0) {
+                     // Read or write possible.
+                     out[(*nevents)++] = (__wasi_event_t){
+                         .userdata = in[i].userdata,
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
