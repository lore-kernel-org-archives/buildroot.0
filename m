Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE8CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DE9615AA;
	Sun,  3 May 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48hNS3HE3b8J; Sun,  3 May 2026 14:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DA261577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819893;
	bh=RsNOX4QUaU6L+GG/y02pBu693lk51Rao2mAQGsNAeR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Env/XnKe1BrJtie9yrHipaJtuSFctSaDMQ/5ggPSBFr9yYHVOohqh8L8rXd2q37+u
	 w16X8V7OiXM92Fv+bZFkd1c38CqzOXDbI6ofq/SNU9xRwFk2W9Y/NRUCXtgeJaQO4L
	 sWip2Ye/cR4CXnri3/zThqj62cNBjCHb7Vc6AxBFj72Z/kTPSHcPRlScZ60g1QBvG2
	 i8Y99uhA+wYxa+L5nNe31V5xYPXwInGZrtFBegbXLeKo8wmWpnBD0TqN1OeyUsOomV
	 p89TBhGZwP78xIrG20b0UMrGW5NkngSbzhD8cbqt4Ma1EvrNHLgarRWTTzWlzeo3Hg
	 vf04bEahIxnLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DA261577;
	Sun,  3 May 2026 14:51:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CC5A392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7C9884264
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-74jSCRdnFP for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED9248426E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED9248426E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B71977FDF8; Sun,  3 May 2026 14:50:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 136af2ee2e961cdafd443fcd306c5145ed6905f8
X-Git-Newrev: 5d695881f8dc68ff1efe2cce75dda462c5990e3c
X-Patchwork-Hint: ignore
Message-Id: <20260503145045.B71977FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: bump version to
 1.17.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d695881f8dc68ff1efe2cce75dda462c5990e3c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/scipy/scipy/releases/tag/v1.17.1
https://github.com/scipy/scipy/releases/tag/v1.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-scipy/python-scipy.hash | 4 ++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 16c3af029d..27a72904d2 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  db334c9cae4eeb9f306c342b3744d653  scipy-1.16.3.tar.gz
-sha256  01e87659402762f43bd2fee13370553a17ada367d42e7487800bf2916535aecb  scipy-1.16.3.tar.gz
+md5  d36aba61d4b01c50551efd38ca03752f  scipy-1.17.1.tar.gz
+sha256  95d8e012d8cb8816c226aef832200b1d45109ed4464303e997c5b13122b297c0  scipy-1.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 4d8d7b398e..8c536df130 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.16.3
+PYTHON_SCIPY_VERSION = 1.17.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/0a/ca/d8ace4f98322d01abcd52d381134344bf7b431eba7ed8b42bdea5a3c2ac9
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
