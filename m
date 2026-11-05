Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB194606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=szW1ONeo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB654084E;
	Thu,  5 Nov 2026 19:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vV7IEjDGIZDC; Thu,  5 Nov 2026 19:13:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A424B40856
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793906039;
	b=sVks7oWqU0O4Fh8fg1Ta1J+W5lYF+ge+/qKOviVQTfVIEKFZVT4ut1wQxd+RDEPEQ3tS
	 kuERtClIcMNtCvoPH6ty2de5XCP71584Dpv0uL01eJD8uw1dMYGJnsdBFPf3sGDkJ2XUB
	 5ryN/gd8N609zaD3ceymhUB4Bq+7DK/Sdyo80d06OWAgLkgpvUS1XVdRrPPCi4khppOIN
	 xCxYWBtCRaCi2X4UI6Xb4YkyhkC9CMtriUVxIbFvxLqPwc+WT7D9+TgQsiWQfJk2HLE+Q
	 zpYs3mDqX5oHLpbE4czPN+TL0mCMhJrQlcKdph6rM8HVHQ2PTipylda6AH+T3S86pGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e3gd+S2Zu4d3leEA4fe+CeCsHLNRDSL+zu365RhFMN0=;
	b=AZQFd6GYeJ8cT4UEi5SnZjoCrVV+BghkHTUwm0hT5Lv+FdMwvNNJQgk6NiEA7RCqnFJa
	 7HeXba+bTvVQLpseOBEpn/xbQUMSdaltG7/0wszJFEuxHg/8TUIqgwLMg1qW3oJukE77R
	 BxhPoSXIYvWRqcK1hDNHh0H401AJmJwcUiEwIWFMbKV0S1FKq2kH7wioTNVAGaAP4uTf5
	 7H+B9M1UDHa4SLSHE89xczC6A2Lq8m3FMEZ2OcCotOqVIwSTMgTwW61SNrug7xiZ/PE+O
	 /w6+ji2FMtGRK0UKjyuwORzP/jcY0peuCaxvSLVtWaWy6VuwQaHgg258X4yn/0HMFQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793906039;
	bh=e3gd+S2Zu4d3leEA4fe+CeCsHLNRDSL+zu365RhFMN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=szW1ONeoUCmAeAqz2r73/u4s+gRSqkEfZTD4lxxPwRm8rO7ajknueUE/1lpngsJyf
	 XmDnjs3AqHXm5U8aOn59ZZriCBc6gBQ8M4AiUkrUMXrsUO8wf5la+aDRhp1NTtqvQx
	 +DmJxW1qFTOzc7lWR+r0vnVU4qX2b4sPDW1MhNPRRYOxfpHY8h7jdWFjNRYQVGmsQi
	 joDMC4zE9Ozv3gCwivbDasMDAi8jgKMqQ+vA8NohiSU42/GhVUH3BBk7MILHvOiVEx
	 adeTU5IS4tm/VND+0DQV728JYgGTmY2SDsF7ka8lWphxuyeUgq269xUazePuqpNFfd
	 D1o3BKzt0J4KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A424B40856;
	Thu,  5 Nov 2026 19:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3964AB00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B52D40363
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmLuYq4KA9TC for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F0C7D40012
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C7D40012
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:13:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89CFA9E042; Thu,  5 Nov 2026 19:12:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 20:10:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbfd535f16b3dc2b090f6f46426baacad3bab730
X-Git-Newrev: 6d80b5651d8126b15c3689c87d7baa12330df8d9
X-Patchwork-Hint: ignore
Message-Id: <20261105191225.89CFA9E042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.9.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d80b5651d8126b15c3689c87d7baa12330df8d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.16/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dc7d35fa67..648c28ae80 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
-sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.16.tar.gz.sha256sum
+sha256  6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48  tor-0.4.9.16.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3f07cc356c..17a80d5bce 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.15
+TOR_VERSION = 0.4.9.16
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
