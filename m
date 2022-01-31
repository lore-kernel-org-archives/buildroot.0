Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC644C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 02:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565F783F6E;
	Mon, 31 Jan 2022 02:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTeaucpLT0Ne; Mon, 31 Jan 2022 02:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBDB83F13;
	Mon, 31 Jan 2022 02:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDF381BF471
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E449483F13
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8VRJZwJlcSO for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 02:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B361F83F0B
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 02:45:36 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t199so7603666oie.10
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 18:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0yvDWvsJ4kF7rSJaL+q7bmGij0M1xwcHoNVTmhbvqU=;
 b=Cgh7S+wNsdwnU5Riw0QwPNo7RWGsahL5vdYJscVoh3tlrntGqGyvP8R8+OsKOiuYjc
 WhKeIrAc/47OI80k+oKwmvwe6sRfOe+YTsuGV/V1zpJkYMCpYgRJug+1N1kLLWY90587
 u3KqhkevzWzI7D39bKhfHfWgYBsqKMaEFPQRSASGqt5Zi3TtgAG34JdAsBuIKCuPC95j
 PAdyntsr54cwOA0qxoqE321ICEAW0jbxBSroU42UapzY+lESs6zcYs6h7AixJJ/mu8kd
 7DbryHFzJVhOuJuLP6yZP6CKbEL11dRQwM6Quq0bnywHTpzT9uUid6UkvjgyX64HMGeE
 ge/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0yvDWvsJ4kF7rSJaL+q7bmGij0M1xwcHoNVTmhbvqU=;
 b=HziIt/MixCb7jklwt8s7hBH8jysegzhgYhpVLRCtxT5pml1sY+2UjhqYNQILbSeU/w
 ZgPxyA0uCSgIvbkF2EVqZ/D+RWjjQTAKQBf2up5PsqXKD7uEeXeDaCuLfRLLQFkoG/Yd
 ms8ZMJCsDw9h5v8Ihyyg4UcLODY6qE+a9MOkfJ+OiNvzB4IXG5JpAY4dRTQIFLihxSow
 JoEOJtgriD9MD7UPguDHUcnhuGKxlk7rPlipmAHOfZglA1l7egDs8iYFC4wSezsQjyo4
 TbMl20nM6fPfp9RARaAC8V2lsENQEO6yXIzj4sDfbJueyGm9CDVTNb1FovifDvb3p6Hb
 abxg==
X-Gm-Message-State: AOAM531au/Zm0DcWPZRCu+Ur531vxu8176r+7UW/if17+ZMePFtF9a57
 +THic1ixQV8EEV04LCqGNeojYaWpH9U=
X-Google-Smtp-Source: ABdhPJw614tWpBw1I+A5JdvoXMTz4vfEHT6imfvIchuBWIePv753/KJCLOAY+PGY72MVmjHRaGrSsg==
X-Received: by 2002:a05:6808:170d:: with SMTP id
 bc13mr17321273oib.175.1643597135700; 
 Sun, 30 Jan 2022 18:45:35 -0800 (PST)
Received: from localhost.localdomain ([201.37.117.8])
 by smtp.gmail.com with ESMTPSA id v4sm10363585oou.1.2022.01.30.18.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 18:45:35 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 23:44:50 -0300
Message-Id: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/thermald: update URL in the docs
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Old project homepage was removed, so switch to github, already in use to
download the sources.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
This commit can be backported to maintenance branches
---
 package/thermald/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index 6d74a164b6..e5e15b9b8d 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_THERMALD
 	  reaches a certain threshold, the Linux daemon activates
 	  various cooling methods to try to cool the system.
 
-	  https://01.org/linux-thermal-daemon
+	  https://github.com/intel/thermal_daemon
 
 comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
