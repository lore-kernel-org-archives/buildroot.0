Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A2CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FC960DF4;
	Sat,  3 Oct 2026 01:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLawFr_r9g2D; Sat,  3 Oct 2026 01:48:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 67EF460DAB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992139;
	b=qG7iaSgTvYl8DSIJ/BszmdfdptFZ1WqvuvT0/MzPjIal+WAH+5Fr7CDz0t2dDut+E3PR
	 kqv85R20KUkE8JMsRNwpl2DOU6LFr5cAsfa4Fk1F5TZmKumJubgRucmgU6/3RPPggk1dR
	 rWwMrFDt0bhNOzwlruUr+HOkB2so8yM5qpqc5ZwYoU3AwqdM2hW+zOYmLYrlbOZY1LV9m
	 kJToFpKuKVoK4Afcg5jo6BRjHf8IoEFta5COcS8gw0+e3YGY5UgIVL1E3SL4v6hTMe3fk
	 l144anFoI3YGw3pFKqj/dTwaCf2QacbjsBzGEaeA8iFSpE2EDLd3ODoxhO537iwu1PA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SSjOE7XzykJXsSzBiexfo0cTA7y1altZfXyEPNB2tuE=;
	b=W7Osb87AGI2k7Qx5vWIgDShxrVP8g5k5uSmo8XJT93XnzYhXgYOhKOtm0UKSOSHtMwHi
	 tBq43Zdp9zKLlzMXFovyWrmxcD42zuclFijNxn4D6gwDi7DmI1EzJ6RHRC0mCuxKq1ays
	 NzNlbVRNkgFD4KPJ6ppuFAJPlw6hS7YR7LU5pX73c1z6jKGqyJlYWnVe3vnnzQI/tL/t5
	 tmvH1didG64uN81P1OFubc+UY3aqx32gMuqulTeAhcJj+UNVgHg3XTHXXQAA1DXdXDbpB
	 TzAYdBB/IkJ5Yh7Pcmv1TFusoCIT+9Jmw0Agf/L2AJ8VgqoOaiXigCHYKLOeyW/ktMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992139;
	bh=SSjOE7XzykJXsSzBiexfo0cTA7y1altZfXyEPNB2tuE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Fnm/JQX99vwEkkU0Z1+w58N454DSvvU4GtzTWT4v+yIgQ+u8K7ReO94pLk67Na1xa
	 gTBx1KE9+zyatzrzlUYNc9LcaQNPBJX6NglgeyGdIJ6rY+KnZ3of1wrqmCMoiNhWDv
	 efiGvZ4p5SnlEjxiAwAd+CyEJ/Sa0iPh6JP05ntYu+GI1M1ySez8C222g9XfYHM1yf
	 yzvttuYrt4gTVvcirf3RPdlTSulOWaouCUWQ688Hzk9DdnPRuaAQaiiDzGeqov5QPm
	 invHBqxem/Vi59iHeeq2ORp8IrSwfLcwEkaZcB7lt/gYambCXl+FG/Nw8pv6bHj1Rw
	 EDWJzxVdy0RiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67EF460DAB;
	Sat,  3 Oct 2026 01:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1253A34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1033C40E50
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEXnAmwL7sqg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0DD3E40D07
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992137;
 b=qrGbnrQuUYq/KJ8aU3N3RUXCDhPLpaX1iSts0NMITld7gLbDcJ7MdH1ZHCQD/fVyqHL7
 NIw8hsK4smzRqcihRqFq8YpDMbYitMHyA0d8DAHG2ulc9gKUNzv/i4PwMARFaFw04+XJk
 2i9VIXjx+XJOVC6Jnckq1W+YoYX1UMQ6VhqqJC+nJ3uGMWcEADZ0xyMptKr+paK+YIfQm
 wiwhy2a0BYUlh7JniLU144GqLgjD6g0bToFdxE4bSn0kr7IuMogwU1KFanog5ypSeCQ+o
 ZEKrWVhdNDewhW8aJI/sKY8lH13uBvYG+kL0ALMa+WJDu4k4wi+FkmbXOPYkse2TucA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZjcefQ8oDGs2QdKv2uj718mSU3/uq2REYoH4/V0PyzE=;
 b=lQtLA6+qwxmI2PlRlrgKVGzipNB8pwZth+MS6L/wM70/t17WzCTLTy7bnYEc7nNY3RJm
 f73kvDD5DJaayQ8JqgeQJ9vEt7JXOOL6Y+xwwx/lEsmFdP15F9eTTzv63VS3DtHr6Nf0w
 Oa9sfM9uj/WrVYxtY7C24Xrjp422IzJNxHtBjEA+78ETNwkbvYlgRLGa4fXqqSaCkFhKb
 txjQog82dPx2ubjN9EljJYfSAXjqDcsJbmluLZluSeyqAtz1/j2HBDhUG3l94zuAPSLuS
 bWk4AwSv6A50hX1sOmcX1isqBt43/ga1J6285kLtXaBRYyhpW766u9YNLKSOwOmN9MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GFmQ40wt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GFmQ40wt
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DD3E40D07
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:56 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-81b15bca7dfso389834a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992135; x=1791596935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZjcefQ8oDGs2QdKv2uj718mSU3/uq2REYoH4/V0PyzE=;
 b=GFmQ40wtDQcZKZx8cBUUrDk3L1ahaFPDfD9pWt+k2hK2rkmEwxxiOUkX5VXLcezGkt
 J2yJoECNASuf5v87N8KQFSZgAdBwycIQHZ8WVnyAzZ0PaGF4ai+1UelpGvMbQBWlsCZT
 V+RrkJ9TO/KfjhhJWSRsPM1B4PTC2jm1wEjmGY5jT+3LdZebHdw99Pw5FNEvbRr9vlVX
 8kV3UyIMz5+lGN6XneGR351MO4MusjXQmsZCJPYEST8EwFitNM284FQKZaxNGwMnxCUB
 yD8BmRnWzQZRS5yskTt6LPuQGNWjCf65w1ZHrL0NSEy6di75zmb2j20WXvUmZrdAu6EH
 QjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992135; x=1791596935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZjcefQ8oDGs2QdKv2uj718mSU3/uq2REYoH4/V0PyzE=;
 b=YIgxqka35Kx7jUB6O+ynEJd60DV92mNZ5cg36OeupOUGVPyNF5GSuRDFgNQwbKrGD2
 7sSnYR3Ahl6Xt+4plbbF8ShdGul6phBnJ86N9n1gPha7d9N3Z1YaWExfaCrbybCdDroW
 kAysJV6iZpMpcPIruaU2n6SOGa0b4YG/as4MmGuVuHNr69+Z2rDZRQwlBEKUmV1oZA6c
 hxwBOcaStaHWpnByLSrGw/i2uldNrMkaKqfSkBTTBK6h1SJXgRi/qNhEnwaYV4ijwu92
 AHmOOvgJ4QoJx+gP9a5tvB9yT/el2lB9YQ7jrMoqYF1K1fpmRNmU4oh7d8hnVjBXlvQa
 9J2Q==
X-Gm-Message-State: AFq9FYISLo5PPybSMwLbvB/7LCRL+DsZZtJ83q5c+WhJJhPDJI6dK0BX
 J2N/Wx4mTD5tGmIvkLZQdGBdE2Y2gehDB+AQGgCqDF6gysLO1wW80kMNuq6Odg==
X-Gm-Gg: AYBFou0fc1RKKrrXcgOCwfqJwoiCDLPh4hjhaL60GLutqhDFmwN8kHZbBEKguCkqqGP
 q6k/CyQtaHLMSRScKvjdylUzMoJGvMEAMW7R4SV8phGZ0xtFF4zM1ikhuXV1xIcjP7/0huCTyFC
 YqKm6WaZ2zt0/GRqpxqZ10owtA9IK30YA4Ss/YcCTGGN28lW5PMG2rKdbwZabfkIXwA/dCSFUEd
 x2Fq9qYRcVEEwaeIkXokrmXARQwNyr8ziIpYYV8kTb3YmLTR3ubTu+JMwHsRPtet8EzRMWbDNpN
 RPEeZG/PyYjTW2fVxYyVzIbPEEqVN5nC4mGPDRzojhwAknczv4XQYW4auQzZk3dMrgspUC50rXh
 8am2k3MIWWiiNBwLd6zYDkceSErOuVwy3XfsyRu24Pgw+6KuVCQ0PEzDQJdZmtwfwAF2eNoGfX5
 0LdYi5/dvv3h0k/um2sMVCuoe4wTEHAa9e6KEMFKfMzl8+KdPR1NoXd1Q+qdP35ndT2nDd11h0o
 z50w6h4Vd9LpMCsFJGOjhUM3uU6Id9ZAz9j/xflb0zMiDL4jmTPAoWY0GInRSu3Nged7HpTrIlD
 3JOJZJo183lVQ3Mb+6zShi2itCn2HbtgizOeLJrnR3z1XxbbB69gMpT7Zgy1akYB+hN7h/MWArx
 wCELKZR2ZBqXJcwWiQSfJvG/1WLQC8OvPkHDC6GWfom8=
X-Received: by 2002:a05:6870:1b12:b0:48f:e0e5:a1d5 with SMTP id
 586e51a60fabf-49e15ee8d78mr3613397fac.42.1790992135531; 
 Fri, 02 Oct 2026 18:48:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:28 -0600
Message-ID: <20261003014837.403895-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-wheel: bump to version 0.48.0
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

Add host-python-packaging dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 4f0640bcd8..346962ea84 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  3e73dfac6b3b47a7d1cd52e81885618f  wheel-0.47.0.tar.gz
-sha256  cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3  wheel-0.47.0.tar.gz
+md5  f668e4885de814378b332eceea04a8a0  wheel-0.48.0.tar.gz
+sha256  94800765601e9171bf5d58d066e640662842bcedcbab982b2c90787a2c987322  wheel-0.48.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index ae379b7ed6..20101cd406 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.47.0
+PYTHON_WHEEL_VERSION = 0.48.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/39/62/75f18a0f03b4219c456652c7780e4d749b929eb605c098ce3a5b6b6bc081
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/d0/20/50ed6bdf27dec98b568a8ae25dc599f35baa3d9709f9e83fd1edb56b9a90
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
 PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
 PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
+HOST_PYTHON_WHEEL_DEPENDENCIES = host-python-packaging
 
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
