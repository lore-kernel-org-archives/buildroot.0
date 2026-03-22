Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EDBF483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49D740C8A;
	Mon, 23 Mar 2026 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcfDhld-hS9N; Mon, 23 Mar 2026 19:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C3F40D27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295298;
	bh=yIMw5u4NRQMI2JoqpdPnO8BZ4Y8oYYr7Q7Xa7vCjNWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kl8w4dGWaUt5DmU3jtQAVyqkabXQDtKBZGLbuQgn6qcDJEe0nFOeVSRg3bd7Te5fP
	 lL3peRzGkQNK5KOQMMW+1AZnJLsc1YxZNxpLDTrjSP3NUJNmICup8d/PdR/h1zvKT6
	 odcPdH5pKD3pb2ioKkcUm+xcCqSHv9h5JrksI4lFxMxbfIm6fr8W11M5UqgJ2J9lXL
	 y2A2MOkFrdKMfyncZioprheVFYs2LsOkhEz+2ynKEM1wLSRUPjZWsZckYo0Nr/S6Ex
	 DI4I9eBpOUmpI8deJRY0B1Ek4HXfNukrj/mXPoPyVJnomX56GKijuGjLcNVzizf2U2
	 +DmMUcc9tJsRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C3F40D27;
	Mon, 23 Mar 2026 19:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA97C353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0DFC608BE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vg2LV8kUkvDf for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAEFC608AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAEFC608AF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1981D84C9F; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 12:28:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72711087f22990261b58cf5780219ff1d61e9cda
X-Git-Newrev: 86254ee6b5168c2b1c413c27810a541bda1dfff6
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.1981D84C9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitstream: bump version to 1.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86254ee6b5168c2b1c413c27810a541bda1dfff6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/bitstream/-/blob/1.6/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitstream/bitstream.hash | 8 ++++----
 package/bitstream/bitstream.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index bdaf90c012..fb41a40ee1 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.md5
-md5  34630d13332fd1575bcc8531b0a596be  bitstream-1.5.tar.bz2
-# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.sha256
-sha256  45fc5a5a6e4537a69fa8440821e87b76252135180a3070c631b0b36ce0a3b90a  bitstream-1.5.tar.bz2
+# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.md5
+md5  3106981310a54d4717cec766a0183f74  bitstream-1.6.tar.bz2
+# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.sha256
+sha256  dea67a9dca7eda0d72017359c8d649bd5a9d249f9f9a691b8daf739d16798029  bitstream-1.6.tar.bz2
 # Locally computed
 sha256  9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 12124a63d3..44228242ce 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITSTREAM_VERSION = 1.5
+BITSTREAM_VERSION = 1.6
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
 BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
