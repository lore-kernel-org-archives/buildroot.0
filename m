Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCF606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=USg5MWS8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F1D81246;
	Thu, 22 Oct 2026 08:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV1PZvgTo_EU; Thu, 22 Oct 2026 08:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86CE281237
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792656761;
	b=kcqI56NfUFLKzxYmfLBBiwOOh0/1yEwOxYm2V8tNJBXD3p3B5zJbHvSmqk+2he1iFe7G
	 lAsyu2VSgzBXMLVZo+NTejYMIKiCkaFA6Ag9uZ0TFfs0EaER/aGpvLMP1Ck4OimCOIisX
	 RXheN17EuTPUDbHISLLJIkla5lN09ZZUahgQHHBE4SjtB8BxzaYqd/QpCuAXOOv7XUHrs
	 p3n5j/0GR0noDq3NoMsSpGonm0aLr9IMRll0NAW1ut6e/VFn5v9DJpXkEMwcFeLJP6WSd
	 iH4Wjl4eLz/9XQoi+HMTE9fX7Xs2ikNPOqxjR/m7brvOCO4QkFGTMeAYNM0kQRchUTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792656761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GButtnv/nmBdDwFaV51b5knn3jZg21TL0uxyi23kJ2U=;
	b=WiBMtbW16swt92to+YkrSiQQnB8eYolW3IuWP1+uwTkkXSlbN8YnLcTfzSU95X5eCN+9
	 XAgfBIjAAwsu56AE54pzA8buXLJ8Xqssul/87/vF7YyImVYDz5yZQ8Yb8hV8VKFDfeZAU
	 kcZ9ZhhcAkcsBBMrmaLMdi6VQfdZiiw405FmRZ6Bd4zL1ioZ3jg+l9ulHzvlNTqdXuCk5
	 /h7kX62SgXI/2IMLeokZKMMxrLCj89eCG8sr6bISGMJULZP/Lifmqvrb0Q7nwf0q/0kS6
	 CH5UL3zQqqnNFuZf4FZTv82IHGczETjNFv83dM9yern0t+8bS7BkAeI9+Gg78MRYsog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792656761;
	bh=GButtnv/nmBdDwFaV51b5knn3jZg21TL0uxyi23kJ2U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=USg5MWS88lSemCi6CiARMjQTVaKVaBUjWlsMjgqqBwPZd0InVfRFYuUBpLdk7Zu9+
	 KQeBuxs4DLJCtq0KJawcI94IlGpwnQQujPHxTr8JMEjZ7AJfsSX5oDch3lAAJrqzSF
	 cdbufimJQLFAgWdFVkSFV1uPoQnSZb6umcN/NoyF+foZOGtnxgP27ktWTIyHQ7MdtT
	 VFx0gPWgFYYOaKelsX3/KVxejCpXhp7HkRv5wzny9Us5kVc3OqyvTRExW653l5qMXv
	 tdlt53oA2ccmo1AIhLQ10Lqn+EQkYsGAUwXJGURmFlldSPtinfCvptl9ScmdscrzFO
	 Kp0bxILR5Lr/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CE281237;
	Thu, 22 Oct 2026 08:12:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 591B395C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F0CC40050
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbz_-nMIEEYi for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 817FF40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792656759;
 b=kFcwqm/gFnbwvNrTcxjVf45626sTkWW+HcyKJzkq2iDYXOjYebNLooE7ljQIN3cn1Rtl
 Q4d3+99hsDsAVi+b5eOcFrelwJr6/hy3C96vwRTv3zK6+ExEOdOKR75OElrMtLhHUih7P
 WNfHx8XVdumeKVUAQZHiIX+nOuF44R2QnJJe6v6SbeDLfPbU4/K1g2x+lWg9QAuICmPF4
 KJ66bKgHm0hBs20hVQZm82jwhPHHe1NilS4Kd4EXoVs0rqhWxncapZ8+VryReXlKkwhOL
 ug7HojHPJ8nXSyHGvEwOdCJdACXhs7uy3oU3KKHzPc6+AKgkwimHWi1EI9mIAqg3jGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792656759;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EkWnvMlsqHDo85k77UKPUuQ271nlyt38IV1uIjA+Arw=;
 b=oprDO7PDviL7/+ChYZ56cVamfb9Y0oMklrR16HK6L8ZBOpI6QSHANk5bF5IRMkUJXc6j
 rgjEwBRvdZDUCt3trAaZqXQANmRyVvCBCE5tAQKZv9Ticse8w5DHpi+5fVLsTCXN65Lw7
 ibBYZXaQTnNfQyUog7p1XC9kxxSorcGORowtYhUpD8BLoj4da5H/2a7L90vdgeXZHBu/a
 CcaOj0erc1j+yob/wP79x1hXCPC4lh8IeuyBQ1yuuBNbhf5qNR9Doeqrp19D1JHDKLmrP
 IONQ4CcG5IaDTmgtyLWTcesWWg0G6AIZIcfipYQ/9QzFGXncELOPFdwBLW9izA+iOfQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 817FF40042
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E19D9B97A; Thu, 22 Oct 2026 08:11:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c37cfc96df485b0480284d43aeed9a45cc8aa80
X-Git-Newrev: cbb4bb8113ed6a801d34dca0b7e5c7872aeda46f
X-Patchwork-Hint: ignore
Message-Id: <20261022081115.8E19D9B97A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfig: bump to version 1.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbb4bb8113ed6a801d34dca0b7e5c7872aeda46f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.3

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 22f8473fc4..c19379ff6f 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
+sha256  0ed3e37db12e38b6fd7ca85775283412043069da2edcdb0c0ddcf9160a5dcc71  libconfig-1.8.3.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 8bd494081c..2e3b662f04 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.8.2
+LIBCONFIG_VERSION = 1.8.3
 LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
