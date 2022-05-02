Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198F8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE47D60BFF;
	Mon,  2 May 2022 08:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvH3fnngf23W; Mon,  2 May 2022 08:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E89605A1;
	Mon,  2 May 2022 08:27:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60C911BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CDB640241
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnunizZVfXYk for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8506B4029B
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:27:07 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 12so14544209oix.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEmwfJ7PbI0/PIAjbxXzA0EV5TH6B+vACuH7YEkAIAw=;
 b=SgveDNcQ4usQyLyDYTjAZMhAsqWTLrS/t7OoD7sDHH0dLfFekwDd8uGeyyq0mm5xKd
 11LiNtNyeTd/KZg/CSyCGyg6crf3NAo7bax/rS0DLa2s5IYSL/NEz+kFrxkNbOD4HyIa
 FuhPUvM8MnJqYfiHGtQJMmqqdlGFzmrIycvc6mEAEee+A4M/z6+5hmEq4GRXzc3ytu93
 nHjtmwQFKsQ02WwQ8fX/vUiLuOHtDAPEVBjpKOhBOEKolQ7A7oCQwI821Sft6lWs3x9+
 3E5znYYZd6qL+PKQbwlX47BoQXxNAXUkS8CGCK8pzDw+Te/S1n9q9nzEA6UN5cU7ltLF
 JXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEmwfJ7PbI0/PIAjbxXzA0EV5TH6B+vACuH7YEkAIAw=;
 b=o2nH4EMqyH6OgQGTtShdnD1LPNsU7tV+EH1cns4CNy4SUE1qeoSfFS4xC/Cl5jbEql
 kNW3D1Gvk77gSDI6jqczoQEzf7eJvExo0V9poAVcqe7c3NMQ6rj6qORdd+0b3fS35B1G
 JbfZ/8+RjmUMqOQmXIbi6zqi2Ng0OMLfmNCGvka73qckg/bA7UvNAO5c4fcsA0HfW6yc
 BRfLJdDZdBStrxuYurtvEn2EhS+aC+xRtz03/mrH9VC2rST6t5Vt++sCFIY05sflycxa
 /ZRczM03C+e6HdD2bkZZ+CcHyr3a+Et+4pJX1JwtVu+CNo7eNRduAlo//mPK+O3lilfH
 Wyag==
X-Gm-Message-State: AOAM532aFGzahaNeuGXdz97Ukk/Gf+xOmT1kXmikJdgLpclTbkVzf+TL
 UB3VDy9lpQm6DLrK4O6nrl8HsQUQBIU=
X-Google-Smtp-Source: ABdhPJwD2smdBeoRu15qeBnGImrICj9RA2+iowke+tjECRB4MnM2Zm3OADmlCm3eQL490HvStXW9AA==
X-Received: by 2002:a05:6808:3006:b0:2ec:8fcb:1d4a with SMTP id
 ay6-20020a056808300600b002ec8fcb1d4amr6595287oib.162.1651480026399; 
 Mon, 02 May 2022 01:27:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 m17-20020a9d7e91000000b006060322126csm662379otp.60.2022.05.02.01.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:27:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 02:26:56 -0600
Message-Id: <20220502082656.461316-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502082656.461316-1-james.hilliard1@gmail.com>
References: <20220502082656.461316-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: do not allow selecting RTAI for
 latest/cip kernels
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RTAI is only supported on very specific kernel versions that are
different from the latest/cip kernel versions, so we should not
allow selecting RTAI when building with latest/cip kernels.

Fixes:
 - http://autobuild.buildroot.net/results/412/412492e19b41f95ff2445df6b7564cb0fa48873b
 - http://autobuild.buildroot.net/results/32c/32c9ffd8e965eb690ca0b0471e9c1cc16bb2fa66
 - http://autobuild.buildroot.net/results/0bc/0bc178dcb11aa23e5f8bf75c958d8a56c6c38964

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/Config.ext.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 734a52a533..5b968b0bcb 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -48,6 +48,9 @@ comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
+	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	select BR2_PACKAGE_RTAI
 	help
 	  RTAI Kernel part.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
