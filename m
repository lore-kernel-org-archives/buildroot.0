Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3F7CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D45680D92;
	Sun,  4 Oct 2026 15:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOl0p3TwLk6h; Sun,  4 Oct 2026 15:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6583480D93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129583;
	b=VHlNYIjRABraK0QbU7+QpU1M8VP6GIa0yKR2e7e5RAO1nADY9iwT6P6AiiFiQS+hT5pr
	 EHZIqc/J8qMtI/bXI3BsAoV6B7Jefr63BF/Gtd1Emq/hBpqPyBZV4Ets13MMq+VJXonZm
	 RNbAUX3c6oz8/43i5pH5A/3Whm+kmu/WIeVdDNRLTb/56eR9LWC1jKLCOT9lxj8aVh59a
	 bhNb7fYDJK++rkBEZUnX3Izu8SWxEzG7rAu7aolUj8dVJkthv0peThOTL6Jj9t5DZw+aA
	 b4dxB8OBm4jWppklJG+wj+MPbA+to5od1QvUQFt32BFCobhc2ILyf2l/XGc23UsEajg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i8Edq3RzF7KPLXSvt1vxRMnTwEKr8kRC1zzgMrrDrwg=;
	b=gcOY6MBx7rbMukRstMjBBq8Gtj69nShm816ZLeYzuVpCLeKM5rjK+aJwqKLInWjMF3Ml
	 BuF+wZumWrqe8iCt644jC95RJFH/2ykQ6na3A8MK2Ze0rvDv0A3yHJOQN3GU2uWNkl+u5
	 K+2UQkIGQfOkbq6L20vtNTDRt5U6k/QeUPs/csxWUybQssE1OsAlfPeqXYI0fftsxzFB4
	 quIlFqLEMPcrgQIw5Q89Ghq1Y5x+rPOM+IysFKy3Iw3XNVbJus8XcfO3jy7pyb0I/dF6v
	 GVqd/+L41DFDJaJRJkNGEKBidSkOls8uNV5wQmUutBoaCjUauRnHecntgqmTWoT3sEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129583;
	bh=i8Edq3RzF7KPLXSvt1vxRMnTwEKr8kRC1zzgMrrDrwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nJPDO6LaOSeyuwnrW18bq8PuYHz+MsR3cUpnWqj24hHzuGWKqDb1IDAgySTAQu+L4
	 aroSqh1OjsNtYvCLZpjiHgoxM22+AHLzD9I4uVdgMH3AHyPlGVuZnFepQcKiwe6V0b
	 lzignAqAc3JIwQD8r5CZPIcJf5o9wUQV9d2y9S3XyRKQZ912PEhss4AhjRLpX15jJ3
	 X2Mh23nWgpkm8PYtuMZGQwb6ggEd9fieSRQapgAKpE7Fyt+mPGnO9sxfxkczM0n8uk
	 PbKu8LJIlqsliU2CN5rWaKOPFfyAWy2L9OMnJoyJ0wGEXxDtXj1hfLudX7okZRyB90
	 8XViFZu/KqjiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6583480D93;
	Sun,  4 Oct 2026 15:59:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DD80498
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53F6B80AC2
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eegVI7iti84w for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A09A80ADC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=BPJtFeL8gNUgcKWnkqKUOuZ48Je/Fd6dqxQD5tyZIsTRy+8R8WafQPLoO50DYhP1w++t
 /WZYasFOveSUg3nLHF0tskYp28BfDsWXSU68zOufRVlblEDdDJzGKwbz+Jud0IhdMH1gw
 M1mnC1SA3xhStvAi9SJ+oSNpQj62vFo+t4IqE6UxHn+ItDCX/Zxv/aMeAoz6era6EUWrP
 Fat3Jn+g0DgaXR0ulghW8rQUt1UgHl1NZrpH5Gr4bGo1/y0n+elceWn5yRSTZ6Ldtxwug
 J0NNg5uxrynuBgUHREpWMco5jMTc16pm38NaF1rXmsCZPSOAtKZg4LwFaRem79/TuEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/DMJCK1K5cKlSbcn/1mfwBRTOVMUIWGyBkhblm+KUFA=;
 b=a+k5Md98AOTwDG3fyxpBi5T/619qcC9ptki/2WbIgqkvdtOJH+tzEV5icozW/CNw+Thz
 4PSJp9Frcs/KQt9OvIxvgN4az5X6LO5hCl9Kqo6onJazXqJgnwOH/OJ/MXHfADPLNte94
 kOfg/4i0RW5vNfusXlteLWRra21ueHcKjLPvVhiKSGxqGEM4kLPmd+JWtJKR7B8dFpufI
 XL9es94h9iE9zB0PJ0QPgjq5l9+CmNz5rjgQiXWKUOnbrwiiuKOS21AvV8i4fQZ5nURTe
 ZGwz81dI3jqL4PWrgVF757ab+czNtGNR2Qz43kzxvfVY8SEzHIora7OslHrx80nuMMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A09A80ADC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FD3B8C99D; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9293e3ef17d337ea67372768eea7efba2d09d31
X-Git-Newrev: 78aa2802a4c384ea07a12afcd931eeb41977bc1d
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.5FD3B8C99D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump to
 version 2.59.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/78aa2802a4c384ea07a12afcd931eeb41977bc1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index af30f9dff7..e157a5aa29 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  9bd25191c4cf31e6bde58788a297e8fb  google_auth-2.58.1.tar.gz
-sha256  1480461d8b2347e679af758f4003700ea79a59b603c9134e18bfa95e8004ee70  google_auth-2.58.1.tar.gz
+md5  5340972cded7915412d049bd7b0de69f  google_auth-2.59.1.tar.gz
+sha256  ce50fc533ac02f489a2b183a0c156672c376ecb2091b1127bc7efba2975fff27  google_auth-2.59.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index c3d6d3ed13..7131da6532 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.58.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.59.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/52/aa/8055c583f8eb69dd4544f0d6a83e22d2f01ab38bd2ce848ea599c259a2d2
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/81/e3/9f752a968e487fbc10b2c2a1dd561b62489f923972911009577bb88fe7bb
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
