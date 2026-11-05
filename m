Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C47606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LK3DvjAN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71282812A3;
	Fri,  6 Nov 2026 15:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gb4EEeDBj-D7; Fri,  6 Nov 2026 15:59:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79D29812F6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980757;
	b=oNJ/bbJH9lvU6axDsh8Q7ZrKY3tf/djs7uQwVQ7tYzG+kbU81wxj02c1BiFNru8DRYNi
	 qjStJ7XqBwBNu5zcCI3gMR9nj7+tX/VM3ju7yh9QcCd3YhjKSwvC20pBx+XGI3oLpNxDU
	 VKCUr+6SWt1TgVvLOeOFF7koooTWknfHZ0EwVrkZj5xNWXjfyXtj729B48W/y4Vy16XM0
	 cRyHMG6tnAh1xFGKXOf93LF8tf5N2ABSM3W746zogHU7jSlZFlTkmjoy1wUNMIolEwdM/
	 B9PG2sEjXAsTpIQfnOeaMoBzjy2rWsA7i0qD4RzD7l+PjNHT1Uo9iT++fc5atNTSXFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1ifD0E4M7uC2QjSRgoYu7XKnNyq/lLqpKBxGIVUharE=;
	b=CdgdLnwJvzb3Hy1wlyRXwOtrFbjMUa6HDMFnreIqoCt0ww/7MZRcm0pt4pKT3sV2UPbq
	 4M5efqVdsjCV1n6TgcCH3O9AAiYxzz1EgXmYEKq5KRBfvRSTf3YLnMt/IEvtleRrnPrzP
	 N+rmXVHjxsWB+R5dtjz05YaBbfmxuGtcpUbBKh6XQ60f3xurzXRDj0XDSwuHb7TfOCqwn
	 tkyQ/z+mtvnek0PCO2/l5j5EW4GllVjRb8PuAmsJH6WCnSlh+yKV1wIiz683Pfk510uVH
	 aIGzT0v4/ZUzpcR+apqxL5Qb6bJyT/Z0oSGG6euEXrUqLsRl1JBwYD7R+6Dj+0xBkqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980757;
	bh=1ifD0E4M7uC2QjSRgoYu7XKnNyq/lLqpKBxGIVUharE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LK3DvjANDqbYAN4kYxTnvhaUWpG7+I2s++0H2cEBvnsVwbQui8kJvk+5cRiW4oIYq
	 nMI+OPzLbPHLuYmdmvG8yD8xlW0FaUgAUKRNoK8dz7LP7oV/WB/WYFIMwftt1BWKI/
	 RhyHpJmb9pT2vNmDjMh6S1jZ9o7t/iV1uLc8yui01oWE/2v9j2cvUt2NCOZX5WVVBp
	 VXiU293QX0T/jKN9JPamVEn2f9rClHWilPra3PC+9cNNsVHmJSVKAfrhq1Jdhq0sGD
	 WOb40eJ8T5zHrOY+Ty/OgtPr/FHEtaLcqxSHNt7Ditq37WwnxMCGjgLFbgCfdJLRr1
	 3GRVf/CI1XU1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D29812F6;
	Fri,  6 Nov 2026 15:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C18FE4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0687406CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CgMgjxUujrv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D6CB140906
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6CB140906
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A2DE9E0A8; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3133b61f8547bc41b556761edb27eb16e22755d5
X-Git-Newrev: cff54b0884819ba0a81977e6d94e6ab43f56e7f7
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.1A2DE9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/18xx-ti-utils:
 fetch from the BeagleBoard GitHub mirror
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
Content-Type: multipart/mixed; boundary="===============6289282628845548511=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6289282628845548511==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cff54b0884819ba0a81977e6d94e6ab43f56e7f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

git.ti.com no longer serves git clones through its cgit web path, so
the download fails:

  fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403

The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
requests, but fetching all references, as the Buildroot git download
helper does, fails for this repository with its ~1000 refs:

  error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
  fatal: error reading section header 'shallow-info'

The cgit snapshot tarballs, used before switching to git, now return
HTTP 400.

Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
R8.8 tag is identical to the one on git.ti.com (tag object
6e8dcab3a39a, commit b23772347318), and the generated tarball matches
the existing hash.

This issue has been present since commit d8b15b078aeb
("package/18xx-ti-utils: switch to git repo"), which introduced the
cgit URL; it worked at the time, until git.ti.com stopped serving git
over it. It therefore affects 2025.11 and later, and 2025.02.x since
2025.02.9.

Fixes:
https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f

Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a34e1e89f6b9d23270276fe73b9253981247cd8a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 3e6f715730..6c04b60723 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 18XX_TI_UTILS_VERSION = R8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE = https://github.com/beagleboard/18xx-ti-utils.git
 18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause

--===============6289282628845548511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6289282628845548511==--
