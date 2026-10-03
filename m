Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3F2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C9480E82;
	Sat,  3 Oct 2026 23:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiCBz8oh7VVA; Sat,  3 Oct 2026 23:47:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A116B80DB0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791071235;
	b=qW1N4gszC9wjqlMLS7PPh7f7Rc6knG7eoN2+6y+3bAopH16bZL4wH7a8G2NdU8DdyEXR
	 3Q8V60i6apEFnl397KBm3wbK33udwFxK1vEVtRgwzKk8KxRx0YAVTZvashdPL56ozZ9Xe
	 HDnj9JHBVHk8PYlnqXL4KnNBRGQlULWosxtrY+wgB2FlckIMfnIHcuRZ6uNZCJwudwC83
	 qlV31CrjuHrWpoZ2ESzqf0/AVIt3U4JiqjdKO+knhfWrSJ6lKo01mjzHauglmHFPsOkXI
	 iCsl2Tag/bdNHYuOPxhR/dR3GgazH0ZE9AriWIE+2sUqdNCeN+p27LodT881vmIYhGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791071235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DroXqUcylY2KTF8uyZw5R6NumZ8+rxrApGIL/Otg0fc=;
	b=S06LIN/aLXg8U3c5Ucf1XDuZaXg+rS8WfmW581fHSOHbx12K8W1UKQmw0XgckqedDiL1
	 M9cjBCXNACDmJInhoXFRuvmvHhwhYMLIgYu8gQy9+nMHhAq9n97/yvEthTkAMpnfXG8KC
	 zx8hD1BGkUwLnCY4nScEHdDaF+OMhmSpae1QHVjtetFvN8F7e6vXzzmgxK1XOloXQhLAk
	 QCGt3PCWDQRUIcpkmr2ewEAFhsFcSEvcLSch409geGhQx5/AuKeGOWCylgZrW698/XNRu
	 Q5GMgbocNUJfwUf8EdnSYgf5Ohsj0rpAPJlFq+EFJNwyMeDEVB8gZ07y/bej2NS/72w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791071235;
	bh=DroXqUcylY2KTF8uyZw5R6NumZ8+rxrApGIL/Otg0fc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WhoohbhuniYHAMUjmbFPpwFbCu70qKGfk8rh7nClq5e9pEAo8gvAHXCKVQQMzLwI2
	 2lpNJQxX/NhkYV+UUNkvxDaBi7z9/friH0UpjutxV6XVRce7M2GywvGrYZIE8JnXlI
	 nnMeodZJhsB5afwshdSdkJIteOOvClARtZT86RxOQuJiZY7ImyBMnXGeQBW0RX/qti
	 u3P+DUyV/PlsbFgB6tzxU74s1p4QTxDv0Gu0wfsmBpZwV+q1WtZ5fcqff+aXmBakJk
	 9dMb5r0ywEZs6vu6s2G55Fc07os/zjpr0nTvzVvkqGiIcNH8k8K+FgregchS34FKh2
	 7jV9MpgIaAgkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A116B80DB0;
	Sat,  3 Oct 2026 23:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B5D3282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 812FD400B4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J7-r9xosMVU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:47:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8C39C40055
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791071232;
 b=GOOsF598jOKUUdxaLTOlsSigrBU/xF19P3SDhyMFrNSs4uoImPOZNEVqnYD6cfothUKG
 LC5l5udg3Zy+/h1pf5WSuDKrya6dzTpS6jVCkqTI7LF5QK1cmHIQndyaLQxMn6/WUrxoT
 Dzgc2M8Yg6zPu9kooP1MeFtLrMUjPMDyT/zNRU8bXIdXOL7m+Z9RqpL+Yb8xgM/wYevTK
 EWDtH7aGvywq84LxqaDozdK6+gFmeLJvzbA80qcxpoVUfgcjAkk5HURZ13jXja9SBpYYQ
 mirAgn5byIPDj6GriIbBhyYz2Y7SPkXtQD2HGTaBJIxsQrkqaHS5nkhENHxoVZfsH4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791071232;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=vU7D4a+hh48vhW1ljGsjWT53rgIp659TZb+AIGO6Tm4=;
 b=g/xIp3B7kmv32/Vz5iJKMj5diI5Dpo6++AdAsshah0zWXEbxIyZPYaPUtqTwVq6n7m4t
 spfpTe4H1njnp9zA1VCQkMWsTO7Re4rh97MKBQMfDbxKj/2OtirETGWikOxrG5Zn8GzBt
 n6WTapE3IQQdlpRBPb4xTGv4jvF908iMTfQ/90WUwf0ngbTQGgvn28pLqdqfNjFhHj5c9
 zosVOE4VHehXHcDPIPEOZNdg1mQXwnaGysY2RCU85kr62UmmZKVyaqCAJmeTd66WBZyr9
 kOfgVkoD+1tVEzqYtx1KLayqd1YAsQz9KJTO24sk21hB98M+6VT+cC7TfTFwSulw+wg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nqY3DSLp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:32::d;
 helo=mail-oi2-x0d.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nqY3DSLp
Received: from mail-oi2-x0d.google.com (mail-oi2-x0d.google.com
 [IPv6:2607:f8b0:4864:32::d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C39C40055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:12 +0000 (UTC)
Received: by mail-oi2-x0d.google.com with SMTP id
 5614622812f47-4f1b285e934so301507b6e.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791071231; x=1791676031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vU7D4a+hh48vhW1ljGsjWT53rgIp659TZb+AIGO6Tm4=;
 b=nqY3DSLpFhfZlNelE7JHWDTFBUHkkGsABaNXcQZ0P4FWvM92Swfvqei5BiIl48h3dK
 HI9RL0IpWqCC2hvYZJofCgLWeHoPOEuVZ0OWG6ql2Ga+kRTPBNVonm90KWRKSsnALN1o
 fQbWMYAufnpwOaNCfENHMyMSj8qBhlnr14qPBUViv00urrjXjkZgz02RwIV5d15yVMBe
 uDilg9KIA4V+duxahUheOQVkH9SoXQu9XI0atBMOdQBAPJev/Qt06842g1MRHnTGrlKP
 OXwMa4SPGrgLXxYo4ZUCV+7dtMLUUUIkQeiyMWza0py2fpmmQGMLurJdCiCMvBHztd6h
 bI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791071231; x=1791676031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vU7D4a+hh48vhW1ljGsjWT53rgIp659TZb+AIGO6Tm4=;
 b=2Xt7c/S1CP6cz/phBDxKC8/dmwuVwv07Nn0SdT+kwbuG1gGB/iKZOcsXSyvmvE0NVr
 VKgGX499IQzVQwRfR6PK35Ggm0yxH9cxJOyI5RATfS5rcctv+1MbTFPHwOGVL5yVnaJd
 TwLk/WUSA4F9BTOII89nDTp+kNvZexutpts+QKbRtkJ9Ykt1OW+XwJh2Cze1Wkxs6haz
 EgUw/8UXo43F2Va5fBixwWGUGDFcfAcb2uWeRJ8FjUMMs2SUc7fyxsn97qd5tJY7FBs7
 3b6FTdxy+ZynP3MqCUqEOtAoVOiEV0xjNcRpE0lFX7OXw1yPw7Vx7V0t9OiF6qUOMyyp
 LZ/Q==
X-Gm-Message-State: AFuF++l4Z2RJQWiaYsgBq9b+H9A/MihWSZUVOTMjDdc1JXkEzoqF1FK+
 uKWuUeYzyCbHFu+Kt8nUw0JtKMSFlENt8CYexdujnsu2MUJTEUm2eVmbQ+E4Og==
X-Gm-Gg: AYBFou0cMfDg02+XWpPuJiZuP0/RaeS/5uBfJIQ7M4w6/I4Z2Yl3sRBs/U8Ng075Cmz
 cDCa1XaNLVMPN+O8EbxkLK6Y7BdxxxTsDILXW+uYvYqzCliGS05vQ7Row1jAtssT5Uqr5lpnjUP
 fJzFNd99nVTKFjmdx1agSFWkwe8g5FgHy5H64yRGR8mCNch+2rWT2U/i0zREl1h53KGbC3d+PAD
 woHCtdrYTv3/6TZMxBtvP7Lts6+qkbXRIvAGfBo3Ca9DVz/YAQsOkN7goboiKViI3QQtm7+9odH
 aWSM3h5pyfrxGTXdTX11vw8HXk2jOQrxoJ+CrlK0rdqWQLO8U2Yp1W2MmHbgmNmGskz0I9HhuvE
 6+fgAEEVm7qmSPTgcCffRbAN02+MEjCftQZFaI1uDWTOw0IRSpe/ipXkItersmC9Ti6DHs70U87
 NaKB0EPvYfRf7iGIgb4AWSrNJQr30BoInYSL5x42OiVPRNWodjd3h7N7WcVDArezuz1EBwd2E9v
 iRMsG99oAd6yftfmHpW/rQRXN5Si/N/cWRc43KV/xan1C4MIW3aNMymlQ7N459Fbl1Bu6zG8RVz
 QlOhghPgHNNRgL39GOqa4AI/+vL4QiF2qrQrATBojQIBbIgrXOFlaLuqOu233QebYG6mAHLXVYC
 KY1lOSXPlJ9U6VHeR9aLwfvgT/+p9sNNzHZ8H/HAWIw==
X-Received: by 2002:a05:6808:1790:b0:4e7:a6e3:7338 with SMTP id
 5614622812f47-4f5288bccc3mr6781684b6e.17.1791071231223; 
 Sat, 03 Oct 2026 16:47:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm6285872b6e.18.2026.10.03.16.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:47:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:47:06 -0600
Message-ID: <20261003234707.769506-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-grpcio: bump to version
 1.84.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Skip dependency checks as the source archive includes generated C++
sources and does not require Cython.

Update license hash due to clarified third-party license paths:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpcio/python-grpcio.hash | 6 +++---
 package/python-grpcio/python-grpcio.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 9441d89389..e533bc1bfb 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
-sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
+md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
+sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
 # Locally computed sha256 checksums
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index af9817a0ef..bf32da46a2 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.76.0
+PYTHON_GRPCIO_VERSION = 1.84.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
+PYTHON_GRPCIO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
