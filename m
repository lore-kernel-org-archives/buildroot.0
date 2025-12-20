Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDF9E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 18:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B028E4091C;
	Sat, 20 Dec 2025 18:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGzmACxm8odE; Sat, 20 Dec 2025 18:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4D2406C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766254888;
	bh=kfOuIfXfsyQFfd/Lp+Hhqh7D6HkFw2FzIsqom6VJHR8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KRb9hB+668iD12co2YjNl4vYHEt2VnlNW3ebVX/YDF9lpZhd9F2K5Rkwa48DnV8wl
	 A+nMOQZzsYyoyhItOrDjkSJ8+BV5SRQ8TcEQT1MZM2bNfOeVNiJWrQAAvkxycc92dQ
	 NMZjXL+yWPvU/7I70M5g7BdHR5/sm4wJUxfAkvxsfuBi2GjpqrOCLYRQz9odAUm+SV
	 G5fQnLGoTGsafUGhJ9sO9HwJCMzeJ0+oSj/FIxE07KlFiCbTlLSbv9v6EgEhiMGSE3
	 MhzGCdO09PHyGzjxinENxkAW3ISa2Uz3/z/n/7WeMljo2EVfs5MIFSSo3ayRLp3707
	 WxVch/4t1LZMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E4D2406C2;
	Sat, 20 Dec 2025 18:21:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B3923D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED94940154
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOPEl88XS4Eg for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 18:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30C9E40099
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C9E40099
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBFC87519; Sat, 20 Dec 2025 18:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 19:12:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce823a0f5b4ca3c9276aad4146dcf5f806514d51
X-Git-Newrev: e4bd44dbdda406a2e189e6342b5157456ffb4ab9
X-Patchwork-Hint: ignore
Message-Id: <20251220182126.1DBFC87519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gkrellm: bump version to 2.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4bd44dbdda406a2e189e6342b5157456ffb4ab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.srcbox.net/gkrellm/gkrellm/src/tag/gkrellm-2.5.0/CHANGELOG.md

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gkrellm/gkrellm.hash | 3 ++-
 package/gkrellm/gkrellm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 27ba276efa..2f0fbcbeb4 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,4 +1,5 @@
+# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.0/gkrellm-2.5.0.tar.bz2.sha256sum
+sha256  68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55  gkrellm-2.5.0.tar.bz2
 # Locally computed
-sha256  6f83665760b936ad4b55f9182b1ec7601faf38a0f25ea1e4bddc9965088f032d  gkrellm-2.4.0.tar.bz2
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
 sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 257ebadfc4..6ee00858d3 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.4.0
+GKRELLM_VERSION = 2.5.0
 GKRELLM_SITE = http://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
