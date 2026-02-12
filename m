Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EBEEA84F
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2BE60BDA;
	Thu, 12 Feb 2026 20:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72em8epuEM1A; Thu, 12 Feb 2026 20:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C5160BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770929002;
	bh=VUGwSPSjKOOkm6LDgidoClYbYXMeTxieiBOqEz0BUtI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VBCW/Ym3NTbF47/nVlFNAAUfS/LCC5XNpWnUl8HjY7ds/7zTjwQjXG5F3VdB2FFKH
	 l+jdAMkZNQJkxU2yLuU7iZBaC/8u7hArm/2sE9OTt0H5iQ59vd2/Pd5EuieejGp5Xa
	 9QLnh7MWSyB636Mg2zlYb4D+0UAs7h5JEDObzlTG4+2LoAhtHNlzh6bV06BlmLozTa
	 AY9GHB4PC/+J48AmqDj3UqsvytteLKL5XLXeDczpk1kz0fdfq5TwNu/T6icoDHAdFZ
	 XaPnhIScn7eiZkALyvsEJ49FuMp9Kigcn9eFtOJBqJBhi4hDSV1nM17NFhiQgIR15c
	 pliuW8AeHibdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C5160BBF;
	Thu, 12 Feb 2026 20:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF3E1D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AFC960BBF
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hl2eYXmMJywy for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4ED460BA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4ED460BA8
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 891FC86C83; Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 21:08:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d5b45653fdd39a4c739c3fc26b041544b20115
X-Git-Newrev: 8a253434615c83a76630a6691bec95e0bbd3147b
X-Patchwork-Hint: ignore
Message-Id: <20260212204319.891FC86C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump to version 1.78.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a253434615c83a76630a6691bec95e0bbd3147b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/grpc/grpc/releases/tag/v1.78.0
(v1.77.0 was never released, so no log)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 130e098c9e..289a6f8191 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0af37b800953130b47c075b56683ee60bdc3eda3c37fc6004193f5b569758204  grpc-1.76.0.tar.gz
+sha256  e2ace790a5f2d0f83259d1390a816a33b013ea34df2e86084d927e58daa4c5d9  grpc-1.78.0.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 77cbc366f0..c99863e92b 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.76.0
+GRPC_VERSION = 1.78.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
