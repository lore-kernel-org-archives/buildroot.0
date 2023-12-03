Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F0C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 04:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F22F81E94;
	Sun,  3 Dec 2023 04:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F22F81E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUiIay94tyU4; Sun,  3 Dec 2023 04:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104A181EA0;
	Sun,  3 Dec 2023 04:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104A181EA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9601BF2B9
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 103C381E99
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 103C381E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vrxex-TWLZRE for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 04:19:00 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9275981E94
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 04:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9275981E94
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2839b922c18so2776482a91.1
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 20:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701577139; x=1702181939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TgMjaBih8t+B2Fp2Lyi4vDJZJcuYvNyLjPaOq/uVn3I=;
 b=ngltuiQgeVOJXsfTLI6IYcbtRUMmraDKM/rOxEZ2BrpISYdiuqnACoLL+io2cIgaNq
 QUnuQGFxVYayTeWjazvP9T6L+i4DcHwxOqzbivj6tlgJV9tQIZTcwz3Iqfx9zJAQZdK0
 OQxvIcSQebw6LzAcT4/CyOtwYl32OOvY0J+s7KV7KgNzYeWzTUvNCctYa2RoP7Cl03t/
 Z+YhBphZMe1dcWZh6j6MgwKETs2Ej9+ThrYGgAvYzySEPaEXBEswBPio05yXlJKCzTQL
 crxfJ/1wezDHOI+g9E2ekFRyIxIpWGA/6lMwZdZLebJSu27e9Vg1uo3q3dIzhZduIztT
 1cmg==
X-Gm-Message-State: AOJu0YwdQzM+Dua30fps3PQFzwMIWQEujW0JwS8DkBozAYnBmsnNOdPC
 aj0kcbmfa3DsUoKRgHV2js/kO2mFXyZrgJmHD+M=
X-Google-Smtp-Source: AGHT+IGSWxJ/Uln1C3+Wc0aVIJQ7dytoCLkpHCfkc6SZC9xL+NPnOfUo0jgY7gWv7Nw+deZsrc7qkg==
X-Received: by 2002:a17:902:a706:b0:1d0:609e:f6dc with SMTP id
 w6-20020a170902a70600b001d0609ef6dcmr704918plq.1.1701577139093; 
 Sat, 02 Dec 2023 20:18:59 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001cfc6388b5dsm5874084plx.260.2023.12.02.20.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 20:18:58 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 21:18:34 -0700
Message-ID: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701577139; x=1702181939;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TgMjaBih8t+B2Fp2Lyi4vDJZJcuYvNyLjPaOq/uVn3I=;
 b=NrF0ANqaG4tEIho3KipSCxwJHKsMZNBUE5Iw8qTFPw1Vmx/SRwjyZH8mLYg5xypB4o
 lcCbldj9fG5xGXkac1K/SdViIt3+/ymr2mOmPkLV+l6g/UjvmxJ/oNqTLMk7/QZIDKr6
 AbLQ6P3aMlx2O6yORHDoHzqodQ3CJu4o/sUS8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NrF0ANqa
Subject: [Buildroot] [PATCH 1/6] package/google-breakpad/gen-syms.sh: fix
 shellcheck warnings
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes warning SC2068

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/google-breakpad/gen-syms.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
index 2bc0afafb6..4bc020ec19 100755
--- a/package/google-breakpad/gen-syms.sh
+++ b/package/google-breakpad/gen-syms.sh
@@ -14,7 +14,7 @@ error() {
     exit 1
 }
 
-for FILE in ${@}; do
+for FILE in "${@}"; do
     f="${TARGET_DIR}${FILE}"
     if [ ! -e "${f}" ]; then
         error "%s: No such file or directory\n" "${FILE}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
