Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC436606A329
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h3odLydQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209F3408B3;
	Thu,  5 Nov 2026 23:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sp7AswHPZZc; Thu,  5 Nov 2026 23:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B1E0040880
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793919689;
	b=sTXs7FX3XLJPUtu1+R0yN+WIuK0auVcPpV7yUQZ7Wf+W5Ku0i3hqOkbbVKkl/Rhot84y
	 6DA94hFxv0NSSrEM6klKFEM1hF8sV/IPsgYucQiMULrRUY1YzcyRycxD84LoGSdRhFfMp
	 Vb7OUhXdI1iZzlaKlhTntDfmuxb972pNadihP+9RtY3z4bPwhmx0xU9x6ubWKqyvgg5m+
	 0arGDqJH5qDinjg2i7yynwhHaM2UD+5A0+uXmk1+ZB1T5PXrlAggX7rQkKdTEm1kIkcdu
	 QP8lxdiNed7NLy0hLUscLS4KMCDyDP4kbckGzlMoemLYn3sH/gCvJp3W9PCbCj+69AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Eo7GlqQL7iIazgtttdOiYSvut3CDxB+BbPh0CVh9ahw=;
	b=GTaWv7wW/C+qUVCIAphdNveCOj3Fuy2hHVKGuprKN3T6bfwAjk0ULbrv9cs2H+841hW+
	 8LOvTul7q0foRr1eNBEAZSulJnHHo/lW5S+XO9wGdHlPhIRagwxmOxt64YfbQfBBzyvGf
	 1mC61M9Be/eDYe6AszAv2rhsz/qFKBfM6kkR3Yq7AbFs7LYyDkmO7626XZMldhpzaA7DB
	 LZ4VF4c7H4r7FN42fEELWFteaLynIj6QokF1mEYgNtwpMePKnuyIWzjjzgPyIW2PcZ5XB
	 LbokWJ3hZ36/ncW5AWZuUSHLTQ2tvRmTE8sYt1IA1sg8ScDb0TGlL7S9RhaiDzHtYBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793919689;
	bh=Eo7GlqQL7iIazgtttdOiYSvut3CDxB+BbPh0CVh9ahw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h3odLydQyYaPKQHSbHuK7xkXXlUMuQvwmezNfU2ty+j3lC/ZFKuTV1mPd6qnHtAxI
	 y05Wi+Vd5B/ruE4SJ8Qnt8ss6t9amwsPv/pi+vRHhCdyY6ntXGUh1WJJWz0hOPFtzK
	 QxpJ+4k6nuoA/HK14KLp9aTPNcsaR35ekqiKhDw8KIqyhmndvI6MpQuFmpgkUG6vZ6
	 EhTtxlGzFlDbV9svYg+tAPdZac+xNiWJfUv/6HHh/SN+L18SW8EMMz4QqvtAOIsbaF
	 LSnGpsveOxNsQjDwqg7uxalvJDTBcmnNJr3HepkOIuzBxnCOt61Kr77YGX6fKnAFQ5
	 bYKHzJfnXfWjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E0040880;
	Thu,  5 Nov 2026 23:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A151A137A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86CA240880
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z64Zhqlgn3nf for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B3D8F4087F
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D8F4087F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:01:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35BE99C8CE; Thu,  5 Nov 2026 22:59:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 23:56:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6004b205f5df573bbd02face06daef9ccc342d1
X-Git-Newrev: e8d7b4416942eab1f92069d249314294a2786914
X-Patchwork-Hint: ignore
Message-Id: <20261105225955.35BE99C8CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: security bump to version
 3.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8d7b4416942eab1f92069d249314294a2786914
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.samba.org/pub/rsync/NEWS#3.5.2

Fixes CVE-2026-119741.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 3fc2603049..183ffe1af4 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,4 +1,4 @@
-# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
-sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
+# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.2
+sha256  a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8  rsync-3.5.2.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index af18dbf608..29250e928f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.5.1
+RSYNC_VERSION = 3.5.2
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
