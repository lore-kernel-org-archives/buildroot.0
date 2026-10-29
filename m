Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D60606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WExHi1Px
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E9EA812D4;
	Fri, 30 Oct 2026 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jduTzqBlTJrm; Fri, 30 Oct 2026 14:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A323C8137D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369906;
	b=nVB7B+UvLF3/hrHKtV7bOvyscqbH2JkyQ9VgVgT/5lP0kNWJoxAJcfjR6CfzHoapaqp4
	 FBh+PCwV9xAlXUeu3eX2yamB52M4L2VF1gN7N5bwTfVYi+b9+E57FvBUlwTriQHqvdo9m
	 bnQVrIfK8w7uzG879YCPeBlbWWv0KmbBAY+3UoRJ0mfPz0aCGazuOTDGhkWs61aaGz8s9
	 qWOU9RB0iGyi0Z3zy9WKUC3AI0k+x0cu71r2LacpO8HyGR/cx2As7UMy7FCqU34Bm6QAp
	 KaLbVI4iAz2fy2sCTXhanxWk2FSQkDqoGUaUUKqYf18XpeAFdj4kKxmhT4muFtYEGEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369906;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lqPjcGUAZvGPxjvTjWtaoCBYaAiisCqa9aJvAx8IwW8=;
	b=NXqugLiA+JuS+JXxbDwlQRrg53neYz9gKfm3Pc8d7Cn3cqvIl/FxGGNNN+NP2lyL94ZZ
	 b8m6qLMdJ0WGnEmV2AoNhNwS3RC3UwovinqvpxK57hiRTYuoanrq/sqX1ljbZmNiGnUU/
	 L3wTUa+DK2MHtmMWKI97ezkNrPKVaRDuHk1um1dBxHQEwMaj4d3vHYtn+n5EW3rSIeA3N
	 WPjynVLWL5SSVnwPjENg/ELnI11taAowf9YWeuADLP7iUIR/GN9nKH5qX4W8b8sjxydy/
	 kFZlwlYJ3v5oNz+HSKDFshb/jAAAnO/ERmD8KUmjQ77kYsQKzj6waC7lM5XhtfIkHGA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369906;
	bh=lqPjcGUAZvGPxjvTjWtaoCBYaAiisCqa9aJvAx8IwW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WExHi1PxpoyzTFbA5XhJKfbtdRJfqlRL+UraicyVtGTCSCvJh1hdbxgDJ9PYMgMDG
	 6HH3X9Tljl5n75suCzjo+iINhnq0T96YUZDZibSHzqNYbMLWlqMJYC7sdikDMS7U0V
	 twdaBBGhzXCF5dq/w2PbhMKIsqG9AQBg7NfqVtU6CaWbL4SSd3tLFm6fhwshkS5Qpv
	 QqmXZ0GTYaulXU+cFVw3xcnO2SoOrvd/s94nUdBA6hokBj5+gocv/sUyYllKrkOzTO
	 LznGrY/JNuNKsunlzq8vbcsZgAhDzuFF6GvXz35tPm3XlId4biLpOex5P+ODhfQBJT
	 91sO3gROc1b7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A323C8137D;
	Fri, 30 Oct 2026 14:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A31ED43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35A2A812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eu1cD-e7817 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2ABB5812C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=HXg398iCQ0RmD3mZfuBexKxq5l7yy81ODAxzEQD+hD13XiR7MIO4RbjEtd/GCI28xlwf
 Ep4i0Uk0P/vs2iWY1vwxZqQqDAygjYe2HZDOIjLWchjbBty1+k22Nm1lkQ15cAbDAGBUH
 WokjjiLSPGtWq8VDQk7XJR390bvAALxGlzOnXjPJj0ik2PiuhYH0MpPGlbJKqnrAvQfYy
 ihkQ6PzJXKhnBUXYp4ev8jzWMWz1rhqudISmKSNF2AhAvCGX/TB1unsjuzDD1kIXpBhFq
 tT3TiVhW8C2InGQSDgjxNiHCnWBpBwMI9JY4NDpWtew5Jvbk0yy/OfPTUuBT3BsM/Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8bqdi7UWFcsvozcPH/+Kui/zDYe+8pVqVZT9J96xSM8=;
 b=WaNP/eoH6bKfvHVa2bEnbXqqQWzXIFGytqr8tQTfcfcIOyc5v/Ipe+o+8IgRouwYEb6l
 USK8Kf1RMB9kzqZ/6LwbirTz9TnlwYia8E2PFIWVP6podyzZUiLc53BOzEYyyhSBMqVQt
 AWfg6gU6KZdFKUiYwDRsS4H3dRYMxypjoEJuek2GBIkgFARLqZSzy/ovf1/Yk1ejtyJmN
 FQ8J6LR4Mj8WJYmSxkndczBMxDnYY4K46xA4jWsXbN4qmuldc3Qp98y4U+rBl481pyGrD
 JDGEJkTxYzQEXE3NY1Yg9SLFUzswp+XLkLGKOZJysLIHXKzbabRYq5iO+R+Wotabw0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABB5812C3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A1A69D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3de3b2bf0cb6bf5360c8be23b48ba0ed54594345
X-Git-Newrev: 6499ff3cb7473d4776df158612a2e4e2f93fab9f
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.4A1A69D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_image: be
 explicit about using libpng
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
Content-Type: multipart/mixed; boundary="===============3379205430960704407=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3379205430960704407==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6499ff3cb7473d4776df158612a2e4e2f93fab9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In additional to specifying -DSDLIMAGE_PNG=ON, also pass
-DSDLIMAGE_PNG_LIBPNG=ON to indicate we really want to use libpng.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 785365def77065e0338061b9cad5aeee481946e7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_image/sdl3_image.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index a2b9f62fa9..64dcf9df52 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -23,9 +23,9 @@ SDL3_IMAGE_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON -DSDLIMAGE_PNG_LIBPNG=ON
 else
-SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF -DSDLIMAGE_PNG_LIBPNG=OFF
 endif
 
 $(eval $(cmake-package))

--===============3379205430960704407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3379205430960704407==--
