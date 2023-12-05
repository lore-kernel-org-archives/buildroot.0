Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7428C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 23:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339B94190E;
	Tue,  5 Dec 2023 23:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 339B94190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScGjBvagKX37; Tue,  5 Dec 2023 23:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DC6416C0;
	Tue,  5 Dec 2023 23:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DC6416C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03BA1BF279
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFBD04031F
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBD04031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rns0OkEf5McE for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 23:59:30 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4466400E4
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 23:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4466400E4
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ce477b6298so1908138b3a.1
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 15:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701820768; x=1702425568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gdMiCMTCeGGnqUAywG17tqhf3pucCHmYLlxEfd03FiU=;
 b=tNNDedYWmemcVMv3c2w6yYEYV05RdvGEir5gxtdUAWnvhGmDbuAsXiDQdlKdwpuzD8
 62aLYymnFCu+yE5KypAsSm/xWzQ4rTX+5HdRPtaEtehXe6Gjzn1yyw2un8lm4JPUeho5
 GFuYjnsdovTXNqzUNKb1wDWyxQzx38Kzpe8I026H2/46xu4cGLjTs18cU775Y9UM7NSu
 5V4/Ac9duigXiZ9wnbnTmSS0U0fIjPrEez7XMyVLpPSU6Y0/XUdGuRfoYp1oaA4OEpmb
 Q407dGVIc0I7rSJWUv1fnpBjo7IM7iy/3sSPTC42Md6YIEfNEPsTjN6x6/dTnIGdGdFu
 rtSg==
X-Gm-Message-State: AOJu0YyuSKzxvF7yv6sTof+zGzlqUtqWzaCbZZylH8bPNKcPIRfhm1xX
 fqXHm/sKXBPc5MdimPvX+d2/Napl56xF7Y3UaSc=
X-Google-Smtp-Source: AGHT+IEKb5/ss3gaFWbrJUlPkg87ELnCaol/D8n6FR+sr/KGzLd8ENs9FFKcQG9jSOYgXuxw7bh1xw==
X-Received: by 2002:a05:6a20:9410:b0:18b:82cb:4092 with SMTP id
 hl16-20020a056a20941000b0018b82cb4092mr5933pzb.11.1701820768184; 
 Tue, 05 Dec 2023 15:59:28 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ab8d00b001cc20dd8825sm7246369plr.213.2023.12.05.15.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 15:59:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 16:59:16 -0700
Message-ID: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701820768; x=1702425568;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gdMiCMTCeGGnqUAywG17tqhf3pucCHmYLlxEfd03FiU=;
 b=Or0cQqeN1QCM/+k3sdSmmcZHAM5VVWpbtGTH2NLXoqggp6iRGXkixdsDWpmZzrONqN
 ybHgkix7gRuoNNTtVIdmr9Izfm+WsdZhF4o277rGpwK+zx5svInQ69EH6ycy+UKoJmXv
 w7G8Gjx+jRKm7vv4leu8mjUrUTt+hzifj0ULY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Or0cQqeN
Subject: [Buildroot] [PATCH 0/3] package/giflib security fixes
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Here are three patches that fix several vulnerabilities in the giflib project.
Sadly it seems like the giflib project has been abandoned, as these
vulnerabilities are ignored on sourceforge.

Adam Duskett (3):
  package/giflib/0002-Fix-CVE-2022-28506.patch: New security patch
  package/giflib/0003-Fix-CVE-2023-39742.patch: New security patch
  package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch:
    New security patch

 package/giflib/0002-Fix-CVE-2022-28506.patch  | 34 +++++++++++
 package/giflib/0003-Fix-CVE-2023-39742.patch  | 36 +++++++++++
 ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 package/giflib/0002-Fix-CVE-2022-28506.patch
 create mode 100644 package/giflib/0003-Fix-CVE-2023-39742.patch
 create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
