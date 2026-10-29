Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC45606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QsvQFNsn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77F060BA4;
	Fri, 30 Oct 2026 14:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyExoqe0sewY; Fri, 30 Oct 2026 14:07:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A5EC60B23
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369273;
	b=WxaDCZMPlohdF4HaJ25JK63MUtbFoo+uhz120Jfu5cO9B7McNRdEyRe+qeDQ9KWMUo63
	 WkcMqkbJun0GNLfrkmTL6L3jPjvuKFD++vlNQ4giqEmLOCpp6Zc4aymskoCjZFFb2W09T
	 VGZfJ95C5nYWeAkDufsLXylLwXOrMxZZj3JA56tRZxLzWGYmn61gPBgGIeVoeJXx3gW4I
	 wUuJz6zF8DL5HTNyFApkVFowhPXWK40tY3UPZntyTljzttuJL9yBiJTBqHFXIwSUut6iS
	 9AMkhB95eyuxgDfRhUtLWeL99oXvE5Se5mxezzcYgL5E0IKLkN00rafdzNObn7ncNdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sXPP/kvRFvbI97LKS2Ms6XnE+3IbFFaNRgOwVtChwlc=;
	b=ODb9fhItLfOrwRLg/iRNDuj9+WKb0MKjRLuFGTrx779WDDGOq6YnNXW4ERRnILtfMgrg
	 O3waZq/hDa+NqMBrHlzt/xvRTLnLOVoNCq6tcuvd3J709XP5nFO3l+lRptKTb1Dvlr4ZF
	 PO9Re80Yx9qjVv7q/8wkxnO8R2sOOopyBSnMyZHpmY5CaeAOaoDMzmiW5DrkVdNhknE+G
	 fWEDdXQS3hlZ4urAtYM6LOhNt/6Z6Fb8MOV+L7IfmYmCCVWO37IsBkQgGz2IMYds3ZGri
	 Kbmu8mh7wx7MK5lJ8wBngSR2UYudKBqBwDfBj2o+a2IiZ4INz1OOin1V5+y7HOP391g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369273;
	bh=sXPP/kvRFvbI97LKS2Ms6XnE+3IbFFaNRgOwVtChwlc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QsvQFNsniZpjEJtFpgl6j7EsceF9VARZNiGf4kjfWxI8ELOfk298LxnsR3cWo8BfQ
	 g/4oMH4fl1Y7sg4Kvfo5+5slUamobQeZFec1AIkfYxCdc+zBnMrd3t2K6BQjXhs/t8
	 58wHSOqJKYRJWHt2P5zjvZec2fhQkmT8/JtBhNQ4A2aFzm+kZAxts0b+G1thyCExQZ
	 0tzG8a1wZ37PxTkiRr/dFm+yQ5CgXS0Mgr8fUgWsIG4TTfYNx4fIco0+iUPdqnj90h
	 VJns5EZiZBCMFRYU+ibnao4zelZq5p8uCG7csTl5Rsh8MUy4Yh7h2o6HGzWzFGRYu3
	 VDSbRRCJWWA7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A5EC60B23;
	Fri, 30 Oct 2026 14:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F22F1362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D323E8116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGNZ4pSsq1Lt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0CA6F8119D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=FEM0ZJyN1Wi6Y8hAxUNESa8dDHBj/OKCwnf9AiRcBwPhlaSoLkCk0eHbdNmuQ1kAZD2G
 LSP555KpzPweFTv0KQWe3dedEMlgzlw+qW+uxjvMuDOjwk+n4pKnbPJzeuOSYmqMD+3q+
 /uEVeuviaSgCXacyibmjjJet/C70TRMuJf8iOV4EZIyLhh58o68IH7/MYIXhyCRLua31o
 3IYXRcWFMzdAVtRx8vdJCxU3Zge3X2r58wRsrNcv+E3e7wdqqDymqxqNFzq/8kRys0397
 YXzp4P6bjh6OV19MPsNHwlxkIh2G7PGf9HFD0En9b7D9uuSAfOCKiFkfdbPcxHP+VMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6cXWoMyLh6I1xk2glbDF5IN0zTV5booyqhbEMuxpcDw=;
 b=ALTBv97n0GCSWPc0mxBVqd4kZfuVn5jh8xZf65WomxGESmQIv9wg6PBGjxjJ3HteEAHM
 HwNThyIAftcLAPcqQE6yQx4NDHTuXXi4uC+iprBGKu8BDo1uCpDrHh+swtLMSjwNCbmax
 tGPjjWLf8GcB/PVng2kPhjkTv6zXkgziqFCkzECuO6L9NF1C8JFN/DylQK30gu7jJC0Wl
 zYhbw6vDlvcYmwWT5IF6NICkQYyA65WdrR41yoa0RWNARGV0/wSol4xQOVBqP+H/lP40O
 mWcxYfU2j4WnLfq5VrN40ThpC1jXA0K4T4ZzEyWq7/LmAeYoEMqhQ6vYdxqkDUgecsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA6F8119D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C3909D389; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: deeeccd806be1d51c91577586a7f5d9ee3fdf4da
X-Git-Newrev: a4478cf45b5501eca97303c3af3ef4fece14b555
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.2C3909D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.125
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4996087847711253343=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4996087847711253343==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4478cf45b5501eca97303c3af3ef4fece14b555
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/836970ddd36ab1076ae0958e76bd948d9d67f2da/doc/rst/releases/nss_3_125.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 4ad755143bfb63244d912492a38a1c3756ddde94)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 4d08187fcb..544681c9a4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
-sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_125_RTM/src/SHA256SUMS
+sha256  1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d  nss-3.125.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 86d2fcd41c..c01d313da5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.124
+LIBNSS_VERSION = 3.125
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4996087847711253343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4996087847711253343==--
