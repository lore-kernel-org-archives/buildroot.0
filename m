Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22575CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 12:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D44CE6060E;
	Sun,  4 Oct 2026 12:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IthdaGj7eYc; Sun,  4 Oct 2026 12:53:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D48CE60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791118430;
	b=ZxdFHDuwUkdeMs6KBiFkHHwCKq7iSzJHp4LnQq13HUkNyypPy+vTPXHe8YE8oQgVMuQo
	 ALrE70eZzColx6MSLj4bc+gU252RcxU887rvJzM7lAvugejgKomrd/5OHuUUjMGrVRnh1
	 ZOfWCrChczgzN5P4QgVJ0ZOsS9erjibPMwSMrQSuewzZqhlqu0yLB/nm8T56YjGt+E7VG
	 i4FAzIvh/8aKzMAH+dJyEFWdZueveMcIBrRW37/TEykGPdYUF+VLEIb+58JWx8aJ3PoJn
	 VdijQ5d+M8UavmxjRwyp2IqfLXnx41yqRjp4tG6iqRD2mq6sW1AxldhwkDQ/retoUHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791118430;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZIDERmujKR4QDxHAi6EaGcniYG7J3KunClHmObqfGyk=;
	b=RfH13Ac436oAakSxguCuN3v6ZKrYrOqYoqfSZcjpRbvOanaSBBiaCw9Bjzb5CZ5wKsUA
	 O7jsWQWqvRmp9/J8qZwdeCGDX3LgUTltGPFiqvLoHSDiAgHwTwGdy6+HHZfKR4JAVYkVW
	 zUTYk8QYuMrkijCi4FvCVOuyGdDkxDMIfmCEBZV4Z8UWOh7nMNCKenuzuawvEcQV+4gDH
	 1SpJPh1qaequYjy6XY2RTCEoPvEJuyb83bfsl1yepI1QQJlLd7QKxvj0ocwXXi7giFcbz
	 qsd4dyWpbU/lCEiDCxLVf0QvpzpzpxKX/VPGcETPV7f6aSrlkTUNDzeMryhlPvwCX+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791118429;
	bh=ZIDERmujKR4QDxHAi6EaGcniYG7J3KunClHmObqfGyk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nysZ2M/W9ck0TCCrQ/D0E3pttj3jTcV2CShGHxFxNh8RM9duNZFePQPfqKzv62mlG
	 VqXGwbrHkZvX3nKCV+SZCATPxmecRERRQX//CVp/2nFO19GpyYnjc9dHPN6OI/WgRV
	 Ee2HZcy4aNYfjliOuPJrDiKsQODqrkf1ncflGBW6ZhXvLFkO90jCKz/Iu8wabluwBb
	 mUpB+f08/qZQOkcf/FyNs35Nc/WtMCbPD7ItMtsUh1RPXlSuDVFwWs27qwO7btxdJh
	 wzRrBlgnD5cJ/zD4L3cm1Qhpf+Ubh1DdZC+Om+J0f2eR7KOoVSWqaw6bjxmvxM7AFB
	 iN/c/Bu7E+5pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48CE60601;
	Sun,  4 Oct 2026 12:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FFCF32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 915C34007E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwUqJ9lC66U1 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 12:53:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A39D040049
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791118426;
 b=RKXfdB8+YpTncZcvS2te8QX2Rr4GvHXWmHYLN8bGsdeslHUYfCm2PfKKLYraCHCdHtrX
 GuFiEYm4GlQn7t2mOK5FeeSe48vbCad/BrOvz+RDvtiWfD2OxHzLzXU3myRaRDpDEYB3y
 4wJ9sGPUTLrMJaXpLtIyD3Lzoz0iBqtTgk+esp/cHWc27H0V/VWUjGThQVgc+voFvM9DW
 0i/yF5C7qOvPejat9fsqtWghTQBwTgJpBIc19GuX9CWgzWoRtJNCx6AUxTsNMinC6hRm6
 b0+NjfmPYBq7Q+DH0vmP1Lgbpwj0H9uF6UZKv7ARJAuYhJch9Lv6IEXsWcKH+W3oqqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791118426;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Je42PvGckWZay6vkMbur6cXFtaLgdeqwtEM3uiQiP/o=;
 b=D2I52bj4SH08hlQKIUQAL/25WAQQ4OoEulg2y7qUqLfn0yISPMY4JfP/sWm0ILFp3Ror
 gBAeDISpTdbs68gPstFN02bbJCflxVer87uEAEQhn672YMOYjDozCLUQFTleW0CmrC5nj
 wp4oAH+9ukZ5o+YdfKiJrG2atcMOV+QNZyzwGa6yPnMgd/1mTKWoDP6F/elWKNF4Xv3S1
 sbzx9MTbG2FxBiYKdsP5zAs5qp+0U+puj+1Y3aCQXgvwG23NM4l2wWdYzBmvjP6nKcdQb
 72Gphiq0Q150WHm+utcZAlp+IxkUgpMpp9Emz4oQFn+p+jnFaKul7pieDfVzSlz3Usw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cpESR9Zs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cpESR9Zs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A39D040049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791118424;
 bh=Je42PvGckWZay6vkMbur6cXFtaLgdeqwtEM3uiQiP/o=;
 h=From:To:Cc:Subject:Date:From;
 b=cpESR9ZsqQtCf4QhMcmG/fkMweoPLrUr3DzUgp5gbxXbA7rKa/IXRprRBvVjG6uUI
 X3mQSVOILqmTdhLC/eB9hx8RmiHsQjVrVqtHd2Qk971S9CI+EJ1GrixlC0hECZaLMx
 4jtl3JxSINu8zFQTTwnd/1VTKj1mTB+ZsaJKITC/wPlKHgabkTG2dFUNO9vpjxK53V
 aq3vT5kzmSU1imJjMth8fVYvXpuEhBFEovidEcAUyKvvgAklQHogLFanAo1GtlFkVK
 zojcepVM5AJYYrOUJ1yDzP39/vrMnBGKzOh0K7Hi0lT3oRfud+rbiknoibSkolYVvt
 UeBnfMu98zVng==
X-KAS-Sym: v3:f51bdf72230551df:gZBMEJZZxZQxh3Mn384LQmaAeAqD2CtsxS++4TKyIofKq
 /s84LheW8NglstBqPusEHuU8qns75xSoewvkQLJbVpaPfaly7DeenxBGvd+Fpnl6JWePR/XKj5c
 AqszskvZ+3VUxqEEpR7CDBfhuc45J1/CXVKft47Az5qbAZA1hUa40VkYupsFXrJsNP7sUR6L/1j
 A2Z7G792gbPiVbGsuiKr5+najLlqsv6TE0CI3pr3KyvLL2Q/f4467jhOQ3tAo5u+2PbjU2/i3o3
 +amkkb+U7yRM9tzMKp+wH5glSeocOCqtolTnWG2NuhiFhejHvF7WJ1DoNQ+rJHYJDCZugaEA==:
 tPKbdxwuE7aWhYF33uXB4Z5+6c9scKjSz3Ce9itnJtUfga8Aav18hSwSrCFc5EYtyz7mLSPqCjX
 II91d8kaLABoWWJAg4xnp0fHcr9pNaAxAA6Dl44TYPZGMluIG+uJp8n7KQho/m/V3GBjceL+671
 WxZT2gK7SFAoquXOfU085d8gAlx6sAjsfDzTXfm42SIEXotSsEEtUGryVxKhJm2p0UZ3fLRL4zx
 FugfI5Au4TW6gepRpNHRr4Osw7v/ISQmzVCDryQn8HqPfRr/XndJuPlKnuJ+B37zUJ2pRPfqrLq
 sVhasA0/CQZwcmth6DhDCHnLk99B9k6wsB7biDi9SA1QnnTsXB9Eo4Ij/1xpAYdB9U/Av1WBWWe
 oDtcRet/894+GtsuZGB3f2lIGeAuxf/EMD8ORm0xBPW7CA/uHW7cEk850aw/JkF9y4d3NUOGprw
 K2he1BL8TYqNQuZoFXIu7rJNHZdxX6gGyIbKgQbEKNW2Z43YNkftrWKsA6o+NM6IJjJxTA1VJa/
 99XJsCKB381rsjwq9WrV+jSRs/4j5eRfESgCY+h1XDG462VzPlwKh6DCQMatOtnQfvgxeKoTq8c
 p1EztN1yuOYY+MfmgyDVq0hR779UZXIXpunWrcWkjo/uvBwOgjvkuJP12QUcZ/c=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 211FDA4C5024;
 Sun,  4 Oct 2026 14:53:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35814)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDLiq-000000004Tm-0Byg;
 Sun, 04 Oct 2026 12:53:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun,  4 Oct 2026 14:53:43 +0200
Message-ID: <20261004125343.3633363-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/{opencv4,
 opencv4-contrib}: bump version to 4.14.0
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

https://github.com/opencv/opencv/releases/tag/4.14.0
https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4140

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/bc6848b1f8f36b9ec92dd8cf15680963edd4e02d

 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index 84e249cd30..810834abfa 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e0077a4fd2960a7d2f4c9e49d6ba7bb891cac2d1be36d7e8e47aa97a9d1039b  opencv4-contrib-4.13.0.tar.gz
+sha256  4f17abd1bc7f88e19c3380c8de7cbf2d863aced5b5ee8d8934cc7902b67d42c9  opencv4-contrib-4.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index c21be2f948..412846fd95 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4
-OPENCV4_CONTRIB_VERSION = 4.13.0
+OPENCV4_CONTRIB_VERSION = 4.14.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 283f7606b1..cc74feb8a0 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d40ca017ea51c533cf9fd5cbde5b5fe7ae248291ddf2af99d4c17cf8e13017d  opencv4-4.13.0.tar.gz
+sha256  ee8fb9b30eb60850431b4656447080e3737b56e45719c92b67f245950609f86e  opencv4-4.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 0e2567eb6f..2a85290aaa 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4-contrib
-OPENCV4_VERSION = 4.13.0
+OPENCV4_VERSION = 4.14.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
