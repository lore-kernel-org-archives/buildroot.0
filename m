Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BFB606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mFO5UbtM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSZNwIo4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A195940870;
	Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cenma3ftWJv5; Sat,  7 Nov 2026 16:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 816B940800
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069279;
	b=L1mzTxyfbiKB3ypreozKDTCGGpLpjoW5qu00Cxn5CxABxvBYNXx7Y8hTtKekTWnBYhwE
	 H6/Tmm1WN6PAUNUsHqQT4/8wxCneqyN/VE1u2Syfxif0xbnkr+Pa8fmJV01j4uKQK8jeN
	 crLPAkhBaoeXCWAPCG5evKQE6DjDz1kLGF5oJFCBT4CrDmyZM0A4F/neQrlMuiHvabhHj
	 zkbNkzrkbzdNvE/Xq61qOxig3rXt1hs0GxGvgztnR8GUVktnOkZ0ssssZxHVb94SintkC
	 0eBc7UZktdcnN4W183840gjkoYIXB8derSVQeSG8thELamddu7gFofDtwlXX6oGgYNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=oysODh0QVhE/+G97HPZ0if17rWh3Ns/Ew/XWFGrf/1k=;
	b=mxbjcXyu1bS11ymElqCsTcNY09wNHBk9g07W6BeY5dICVvgdrVSPtmJbxAqVrWWHIPQk
	 TnxxUJYQ+pWOQvlyDCTXBpk8TH4YQrsBFcpY2i6Tn6pGJxz5klG1Opmvo1xgDUi5rSAs5
	 Y7wCfr8GwYsDIIMZDbzDddWUZ3UWfHxw8Twnuzrg/Y+vP8XvrMU//ISOXKpikj2jvE5qI
	 BMhRrRRwgZKkBxj82VpOu4IHD3ptOIkj+oJQYn+NMTq0Xl0bMAP97NkOsFQuIGBLC6t68
	 qGnk6rYaMo1AGUmCEow2ZEf3iQoR20JTXv9gKAIDY6hGlNcNnaRv/KfKt/6jiQq7xtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSZNwIo4;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069279;
	bh=oysODh0QVhE/+G97HPZ0if17rWh3Ns/Ew/XWFGrf/1k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mFO5UbtMQJYAWmaA8zcTANrVaX/4Uuf+1gbeiHChIhgsXUTTCCbN7ym9WrdLr/Tme
	 +cvjK+8xylxLUUDUKPB/G9KqR8fCB1J5rzR6gdsL6e6tWaxmBaQFsrNovJ9pBzVAVO
	 /uInrzADcNqQY7gSD+7l33NJQBHIUnwCdCC6+PLjE3ZI1f0X8DzGtIhDkGXXRR3bQq
	 MTMojqMuVL23o+Wzf4mFKTqZgWL1MKff7LLUnOk15OQLyyB/RpgYWwxd8OaG8k/Gwr
	 l9UMhgFRVFTbJ6iA/ufzmu1hAW9lma7fNBtlk4KlLt5aCKN4RniFWrYhTWm+ctYiXq
	 joX2Mf43BGGiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816B940800;
	Sat,  7 Nov 2026 16:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD95C34D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97BE04075D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZmgD8LUbmg3 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BDEF0407E0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=PSZNwIo4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDEF0407E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so16767045e9.2
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069274; x=1794674074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=du6Sg9Qt6r59H/ne2UPtLDpQfju4teRUGxcNA2LLt/Q=;
 b=PSZNwIo4GM4S6eGSkyFENKswgWFVHSmdYH2EvGZqGFzNBEg9bR8yGmGMZvgR0965s3
 Ncroqjlk5OD5YsTbHxZbdrQBGJT43ULlDuUpJ+iJdqpPSk3t/bL1CWb2AvOHtxo9pybx
 EEr5va6bb2QnlGNy+ZH3dOKKuRuQE069wI+wwRuB02lW97FSksVbde1wvNkd9v1+Ynal
 AG7dU243jO9zAdr9HxLNkbI2S7ezXhT34EpEmar4V7cx8YQvRMK7IUibSN9eWienBRDZ
 KCBAdR3DBe4jrCh3vDtnrB7sesZwd64Ma4NDcFsR1Vg2arQZf+SZU/9oNbDryPSoN920
 OxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069274; x=1794674074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=du6Sg9Qt6r59H/ne2UPtLDpQfju4teRUGxcNA2LLt/Q=;
 b=g0OLvUtilOh+V3bE1E9wmOB6UNQwapDm4OiJ2e6x5GcA4D8EcVflQwMEVgiljD6T0h
 zJz6COfLb8YH6FCdrDafz+hc+f7IAwn5V662OJqlkUBYnRFkvpZtS5VyZxD+6LWp542Y
 9XEZwGuBoadRCbXOPs6qYAsCmONVCg0BlN7d270FTyI6fmo1BZ9NrUAtehx6z2zGJAIg
 GbIeujPBxuvMHSZLjTWmmALinAZ8HeqS4xM/t1Ej3wINoChQjKA2f5hZoqc3cws3XePT
 48t+YCLU743iJPy+zH9ifK5OxpSZYfTqXrtkQ5jyQTgH8Xq4C91QNIHWZv+CrNJwhYSE
 MiZg==
X-Gm-Message-State: APuU4Z/bFCLrMLVMHtOa2efulUxlMYX/4NXTdHfiYH3fYkBdX75EcEMb
 jWeW2Y7lgkG8W93MRqF7AGKAQtRStoZxd3oJ6vlq1OqyuDlmp1KvMKh57W4Xcpiy
X-Gm-Gg: AYBFou099nBFpmvzsePVZMa2QEAnLS1e5a/oceVd9UCbZ7zcV38p6RgFguoTnQmdARO
 IEXzAgVoj//RiSUfpc40mRPJLea6rKgyFPTbFCYh92zcxgf4iFdpmWChQVIYQ+FUBONZf3wHuGl
 KzzRCw6hHHeLTX/XbkNqEPXcr5FKh8872vgNXJ9vAG0MmqRnvJswTcV74CkMoixGYKweXgzCqex
 PpXDuw0mMJcZUZ9SBBmjQQtnQvKU3bq8u7RQz2LaadKHvWxvUZ82JIByIIkAsBz6Uw3Xr8hm2U3
 RmR2dC/TCo5jAOWJQmBvg9aIbWQlcCkLjFgiv/mJgDKTc5UmE71vB4dt1hTeNiZrj9Om1/DNCTh
 Z5JOF5Oq9QvRiFWYTLGSd1m7iT8t9oV6Yvx1Ct9Nyc4NMpniHXP0WBvQkpQ/HJWbCuGkdqcRu21
 JJOxcxKFp2Od4PM7+SGtxktV1oT5jv/FhMRkriTG+dmiYVTDHa4WLoQTpxsxVJXouEhVmVXd8mY
 JWqiHKHyVu35pa9yJc4iE91vu8gPTWpjrSw6UFoD84bB6E1l81YvhgSp7CKU+3GIjzmUiYDoRbY
 n6VRiepTlwWx4De7icrDaT3nq3DqnRAk9Te41ppHBvBgNUJAEIy/
X-Received: by 2002:a05:600c:5295:b0:4a2:150f:1607 with SMTP id
 5b1f17b1804b1-4b6dea689d2mr106464425e9.13.1794069274204; 
 Sat, 07 Nov 2026 08:34:34 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:33 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:07 +0100
Message-ID: <20261107163414.560896-9-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 08/15] package/libselinux: drop the unused
 make environment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LIBSELINUX_MAKE_ENV, added in 0e5eef911c ("package/libselinux: allow pip
to use system-provided packages"), is not used: libselinux is a generic
package and its build commands only use LIBSELINUX_MAKE_OPTS, which
already passes $(PKG_PYTHON_SETUPTOOLS_ENV) to make. Drop it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/libselinux/libselinux.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 9a01b9cf94..2039d5f1ab 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -38,9 +38,6 @@ LIBSELINUX_DEPENDENCIES += \
 	host-python-setuptools \
 	host-swig
 
-LIBSELINUX_MAKE_ENV += \
-	$(PKG_PYTHON_SETUPTOOLS_ENV)
-
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
