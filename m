Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93E4C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BAF80AA3;
	Sat, 29 Aug 2026 22:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7cQQfLnP8Eu; Sat, 29 Aug 2026 22:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788042034;
	bh=e7UfDJCyZi83jlmcXiqJlP0MTN+uiwoHuRKfxlOo8Ak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MfeF75hJLJDXLzRNS+l49HsVGioLHwp+x39wBFJq2ojvRvU+mR/BYoMzc1HWR3xxD
	 itHi7K38o2nfIeEbSd6GvHIe8TWCuXEq4bThTGelScqEkN13MAuSmaXM/sPW/JS2Ob
	 jk/vVvMExRSyso4zlMX7woQHzIj7WOAYisqsJcDQnPV0m6eT2czqa/jyIc6R1YTpkA
	 gf2ogpIpU+RsqOrq1cl4famigrBBUZ8O708Mzqbdvi45VtgrwNA7SaCcCaqrCzUl7c
	 rSJFTZtt/VtjGZvjdP9rU87T64uTIAE+77BhgijFkwtkDdTUVCE1qRkbqzNkMIBwyQ
	 1UifCu89tsRTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB1880E3D;
	Sat, 29 Aug 2026 22:20:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CED4A118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1FD180E3D
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiFopARwxxvj for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28AE680AA3
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5897F92228; Sat, 29 Aug 2026 22:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:57:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9c340a3947b7ae2c415bdbee6f76b568a257424
X-Git-Newrev: 1982fdeaa4aa3d5656717bacffc4b1e78bfd6b26
X-Patchwork-Hint: ignore
Message-Id: <20260829221934.5897F92228@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gensio: add portaudio
 optional dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1982fdeaa4aa3d5656717bacffc4b1e78bfd6b26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Portaudio is an optional dependency which is enabled by default since
version 2.7.3 when alsa-lib is not available:
https://github.com/cminyard/gensio/commit/71eef5e3cef2232eed85c5cb604bdf5fe3ebf580

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0c3ca5e03b..40cb0df514 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -62,6 +62,13 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GENSIO_DEPENDENCIES += portaudio
+GENSIO_CONF_OPTS += --with-portaudio
+else
+GENSIO_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GENSIO_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
