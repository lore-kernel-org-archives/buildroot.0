Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220F4CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB96840DE7;
	Sat,  3 Oct 2026 01:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BQYs5z5S_IZ; Sat,  3 Oct 2026 01:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C67E540DD2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991199;
	b=MRnbwPYu5aikdJRKcqwcnNlTl3ztvCXFCET8X6gjh20lWf6oAjdGuLSHcRFq9dj3aRTw
	 FL5ja4cpnStMzMl0VZ9lC4k7CJRgQsCQDazKadhLWbGFMhhR8q+r7whY/oANRjL1xJLVJ
	 dvGt4nEq52YSnUTdBPO9u83vZm5gs/CfijIB/RvaMn71sTDYISkBGuQteFQm5ersTR/7a
	 Xhq8sq0uuBfRd3HxAiR1pQxuNeFlYNVBlTSVxAOIpG9LqN0MPKnv7+bepW66v6ewI+AJM
	 ent+CzSfEBxKN2rgbyhj8swg9rJjngkua18pAAOKa17K9wGAa5PP+3IHdISek4q8Zgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=43wRjSARAKhjOLM/mhE9OP10n5Ez3S6w0mLV0fNsHEg=;
	b=So0C/T6cn2s+pelLWl3CnFCsQG+TvGIr5lJYJU2kmL+S/7pymuV+5NW+CC/AVpdow/K0
	 2a4IM5swQ8i4f6Q1U7qcXmSTcD2tKN92lu7wPYyAyRB9b4/ARC6vqCSwY6tkSIJpJqYwU
	 J9OffDxGyYEU/0aenkgdXN8UVLPoXD7Xc0/ffDkmYmPh774inTRpk0JXudhYSGevWBH2W
	 f/sRE9QxYz7nvh4o+zkWWN1P7L3etKGHArnpe7CVr5PV12tcrK4bMJdtZbmAR1WF3Qghk
	 bZ9RZ8uLBshZx07NNjwPEWqoa3dzzoUwJv0T4NGwEW+GsjJfGThM71LJcPRBbxVUoRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991199;
	bh=43wRjSARAKhjOLM/mhE9OP10n5Ez3S6w0mLV0fNsHEg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n6ASqTOC2L0/rIRLXCj4qEC7qcsAoWtQMPmbxorWyRsMUf/R173EQHNIBrrJHtKHG
	 Sen+zYDTxpQoHIkKdyopM4NOX/2DyoPQ2vgRv2gnSy7e0NaMcRUOvE+T0Cg0v285QS
	 uOFt2GG1OHcFXQaum0lWtlqYhm1K3NkmQIvDxV0aiPRqexgEL0kdvFhK8zkxRSHO1f
	 acQB3ObjRxN/wWJo8A24gGMZQDxk5nVcUpd7jPBRQo+oFka/zkUGvNAU3Vw2X7tXQK
	 4T4yBl0QiZKQdrRADimgoj4lkKdqYbm6bVlFXs0TXuMwcoPc/rVImC8uzldoLrEwt+
	 ZvXmdBBE0bhUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67E540DD2;
	Sat,  3 Oct 2026 01:33:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EBE4179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0330260BD5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHt-ngO3ihqt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1AC0A6061D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991196;
 b=j/6cnSJXIeIyHAIQR8JVL7BkU09PjxfB4/SEBXJqPPYZmajeYw+mVBy1SIxHUiAPRwHN
 /TOn6uQZYr6hjLpGHqD7lfeQfidVjkc7zmbYS9G2FxjlFYxx1KrzlS5/bcj0GfqcgcIvQ
 3ruUDieC9dvmCcqsP6hySVyad17cGome8ZMfdL1EqhlTK/5aJSUOE+fOa4vawnrQKNwUe
 LOf8xTLbXDcfoUmOpcTBSXSmWOEdVNWq8KBLS31z4D/tOaHNFH2XIH+fhQ6DNZ44dnFfY
 9XtRYQE3XGjqCNXtNxRzdZ8BJEVcRm8kErz/Q9QqznVQbdl+nBFhteEQXHJaZoTj/NA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991196;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4x46dJ5xaxohcy80F2/vn88/Qo/AUFxnegHLi5oz1vY=;
 b=hJwpf+2rgAPWD3fNJNp+reZFL7iHFPsY2V/5EbYZFmk9Y7P7hhMZ8XrQCOq/3ZCktJls
 uWPtc/6wWwf8615MpvVFUi107aNEtkjS5g+yVZD8Nfmqd8HoPR4TGVbsJ7C+GgC6oTyTW
 E1MgeGbLYR3qzqcIkBKnT5h3m6z8dRn9AOC9msNSkvUdohH8Kz6kWnD68kNQ15pBErXo1
 KQOR0BYWOX0uEBc11B8f04Z76B1yODrzGTV83Fr6KhEWQ+hSEYTvkUKhDq8spR/W2O5xt
 LIm92aKeXQnWsNUP/aFMUY8qlGWrvVcKqhcs6PU+djAyH5aVE35Qgg6Y/kHI8Kn4Bmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AWqVOojf; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AWqVOojf
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AC0A6061D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-81b0fe50b37so286802a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991195; x=1791595995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4x46dJ5xaxohcy80F2/vn88/Qo/AUFxnegHLi5oz1vY=;
 b=AWqVOojfMlm/8ls0iZk0anv9oOjo35jVXRUgvORI7KZSqdBW6AE3nU9nqAtJZPUzma
 bqdAMFWFF4ypA2Reo6rWofWA0qCbyJm04XMXdSE+jm/t2xvn6AkMhgKClwmI7ugNNL7z
 l7MpI3F8zh1e7XaMn0lOeM+QQqImIxA56JdifWkTaHYCHyzATlGYGkGfFkUiVqbA/Rrh
 B06yW8a1dpTcsXhntZV4yYY3OO0ydjCa40c0PZ2/wImI1FlJ0jwyxoXq6mQRZt0GLTah
 D8lBPFT1c1LxW7zgct2OEhJNKh1e4w5jBeAWJaHYDo+FTl1y4xC463t1tJkp8SR5sK8d
 Bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991195; x=1791595995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4x46dJ5xaxohcy80F2/vn88/Qo/AUFxnegHLi5oz1vY=;
 b=l9gQf02WPUrgJXmiq3ImLB8/xlkQpcJyq3pq9mfzXdCQFAUfvJuU/HmU3i/XcMciPC
 frhb99iFt3F9XPNZJzARMM1lvuVkyu+kIOHW5FjYmttxVtC+cAPjRmjK28WxvBIQhfnD
 LTtn00FE1bc44i9/NNycBQUkoNJMpc+afGijumi8Kd5Onx072tVQCq+lGm8O7WHAwf9E
 nSRVSdNzMRHzHvtlm0apVMsEt8dAxsrb8wajSq43jVYv7oHExQO4tLfHw6mKRwacaS2e
 v9LYatJBQwaw160JI22skDOtS0cw+6NoxhU7/zA6sPNf8ihew8j1qZyIiE5NxdQq1o59
 jYkA==
X-Gm-Message-State: AFuF++kGiPG6XmeYBK0Li1UE6tl6DSFhi4v2jvMOmzNWnq5l/UKS45do
 wyteRDLFEOq+kUhOaNDyQi0H+EzV6MVJzYlt5sXRJQ3ueHDGCzuOcku0QnZsHw==
X-Gm-Gg: AYBFou2A3X1mMNnG0YsZWmWkYOz4fMR4NJjoFtWXpt5eCFcY0b1oqXcssjKr4khpbdS
 mvJYRevaxaO+Axuv2R7KCU55IP0mTGtkl34UKtIoUXWfRmJqSN186QqY9LYirnBdykmAuaM+E1t
 e7pB/wlMUGWLLPCi6SDM02yxX0M96Bz055zzZXlq6biHG1oIuoxXEkvJ260UtKnyB4g2C5EKryy
 jabMonr3+ALg8Ob7tNKGyoX98bWwEDpqt/gbmVhSlYpHfkdsUJ/0fbzIAF7SjtY8jmDZSsfZcKH
 oOwX/hW+YXa3qj2E7CrtOdp/qgV9FdnbrpELdRVns1HNiJGYLTq9V9NOoH7tyZlP+gyvm+1br4N
 rMm7NJjnh/kueJ0qZNLbqlIuqFsp4GkGaxDjwBngYhOxC1k3ghVfr4hRn6RYeQSxbbdHxtp96eR
 J2Kb4mVkkfqV+BsdadwLA/txu1QxhyLfbCprNUFp1LvFiDkV6hy36EIRIJybkrUgiw8cajgD1nx
 GGNfnjM70hpUfLAHn+CXklJtGGGhzE595sCenApPFyoqKtpkwIg4HqcJw9bZdJHvDfbiRpBXzsI
 xUJFKSm1NSyMyUvYei4AvZM7GQ6q3adMLvrIC/IzEYrqoWjeN3XT+4db7kkly/fRs5RxmzJrFP/
 SDW4hd7IlfhfAa7XGyt9xdIU+qdBRp8IuYmbDj66I6w==
X-Received: by 2002:a05:6830:2aab:b0:81b:9724:8724 with SMTP id
 46e09a7af769-823fcf154b7mr1072745a34.11.1790991194726; 
 Fri, 02 Oct 2026 18:33:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:06 -0600
Message-ID: <20261003013304.400979-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 2.1.1
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
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 347a6f3ede..c8fb41f136 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  5e897f6251e614f6bd128a73e81801a4  cffi-2.0.0.tar.gz
-sha256  44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529  cffi-2.0.0.tar.gz
+md5  32f0067c08d797dd28cef1544105caa3  cffi-2.1.1.tar.gz
+sha256  dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be  cffi-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5ba24ddc57067f9249add644c3afc41a5d6dc37e23433ef759d95df370b0af63  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index ab9068b101..120b98fad1 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 2.0.0
+PYTHON_CFFI_VERSION = 2.1.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT-0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
