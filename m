Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2130ECF58E5
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 08:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9329400F1;
	Fri, 20 Sep 2024 08:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7St_ByZNtclI; Fri, 20 Sep 2024 08:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749CA402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749CA402C6;
	Fri, 20 Sep 2024 08:30:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0CF1BF39E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56247402C6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 08:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCbTG1oLMxLa for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 08:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=hehaorui1999@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39716400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39716400F1
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39716400F1
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 08:30:45 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-206bd1c6ccdso18240555ad.3
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 01:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726821043; x=1727425843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYAjOoiULzSPcSKkEMV4aIIaimWVQVCVueOTQb+l9sE=;
 b=BbuP3jhkPS4QLTpsBDk1MWpS7FEEQ2U8qFSugNMl+FWDJo2e3+jg4af18efD4f+WmY
 HVYdIu7hghHfRECUaoQ2b3ejWuVm5AoqAPXxfKKJZTrsYDahwnNfDAmmZ7iWM6AiMjXn
 qgUbJa+HYRnOybbcSLOhDidjOXQa/pAzstKZu6Wj7QqZqSy7fKmO5isIW0b/EBb7GMfa
 p/rGjvXNQywuTYkXpSzfPpnd20Bv2hmzvrm4gVUkGQXrXYGD1SLz2zMHQYzVnmIlPQtW
 5TrYVlImp2dV0gGDj2KDWwHCZb9DHOlRQd151Q1eI8p5uurDr9CamMXdos1QfGLhA53m
 P3BQ==
X-Gm-Message-State: AOJu0Yyd1IkAC5gX5dcZFrNLMeFOwN8GlQC+oamAXhiI48m7LFZkF/1v
 L2W8IGvZPU8IedWQMAa/01aNbkz76goH9eHPP+NZURYUnlSuKv09U/2f3W05kRA=
X-Google-Smtp-Source: AGHT+IFanGpxUdeIeMPLw96XG3cnCKG8bJfbJmCYAIAPYWfmV0GB4ODpfhSARZa+hMRAMEZ955LCvw==
X-Received: by 2002:a17:903:2c8:b0:207:625:cf04 with SMTP id
 d9443c01a7336-208d8565119mr34054715ad.52.1726821043339; 
 Fri, 20 Sep 2024 01:30:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:da8:c800:d70a:0:740:2:113])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207945db10csm90817545ad.53.2024.09.20.01.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 01:30:42 -0700 (PDT)
From: "HE,HAORUI" <hehaorui1999@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 16:30:37 +0800
Message-ID: <20240920083037.958289-1-hehaorui1999@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726821043; x=1727425843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VYAjOoiULzSPcSKkEMV4aIIaimWVQVCVueOTQb+l9sE=;
 b=Xo+l/l7ujagl4FnFyU8xHuyXqp+lCqm9yHp2qFYiehRnCQ1Bi2MccYETEeJsPRjzkW
 EN/3U+Juhh8y6bALmFcZrq9V6gC6aT4K164w5C09drN2Iyu42EHqqWspulheNSD8uLSM
 IRujZXjn2eDZwHqXtoPT67oYivJXT61TcKhBAKnGa59Qp65SXF5rEt5SVp2OpQh4q+h5
 6i6J6tSX+isgU6HgJWOoxSKUMOI4pzlGEf6Nr4IaPFoMes7BvzX0D+NDozilb4fEUyOf
 qr/m0/g+UHnQ2smjmWagASoUSVyTBcki4bMb0pg1YRNUOAt86iTihSMPcZaxE8qO84xQ
 amdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Xo+l/l7u
Subject: [Buildroot] [PATCH] package/openjdk: fix typo in help text of
 openjdk zero
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
Cc: "HE, HAORUI" <hehaorui1999@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: HE,HAORUI <hehaorui1999@gmail.com>
---
 package/openjdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 25d6960ecf..78775370ca 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -148,7 +148,7 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 	select BR2_PACKAGE_LIBFFI
 	help
 	  A non-assembler variant with wide arch support, however
-	  performance is less then client/server.
+	  performance is less than client/server.
 
 	  http://openjdk.java.net/projects/zero
 
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
