Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14766D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7474E409BF;
	Thu, 22 Jan 2026 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvDs7Rmh7dyF; Thu, 22 Jan 2026 19:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CEC409B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110829;
	bh=cEjWv0wjQ8ivsuwoKAthmYWk5LPL7NZ63MkPwnzbBe4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lX34L/Smd7VX9XwP6uC2XoYInl017gwofWbUq744oLpOQa1xljtQWunaMnPdewz+M
	 LALkbK0D2dGuax2mqAyopabI4RaR7zyYIO1GITKV8R130DjDk73AwxmT6T9wdhGyq4
	 IncoGrM7HgfJ/GiqWiUQPMNe6nlGEfUw8fWkIErf3Khrg2Eq5Ne0mmMBCjvTGOqS18
	 Af1yWRoNFkqdwbxTAkeRsYMOIVjSTRjPuWmoJ1LNZpGmt+MthehnDQLvL1K8oV491I
	 iSDAdB+LLrgbQ95j6v38ENEEIU2j7uXYMfuTZDNF2xBYXN6Ak8P6FehP6klcELKnSA
	 gqDl49Att9snw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33CEC409B4;
	Thu, 22 Jan 2026 19:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A7A122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58991822C1
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYdjVvXVqGZ8 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD30822C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD30822C0
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:40:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 605EE87577; Thu, 22 Jan 2026 19:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:38:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e58aba80e61d56ea61e7ef8b0a4dabfaa782220
X-Git-Newrev: cae3c75fd2e588d8f4de46a1910de15d1941b97e
X-Patchwork-Hint: ignore
Message-Id: <20260122194027.605EE87577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpagekite: bump to version
 0.91.251215
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
Content-Type: multipart/mixed; boundary="===============4138439378229350005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4138439378229350005==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cae3c75fd2e588d8f4de46a1910de15d1941b97e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pagekite/libpagekite/compare/v0.91.201110...v0.91.251215

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpagekite/libpagekite.hash | 2 +-
 package/libpagekite/libpagekite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
index 2c2e5c9b59..70aa5174c9 100644
--- a/package/libpagekite/libpagekite.hash
+++ b/package/libpagekite/libpagekite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  db835d49becebc00d462f2f47aefc1f1d3a4e0e096487cb3b4248134185df715  libpagekite-0.91.201110.tar.gz
+sha256  bab3ebb7c9861eda33181ecd6ecbaf29a287f88a1667d9f983a14f6b04074998  libpagekite-0.91.251215.tar.gz
 
 # License files, locally calculated
 sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
index bb235ba1f3..3bd29708e9 100644
--- a/package/libpagekite/libpagekite.mk
+++ b/package/libpagekite/libpagekite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAGEKITE_VERSION = 0.91.201110
+LIBPAGEKITE_VERSION = 0.91.251215
 LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,v$(LIBPAGEKITE_VERSION))
 
 # pkrelay is AGPL-3.0+ but is not built

--===============4138439378229350005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4138439378229350005==--
