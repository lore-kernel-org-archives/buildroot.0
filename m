Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550DC79FAA
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 08:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A778087C;
	Tue,  8 Sep 2026 08:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gaf9fc6F4NVO; Tue,  8 Sep 2026 08:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 68458807F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788854896;
	b=pNiqzTJppdH1rDRjrAtxQnwUV/M5H/Af/RfWT+amtOjJRRfHXtGHh2Zy086GnsTpLems
	 jVcNp7ysJmIuoLIHqXkw19HpXJ4/NYXsPHlQEp2JTQHOyviV6ED8BLmGiLfuu1v1Dgy3t
	 G7rScgfdNpBoqBnkWsA05Vgh8qJc5gP9HtkOUZGP9JHyuKMyahvWKIErk2fQF/yzXMzg/
	 zoL9jcb1U1N22aOMxIGvQOidfP3q6vO5mp4+odlqg4nEBNp/uskrxNmDrLQsN/yA5EXJY
	 OBaP0ySqw70xvl5nj0pUcL8/zvocc2Rjew+I7xbT0pFCkXqXUeMZSwHKd9cRathwt/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788854896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9QEkdQqJI169WAiiHytf6abbbuLRRlKHU9DD51iomFA=;
	b=VrBNH/lZJETJyaJ9oBogCYFU+1GvJrrnmzcXBpd9HljaxgDgwLprQzRPv4EPMUgRYwdS
	 VUW5fmjJURqq5si6Xc3bvCWu/npNoobHx9EZdg8BFmbbs3Jzcp7nMmqTiJUdImwRNlqWF
	 6F3yfG4VTrnKku4VUzYasIGLVmG+D5Np6x4vZ45cx5uApiqKhiEwywkh3RbtO1JomTSSN
	 JemJZQMhvXJDfayAn5miYCyX9TwTe3BRu0xLEAu6mXGbTkrlWKEwpal+trxcRPX7h18q/
	 2SIZGUoXsMOhbmhNERjHZOgCDV0CeO114ixS0LaME+6h4QLTSiFxnRzgUApl99jewzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788854896;
	bh=9QEkdQqJI169WAiiHytf6abbbuLRRlKHU9DD51iomFA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jE2ZrrZsr5aS8mJhb2f9PtmpYoIifPzKPs+TrwHUdQbwCUTMBgsVbe0vdbLZmu5X+
	 HrsCsyFTWXf8NWmYpUYKnwuSaBPEcyRs+30f0L76GEPz+cBAy9ZeC96LckMsaUeS9P
	 djrvuuiRLn8txsZ1UIuGjVC+kxfNZKxvKTcZCQokxdC2BKYduNWK6662/TBwPECt2m
	 9iesTtAoyWZoDM/osvQskKojOH2vqg52SPQ9llVirTDjuFaLhxnSId1a7G+7otetCo
	 oQHFI2JfIQCIbu2QRz+Vo87DumzSNija2xlwlRLQhOgHEnMzv6xTG1VT0Hen3V9JdC
	 lPSfE5Xk25Xyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68458807F5;
	Tue,  8 Sep 2026 08:08:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4ED3372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A58404C9
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu8BjhWiEdWU for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 08:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 921034048A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788854894;
 b=tJzgywN/o6FDs7gl0N8Wi8vcEfFHSdqyXEFCuFX79JEz6wLPX29Jhj00AxShkqX8+eYb
 wOFqrAs8XGJJkqeUY4R5LE+mr1p6d8J9E+ulvOx1gBOc5RvDi5gJz1JN6uiVmVsh/S8Mx
 7WljJ8TZSIEUVKW7YNZSDkxdIYtQOU3kFRor4JeL6GCcOwDSK6TACkmD+/vzbjx76fVP7
 OJaPCib4k3YP66Poz1G1Fjcf4CwiSJPVHwppodh7IZb2W9vnKnly/UBTamAu3IUZWsi2o
 bf1bNJJ5UfWDV6B/Sz0H8UQ6/qMzexhQjCmT+dCf3dW7FgUmIG5V+0voZIQmXfweSVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788854894;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zshbwcQHl/Ub78AhEo0XS7ZB2giLeTk2TMQ1JoUUmXI=;
 b=rc155dSqFUr44Vco0P/aXmZX6m7CMZzp4B3gPFFYbuwxO0wjnd/mJQB12tWnkDMWyja2
 y+q0OnENbGcd19f+ZXwvLrBFWnH8e02L/qDuyPvD504GID4qVZlgRk/HOMfbzBfxwa3Lx
 gjxWmHJXOY9ZGIdpOltLRWLTg2G1bccuz+kqdBS/h7Ga1PC7byUyeoAIIRbCx4BHPqPx/
 s+jPH34Zfxhn8JID3+9o3beBjQARbTGxQ7WKLIMIZKMcANSQ4BUjiSwINxD9SJZGRoBWF
 wI9E5SfJqZzL26RZE5J+bW8V5vfxteYXr/ZNVMcBgp9epWWFKIelsTLBq+6csiWnbsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=f5QExby1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=f5QExby1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 921034048A
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:08:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4956869750eso38666905e9.2
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788854890; x=1789459690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zshbwcQHl/Ub78AhEo0XS7ZB2giLeTk2TMQ1JoUUmXI=;
 b=f5QExby1IsgOE+lzf9AlhS9uWQPGs39lsfgWZeSBmFowzjQ5NX5uT1O9BRZvK6FzNO
 kJciHulf3c9phboAmukgdt6WU1aclXzHamIXnzHq/bmgg24SVTToW2ACrIMDFGRQiXRp
 Bk+Dc06nLKTr+kS7NgvikP80IwrYeX5e5Vu9HgcxtPPJR6b9fyzTMXUpsb2IEBd1+HwG
 vnUJJKFhZi+j5YD0jSwQtp6Bfwt9H27ImXCBmpXbzNUI4mODmql8zRNdm9g+HkRyKUTq
 yEV9swADxEf5QD6tryp4VFL++YszC2lCwVHzPFLcqhZM/7+Qu92vV/jgpqRWHdKNj7QC
 UX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788854890; x=1789459690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zshbwcQHl/Ub78AhEo0XS7ZB2giLeTk2TMQ1JoUUmXI=;
 b=D75nL+srl44JiulLl0Uq6ih+8tnuPgWMHe+Q04MMUEe5eQHknBoXTpmiV/IsqnxmHs
 mQJDF+Bv9KqG7IL5e++ZgxqWNuqtB7Ho9qaIUVJnVGD7qYnIDlTxXvI/wUUIMh13TWaj
 rU+Ntf9IXxmeEV0pGhSzXcKIV9V5N1W8UzTkxLC0xv0Iw3Yblh0R4LMKx70tMugNr3tk
 UJ6wJnm6p9dnYdFesR01l/uuVyLmwbnJW1R2bOAFc1SzNxdtiqM8SOBWzmqE2zrHmUGb
 IH3wfFaZLXSYRcq+XJ3DMxJ/c77k3b1yqQsxW5pHtyTYS1N3TUVX0ySaeXb560zQjEoL
 2/FQ==
X-Gm-Message-State: AFuF++luZ/aTZhXd9EVjjjdgmc5EvU8ikv0bRxOBm6a4zQmN8dGk3vFy
 9f/RF6w0BOz8Qp0rPlKM3libDjmlniehl7gKw2DpcaxNdTDBhkqE8OjyKUWNaeI=
X-Gm-Gg: AYBFou2UVYeXTfQS0vaTX5q+ETIntaNqZ2oWFSWd6ImcxQ8qteWdkSWKxWv0R/KFmED
 hG0+3S90S7AYFnIBRQfwg07+uYw55Nm+1xRMTCn8vJuIRvoDtygON2vtyEd3nOBbSwRdqQMTuGX
 uNyZSJ3/4BV7jum1ayPeL/K67pij9lgu513g54qaz4h6OQclI/J+Q5RCe4Bs51V7RMlq/dagBV7
 B2ll237Y64Gu0rh1oC/eafPCsQP31yr1dwCeMxIdHGDxDodroSqdUFVUStVNCsZFl72KeULqqR2
 0RI3/yg1J4QAyR2pdSMVCyUrBbS/SKwiBuGQEL9rhLm3zho5+0Un/D2RoY14khct1v6oi4F/bt7
 fiGqG6JzUAVrNVaP46eclfz/1Nk6XslQZUqZCMRTZyVMG8b5qdING119ntWBBXomR4NQIceFlBi
 rtIGVzSbJWl9/vGZIOD3UOG50Z6oWKPJWPD19neXu6DEfEFBaWQAxQ0inKhuFhug4+erCrQ5l43
 3Ow3FRnxXdxlw==
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id
 5b1f17b1804b1-49cfa20cd04mr250784465e9.18.1788854889887; 
 Tue, 08 Sep 2026 01:08:09 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d07a23e85sm258481275e9.5.2026.09.08.01.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 01:08:09 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue,  8 Sep 2026 10:07:50 +0200
Message-ID: <20260908080807.413351-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.45.1
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

Changelog: https://github.com/zellij-org/zellij/blob/v0.45.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 73ef5729db..4520d6ff8a 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ca775a98e78fc8b721dc3c67ca511733c3eaa106423652e621ae66b6d10ecbf8  zellij-0.45.0-cargo6.tar.gz
+sha256  e9e67742687f3e1447df546bd2828b01edae39762bc6fb0795a686030c00674a  zellij-0.45.1-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 39cfe2e460..956a99aafe 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.45.0
+ZELLIJ_VERSION = 0.45.1
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
