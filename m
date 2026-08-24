Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0224C79F89
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649D481196;
	Fri,  4 Sep 2026 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaUMNQizaEtI; Fri,  4 Sep 2026 16:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1BD3681189
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538948;
	b=AvLmNM/lhNIXLW6BMYHRNOVUHvjfDSxYCisFiirM0QX7Co1FKTwa9UV33lPOXw0dztB/
	 U1u4kECbXA4zvRtHU82ju67gKWX8FfYxr4ZhaF8RRbntg+X2OG8TgkG6nGXoUw+fVvZwR
	 IBdg60CTMAT+gQ3jQcTzg5TuwisHSjxawfg80ZhEjn1DY0GASj8wsKizXlEhnoO0+str9
	 VkeCxGn/09piSHp65R85hpnou7etnFncLUaH85p2wKgD9TqIga4k3j++ZP2/EJruB9j83
	 9b1rdjcq21hYXv3hBioRZnTkQqd7vkDsrX1FRkiblUVMNuvf1R+gzqjcbEcQDIUCZtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CWz+qm52ZhMMXhq0rQXDlZDO1c0poQ0wTwH0VJZ/Mck=;
	b=VosolZgOTvBsNUIkz6SyRQA2HpoP/YJnp8FmgElpO3UiysXJMEe6CdVS0Gk9FwjmiF16
	 NtfeSQTXc6tWGGT25MKX55Ov5VTq6buU51LMYWrVM31P5YKlN7gtiZ3dbsP7EQX/RtdNm
	 Epe1UOr/nfjkQVyi1mVwhtNPRyqAs41chW1qDYNPJQeKR37wJAmHct80cd/Gt9PsZxzF9
	 V5x1966E+C9o8vnkOJfS5aGi2j43dj3PgQXGhN4s44eP3hJczBsoGuFXSmfJA05R0YazX
	 1CVqc/O9z54XTbdBah14PdIc5xi78xR9IOrB25s5x8WgTun9fLsM4Mh71INCNBcZGmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538948;
	bh=CWz+qm52ZhMMXhq0rQXDlZDO1c0poQ0wTwH0VJZ/Mck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ljlwExuR7Cp5uaRqa4uR1RgcgWPtFR1x2emP880pLtnr8+8xEXZP0sOd7AEd02Ovy
	 FZcTlwQtJLDr84yEl4cG9czKl5TdPKF6qWBGDqy5cU6ZEwF3uo/hH6MRpjqM7h5O/J
	 f5sKst+OJcA2EUNN37HsNLT5hM95ufd3uiDnKiJjFlHeCT2ZpUJW+CUC4RzlZjjB/M
	 gC1O1Ypc2Oy8+VMHjbVyDy+B/Pbn9JRi4ZMXrJXm7dM1AKxFIAORcqBYF1vVHOskR9
	 tj9lzVLZit7x0GORpKJw5vm23n2Iri8svBpwQy76LpjPCOQ9RO8jbbooB3rK/lF03+
	 e4508O51dQCDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD3681189;
	Fri,  4 Sep 2026 16:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76565F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6879040A88
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLI7Rbdmop6K for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 25B2240A68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=Yg6VvqZHk8LBsaJFFpUwYt6zAYbbp9Fec/eg1bbIXWaiC20jK4zJ1ssg6Qv0OppGcfOS
 VQHxhz9ZFIypkd/hIbF35HXEl/BW5hc3UXQlSFINVZsfUUFEM7MipT0dagBlTyFiqMOkG
 +jMFDiVgaTi2aVrXQnTe7Xg/XdlNDaBNeCfl+V2Fsi4WWJ31it/Zl8KRczI5Cs4r7EKG1
 PCR9E9ZDq6A4YQj0pzowH35+4qRtccS+xkV7A2NTNzyJeL41Kp/n/t550T3xEGg8lxhug
 jRrXqDjSxa6HhORItxzbkdn3CC2jgSm+zGuXG0khzMK5oXhQj00lfgQwbZ+E5TwhTQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wZWaN3lWxWBntpVPKwAA/YZC7DvbS6hJCYNybz/1TLY=;
 b=EFGgBNfhgWhUfSx5QjQZmKmFIhkUd3Yk29EfM5KyfYSm4dZfipAITpP9aBHO11I+9Ea1
 BDbMNOelaVAVY0TK/N8e0QOG+Vr5Z23y6Gkmch7OpirQI+qwAqNpHdYT5Ao25703pGl7v
 H8xxJAx4noSKV+WzNL4Q9iR/rPM4BKdQFXTeUFqYGvffXbTPMBSEJk14zFRhqz6DZs70p
 rkthVUqedEP8RpFASDQke9wl9mV8ZaAfiB+XhFwdqo3dbNmhxLmRkCrSCR3ek3p45i3tp
 7uf3TZxfTXq+FzOhYgydr3LnAPePrwA7sE45+ZybHO3YK4suS3Uuo7Ebo3dzR2ETfbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B2240A68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A38394D3E; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 23:37:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
X-Git-Newrev: a8dd506faabc65d3cd678141f4303a8d88968894
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.8A38394D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: bump to version 0.45.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8dd506faabc65d3cd678141f4303a8d88968894
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/zellij-org/zellij/blob/v0.45.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index ac6a219270..73ef5729db 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
+sha256  ca775a98e78fc8b721dc3c67ca511733c3eaa106423652e621ae66b6d10ecbf8  zellij-0.45.0-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 4b4e7d6a3f..39cfe2e460 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.3
+ZELLIJ_VERSION = 0.45.0
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
