Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466F606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s9nvV8j1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60AE8128A;
	Fri,  6 Nov 2026 17:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WaeDKmMuXOT; Fri,  6 Nov 2026 17:28:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 205618128D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793986139;
	b=Kfl2pgAuJdwAFOaXmam0W8CAr9kBXlCGx0131wmOedFue2lZUua2se7VGoR6k9Dqp9Mw
	 w9BBGymeDspb0yas6xlee6I0jlJT2i/fZC44LVHzRU58+hTASRuxNmdw1Ht0qzSP++Tn9
	 ccibqvFeonIZgduiQ5/v3MPlKvxaLfNO4PMaNfaJIq05/+k4lSQq+8VTLa7VO7RRfbOGS
	 h8iRle/k78mFk1beQoUeDNjS2g1P3TSMbR70kcNDhukP16tJhfBiwoIVgrAvB72rb8l3L
	 1fVqo/FoWOICVW7QPWXAw0uxnjjjJ/P9z3Na1AydLsmLI5LQobSsOZ1oCrYcRcj3v7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793986139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U4HEHeHMyPRF/+z4+BNj/1G8971Jcw8csb66MdEJV6w=;
	b=Dt70JbOlBTHMWTE+tPzWBu1+QFytL4r6ZWPC2YL8JFJ8ptPki49x1VgRVM4MtGie7VFF
	 XzkGInjGIg7/ob85NVqO+O3iEEEJ/d2yH9PbAkZCJBaG3BztFFFSAos8awOEZ6P4SbKYA
	 yWjnbPuCRiYkiiR/hwczZr090AIwkvWDBCGYOTOxbdfpaKSGzm1XryHby8BKiDmdWdxhn
	 XkFzAAljFq5XTGrHPFaC7NTjJLzudGhBNeQBBzqawC2ZQ7A0yaszHZFQKX4h7DIvCzGMt
	 YFpsaBvibBene8qZWyOyWFg8pgoy98tCY5rg9I3/7LW7uQpCq41G+ipl0ECJYYfGpYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793986139;
	bh=U4HEHeHMyPRF/+z4+BNj/1G8971Jcw8csb66MdEJV6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s9nvV8j1HwXZVMa9AltOvrek3+LuexVxHBvW4sPkmoEGrDfnM8Jhe2Pt2R+6cQwJD
	 hMem/yZPZX9uqRJzzAAnK0GJ4ZT/zFis12u4A3jJHhjrCamFRgMVxQsf9AJOe6fDXC
	 Tuxhsf/JHcb8lIVZovTzYZwI5kioqF4UmASjr8Xgc0KwDDsJqGaQu/uAd82JZ1vORZ
	 mwYvhU+8MIz7yuTah5nJ1P3CRNhFhQTzzjAl4vj++bCLwz/dqRGuUT61IrtOvl1aQu
	 2edpiWdlheD+GPGfoda4nt9Qs8KyMaW2OLJUVlmijJH/DVdigQd5MoQj8PL8FS4N8k
	 /N7+KRu2rERdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205618128D;
	Fri,  6 Nov 2026 17:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6251732A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 487466073B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1LK8ppgMnvu for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:28:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44B23606EB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44B23606EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 618179E0B4; Fri,  6 Nov 2026 17:27:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89623a47f07167c2b34c595af7924c0004434e2c
X-Git-Newrev: f37bf98264c6a448e937c8ba7571a9cb72964ef9
X-Patchwork-Hint: ignore
Message-Id: <20261106172723.618179E0B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jimtcl: bump to version 0.84
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f37bf98264c6a448e937c8ba7571a9cb72964ef9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://msteveb.github.io/jimtcl/articles/jim-release-0-84/

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 906d2ccc23..16655ad85e 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f2df00009f5ac4ad654c1ae1d2f8ed18191de38d1f5a88a54ea99cc16936686  jimtcl-0.83.tar.gz
+sha256  435095b436b38b96dd85e8cda13878144813bf52066057f76368db178dd8fea2  jimtcl-0.84.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e81b2a250d..283cc0f4be 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.83
+JIMTCL_VERSION = 0.84
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
