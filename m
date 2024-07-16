Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E2C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969CD60A97;
	Tue, 16 Jul 2024 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IOFQ_sXnu55; Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D4C60A9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D4C60A9C;
	Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C28241BF307
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAD8A80BE3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpcRXZBG-6IF for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1819A80BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1819A80BCB
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1819A80BCB
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:50:46 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7f9be1f6cdbso2238639f.1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721152246; x=1721757046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq13bZ0Y1S8jp0UKkTtwUdk20wWwoM4SMufaQ5TxoqE=;
 b=hi8EjRA9aBcbH7P/ofZzK06E7HgWnKabF4Tw5ZlhtZxlChDn6qkpmNlsJ9X5TumMMP
 cl3Soot7pLTFP1urAUVDvZ18PU+UIzO1kmZab3y8fc0PxgRK8Kz89fcsLJzINeqIMEPU
 i0mFFn6pBF7V3/I/85yl/HzcaIZE7UuUQzSK6aYi2aQ/z0nTBfUX9Ct8b84z9yGIK5pI
 idr/8LWUtu0ePypO2CYwlD80u7RbmvlEMW3N+fvSXGgMbv/EJRh3sz2Nl7YKANN7Ir+1
 /RwsZVwM7CcF8s3g725tsFUeHdyoQeO3i0b/RcyXM9Yb6BCl2E0xGpC24EAHuC3VHfvE
 APAw==
X-Gm-Message-State: AOJu0YwHOzbVTcgW37b/mHMgFDJEqrGTwGBIZkZEkCJi3XUHkUO/DLf6
 IYn/edDtmlts8qU7fsNDdPLm/QrxQi0IbRIEwYeRGnsRvLE5QvWjLFkT5V0i
X-Google-Smtp-Source: AGHT+IHb1xB4eaK+5nz1vbVOcRK0AWu1Jkq9Uq0pRQ/ovN3fffI1ZE3Y4XBH90QToC5cOeePP/gk+A==
X-Received: by 2002:a05:6602:1684:b0:7f7:96e3:ef23 with SMTP id
 ca18e2360f4ac-816c407191fmr17395439f.2.1721152245669; 
 Tue, 16 Jul 2024 10:50:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c210bbef1fsm39420173.31.2024.07.16.10.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:50:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 11:50:34 -0600
Message-Id: <20240716175037.1844929-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716175037.1844929-1-james.hilliard1@gmail.com>
References: <20240716175037.1844929-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721152246; x=1721757046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pq13bZ0Y1S8jp0UKkTtwUdk20wWwoM4SMufaQ5TxoqE=;
 b=Nv1D/s0AFE1aRrV3/cxzx6kqvflgiweNYpYAd4YWB76XLpXL5Z2szXZAW2ITkY2TKu
 0wK3MsXrKcLbMregPtPf5lLapoFAq1RlKDewkBKpWKf6PhKntgdTgxGBrw3eWrUNjxHw
 g7QwnavrOHGNls0X028lF9v74BjbzWOI3WhG8EnhwSvnjYXsqJaVi54o36lmt/vtXl0f
 /HlRniSJ4ufBBI5pul65IbMrIshATK+6ehj7UG1pUwhPOj0KN6Z9h4z+rQbVeE2yoW/w
 Q/kmjqRe+nTdsFWkLl04bCKVm7FhB82y/wkwSE6txy2g+DIp8xANPhKBwFqDLJUzYJQX
 A1XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nv1D/s0A
Subject: [Buildroot] [PATCH v3 2/5] package/python-cbor2: enable host build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required for the upcoming python-uswid package.

Disable c extensions for host package to speed up build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 5040301867..423670047e 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -12,5 +12,8 @@ PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
+HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
