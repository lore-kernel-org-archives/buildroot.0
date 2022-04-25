Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15FDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8034640323;
	Mon, 25 Apr 2022 08:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_eVGCfWbTWT; Mon, 25 Apr 2022 08:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E7D40328;
	Mon, 25 Apr 2022 08:05:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3C8A1BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91CE98144C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvVPvUQrZHXY for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:05:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B838281444
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58A671814B9; Mon, 25 Apr 2022 10:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1650873933; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=b9r1GY7ilafGJJIh1qVBhdmP1+wd2BFv5mXr17bvnxE=;
 b=LZuiIGF5WjHb0iHby/cOKhZZntqEHHMphas1z5gvgFZPhtKkvguzUVuuvfycaS9Kakihl9
 GeZADae7Lwmc0qXEwb2PJZTF9Nlv1NgcwDKnp/kHhrRXb6kDArRivSdS8RAA8cDRbyAa9s
 JPoGBwISXBBiaFQFuBhPKDKqf2zhvEs=
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 10:05:03 +0200
Message-Id: <20220425080503.769954-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 3.20.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: 2dad10f61914960b2bc05a650450d7fe2b8aa211@osuosl.org, Sep@osuosl.org,
 17@osuosl.org, Asaf Kahlon <asafka7@gmail.com>, Mon@osuosl.org, rom@osuosl.org,
 2001@osuosl.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>, "00:00:00"@osuosl.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 60e64f54d4..f37b2dee40 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  645192532f28254152b51c01868efdf9b766b1dbe49c77cccd6efcdb2d7c7bc2  protobuf-cpp-3.19.1.tar.gz
+sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 80764f0216..c4c33ba7da 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.19.1
+PROTOBUF_VERSION = 3.20.1
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 2bfef96676..ddfa48b491 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2286615a3ae3e24c3524d171b6728b77b72cd2f3aab905f6a8d3fcaf6209dd00  protobuf-python-3.19.1.tar.gz
+sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
