Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5679BCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1890360B14;
	Thu, 15 Oct 2026 21:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_V8D5GpktQA; Thu, 15 Oct 2026 21:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C28A60B1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101168;
	b=lyWszDUGCipBDEc110lMLthuhgT+6v9ijixr/HaVJ0A0BcVWq/Bgqh/FbWoeNRLkmpNj
	 Eo/joAd9QjCjieuYP/AqqBBpIldJomkDuMi4qlOmwAq84Lz09swKn1fBztR/oyp2FksKH
	 Pl1fNqKOZomen3j4Tqu+IwAMLmNjza+IxJQ4OhFnAiEXgSDxAU9Y0BZey9zkZ0OOfQIBG
	 1g6Q69aNuurk3D4ImLYlN7+mI8Hr6M6StMWMeF9IoGY8KErhCRo9iKrWjUdYHdWdjjCPo
	 bSV8u7pmRlJVuyWNSoXJ1HPEIYbnmQM233iYOxzBKtCQ+xJKnkL4KUpnTw+AF8ULSHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2t6HGw8ztYipXUbFMbYl4gYmEvSyqxP5Xu4YdxzlkYo=;
	b=NA6OrCrCombAqhXD7AzrlAam01dZHBzWwANHb4P5n6bGjwjOm/+zJZtIWJpokjWmVei4
	 iQQZA/2ysbFxPjwKVylaD6rGPZGoIQzyGsUZDFMfaaad8WHg6sOlgksH+Mgv0qSwf2UC2
	 VunlE9F4IRPFlVratTk0amNkCZXi/G2kQ+P4XUJ5iNJpnUdySkdInxMYAS9LS+Bbllv4l
	 v10XXSZgpixxy8bwW9cg1CDBNuI3lb3KjQdQdW1QC0RF3bM7mg3FDVjMjakKVjagjI3pe
	 jycVMgtJ0xf3oiaoU7ctwMNWamukX6SOe23YVn2nlKmbyex8Xo9GScOl/oDMlUg05rw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101168;
	bh=2t6HGw8ztYipXUbFMbYl4gYmEvSyqxP5Xu4YdxzlkYo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PWABTnIwIrSmT5/5Eclu9+iE+ibCU1ZHpQ+hzIZBKigPvA8hl5DmWqCbRPhO6745M
	 Em8wHZRdmknu9erx+UDnsN9ftcaxoFbPKXtwDphI5kNcBKpobZ6ie+vWP30MDf6/aJ
	 luqcxXE96A/KVFH64x28BNzqYCxx2pm8Zr6jl00oCkELT/3QNw70OodbSDi1UMbiJs
	 4QLhfwyccdbhTCYRuzhIG4Vxk3mT79pirsKQJRb6BiAamzohcjqIpsgjk6VA4YFf7Y
	 tj/lR+sLF58TwMxmpjuzdDhNXpTzuteY57a/5v43pwKGdflI4T3ri1V0qlpAXK5b9p
	 f+hNWu5OU08+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C28A60B1C;
	Thu, 15 Oct 2026 21:52:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF33B362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB214045C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1iqGY60OFR7 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BAEA540087
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101165;
 b=pibQYNhYWiHxUvWEhFYZBupcI9EL0v5xUFtX93dHA7hlNJv4AK8vYVthG0PN94ycT5gH
 mke3GKh5QNifY/xObQXsNd5Yy9a6xQGy5YuMQhaQRqw0NGxfHiqvcrf5nORKw+vqaEqxz
 E7Wg1a6n0BQDsZc8RSeHFVZXmwTU/6qbrygs0XD6v5xMyvDcr9J86se+Jia+6K4VT/vty
 ZqGJhhg5YVkNjlLuoFHVrJVGCHLGOA5zkmt89hRDRLvuja9emKVz2kZ6qJtnHLPtn6cOC
 UkpbKKWWFcCo44MI18+KUt0mSGJrnGTuUXIcJsz5MxAnWnHgVxbcyRgTBoiOgQWSaTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101165;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kK0HdS/wf5r5dw/QdDa/VWTHE7AjYyl9BBb/c2UWT58=;
 b=MxtJazfUMb24CMq1PX5ZNcdZ1AXjYUsFzq3Oab1c08QfEdrH0K0Y1aYuEc/r91OFQkQd
 XDrSvprQ7+7YF1a3DLqRG6kS2jogxA+CQFwRhcLDc/UFsM/t8TZBKWCnSmohugWpQuTl2
 R4SdEULhckIv1CN/TOfkh5VvBY+micM/gZHTflItDa74H6y628+sv0/bAph406w7V64SD
 BFfsAN8BBnVnbhJQFqD4Km0lk1xKryetiT7G7/UTgs6FxUuHqvZDjq4q1xGDoTMCB/92h
 WCcGPuZuiyd1Se2+/0Vog9FENc2ZGdxf/biyy7qZxhv9RcRhfYZr1EnhBcyN0vbgjgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=alFj624L; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=alFj624L
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAEA540087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:44 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4f59ea27bd0so2070668b6e.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101163; x=1792705963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kK0HdS/wf5r5dw/QdDa/VWTHE7AjYyl9BBb/c2UWT58=;
 b=alFj624L8i3ZdAiWXArcZv0J6qVFzogd9eOg+yytucC67ugSw8AAxL01EnoNTN0jpv
 GyoTbBeRuzvJNv78HkG0qnbvr7yGnPEfiN00S/BiCxkv4XnPBmGWuKS0bkfapVIfVJ9r
 SAu4PCNvUVnhTPhCVY7RQeFdf/cHMm2fxuo3OPBHKC37U8tzfw4XPRj5Xd5e2Q6vycw9
 JeodCdm+4DPaMeoP6mtu+h+H4g5J41XIH04bBWs99RHT2SBWGESmJ6SjgA8KR/Jw7aq9
 ppW61iV6HioC1WlFPPmt8sTir0VzodYfd3Bahh8cP/YyKrK8EQ1RpLQtLTl6ZGU4mbem
 YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101163; x=1792705963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kK0HdS/wf5r5dw/QdDa/VWTHE7AjYyl9BBb/c2UWT58=;
 b=pfHBHSpaExxbWf9T15sJJPkHHKF5Cd5qN/de2roMSKxcFAmqkO9gIb5Hd5Ys9ped2s
 svfoeCYhmjxuvBaLLXXIiNm0bJpMX0PhcI8fr8g+Lb6rY3LNVgd1UrAiSt6lfJxL/Uvl
 DYLtN16gqmTCoJbY26oP+hfwCmDAu8ziniU/wvWjcGzy3pOZBjGWR0gYcvJT5SEQDGCh
 h4QYSxGfm5xkjNjzJkvEjNt2G9WTqOBXUMFusvpGNGRMRxp1ytTrX6uNsYilfXFkvbm4
 STB1o3tGbmi/rVI2G6r3xpZjEqF4CI4r55KUqmTsFFOx0/QWZLNPw0LFPbaig2Ir19eK
 hACA==
X-Gm-Message-State: AFq9FYJa/7sJg26Mzs+f9hAhRcbaWUxtwC/CNJH1X9EGpmIxdbeNmW4A
 qse13kmHhMg+Kp6ywBfQtS3h5RsEzqrAPidwNBPBC9jyh2Y2+zA8noHh+kBFpQ==
X-Gm-Gg: AYBFou0JCLlO3vg+YaeRE0XOprIyDORKS0hX+5IhJc2VoUMS1yDD53disNFT6Fk7qEq
 mP2HxL8rE+Kl/iZn5RC0RXoyjpsSmm8TMvMa42HUIo2JQrFpkViNZemflxKRf9wbx8kbNWbp/Br
 NpMssG+WScuJ8i8YyF6AFMytBKBsr3NSo97X5AOkYbMcHjfn5lGJKD8Q3ZAZVwAfLGHyS/cUnJL
 GmGixyxZEOPGq1ohPBm6MVX9LwBMqtlve/kUCBn1haTqWs0HoNg75E+S3lzGcTJ6jyxvesVLI2T
 XQ/957QCq4b9Ivl+5WLXJtHoAJyz2VJ3Gi437BF2r4M+ETkLDzQWYP7H3rw8LcaXSp2Upo9PQiU
 MhSwL/kKroqqtM8U4eoO55QOJKN9QizwGkFhPTfVu+IRP/uSsCZ9zu5Zf4a0eU6sOlzzZFiVq9y
 Q9mDgYesaE6AYF9d3ekhKAfZ1igRKXb9Lg44USCP0o2k9VBees05JF+0OXEkeTZrq3Mjf5AMsIK
 Re7SibO5Tz7qNjvSteQqV175Ifu3YtrBGYXD62whN8e2gQuhR9OTAF8yzvHmCdrBLeqxBY+Zxa7
 IdvEjxNmB7jPZcDpPgTqkCZG36KX/JxmYN91cvZhR7j5TMa3ks5saCjPJZ0jFFi5VE4o7807HXN
 3qYzeLclTW7F88DcCUfomWJLDFK5EhJI636MgKo6aMiEFHo1eqYGlnA==
X-Received: by 2002:a05:6808:c1f3:b0:4f4:b5ba:a236 with SMTP id
 5614622812f47-50c4e68002amr19066157b6e.10.1792101163590; 
 Thu, 15 Oct 2026 14:52:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thijs Vermeir <thijsvermeir@gmail.com>
Date: Thu, 15 Oct 2026 15:51:53 -0600
Message-ID: <20261015215210.3426895-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ranger: bump to version 1.9.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ranger/ranger.hash | 2 +-
 package/ranger/ranger.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index b1ae8a8b8f..1dda885012 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  ce088a04c91c25263a9675dc5c43514b7ec1b38c8ea43d9a9d00923ff6cdd251  ranger-1.9.3.tar.gz
+sha256  7ad75e0d1b29087335fbb1691b05a800f777f4ec9cba84faa19355075d7f0f89  ranger-1.9.4.tar.gz
 # Locally computed
 sha256  ef973501404bd0556fd47324411fc69679f30daf7128e042eafa64e2c4f9ecb9  AUTHORS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index d8a55b1fc2..dff2d65198 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RANGER_VERSION = 1.9.3
+RANGER_VERSION = 1.9.4
 RANGER_SITE = https://ranger.github.io
 RANGER_SETUP_TYPE = setuptools
 RANGER_LICENSE = GPL-3.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
