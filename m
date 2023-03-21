Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1881C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 19:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7C840CC9;
	Tue, 21 Mar 2023 19:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7C840CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7kySqA1d5k0; Tue, 21 Mar 2023 19:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1F4740C2D;
	Tue, 21 Mar 2023 19:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F4740C2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4DE1BF955
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 024C440155
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024C440155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGL8oavr9Enx for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 19:04:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A7F400E9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89A7F400E9
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 19:04:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.182]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MHoN2-1pkgkf45Li-00EvSO; Tue, 21 Mar 2023 20:04:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 20:04:03 +0100
Message-Id: <20230321190403.19039-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Cu4eIHvqcQva9vrBu2qtsMmePsDsqKv9RG4elWpkZyesm/w5nGU
 z08NWE8d+xR0m6s9pzEhziFCwrGLxDgA+hJcFaw+UFANA6QDazNoLenRe7sLQMV3eKKOzxU
 R91pGPxbzfkwKYe8X5iN0Chpq09EzRBv7qwAHQDZvA7NorYUjTio3M+uNsR7JY0qqjRh9PS
 XQN97SqW30TrfxfTXXJiw==
UI-OutboundReport: notjunk:1;M01:P0:Z+P3hegtJCc=;KOEMgGPlYmJvCUlZcp2WpNRyMV5
 Mr8Q0T7I+s+sHRqEh2G54OTSznI2MoO1GMFKZrcxmxnHZZ5bByglr3pahM30FOZbyXMNHDXCC
 YSNE+g6yP/k053OAr2kHfP5uJqYlgclNIeH+sTy7OOV4iomk6LOjVd0UVufw1FiUQ3xX8iLxP
 bg05hMw/3uwF17e06UaHCrCsejhXI3v8SEPbsPfsJzfsexGfuYoM0KIrkF4M4mzPfcHKENeky
 iPWrEZj2OrfZw1EQClLreF0B+ULdFFr8cLoNIOIv0oie808SEa7uCRuw19TI3w0uHBKDJC3Nu
 jPuM8QJN4jgyMcsdFL3cy+K3gmIrsaEuyHanYgN/M1oAxYT3iKjwl7Ez1ESNakCP6pwNd+p7h
 utNdIDZIq2Bsd9LDGup9UCwDtqiDjrO1384XDbadNmTCb9ruB6TNVJ9Csj0qGR9VPFn5hZDN9
 xYfnrZxSPavGNSG2I7Hxg/d2bVTvc4vegpr9whaq5Kia5RhNNFZOn07HPhvUOGJj6HJL5WPeN
 MqEFXJQDhaWnsqvLM/LFpPN0IQzDnuCYcsN1BoU04Z+tJBuGqm5XiColjhOASBDGjedJut+Ve
 IzfnfYLSiP0ROfuZ9JrDknY4rRjJedM9aT505SIMJ8b+pUBFBJAvn8E69lE16ZGrTqy7EVZpR
 0IY6ZlhcoTIlguc2OljE4H1lowWt5CoVfn+oAmhI0R84CWoMjeHXvLs7HP85mTpS88dib9RB6
 DULmNA+UTzunONqecbR8laupaBo7Byn6B+MW9lA0KwllfTmo8hTNeKIH8VKonFG1Jg/VOyKnL
 wW4pw1wzZfzx8TG3ElUxf27Mi8r0GMbbzUIjZOfIc9sNH8VhyLmlNnRmQ2M9yBJiDDArQkOqd
 2U15K/7sOUUH9tTUYJh3gk3XZJwlGtjr43pDHCttCck3TKjl8L0GOc70MamgFAYwyHPSzS3x9
 gP+l/Vvh7YzHZ3P5YGDCuqJVIHw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679425444; i=ps.report@gmx.net;
 bh=U68ujgwKyF62rKopn2exHVok4CdhNM90v6FyTFffYK0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=mlJuzWe7ntXbORB7cEKmDTK3iOg8VVkE/J3eK9++uZ6CslKN3CfRIE/O7V3VsGkvi
 upqNph1i2bqLxZAHfDxU1KxXOSsueAqAiKJZ+HdZFRRXdMEnVl6FCuEu6fqYev5uug
 nt1nfqHzcmSd0epTuZaMXGZT+7xOXb9o6r8rlf2fq+qxYlXhYArxcBQcTMlf+U8wGK
 uoGNkvOxb4JfG2hgMrmCNR0vs157bq7RXvQa/5fMPbcPaEXcLl+hj1gmm6Qd05Munj
 C4AYTjg3XO42pEPty5A5S1AVd2OGx4WkBRGGE2o/TuJVUJRp96YRopY97A8dzsLkmI
 taEUS1vJ/iKFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=mlJuzWe7
Subject: [Buildroot] [PATCH v1] package/grep: bump version to 3.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00001.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 6f3bca89ad..c83e4653c3 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382  grep-3.8.tar.xz
+sha256  abcd11409ee23d4caf35feb422e53bbac867014cfeed313bb5f488aca170b599  grep-3.9.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 318e00940d..309987010f 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.8
+GREP_VERSION = 3.9
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
