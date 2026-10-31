Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B402606A31D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ad/rh1yw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzhpLAxF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4272080EF1;
	Sat, 31 Oct 2026 17:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bD9eJgw-wDsv; Sat, 31 Oct 2026 17:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4AB0E80F07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793468580;
	b=KO0UtFooe0Sgl+Znmq0axvLs27TvxOFx6qtFKT111JM0Y/G/8qmQcEvKKHiRZm9X7x8H
	 NGJh5fzaGqzGp01tLJpYRvkckW+66VDE9D7Suie6y5w8zdvCmLLQDcaa2XwlldzN29D1T
	 EbXtezn3B66FufuOBa5KgWoA0w4Sec6BYz+QmXZV5DCbQmtXh00NrmTOjYxUSQAOp0Ocl
	 h3Jah6ALYbAlZBfzPsdfKOtw9hHe1AiQ3X2371xxOyykqsRpGXWf4rXpmNNw5uszD9rhr
	 SqspVvI4fkXmkEHiAZRpyv53B0D2j1oXDPp2a964nuPBdLGWkKQNhvO+opFXYFQd/Pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793468580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nx27tY0ZZF/N0YRsUgDDinXK7sryw2fSPBQxpH82DyQ=;
	b=RZfcQX6DlS7+2YwkyMT0eysNLdsqbChE/33VkdpuN6svcy1AQW7QbVHp0j8fu85y33R8
	 QZWG6nJZRJSTpAePp9MUkAy5/z9sgpIVOSMrK0Szzb4YoUkS9llwT0V1jVnFYvK47y2k6
	 5fwOk6yxwIPG+bSmn3m4mi0nXmdCz4EtRCh0dTpepGg9Tk30+ZvTkXqgh7o22QVGY8E4q
	 moxMCtSwWYEGIaYwvZ0Fyr6kSktS8UOIVS/aiZqGlEhBonJA/lI9yiSyMrolDgHB5aSkA
	 Y22tJG0peIC2/alXeFwW5j9UwgfE/0z5oWJZAlUy7Ql2WhxNVpX3XXF3IZIatdc9KqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793468580;
	bh=Nx27tY0ZZF/N0YRsUgDDinXK7sryw2fSPBQxpH82DyQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ad/rh1ywc0AVPUJWWHNK6BP2D5Pok7Fi2wcRv8dZxryg999GHTe3oR0C9Xu634grj
	 XcAVX7H69qW1YaHuWfASez9ZTCdhFCAvgzcvwRJD/PjpKV5rv/1oAzI5Te0Alp558Z
	 l5WHq+5ZARg+X0UoEHW/7L9ZDdlcq4mjecLyESrHjWWMVRQXZYX4yZknm7/CaUQ3GV
	 +bU2GZQ1svdluAeJSRHH4OLk7A+F5W5/wcCkQkz6ruyO6EDOGbMFkwMFTS0gzC72w3
	 nA9loWLQc87d8qUZ9eosvsnnU7rYH1/mPKdTMMf23Q4Myt78DjwgLj99CLJ0hlYrgE
	 SLBhg2wZ7D0eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB0E80F07;
	Sat, 31 Oct 2026 17:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B68A380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D2F040257
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdQm3CiJrbel for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:42:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42397401EC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793468576;
 b=I2kkn50PB2XjskYoJjM8tkjAacuFYtMMTPJ7Ge8lekUYE6jwD+SKF9O7GiH1wagIUfNi
 OAhmZP5wjiWx4ttxRP2ycXZV10MQME+vl8a+CqocYRxu6/LQ7JMIkvHGyA3Owaam2Vbsr
 7vBdC43mXZEGoZZsf6gOOGuLjRvpW/tC5y+1XjHp4slsQactqakt3AIjII46Ts7RwukcF
 Movp1nWOYYCMF89+j0hndHlPReEVteoVAGidc9mEcOabV3Lp9w3nq2NCZCKgEyURaKQ49
 apgV4zXr3S/BDDKHQkrdi0Ysimv668apjknhCqDU3/R5TrT9Yg2gDq6xm6sgjtQgUJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793468576;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ScL+4WHYB+qKDkI5peWzxvWw4e8V3Z1XisKz9jm++nM=;
 b=HstIl+aK/QCIHskXTnAo9m14Gw8E7mYKbVPwKA7nwOsYv16BM5uYpulCS9ISRFVYTb8X
 pDNI6Sa1uDQw8p1HgHDaRpn27yCEmK0lus39IOQgTbpRLmzbpIIB6fzACP1L9bJ7ivg6Y
 rEko/XOd982DgJkbqrWlx3DTxqX+uVC1u2ii2YuUryGQA+AwX1sch1XtQiiq5D1l3MocG
 MOfkbh5Flw28P/KPqysSVjEewb3T7QA13budFfVFy+8H9w9wsIVRqxZ6Cmjrlk2h4JKs4
 4C1e9ekbtukw3kNmNE8lylQArulFfDHS7APJZ5MAIIPxLaxRJH7cGXyDq3Bpx2h53tg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=rzhpLAxF; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=rzhpLAxF
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42397401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:55 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6de2f213b7aso721675eaf.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793468575; x=1794073375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ScL+4WHYB+qKDkI5peWzxvWw4e8V3Z1XisKz9jm++nM=;
 b=rzhpLAxFeOSCSZMLjog6D1DmxbcPBlyWKFDFblkB/6+VHJdU8jEtB4PWd/UXh4umG+
 nS2TjicCNDZjKUYJCZl0jRxmmqprXTJX33LU9YeQIZPWs25EysbF+iABGy8GsJifQ74S
 vaENYoFsaQTw/rzJhgyvn7nqa/Mh/+Q546zZJVgYn/7tf19YNM7AKfw8n/H9s+EgQ7w1
 etAocebzFqhMhlu6PlkQy30bTwoMpv2QGLTqBJEJpBaka+ModmqgMquGRHWcTP00w3sX
 1W+xmvgtbMHMKnFvRq32IfGevcomFqhA8B4TiRDH88JRKbhOihPWnjVRlOES23iEf/V+
 lJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793468575; x=1794073375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ScL+4WHYB+qKDkI5peWzxvWw4e8V3Z1XisKz9jm++nM=;
 b=1k7BlvaDjvEnNuDEZgQDqHVtZCiQMPgB+MJ6veqlfgr1e/nRRMJMRAc1VFWW6CiK2K
 73jIKQY22uZhPp7+Kv3CuHE6Z2IC59qmu0tHDtdOhXc5a1pbfb3vcVBlA6oUmP5MPxfN
 vZrQIznyPi5gcHNFvZ9x/9k4PTr4ptCgQV9g+Jp3w5zrGBa9hckX0JAeRQhi9Fo1C87a
 ezCwwUA+F1fr4ith5rkmtbshzXRYu1YHcvbyz5Ql0TCYoQdhvlwSW7znprCEbQN0fGOj
 7vqYCQ+zICwWNk380nv5rktZtS5S0NBISK66yMOyo395epc2npIoL7WVTdm7bWN4YRdn
 +wSg==
X-Gm-Message-State: AFq9FYIzHLviqQr9zHG++9xs1IlcmtdZirJPweXjDLHbvjFN+LKp1Av1
 lzuj7SU7dZsl+6bkd+3PIzK1NnEFImCtcbhNUTjnYFPjGLucmav+EU7ouc6Rmg==
X-Gm-Gg: AYBFou1DVKUJfb66tWmsg+E4VPyRhEyYbHV64Bot7wayWh44eq0bs8luPhr7a+I7Mv4
 KZwvL1sYAvzjcpV4pfhqHEKDo1FrSLTqrISPABXilu2fHsB5X/vvJS2Olg4Kb8WHM/KBAodFp1n
 xETHHQ/cR0581XuQt84kITRVOKWNByhVDhnkS+W+oj9if8d31XkJS1c1g3CUy8hukZHvu/kOaL7
 PqmvC3FVrBtMJKNgY1ZxQzCbJeDaExOSgb0YQvHhAbzdgn1SxP1aoX0jzw0chXggJ7kq2j4SEbj
 Vq4E4SkTVcXuyZnfgQRJxdDFiQ1YpyE+SaaeyfqvBMiBOIz1nlEoD0MI8m+DlWQmmc3SO82PLdO
 IclpP+dmJFsTAcP/5OqOn9eSlP2fc9LdZVoK8x8klgiEnON7lUoeI4JCWDHeeRVAgvYPvuW3Ux0
 2BXb7lk/oVWnS7aMBz6z6NwH1kj3LtZaiUjRN17ks6ymvTWq2u6kv5XhjnjsBE5MLKJwQsttiJq
 NcypCP9noXqqSMvT/r+JDlNC03DffY4iLNVKXNDTEXLugHzL4NgS70+iKnhwNj3kLperd7prTSo
 t3BBxyPfqn8jnqjumqQwPzkSW47txQoQ6oycd+F4WgkkYZM5i5kj7KgTEr9c2TgA7zkp2a6sW3U
 kIwwBmox9BfpGw3qaBE+ZkqinWw9TCsmH4sAv+XVbox3u9Ngp0xRIAC4uQ7ZKsVpHFzBJ8C6Pga
 iP/drw5tEByj0SJeRFkTRIwGIi/NjOvFE7+aeOUus101OXJH+1RNA6izNOKpXqVG0c5ZaezisGI
 Q==
X-Received: by 2002:a05:6820:5710:10b0:6dd:6d12:22ff with SMTP id
 006d021491bc7-714f24eacddmr2407624eaf.11.1793468574844; 
 Sat, 31 Oct 2026 10:42:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm5008126a34.12.2026.10.31.10.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:42:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:42:46 -0600
Message-ID: <20261031174249.2698980-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-zeroconf: bump to version 0.152.0
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
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 9f7d232430..bb7b23c268 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  0dadd9b0d4d47b072ee3a7e43e3a0a6a  zeroconf-0.151.5.tar.gz
-sha256  28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1  zeroconf-0.151.5.tar.gz
+md5  0302be24e93b51a8f1908e9acb1c2a14  zeroconf-0.152.0.tar.gz
+sha256  8768de190d88124c4f69665c5547f6ae33366024db76007876bbff79cd2509ae  zeroconf-0.152.0.tar.gz
 # Locally computed sha256 checksums
 sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index ae666058d5..625097cea7 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.151.5
+PYTHON_ZEROCONF_VERSION = 0.152.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/93/20/69744d9de9d375dae2639dda9add7dae85d52d690b68c61b23b8a6468434
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/15/d2/7fa1e89251245a7135f13a653ccf0c8db46ab4ce1877007285b9da7e8865
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
