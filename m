Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56417C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D49404F5;
	Wed, 16 Sep 2026 19:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PttsfP7HO0T6; Wed, 16 Sep 2026 19:17:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EB1B9405A1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789586236;
	b=GBDophLk+u2rWmnVmARU4dcHdOifCrWwDEYSBBOQMMf3pcvOgLImaKWfpJD1n0LwwlEw
	 F6/OVlEKmdFEqRzNC+6rMMf4v3suznzRAgD8/Noza3rFJ+XJX0ecP2dYVnlMJb7ucYTAE
	 K73KMnlkNoghwDDmqc2qg4KO6DbvMd4wV0FA6P/K9S1YJfp3Fb8vQufiWwSCmIhmT87Ow
	 BXvsDb04ggPW99bUQCDDmKwfAK7IOaejuPw02N3u0Ry+u8xNoLENKWkPnLLJ6CUlhzN0S
	 iMipxRYtGefBzHp0YD9fXw8yH1AC9jrkyiVCu51KflpUh/A5aSn4RRXMuyYHZNIU+rg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789586236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NowDeq0EXAbhLqP/vRmmsWsoQNCw6ZpJG++o0ESbdIU=;
	b=ao8wQLKCwlMxal742Gg7Tg8NM9iXknXO+qDb/xFlP5FD48Aw/HdBzpql+wfSaSY6KZRB
	 V7baYEXBUBxAIgUkrSOYuDoQJHTtvXe2cCAudu1niZqEpEVuPcAi6qM/5Eaqd3svAkRyK
	 2kinbH3WYGlLgFrDE25ewZP/BIz2GXGhCSaRTSHtNsXgpMSFH7Bh5QG3Y6rpigmOEbaDh
	 Et6qngO/7bI7H0zv3J8sV3TDmfeUBi9+PTR8dlhoaKWnzkKtaZN4O6mVQxkU9RvsgLkzN
	 VAAGFw0hRIHzwBE1eA1amSjkh1E7lZNnI7OXiaoMx/HXdxxD8kCHv/a4zAofKfo2Jig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789586236;
	bh=NowDeq0EXAbhLqP/vRmmsWsoQNCw6ZpJG++o0ESbdIU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KAHWLkdQu9vikod/gXZjBw05aa8wyxOMzn7MHHFZbXZYKx8MzxWS8gcfMJqFAlerP
	 1Ix1QJr+SvPRIQrxImwSAWHe9AtfP4o1y/b+vm38FwuaavvUflNn8SzJsG79oHb07A
	 FimESHObMEQk1CMH5XDNYuY2S7Dwey1E6BffX/ofIJ/68kgrdDg8O//+XP1bHkNTIf
	 4rSg1KNeIPovTpFag8Fuc+3v9swnKCuBx6lRUu4Qv0WtIQUVxDVxlaR/qxpj4GPZcT
	 IQLxsvDbc7MPdNulP0EjSZBGyc5xKUNJaejYlnmREXS8n0Kx4hrnqclAIV+SxeFScT
	 mGhBMdORLwODg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB1B9405A1;
	Wed, 16 Sep 2026 19:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62893422
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48A5D808A8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHk-LLcyF_Hi for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9665380848
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789586233;
 b=TPXXF0id6hKs7MBEm5EQRp1N65jT6SrvLgSFBKN8IulSNPEtMxtQTTs2RS+JWFm34Yyg
 0upx/1ZBVAIcZAme+9EPdVR19fWi4+HhnyljG6/FI+I90k2WJL7obZwSKHm/RrAcjhDl5
 iNOAR0uNq6zAVYzmUbGCCLuZ7FTJHGwwsttxEWi5JsFSqetE0xqyyzDfGDoAVgltK/xJG
 ipkXTq+/4ojc2jFxysH+DnNHzcCSB6cFqF8UN2lYlJE58DcdFQqZgSvoabqk8tPFnAGZY
 y7UHWkJ5DEBaPQ75E5jPt4IGJOacNmXcYBCvBo0yFbV74XgbOMxCvQpMb4RrwSS+3FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789586233;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4HQfRFNaVIAkkuIBPvUE3P8LYvMqB6PeHzRBYoPJ/LM=;
 b=jglOHSI97sbSr58DX+X3/KnB67KOqdtrHepKendTVoIN3VDa6tRO9yFmGJG+GT8HKvJ4
 TIf+Vx7fZEvsSQn8QB7YVC5M+UxzJ4AV6W9AsCUgW+ddMXzwfEtP2+EquopArmAg8hSfO
 dC12hLSYT/syvm7FIqBCQat4hUK9R8sGMNSEohl1hRGSWTbFfd+ZpeYHjI7dsW5v/zgFg
 bgHVjm9uNzaDCPgpOb4319JGgC293Zc1L+V9lb5aVSINnJxUdfktny63KxkapOOvZ1alH
 Sd5bu9k6qcQXlwBbI5cDkogrdZMJJQHCxUlmxlgBuBp+qGtr9xqVERAWQ7LrYUqr55Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kd4qYyXl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kd4qYyXl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9665380848
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789586228;
 bh=4HQfRFNaVIAkkuIBPvUE3P8LYvMqB6PeHzRBYoPJ/LM=;
 h=From:To:Subject:Date:From;
 b=kd4qYyXlji8qotUF/aHEGd1oJhvJVdWhCAatxjBrKiLhg577MvTlcGqhrsDTy+kvB
 z6jSZpP/wS//whcda15+a1JQ/jMUu0zIbIRzsLAQWDr3drfGF/Q2Z3Xs3iCtOmccTT
 pXPIxYo3tO7wBsUmkomM6sVOWbFx1QnaeWt+RgrQUshkIo7i6lBmMP1yT99JLVwHoE
 QWev2fNJw0hOoQYHDFpIsdU8DmhoO2cvt6YLcTn2u+L4fxbTOsanjsW+TN20jz4ZaD
 42t+MgYZLwN1sLI2aJZWUIublbQEus+JJbt84xEzAXgO0eyPpOSbLm7kQxFFToTH/3
 5ZzwtoqXEQozg==
X-KAS-Sym: v3:f51bdf72230551df:WCmC+EFxKOsYvV2nsQ8bqIBG3BRUXJ/i+qkAo/N5/IsfhXO2QvQfgQf7IeRTJLy3YHyK4Q3PnQ2j+Vt9JHYHJwj9QyUoIe5FgeHlUtauCsXLd40CEcAlnTbGgMRZF4fDdJnrCfiaX8vrOXFKY2L56Ze+KTmlTwNI3rqbRTSRJ/b7TCydS4qxEnQz9IrNJnFOoTiwgB+q4LyU1jqd3PImvNbSdlGE80Enhd9QrGRwwWbHQktuGm3rlcwVpEIYeRNcssM1Ro1i2AD79TE9cVjaZIz25VTG87CHxBZVsnt6333khjhLeF7+dYEyWZEcCJSuMgKteJcqHD2oSy3V2gP4Rg==:2MOj9zMXD66mBEcN+1XC5C/4Dzz9pLjR0MWRAy2h0/Y7ZXZ3bTwAe17Dwcey3Y0mbG6ykkQ6JJpiawYuO7JenUN8cDt9qWluw7fY84Xipswej3iXXEHR7wgjVHb7oJcaFNxhV20EOJjsSFU8SNQ51YfDzWcqui9jMle70+OEK66W63TvwLLjFb28f26roQTHGMHw/ktSW3TBpOL/kXuXKnvo/ZQ8O8OrcFSnRW9LURtQAr85XGKrt3oKVgkscLftn4kQ28o3wdW9UeaXqr7uLnajvgDBk6nPc3a7ROaeW5gEjsa+E2kNcrccBKX07zXZkl+3ZSCSaj+UwaTiuP7cibWy6H9+YEQGwK6lt8gmX7I0udlc/eAnr/K9kJqqDwUcIBCXePbYDCyLQp4UEiFSU8V23JHgDUt2KN16LgxnX3CwsNsjI4JKiw3Fi0EVHsTzyjdpkiGFZUOuD07dBWtT8KxXCXBSbJfDJeawwHiWud9TOM4dauOHVSOrk93us3zckDWNCBdkoPEAk2RrC2MGqnjaNc97ggqUR0L1YWUftpeA+YPjvOGyn+SJ9Cl922ktmoK3svObd5pObqvfczOtEewgP6O2iA==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8714A4C43CF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:17:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39628)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6v80-000000008Pv-09bK
 for buildroot@buildroot.org; Wed, 16 Sep 2026 19:17:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:17:08 +0200
Message-ID: <20260916191708.1093637-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/apr-util: bump to version 1.6.5
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

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/49b9b4a2d83147ce42f3666533ff4445ef018988

 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index b8fff95de6..02a425651f 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
-sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.5.tar.bz2.sha256
+sha256  96de1dd6f6a0476d2d2e7964926d8c1ddc3bb0e210e1b1812d3ba5a454a392e2  apr-util-1.6.5.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index c11957bc56..3669d2d2bf 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.4
+APR_UTIL_VERSION = 1.6.5
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
