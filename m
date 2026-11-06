Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21787606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gV/pfLov;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+r8pv+a
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F300B81488;
	Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQDxLi0LJO88; Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0FD9A81330
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992596;
	b=eMWyynQO/qOdRULNaMUTYuqGP4AxR3mKLgrcD9tOPv4xz0v57x6M+p1OpK53pQLlx2BJ
	 0JiiraFCTwqxnj9RDIOdMXa677rrtyzuFEd7n6su131kFny7Hm50rp7IutdZihPjDqhap
	 q0lcybMS5F6RfvInAkudhuJGHB99aCvXIfJVUcvzJHKlkz/9QYNctZX0nGSnX4mmt8Vz8
	 V43rwqcMhOb1uUT86XtaVAmjJ069w+saR1Bw1KRNz/TvGgLGdlan+ru7lSj7XmQgoaKbA
	 /FC5G1wztoyMnj75HUsKuJm3Wwv1RrL/486MT/Ixg7bGI0lvPlHKNeRaz+6USg8Xvsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xhr41KeWyRJoHQU29avlQfYeVRmQaHl8H/b/ZjBk7ZQ=;
	b=ezak1loPu/B/Da47rkKD7gBMUTW2bjb8yFOwjzPi6/l1oD9G4f3j4j6L9w50i6nhLtPa
	 IYRCHSFFGwhRMPfkoxw3/2tNUtuAU6xSi3hIkpkcjsZZhUSh94kCnmAJIAzMjNyNlajEa
	 LGWCfLisxqlvYglrC9pEXYdmn+D5m6nOt3La7ZgYP9myQGgWgujFrIb/RrcgQ2Bf3Pj/b
	 ikF4B+f6F+QageWouG0ZhBXmQwCUNU+32TbdqqE88lKQ6vAdDszTnQxJelS67rvP+oXWQ
	 mZz8O599yira4lLExouHeJReSQn2L1EtTcKtGp3gE+bo9SppjbD/UJVl6K9UjPgyv8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992596;
	bh=Xhr41KeWyRJoHQU29avlQfYeVRmQaHl8H/b/ZjBk7ZQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gV/pfLovsQbzWVCtyBjbjZVK1L2kfamoAUEjPuZuN6QSIGqr9Ju+h0+3g3u4YWi82
	 OBdDHb3zNK3dBkxQ3ao1TsJCmpEmUmIbZaTDbcgeYNJdqQ3Wp7kwk5rh8qO7MapGbZ
	 B18CJr7eUgS2pkWvaFCDNIXL5SlzirJic/M1dG69WVn4GRgqLUtvKYFrUBdDeITGZB
	 hATOj8UgjHijlQr/efRMclstRfon9gNFYngKXivCZm8jZhmmNytDdcrfQ/LVtU3meZ
	 J/8AZfJ7TfN58SwqtlSbK1tN/Mht4kLkfiu7W/y6szonPC9KJ+PDx95tJcHq4Hk92W
	 D7dOTzM9T+fcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD9A81330;
	Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B30AA362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E2040437
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTM4I2F8kjm0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AAA5B40467
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=T+r8pv+a
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAA5B40467
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:29 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-84621d8c7aaso451136a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992588; x=1794597388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QoToNH5pdARBMFI6H+I+JMAo/k7nchvJ5pjU61eDoeY=;
 b=T+r8pv+a5wuZNv9T2Cf08Ge+AyHrUwgkBnVBYxzNieU1JPRrkfzOW9kK4GnCa8Vqhq
 ZpG9LPUQXQF9eJWyz7LeZ+ZamEVQV2sDwMVmMmPPDNXP9IY85oH5rf46SQR498KQqPaS
 npK+ywoRiXvaNkKpz7nCuBlXyLCNTmlXBuDg9Tdje2IPSZlXUJUk1BQPd+AslmFHxVVa
 LjO4NA8BLclsMOBplTelKqyFA6Hx1unwzxnQjvI9pSKOVUc2HqJQekTCAYjjkpB1iIOp
 1sGCEzlaQkUglkj8ol39M8CnxgDlBQNT2H2cC7EgJXGkCLmt/UCYNuhARU6CTcee/B2i
 Rf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992588; x=1794597388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QoToNH5pdARBMFI6H+I+JMAo/k7nchvJ5pjU61eDoeY=;
 b=RCJJyP8eVkHHtT5kVa+mNiJVIpKoJWkbo+kYsQDu6GWpsdIQdtNqRztPqLTU9Jpu4i
 OO9q2vSW+VFUyU3MDAeVGeBpcYEvKIREtTjO/A0HygUhDqvEKq5djapZP+D0yfEWHYnr
 rgrEZ+IUcQJHTI/cGYFuOBorE+uAbhPUEXEcpsb+7Vx+69pKtsub2LbX9M+22x+PJ32Y
 4dMy4wQkrPSXsEfIYToCmGKU3Tb5vTd2s/xwZ/lR+6tG/YbD1+0AMpv7TcP3+QLMJ4aw
 XmOPA6MWCYk+JeERkfj1AhbJbcDmG4huJXUOYZB30ohe8AEOhN8Io46ck9501pADK+We
 HL/w==
X-Gm-Message-State: APuU4Z9DDyidVg4jWrBIqCY7JZJCJgmy2dBrmhX6vgSQSu1AJP2kZ2qs
 dsVd3o+EbLQpKjB3U9LTgOhfhdpbh9da0Eyx518kWjms2rM0FclC0ZORp+Lvuw==
X-Gm-Gg: AYBFou0cYMa2Fj8ma31/yQU4ckTmf7VxU37Td1PIXfJYZiRaryEgTUOgxmW4rf1TYG2
 AdJO9KT/IPQJK0Y5TGZZTl/gCE0zoMUBpp23cSPS39WPEbRVpZIfxk4F3hhCbXz54md7YiZH8qy
 QBfZrmc68vXwN5S1yteZL/EPjHOkonlPkDS6oqF0nE7Il4Pf9ZESsgVrepSdZq5S2euSIePnkdq
 /zRg4C5w5BosrYkq12Kws9yQM7P/sL2S63zrjp2jyxhuyjBriTkkXFYdtNzyDVpOm/U5hjjoY2u
 LZJ5Nk603haSD0GCV90WgcLgK3rnLKAQNbsraWP65L+N8k3KGlK98ZRI6scfzVBH+xhoFKKZ/sk
 gZAf5JoMbfGNG4lJk08AOUivEKDpvcKlldpI4SJs6EIp4yY+FkI/aaZja3UGN90KT5EX4PgqWIF
 k15E/4NLB1xW5XVMA3W+uOJfX/WHonhiBHRsFcJQzL339PFi4XQTW7QA3AAucFP1mQrOCegeNP0
 qRYbffc6yHHHphPQZFv1rFHgNmGVacu2WQiV3bqXc6IivVTKA1WH31W+UM6CNGfoT70nVACBiYR
 18pRwM2jBOrmji8INMmydVklrjVdGLooSEgftKvSwjaxxU15ARMf+unfg25vAUCGrBgR2C6ub0U
 kZFm85tQMetF0SkYmtePB1JtdgRSf/3kQUpaGOSXZ9MbOzcKot7QuJXD3J1nDMVBFjWTfPGwnqh
 6sHg8LLsrPkg7pugdlPJsyY5hXb2mU1edQe95JysfoNFCYtdxb3Lr75DBW7AKMHdjVAjD3PWAPw
 0HxnQ4pRxdVybeCNlBChP4=
X-Received: by 2002:a05:6830:2e11:b0:81c:4784:a5e2 with SMTP id
 46e09a7af769-85f1cf956bcmr3379392a34.6.1793992588365; 
 Fri, 06 Nov 2026 11:16:28 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:52 -0700
Message-ID: <20261106191536.2120153-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-socketio: security bump to
 version 5.18.1
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prevent HTTP clients from dispatching events before their connection
has completed and the connect handler has accepted it.

https://github.com/miguelgrinberg/python-socketio/commit/0f5f4faafd941878b7ba815d3369d01777ddd121

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index d8360cbde8..8dc86acdd2 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  ed364a997052808b3d249630ca907817  python_socketio-5.17.1.tar.gz
-sha256  2a3183d7172e5ff772b9c24ef94f1fdf84a09b746925c997b7687ae8017f7247  python_socketio-5.17.1.tar.gz
+md5  ae54e4caee7a842ab49becb33add6600  python_socketio-5.18.1.tar.gz
+sha256  07ab0e7c94a52833a67af1dc05958ad6fb0de69adc87de9198a61b22588c40d4  python_socketio-5.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index c1a2d6a249..6ed2e5f442 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.17.1
+PYTHON_SOCKETIO_VERSION = 5.18.1
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/f6/a0/b3c6cfac960bec64ad52b83e7baed825ce256f8506b343aed10d2dc5f747
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/71/b9/4ab083267c1f8ece9a9e019808412af7c7a03321411a1263cd863321baa2
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
