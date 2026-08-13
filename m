Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2861C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081268140A;
	Thu, 13 Aug 2026 20:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFJt9br2WlCR; Thu, 13 Aug 2026 20:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35218145B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786653808;
	bh=DMI8dd+WasYfHRnd2FKIyILk6iemQuCQfcYoR3JGJ6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ab1w7nkxBQc4tPoA8dPTPD12Tio0oiqlJ4iU3JIm5eRoRA14QvVMoZh2kLqTkpwd9
	 JzamK2CxekiQBTpTo1FuZsZh0WcfEdtNFJJqh6/djoti63olFiEWL3XdbEaZx5VXMB
	 PYcLKAM3/stdAndS5YKjsyobf83fDCfesdKgC3H7Pd8k8yEMjV0OJK2xdKnDOh4hai
	 zhPP4vKxOqh2U+PVe5IIs3Nq1QY8M+LqosRNkvJGl/belKrVs7Zyb3Fzb0M5YIVkdr
	 VVEshkZ4//mhERdpYW/RgvT5zfwqsxsWS0ow+F4vbwW9+BM89BZE3bDY1Kb2RabRxb
	 XRdd/BjXGSrUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35218145B;
	Thu, 13 Aug 2026 20:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F951393
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE8BE606BF
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieFRdfYBMgwt for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A48606A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15A48606A5
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ED438D5C9; Thu, 13 Aug 2026 20:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 22:33:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb6edc3ea1371b5c1bdfe250c8ed502a1fe69109
X-Git-Newrev: 4146368857526dea1255355ea9beff81aaa42d09
X-Patchwork-Hint: ignore
Message-Id: <20260813204237.5ED438D5C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 1.0.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4146368857526dea1255355ea9beff81aaa42d09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog since 1.0.9:

    Fix race in thread-per-connection mode on wake-up signal
    between daemon and thread that could result in lost wake-ups
    and thus connections that did not finish processing.

    Fix rare assertion failure in relation to suspend-and-resume
    processing (harmless if assertions were turned off).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index b1b943ce87..2515518996 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012  libmicrohttpd-1.0.9.tar.gz
+sha256  04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685  libmicrohttpd-1.0.10.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index c2e585adea..8756adb4c6 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.9
+LIBMICROHTTPD_VERSION = 1.0.10
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
