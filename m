Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A88CA5FE4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F1740DF2;
	Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NAUVulxdLr7; Fri,  2 Oct 2026 20:55:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EF5F40DF6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974525;
	b=B7gCgA2z30KvWHQgAk3WurCLy997GCusRU3Xic9nSpkB+bfgUfOJW3EKni61cSpOySPI
	 eaBAdOnlzrmPH4nOfdA36ur1DNQ9BwMf9n+HyK1ytm6Ak3xjqOIjwdaW6o0pise53qOrR
	 FWLHZDjLqwEEUa0319pzDDAKBm7kkhH5e6bP2EQK+ok3BnIvIWSm/g14vW1IeDHcMYknB
	 MscKx3mHHBMc9j/goYxgS6w/qC+3a+a+1D6zrreMXJllwtLxHEQILsPqUQldL6gFnrmmD
	 ECXTBnHkuGq8cFQAsM3XjiRvHUTh9Gck72whDVLQaYGXy6JEM81eQa5oolfLL4Bh8SQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974525;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1v4e/pQPwcp38quIvZmI+7DmsghjwTfZPbZqMG0WPns=;
	b=aZTUJB1ga1Fr/S1vvic3/o/pf6jPQnXtM/TesXmaxpz2fMGRvJ6HPFMTDBZ7sLMSszXq
	 8AnXYbTdEYyZ+/88JYlYWHcCckLSdDS3Sp1OtKZ/jdJegosMcSH8tBgf44V5v46pHQt4Q
	 dG9urMTsBOk219p0yX/qlbxA2TKfnawZo2ln8VI+eIU3z+esgHgpSc6T/gWx+d4ww6TYW
	 YCz5Oo6NaWfmLrn4LWC5pRHc7KezAmxIZD4Od95omqTX8/4Xq4dOt9hbdemiGgGAaqbUv
	 adKLEHgfEgsWrD+XjbfieGlCqaP6ut+pnqfy3poOwfCGDsVDPtPRPyaz7VvJo8CFE+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974525;
	bh=1v4e/pQPwcp38quIvZmI+7DmsghjwTfZPbZqMG0WPns=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NYMXVPGuoHwO/6HzAZYNAELdFAP9ZdkBXeU2lAByDepW9FNLcUSQh+fnQn9vBzRAp
	 3fvV4Va/lNHYcsY4/pGlUptwnN+DsRycSwxMToAySuFbqZ9nwVKd7GJpTCA+2uHe3m
	 Yqmu89A/ITd+cgA5uHFyXbWJxDQdAcsVH0/hRqPv0hlHZHqPTRJJtylT9KcqaldopC
	 OYJWrkBlWVHt35F3gALPNbluFNS2UEE22Sz1v1pwJk3j1YeRgVvokx4w5V0to+9pEs
	 00pMnZPRgZ62divbdT+2W09obJEKuMwddWlTQ9RvhIPePNz1Z6jZMN6DRAxPeKLyYg
	 OYEt4BFWVqHFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF5F40DF6;
	Fri,  2 Oct 2026 20:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0904634D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4FDE81368
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_xUOycgw0vF for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E3A4F81363
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974523;
 b=i3Jitpj+VRBBT+azYcvux8C2LiHtDpyeAof3lA39yvtyecXtMxZiWIKbbORlodsYm03b
 jsfiAw+BtbqK1GtY+llufzInuLK318EGBJldb0QO+fyiZqRIz5vxhv5PhfHnZUpzupK6x
 oy0A2nDW0+Ihaqg9MGVL1vsov9RYsYJGz9OI2E0x4lJQUVHpcnTE1eCrfLfWDFz5Iwz7J
 +XQLTeCjtooU7rvm3xjR5KQnKENRbqYibPN1H24dAqQWcJZMtndiQCmq234SCRuYrnrSF
 VUPqbh9N7p0pqfSk82W3H064v1cxSarqFQKzQk7sJ/LCZCYzcAyrX919MP2xl0hFyEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974523;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hULLAn46ABu0L355IVtC6FIIiLL/SsC2g9SedwZn29s=;
 b=N+AHBrcW7grP7qL5PBvFi7SsDTOPUyAEpaceFRmbWiwrDW7T4ruKFARNrmvq+UHJzgkA
 701Zv41yToZ6rtGlm8tOokuWvuDgrz3gXsG/bcUo5e4/j4RPVHbemgUtkZvPXSaQNXjdt
 GNG8igopLYV24t1K0l9qyzQqsHhVBTcwsgXyCaqcK6kZBc9IhCS9DA2mIWJFpENhFsYdc
 agx7kzT/usoD4IOwzi1iXQfbnt9jq1Y4gtryRZh84KyT9FQ2jNMc9CdHHfe7Mkk/+AP3X
 zA3Lj6rFDeHdNKdgYQG5AUQAh2N4zVRPtK9V0i1Q7fHYaHYtVwWc0PKVoL8wWc3XIcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="gbm/8J41"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gbm/8J41
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A4F81363
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7f48c750afcso153973a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974522; x=1791579322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hULLAn46ABu0L355IVtC6FIIiLL/SsC2g9SedwZn29s=;
 b=gbm/8J411NkMu/XnfONxWCx3AIBVKCyo/HEQmp7tt0Q8uXYwxqUV/459r8JGe381w/
 njjscdZIVCdXCXrCG1DbH0QhWOfAHMrwqxM+CkynDRdikMBap6t5ZYpA3avG9BL5Asdt
 bcljEw1Na93uWuPu9CbTSrYflIptfxFaazJQB6BMzvhzjcw3RbLnyETmkW8d1D3E9Mwa
 9pc4PGX2JTTrXmNc+Rufm+H6deOv5U7negJxdvlwxr3y35JjA4GhFbRwgPqOPDxzliMt
 /R/gSPmop45kcIFEMFhaIDBySsR6h3X/cVHIHqkztD7tYZ0wSukhlv960pWkEu5R+oK/
 za7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974522; x=1791579322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hULLAn46ABu0L355IVtC6FIIiLL/SsC2g9SedwZn29s=;
 b=k5VSP+hpLc39jfjY7U+R7jtLGcPY4bbr43kAqocz9J6KDI0hA6d3M7d8lHM1Sw6rPA
 73/O1qp9GlIAIICL1UWcdUSHtD+MoUVrpuYyp96AjVES0ds60NO4qhxwIe93sIJ/3VY5
 tryAttbbOQxbpe/nqzcSfRIOWxz+E2ZKCpbe8QZAX3VuMedK5FSrESAmWmr/dpWDC716
 822mxxf8bmEUcHumF8GEM7+nOezKskF2vsqBR+gz1e6l0joYzZnfzOjvWhR+7YxUIw21
 zxa39rDyFy9j/JmtUhUllDo6ze+11UBZ1Frd5NjblIEef9U0IPV463Opgib8TuYmnbQW
 +rgA==
X-Gm-Message-State: AFuF++k/mdAhLa8f+ie1NdXKn3qvk9x+8Djl1f5GudQ+LLNrO3SNbkVd
 8HOlJo4bbjty4bgEBS3GmUc0r3mDSbGm7pHnK8M7Rdm3Wgjasl5V8MNplzmCfA==
X-Gm-Gg: AYBFou3EVOQKHx3SSrBwG/aanN9KwEZNfExtfyNGblei0yDakjYDHn577wD0rlkpc3h
 Z7cWxicpn/i2EBN6XzsqlL/xek/0S7eRZ/3Hcepa9A0LD6aqn3XsoKyjEFi5GVq6M/j5JzLg09f
 ifwrpZpRPC3SNyblamfZvM+0PWtWA5RaFZT4j5olizRh9Ldv0zq1K6FxUELeNUTIusNF5RclxpO
 zwW/HKQynhZvCQDtljSPj0hxJ+AM2FNKGS0M2vL5uoefD5PQi9pCImsnFWKyAz9aE8lP/CCHv60
 Vue+kEBi8DNDwPMcyqcSCWlWPnJWZcWNd34P2/8w2pSPzkVigEECd6zTzPjxKRyFRShzZipSuH2
 j0lhgxPmBBQ3WxgmZXBSzyCy9GJDwogw8u8QhYiOblbcLMrxUpNU3ULy8RcuO7Jb3LiTMMq3xSO
 /lREOHiZondYsnu3t1klJbV7EFp1subTPd5UotAHaQ7Yr/FMoS3KZworxRfML4bkv7ssOCbj9f8
 2LFfrMypmz4Q/Hu+eVsQ1Pl2rBLbKCg/FaY0qyVtcIGg//AexJl5iDYJqnj4xKJ6Qt4aLODoUMB
 HeziXgFzv+o5u3Jg9qIi3HGG0PuScb2IJv0rZ4901RkGlxbZy6dZgRMRZmSP75r/8guX1lr0/ZR
 Z56rGs7KVHsQx3/B5PQoPpIe5Sp15yLP50yUVXKxc+g==
X-Received: by 2002:a05:6820:1519:b0:6c2:600:3129 with SMTP id
 006d021491bc7-6e09e57dd2emr458111eaf.58.1790974521634; 
 Fri, 02 Oct 2026 13:55:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:12 -0600
Message-ID: <20261002205517.4043570-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/python-idna: bump to version 3.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/kjd/idna/commit/21cd5ddac6a1cc5e2bd4ae9e477ebe5f103f8225

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 188f290f41..8b3abc23ce 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  9a9c33db960e0d35cc5b257c37dabeff  idna-3.11.tar.gz
-sha256  795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902  idna-3.11.tar.gz
+md5  922e0f674e2ea8035ae7bc07652677ec  idna-3.20.tar.gz
+sha256  a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44  idna-3.20.tar.gz
 # Locally computed sha256 checksums
-sha256  b7a336abf3b04e180ec065cdd16e705d079e1cc7a14f910aa6e9187f36b9cd87  LICENSE.md
+sha256  1a9a4f0e3d479a27240ddd59a9137a66ab4a0f9dfdc8ca6188cc0bfd85187f04  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 2b654a480c..2fa18ef541 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.11
+PYTHON_IDNA_VERSION = 3.20
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
