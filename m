Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0DDCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B9C80D7C;
	Sun, 18 Oct 2026 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVw1xGNOu9D0; Sun, 18 Oct 2026 18:25:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4014C80C0F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347914;
	b=STFbaDA3FWI+upHJlyWGwnlI4oQIkE5cHnub/LT3OFAYWzIiCDIPm+3Oc2ckQ89KBlgk
	 9ygCALO6Ze4/icEaW0l0EoIAah78IWRbDczLCbq2QhZbxDxGmYL7hBd1HEE/AzLtt6swT
	 X8stkJeStzq3AJVhEvaurRkJinpEgt9Q5rFN4MMh1+hNiSxhho6pMmz/kW8rqTY1i4AaS
	 ThrTuMvAjGWoaTRxkfVURNmTrzg7UdHrGMjyk8DMI5f9S3tr5ruxSn1YelnRvnTc01QQR
	 XyFRydyl1wX79sUrolnR2k/eEvIW6kLH2FrOKdM+IviW2wQzOrjk3ahCddTU91hkJvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mlWF/dMD/1n3N6jBnUuNuctspt+He7aoD0Rzyd0RM7s=;
	b=lOq3crRQw6QJPtOrQND5yqkLZ3MCVpLK+/K0leGqlLMrg0Gn+pHqThcBgsGzBr5uz834
	 5hGAx77EUFleow3rSRRXCct8BtOBj9E/ictU44/+xfA0x1jgLRHzVQ6mD3Uii/BF9PxZL
	 jwBI8U90Y0zso4tJjuhInfKwnS7hzOilNzdiUR7HxTj3Uq/DgSq4jCnQHhbj7FL904RGg
	 m7/xnw0j16wrRey/GBNPLQ10prGhXJQSpieOea+5KDX+jXrAntMYJDzoJxlNJou3IJM5P
	 h1zeC0o9ESnWioeJqmg51CFTZakQIrsjLxwcn1nhfcVTZmQwhaUDMvomx78K7JQzIaw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347914;
	bh=mlWF/dMD/1n3N6jBnUuNuctspt+He7aoD0Rzyd0RM7s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=anDWxL31BB/oVtHpGNX7bxwQloYj/2Zz3QdQTY9njbje6mhyr7DAj+98891vOGoy3
	 rRc5vH9y7EqOhUjsucBZ8tYL4o2bNvRczfxXNh+gfEi1zY1arGi9OBede9SUmQvl+A
	 GJ+I5RvzpyquhZhvlOcLpheHjG8CJP02wfvteskEXth4xVRpiHTmo0OtLpdWY2L1t+
	 BXhjjdQBKVOANWdQazNWAtUb9fb7JmMWdwKHE5ifPWFltG1A3Ynmjbu3yE3kSNtEh0
	 hNJT9VP/JXtocsIBG7idV7TgqD3TeULbnw0I2cAfejfj0FOjD6vVULrG56xyO3SjoH
	 fCOP48DUIHUKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4014C80C0F;
	Sun, 18 Oct 2026 18:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDB961
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C136060C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irn4uJ6F1ZjA for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5B6E605F4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347911;
 b=WzgC8w2SKh1fI/vAGya6HkK3A/jQk3G4h5RdJBgx6SlKBlKCNUgvoFzoPWH8X3KnKsU2
 mEaQbaBoc7krqquTwI2UVpYaBlMG/cFSD0Ye+PrGkiZisNzLulLbLVRNnkYNu7NVvoXE2
 wE1p2zLimC0LoTOqji5pJBZK50PGZE8y0FsRVqq5BCFiXqmARPjVJ1hlGmz8thqD5mR/g
 29m6VJ07miLpSTfZZiIV4xGNS6jD1hJhvFLWQyVokn/d+h2i+un+/16C18it7LOPP6mKW
 PtA6qb1YjUHPrw7LMsRTsvrW9aajFXERAPcjiPnsZTAvXeo3rCCD6aWZsrNQprl0fUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=VyjTL+FLVbZ+roMmqjjUMoWybEm8EKdv2ViH+4ZNLnU=;
 b=hMW2UALeotIPrxKLZcgW7a+8Xe/07k7L6VrhnPqHBjEUVe6Yn5eee0KqV/++JmrdR6aM
 9Zpq617rVkfW2gmzucs/gKHBsZfkG3vINDGN0ta+fz54lJFigTGT9L0wq+B5jtnNhu+fG
 0VmnK17Y8FYsAXTMg+trQlAjY+wEpPtuXgKH1n6P0iMaVnV9ErRGafhDEAAADZ2PUl8W8
 bryPGsTHmiHnI/VqH46gt2nOOkVyi/OrUr0wkRmBbx9LMEiNGQIJxHZIO+/5KOOzVBkX5
 VtBhGHZDcgwlxzRuAqIE94gPEYJOrxv+kYqGSkLDr/pHK7nifEQQOfmJWN2IkUTjpwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="pEi7/DUE"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pEi7/DUE
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B6E605F4
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4f699fe49b3so1120165b6e.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347909; x=1792952709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VyjTL+FLVbZ+roMmqjjUMoWybEm8EKdv2ViH+4ZNLnU=;
 b=pEi7/DUEuUg7baZgT3iIw9mCgrTvlX2p9GGr8Vk34Jqkof2dROokIs0TCvHNR/Tosc
 zi0XPPh5m4JOrQaYIzRx4slnfP+uQwU/S7KBbXbqM/JGKmBSLIB6wycxmktRHJdKBP1/
 g1es5cBukS4N+DZimEUs+E04JMz1vDErALwXjRiLXHFOSEENHUJ/VyGlx2x0vSGuEspM
 6cDj52Xqq2gh0aX8PKhZ6fyYTLqdAKtG9Q5ZCgJE9syjw+NJZ7imycS5Ue/1y/4fpRwE
 qpkwfwt9MrSiZU6K6avAaHHNzMd2Wqo0DhuN3f86TZ0eUAhQokxBv/4aMQ8R7lvvXDn5
 4Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347909; x=1792952709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VyjTL+FLVbZ+roMmqjjUMoWybEm8EKdv2ViH+4ZNLnU=;
 b=P4H5LOsCH7hS9I3IvBopbP92/2dlj0/1p9cJBFUucft4NoJmLmcJWkKqq3T+phWHj0
 g1NEXlFeFETZxXOxODvcWIyH5Y8CcRIHGpP6oi/+3ZstrhE2tjQy8Zd0XkoPALaTsQCp
 HZ0VqesNjThxFX5QcX/H8dc6vonyGLnJin22Erz+mxfJ5+OQPGrNntjJZznVWwzviWug
 17Z+MuyssIf/m+vewZgScDbb24I8pe4jkYVOffjGlhWWXKl5+1SqQfk4BMjH5omcyII2
 KHrZHjypm26MRyftEoO1iiFC7dtEoRzsrW6+WeH3W/V/Byih7r2c8vS8uivvLHXEDFKd
 R1aw==
X-Gm-Message-State: AFq9FYKwZjZfoIO4QA0xsDw6MNh/TlseG5KtKWorZhP5E6mAZ/uTlqBE
 kSYsdVEwGjfpd7SHaPUV8I7JsUPsW4b/Xkg/I7altlKlV96z/p/n6a6CXHwqYQ==
X-Gm-Gg: AYBFou2DIiI36q/AMeWr/E8SsupxXmxNOtbwUsmRbeWHGQjSNd9Cll3lmgocmBvi5b3
 l+xE55v5kZDTqGrlTp5UQP5sfg/SVgWbInji4YAvnhbsJ6GKgxtobFA26wqIdW7CaJw1Tg0CWXS
 J9LEAT+6rsQqHWapV1ufq7T2cWkCY3sPY4+Du8XF6SQZMvO/b/vmoj6kHXiva3depYOIGyurI/p
 KI7hwUA0dZXHq/37x+SP68c6lBiSThHDLUkq0kxVb8PJ4L4zsku4BwxSFtaEOF0P+wvvgruIHWC
 E0C4UebFyh/qcv5k4FP4p1yyQVkXmmPfZwInn6doJicErH7CWj6tIXc7L+DPqwcU9/ODIPhF1sN
 qXXAiclhwOBW9vBMcU9yKg0K7fnXNamZgueYa3pYxRj+ybS1PFj2ZbH0Tr7TMTBZYluIfBXjMxl
 jEFWenQZdqkiowhksahdhIxhFWXsaLysRK2ZMaE5Tc9WrQSTl5yJOWywADjp+OGC1f/OUcHBwjL
 oxCAGaRTdfDTIk+IcqYmrpKFeoISMaoNhSm3UHNfWwuIy1kMGlcmTCJHxceFPrUTOkCra5Y92v9
 CVK+thQyBX18IAgz0PlZ7dTvNDixgblPj0t+00jTtynfWaOOu6WQ2ireWRaEOY3Pth3lSKj8MF0
 ZCw/BGnd8N2oc7WKPAk6kaMoXz3AeO0SIQuMWaseSKSg=
X-Received: by 2002:a05:6808:2389:b0:4f4:813c:6a21 with SMTP id
 5614622812f47-53ccaf24921mr4507856b6e.20.1792347909414; 
 Sun, 18 Oct 2026 11:25:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:41 -0600
Message-ID: <20261018182507.536698-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.2.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 59c97017d9..3145620cb9 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  4ea5f8d2e11ad9db332ad02758db0164  cachetools-7.2.1.tar.gz
-sha256  b1a7537025c06abf96fcc1443e496af9a3fb95e774e70e1f0af226f73f7f2dcc  cachetools-7.2.1.tar.gz
+md5  cc17ff466a8a3c11920c5f9744719db0  cachetools-7.2.3.tar.gz
+sha256  e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a  cachetools-7.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index cda505c404..73bd924bc2 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.1
+PYTHON_CACHETOOLS_VERSION = 7.2.3
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/31/44/71476a5812da1ddf2c9a3efd31ae76d01480a1cf03ed13ac28aa8f2402e4
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/09/88/27fe0785c7a9aa285c753db0b4ea967adbf76128fede66379c35a4b8d054
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
