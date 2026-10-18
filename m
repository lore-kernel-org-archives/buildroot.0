Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3571CCCF2CC
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FF460622;
	Sun, 18 Oct 2026 18:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-115rUKnlCG; Sun, 18 Oct 2026 18:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 191D160656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347928;
	b=ifFfLJNWRXEh6F+PFMU5Y+6zERMAbKZ8Rq59aWf2WJ5FG1As0fharGZ/ODvSrsEb0Q3H
	 XsYbI8pDBrYbw4Hq8v81goQoXyUYPXRg1wLvq5yrnlGstQrwi9A8uPKogD5M4/HXbAggn
	 Vx/1Oc4bwe64ydz4GnCQknOBt+QnOCgDmeAp/PEI/JUtdU0v/52qh4or3KBGxcg5FiTJH
	 t7zKIEzza5ITZia5oAmpK6zZ2ebCH8kr9J35wgiq8229NsJ1ctzPXgL3oaP+UivRBj/El
	 TvrxEj61pc7Bo3yreLw5dkSdOtakC4ayVpvV7xp+o4aBx81W/bgLsJb4+Ggk44s7I6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wCivmiqyopnDvUxGlAon9EIyIqDZghCqdXK7oocsVSc=;
	b=BJlV/eQANm2TA/rmU9sz9Gn20sPx6J36sWWgZ+FRBOyGeWuwKm8XN4UDG9J2YxkQXfvf
	 Sgy6zm/3Nv4cAb0s5DKA8yATf9mQH686GUSK/6PbLrtq0PfJ88ajdtJX4qjg32UgcF25H
	 RENBatfuBphSwUrzpkejVXZt9vMBN35oRvCYjEL5tRnrABAKX7X3u8jFtqVH+GhDKPyDr
	 jyJ820SzWVj/4l68VEKsP+nQi8ydXCsr1v/J4ifFe/ju+av/V6+lt98kcOR0MK6mZo5lQ
	 6ahl4DI+9M6qT4hM+bdeM9nN7Yr63Q+6qaRymVR8HiK0MIlhZAOl42Y7MChUsFwBjeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347928;
	bh=wCivmiqyopnDvUxGlAon9EIyIqDZghCqdXK7oocsVSc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y8bx7Yx3rngpZS9tac75KdPo4nMDSpNRE6x4zSUeB18rsr9EJGn0E6VLvWhVqs7OU
	 VVIp45IYqWsaaxR54DJZEA053o6MIDUBryp6FIR31F8bmCktlduaF0AFwwxkFK4yVk
	 MPG/quQmJSpfhaGFkhCJPo6d9ppb4EPwmFyD501UM4fXFVaIst/nlW8fxBtKkVfb6F
	 DSl6oS2BAaFX4ZdCTpE/CExyH/CTL16sZVaMh1i8rWkoc9Ejc+FlQ9peaOya24MQdQ
	 6KNGAbU+1iyWlBzwiawlOUDP0ap9zgwb3wzwZJCXWU3XB75fI4lge6Kw+GORe/rw7U
	 COCtmnCGDdOJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 191D160656;
	Sun, 18 Oct 2026 18:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B14FD1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9803780FF9
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OdHPL9OVwSi for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A75A80D7C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347924;
 b=JCUF2Tl6kY7l5Wj6Kqngjug16DgxMWKt9s4QUaElCMnV8vTSTwwSsTKPgA9dFgGqRJJz
 CmnMVwvj03hphYr1f5DxAHYLh7Q+sl+bdZh/B4oGCUPDsl7bcb05rEVIumSn0R6qnY8zM
 IlwNwx/YCFLhcrGIaJBaq7SAUrcVWUtdGS29MmY9O5XsT0Fju/aZ35DGYSCqI8RXFszoy
 /EP/qm14cROuq5CAuZyFRsuY5qzl+sXI5cdN5MXqpWhoeeZ2chawpfSvMz00aQoGtIQ4U
 HyiHGSGZaWIH/4OiZF7/0zf5RtJhZLK9VcTLXFTg65v+96z73ZDUyCsA2erGEpmxW5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347924;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Q4UvDrFSwb1ugpbQlWGDIfN07jKTHGaloDMKCYcUVeI=;
 b=AIQzoM6a/i27C4ecFyJi5LYHKzcnXKR0ACr9ago+vQy0KmNlBgNyKsqO0RadRSwRxNv5
 JcYCFDS2SS3Ot1h6/mj9OmSYe/VCz8JUt7AkDz6GqKSWFV3CGW+TV9bOQ+/JzWOLa648o
 1URMbKAhmrHup5F1daTFt1+iQt6SlpB6xZ3FVEjaAKJaUSFovf+Bam5NmO+VlzbNwgDiM
 LntRPy9TMo+CaXRs4OnRvYJ497yvA9EHQlz72ezHBbM2Owtb/Cbn7g2nRiQ8nJUa20KAs
 74H1Fjzr/K1rr+ZhLf8nzDIMk0ebI833t6joJgzSBKwx/My7A316buUORwQ5+isC7uw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Sa/vhixg"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Sa/vhixg
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A75A80D7C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:24 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-4b1fcd3b1a9so384381b6e.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347923; x=1792952723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q4UvDrFSwb1ugpbQlWGDIfN07jKTHGaloDMKCYcUVeI=;
 b=Sa/vhixg0tN+fHEL3pt9NEu4j0VBiqsRcdgo8BxsHxPCyIZo1neJHiZSWsdVlMsAEG
 fmSBpzfQncKufyl8qtpRiYP8R0c2hFOyIidvY3algaOkYB/HqU5A8WwGjJeILpHijaQ7
 azG3VEDFBzxghUabbRg2k73bvTAunsxVSPdo4i3aK1LycEs8grRqmdH0EklUIxtMz2jr
 jkc9iCBmeiwtjnM2wMamp0VAL0odip86Ypz4NzUF9jqm4w0ovOJuz6J2kdBve9dnMFbF
 NhlHbOxqTlX2LNY2uoUUYUZOP/nzafnMMGhD8yNdcIi/83aSP0MPSBB185zlLv9lHNys
 yVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347923; x=1792952723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q4UvDrFSwb1ugpbQlWGDIfN07jKTHGaloDMKCYcUVeI=;
 b=ow8j2pwPxgw9767O5bDFvTR6UeKgTxN260oS5FcBSn3J0VUzRcnm6wO5fX3xFEqigv
 MRKxLHl59qL2MQk59TJ3PDFxi1fDNIAfeir0LDmqPSb8kYoYGZ99KrJYgwZaF9mTB98Y
 lG94I0ro8mQOA9znar1clIlMhjf1L2qJI0eEVMEAipsnp3Me1iR/1QE9JuqokNURaRZK
 b+Mhhbc+wknGjk2O6ZgsfW3UxiWprx+vUl87d7BmNjqR8Ue13gItcdFycCQbje8QiG1X
 lXpwDaee/l+NQPwgQSsAN6ZiBvgiW8t2tkInuo7L70JauFyXyqEliB865Du8INILS3BW
 gIAQ==
X-Gm-Message-State: AFq9FYLxZN1EPLKoz5ly7Z9TAD5HTpmQWMFW3ZgmYXreGbSTgHYGw3iy
 3AItt1FHBeqxGQfQXKOyFWvbT+M7F0xLv39/aUoUuFSrMKS/Gq8eiI2LjuJQpg==
X-Gm-Gg: AYBFou3uLNv6J40d/Qfe4hxQIuR3Jta9LzidLAaRXICN16QCjtOlypsL6SpQ6I4ATgK
 NASdIwAAD4DT21SOBOUA8NdAGTTAoDl/+YRx+YW+LyLxSJZjI/QW8Sz2ydBdorYILPo9OuaOhVv
 Iaz9mr5l9Bhhn+CJ8j3mFJ9G6dWboKPpmFeo8Lo6Vx/ZIWIHm26vWDiQtqkHO+ZTWEQSjvkx9Of
 cwOLEoweGJnaKJmLySDjo4yzgFMd25oARXMttlV5nkd+zf9GIkxqN5i8LpribsuZ83YmQAtMNrx
 MOYm2+n1/DSdEoW4AMEw1QLaAgsU7jQWcnBAwZAFbEDrEuJRAzciqSnyvtABEDYONQDrPsSejp/
 ymkKeoswNIpwkFErCzdsiAzGoj9rCR381Sg0hsrL/7egdx5z1AmHCg269b8fy5UYub5L23QSRms
 IkB721B2G/kqKhA8LJHH/bxpViNG21xwBrPoiRBkkSUE8+ray8MSd+20TkiH9PUbWlga0/1UemU
 ZiYVsgsqXzzntj9I10vFEKQ1WvLMLl/lLBiv7KxeX+Dw+82TE4NTFJo0x0uyag79VmOiSU/KJza
 1k8rFZcq2vunkeKcuA6m3a+7HRuD8qJAXNDNSy0Xtpinp5ZPAbB8pssB6EmM463ZPqeJ+Cuaibl
 kMbLw/XGrpFDCvjXwgGF/ABueBFjkRlL9AdY8UZ+D1t0=
X-Received: by 2002:a05:6808:c3eb:b0:4f4:2b4c:d66a with SMTP id
 5614622812f47-53ccd014cc9mr4373577b6e.12.1792347922979; 
 Sun, 18 Oct 2026 11:25:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:48 -0600
Message-ID: <20261018182507.536698-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-httpx2: bump to version 2.14.0
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
 package/python-httpx2/python-httpx2.hash | 4 ++--
 package/python-httpx2/python-httpx2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
index 2570c6df1d..3c14598c5a 100644
--- a/package/python-httpx2/python-httpx2.hash
+++ b/package/python-httpx2/python-httpx2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx2/json
-md5  29186979393f62d61718c3a525f8163a  httpx2-2.13.1.tar.gz
-sha256  e48744a19e3af5ee48313d0ce5fe941d5422fae5705ea922a4aabf94d7800dfa  httpx2-2.13.1.tar.gz
+md5  3efc94e9a67ec11572873e2f32d50cb7  httpx2-2.14.0.tar.gz
+sha256  47ad61a3c40282cd8d0dc96311531f00f5bfc71a066c6fe3b36d8f63fb9e4f6e  httpx2-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
index dfd6bd04de..b75a36f26e 100644
--- a/package/python-httpx2/python-httpx2.mk
+++ b/package/python-httpx2/python-httpx2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX2_VERSION = 2.13.1
+PYTHON_HTTPX2_VERSION = 2.14.0
 PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
-PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/d5/44/474bef2a0e9d90f1715d32cb98b0738695ca17ba324095fb2497ed7fbd59
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/e8/67/58353f1848b4ba568e1ec22ea1e0d8e039f0bca5fde7e2d1f07739fd83e7
 PYTHON_HTTPX2_SETUP_TYPE = hatch
 PYTHON_HTTPX2_LICENSE = BSD-3-Clause
 PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
