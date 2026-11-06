Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2154606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kfcMyCQH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE2860AA5;
	Fri,  6 Nov 2026 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEE7jLTs4X6E; Fri,  6 Nov 2026 21:15:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD4F960AA6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999704;
	b=eGYhk+eDjYmFOfdKNLajgdTmmxabO9jZ9sEcFKXdG+p3vKfqsblrRW8OW8xPfDymXy8b
	 lddFaJEMBLEfa4+rUY3712jwCWbgdus9jxHy375RHoCE1Tlve8vMRvvsdSqM+YHAlp75i
	 p87Dsr9eQ8+N9NNWWDXa+cq7sCINjuC/zFydDMOrlGc2aAFAiFaUMMkk73k9wADUoGPia
	 eKbaVnbmm5Bww6SAmGv7c/uO3jAPELAAOr5hyu1DAZLjr/rySkALLcbC/y3XtYoseTW/0
	 zGcJElXYJhghxp/yhXUnPnT6exiXTzUHgDGYCy8jYsKxh3PMu71qLWOgK8m4VlJrbtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OYxKAg+M3+MrKALq2JmGSuUnVSEav2O+jKVj4UJfKZs=;
	b=sbm+m26IQGIoDtNEoP8GkZEet3NfovzmDZHY9ZIarP8c06O1B7B2rWwl5pKuOGK0MnT4
	 yuoW05UO/vr0J1TEGLVBCAHwPmrC7Ywz2vGfq97krYgb3Nyxyvs7kqG8RCOFMudFlBUP8
	 DMzByi1l+oPaPU2Cl2Z93UM72AF7ZrTyPoox0dwbSoOGUsQPOs5KMr12j9YuFTDJX8mzC
	 NxQq5CQgjM5BWtQfgYqnmPBPvm4HUXxNIlX6+TIaNXM9VH7rlGD3DmDbz2DmIsYMFvVLh
	 vc+4FLtcn8Boe8r74P3eaQrzqzduYr3e+J9oySqAICZGzK0rK2KD5bragVoeeaPs/DQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999704;
	bh=OYxKAg+M3+MrKALq2JmGSuUnVSEav2O+jKVj4UJfKZs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kfcMyCQHPyJCKXratC3RUcuArLPBGKXQUjlkMTLWZ+DbK3sdNx0/yGl+3QkX7S5ba
	 WuiRN96g7jpvRNHhZoPYIkSRvUIGTq3xEH3PTeor6yUH2zEkz7XxnyclIMhcc8wEd4
	 pm5Fg5FD0S3Dqr8BW4YrKoqJo8qACxUYQyqMBi8LuRfsSLNgSrrVFkrDHW1U/b16Bx
	 ta2hHLiBCAt51eCK+AFRW2tq6LOlqZsOJl/2gETqZRvprqkc5dzRhfBp2Sd1UAOJhi
	 qcjbM0JG3Js5tqi/R9DvifsxrFPEbalIlot0SljsEVzUY4KfnZD8KaZ3AWXsBcuT3n
	 lzh9ycgPhSJ+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4F960AA6;
	Fri,  6 Nov 2026 21:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A8C24B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF2981285
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fP1_xevL0X-i for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E9CC81230
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9CC81230
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BAA19DCF5; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9252152d1c7f1c532ad75fcf6185dbb0ab27af94
X-Git-Newrev: d3ab6c1fb25bef4d5c3bb82deffc9cc9eb6c096b
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.6BAA19DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3ab6c1fb25bef4d5c3bb82deffc9cc9eb6c096b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 24c412bd20..b9d6995ca5 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  af3ecc3a57f935be504f942c52d6040b  soupsieve-3.0.4.tar.gz
-sha256  924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0  soupsieve-3.0.4.tar.gz
+md5  51eb4768c710a5dcaef95fdc24d23034  soupsieve-4.0.1.tar.gz
+sha256  7621e3c5f6b371ed2c5eabaac5de300ac3d66d05e6d7f34783e31b63c4f90c75  soupsieve-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index e99770925d..13908edc41 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 3.0.4
+PYTHON_SOUPSIEVE_VERSION = 4.0.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/19/63/0b6bae54546aed98d72f12d09df57b19a287f01c84d22047fa2e23772ab9
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/01/7c/a64eedae0b7776cb9602d2da9cb8f8caae8e1b4c1da5e8e87bf1e68121ec
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
