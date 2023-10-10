Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E22CD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69F360B73;
	Tue, 10 Oct 2023 17:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69F360B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7itoAtm6nIzb; Tue, 10 Oct 2023 17:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004026142B;
	Tue, 10 Oct 2023 17:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004026142B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9572D1BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CEF682283
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CEF682283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yME-DrQ2Ohj for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:52 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E1F1822CB
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1F1822CB
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53808d5b774so10560875a12.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957310; x=1697562110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fk6/9Q5T6xGBDY06fe0Ubw0xGTPyzQixQ+SG4P5t0jE=;
 b=Dm/tO4Ooz5O6ju3MT6A7T10FfNxw8D3aaay2zvTOss7iwQ/WO/sHM2H21xXSuwF8pJ
 Tbiqbj9K0gkUsntx6sZqoPuyAsOoABPQRnCjfFd07i78oW2C72rs5V4ebgoFRkP+9VLI
 /BMsBcgMU/Q/XEzZrcpsQOpCLPmoVZAbcXm/WTZ/nXg7jhrNjBzkTrfPHrUYKwhkbxVa
 IwBhriwRzZVw+G/oUDrHF+/vS7K0aG1TtvZvpiRp6PF4prUpFK4EMCXpDZ9zggspeEI1
 V5GjWEZXL+9+tUEKfXQG3ernJxtq+oP3S+BZAlMOoyKcAYgD/88yOsJYuJgAHdqVESbr
 LE8A==
X-Gm-Message-State: AOJu0YyEQO9gV+4iaNXO/rdpriuc/LT7tAhGxRRZRXh9BS3MMt46BtqS
 +M/QMjemu5SJFZvmrWjlLjtu39aLjCyOEnZyIGJ9Fg==
X-Google-Smtp-Source: AGHT+IFA0V2r7lH79qUwJDsUzpAnWsBC2Eis3uS+ywybNWNgU4VtaD+qfGdaOPqpBu1DWBjuN1HbAw==
X-Received: by 2002:a17:906:1daa:b0:9aa:63d:9ede with SMTP id
 u10-20020a1709061daa00b009aa063d9edemr16810639ejh.9.1696957309852; 
 Tue, 10 Oct 2023 10:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:29 +0200
Message-ID: <20231010170133.2981698-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957310; x=1697562110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fk6/9Q5T6xGBDY06fe0Ubw0xGTPyzQixQ+SG4P5t0jE=;
 b=PA0mJUvJvlbrhFuTWRNY71X6nnb++PxRgmuLMOyAuv/3jwiFavHPEPmWRpZ7PrgRk+
 UUqenP+78eohNUwpYEOsGUyulUoyy2qqn+1eEa84pC6a9cKMdak0g5DRXrMA/wND3y+1
 INvydz2QELH6qIrZo32l9qWWCBGgWVZJ0zoPY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PA0mJUvJ
Subject: [Buildroot] [PATCH 5/9] package/tzdata: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/tzdata/tzdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 08f3c83bd1..33e296d7d7 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -7,6 +7,7 @@
 TZDATA_VERSION = 2023c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
+TZDATA_SELINUX_MODULES = tzdata
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
