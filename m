Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A36606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cSwLHFbm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gf7JqYSO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF55E605F1;
	Mon, 19 Oct 2026 17:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vBWzSWvbddw; Mon, 19 Oct 2026 17:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF39260606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430340;
	b=rDLhYNUIOGi2m6LULIA7Z2z+23Ox1/dOaazACV+DzgAtqYA043uU8YaCIHWeqDr1Kx8A
	 GcntXf8jc6BShbRrIpF2Ugj0alfrXS75H+5ILLcv4dbBrjHQQ6z0W+UuY+jVXPjnMJkX2
	 ZUesgLcJLomyC3DmMUeJwNNIYiUOsIKwObOwqrjXDIrG/3H2TWmRtLmBOkJas9XwlER3v
	 R9E7NIcr7YAXQbnl7GheXehiGTLO6YeJTZvPEbILirjmoeHPUaT54q18STsTzBYH2yxjV
	 IfboVWq720XO1DGQeiRBoBD/aNFWyb6FoIJrcmf+VoZicQmaxONWV25jmWAWmYdfGaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aR5bSrWMHTHPC8BsePzCo4rOr0XE/mUDlSSvRSzu8Z0=;
	b=qffkOz4LsLCupOZXzIlzMD7lii/vaKz8G+6Mm+pgmxBEIbth9TQrd9VPREdArtK97l08
	 gLkxVa2AEsFtDvHnTdPDVJNC3V5kccZ3VL/uUpaBex+kWPMFyM35iYhj3AfZmAdkKftuW
	 uM+536OMn4QhRCiJJy6OsANU7S/y+9XtmI0+nRFgZ3Jnx6Bwuo8L8wH+2SuyAyyAKxIbo
	 NA/vUXsnnELpNb64qf6loXGYqqWcJI/W0aIcw4dExRyx5LGxp3r6WbXjqKFQp8id7Adym
	 lB+S70oJF7WvGw2ZVXr78T0JEj8VfIu/SasWwGTwJtKjcL/tL+Beh4MI6RIAnWRhvZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gf7JqYSO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430340;
	bh=aR5bSrWMHTHPC8BsePzCo4rOr0XE/mUDlSSvRSzu8Z0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cSwLHFbm19+lLLPNJCFeO4JgNqd7EV01sjDRK38deqE5tbmsz7TP37fV+qRSb4qsC
	 OAKLgbUupBxDAHd7GxkG72mcHMNxY8c3cWoMjHSKIx66ieZl7cyCPlWvz/DBsRLmhI
	 GFXTI+UbejoozVMOzFhtLkbTuolKHiDB/pveLawB7na1+Tcw1M3cl0qqgt7fefcbPs
	 Lw+sxQDg1ZRr3LH++5j8xO1udoXXi4oIenWSG3lkvi/HKgH2PQ9qgIBpbA/67vSOsh
	 ts2HQ2+Sbob6/CtFCv0SPCWPkXxEVhfQ3OnEzjoQIaorHI/sCwlrcrLcCvwXj+XvkX
	 dLTfgmIgKiV5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF39260606;
	Mon, 19 Oct 2026 17:19:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 166481E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07FAD60606
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7zk_WRSUeU4 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D99A605F1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430337;
 b=D+FA9uip8AiibRwKBoO1wwPPa4s/UXdMF5LfIg3UY9erZHM6Qdbi249I8LlnCBG00BRD
 KicQ2yPxq2RC5kcNTGX6t7XL94bJ5kbEiR/vE21ETnkBCH+DnFRgRRFrh2Lrl3L19b0+l
 VXrK7vjIpm/cDqxRoe9cZGHBcgG+Yufei5j4CZcAMXDNn3rk/gjFxmbDchWH8tsFUnTVr
 b0eiBixXLoda99dJHK/hroOZ1yiyYuT2v1tqlMM7nVwV1M53ym5Nb5ftxtYfViNqX7axK
 rI4gPPGNyFDgNS48w9VBq1dP9g7GeSMMQd3QYrlfxl2DTn6gMjXhvxGML2DJ+NZMa5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430337;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Asniv2GLxUqKgRJoyQpAEXWjmTtUR4KEQDCIBM09U5I=;
 b=pSXg1T9RCs1+r5X2mF4WaUYTnSMvhYMNvWejuhM5pJYsPF9nGHj67byovVURu5eTw9/x
 d22DHIjLxDJGlxPaaQIEjH+PDsvi30LCKXcPgjUqNnC/ewU8N2/KWLDTJoZISamvWpq3z
 YUaPqqy+gEicl1Pi/VaHsNXvQ6KDq6Dxy4okC/vINN63a56UcAneqz/JhwSGlpqrdJvn8
 0NDiC2rq0/RKSfIF7Iw1HMzRi5alI9OTspeKPIm1Xt7zXknsRip0ZQ/hhJpYWq8y15CZ4
 xBdhjt4ZxbLO7al2CPRQIlYkg90sPYZkA4eJRTw9IzjOs5LBx4uI8LAGTExMbtCGSvQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gf7JqYSO; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gf7JqYSO
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D99A605F1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:18:57 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-54cd7de2d42so62426b6e.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430336; x=1793035136; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Asniv2GLxUqKgRJoyQpAEXWjmTtUR4KEQDCIBM09U5I=;
 b=gf7JqYSOzQ2FgmAO5JOSYz6G9zVqXWJTH2pCSzYklTTnxNd+hJ8HO8AtPVvuj5Hjj5
 HbSsDC4aCN9mZYW7k4HuaLOtg+xCHmmtHu44ia06EbPQyg0RLVXemzlUI/CV6sFv2E9S
 HJgXEggVhUQqJ4jFQgmJrHINj+GNoIQcvZ5QCO5iwOew88NbXZ9QGRD7+G9fY3eFl6p6
 2IR5gNE89N1U++ZSDJOLkukZ676/C9WCjH4aD9cncsZNwJtbLjsY6ssELzxjNxkR84TG
 Z8Xr/ebpjMQ9yC+YefgEu91kJXDoeav3qaoMSi4XV8nwx2oziwWfZGaJqD/Yf+M+hT2e
 bAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430336; x=1793035136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Asniv2GLxUqKgRJoyQpAEXWjmTtUR4KEQDCIBM09U5I=;
 b=cQKy20xDwIaNP5g5MWtgeKOtjiQpL4bY3RdaZWEcO6HIsZiVQYB32/Dkgb1OZOGW2z
 y5ROwiJLOfGMgqNszJKBYh5zWAAp0cx6GlHYK/KV21DA8IvUCz3wEg3nA0LhL5b0V45N
 iUTsnDyPMQcWbhe2LZY6FpBBlB2suYPoibzppIhcL/h1gqwp9VTHjgew0EKf3RQ1eBSP
 WY5qKhLoS3qOMPxxj6d0hdFSGx68onFyAR5EOFjcA6LxJtdiydNmp6wfcuJ31g5H7XR8
 +rv0ZWn1vjWOkJpyJkr9S4h5Gk0Ons8icD+JB0qZU/Fl9GPXxLTT6UW+v1U7LUqYRLzJ
 pnmA==
X-Gm-Message-State: AFq9FYJy7BGgpbswxrZcwAFCcCsDldWSVqt+BtOScsy9TchYa8GUeGOT
 EDWR+tzhtC+IT4TU8aEFe3TzCKQJ3jTpl7H0E6yhMi0Fsbu8+ShuZ1HXvByeeg==
X-Gm-Gg: AYBFou09H7gKZxdzwxIaK+zSAybhHkuSERhH/ETrz4PK3gU/gk2t7yA9eTAbURfkGez
 Q6TiG8hWmG2yhgyX9eoIR4h3819L7DKgu6MW1z/Ovy8GDX3H9jKW6qorAsGE7034BMOf68ZPs6N
 43LhIxkkk4y4zl9EuFpQWP6gKlG4Fi4VtMbgDk43NXjDY0VzhxuJVwLwfPN5W3kgb+wqw86Y4Uy
 tPngtm0WEyEoL6+zkDgdgbzH8T1ndI3ngSowxo1EisQEOKX4ZJMNsymB+/rcpwp0UJtkhnMwsKw
 a8sTKvKOV/3qLFS3R1amW/fCyRXfynXBFLawfgFrBqrzAfYmRHr8CJ6Nn6V39C3CyM51xsuoGqI
 VMfElo90gjGp9QsWWpCVmNluVSxC77N3vUvhw8ck+yChah1JR7Z7egMkogg1E3O0Jlig8p7Hank
 YN59BzvQluXaodOFZKEiLOzeSkxCSq6a6V4OZPj1xjpZvWi3A9zjZcbOUUlE1eYcDq6caqUXRFE
 yz0gT6dk+Kfg85z9lR7XUVGJT4Pxb/O2taG69EsU4a99jhwedLY5XGNOFAocKOVbwH86eBWdZJ3
 jX/CoawWo30p6h7tbuCBUmAwyZSpRGvo4wZ7FdmkfqG9SqPOj6up1dWTu1u6IzdteODq3C133bo
 6u92kxE22y5EQHXdu6qIHItb+ibXPwZy6kLo3wrM6QA==
X-Received: by 2002:a05:6808:1707:b0:4c4:5f5b:6918 with SMTP id
 5614622812f47-53cd1cbc0edmr6629582b6e.16.1792430336035; 
 Mon, 19 Oct 2026 10:18:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:18:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:41 -0600
Message-ID: <20261019171854.734871-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-autobahn: bump to version 26.10.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 64715ff622..724045a52e 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  d6e43b49c77a11d5b36ac8a2da415d0f  autobahn-26.7.1.tar.gz
-sha256  c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245  autobahn-26.7.1.tar.gz
+md5  2958a002f07a91d6ac8c0ce3ac50764e  autobahn-26.10.1.tar.gz
+sha256  0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a  autobahn-26.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index bb411033fe..97ec7b1b0e 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.7.1
+PYTHON_AUTOBAHN_VERSION = 26.10.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/de/73/f109f563c27e048e45d135d81af19e6ca391e24905550b06bd1c9d674c57
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/df/e0/f0a9218a299f0d79feaaf62042812629bb7fa0c1fd6d044a6068ee7f5c79
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
