Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559A606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jb2M8JNp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6E840647;
	Mon, 19 Oct 2026 19:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPBlsr2gSdIs; Mon, 19 Oct 2026 19:42:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F071405E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438976;
	b=CyHtOP1sOtM3smkWntAMWe383GZSfh6GRgHd3iFIA+N7Jcnq/5+RwMsQoty1gqqQAb94
	 5dFHFAQOAb7l0ZmswBEwBUsoRRQ/iUl9sSpyD3bggK/qzY+tyaI7F3IkTG+ACf7r/hV93
	 c4CydWh3Qm91153qjBbpoHRBgVrlXXnaCJz5QiuFr5CAuMpV+nGz0DcC99XJVtkZrgQYA
	 cjddS+xa099+nU1OYylBKLNBjDwJKx0IjDllznmbzrQwf0vZdXiYZb+sSb+X/o+fwIG/e
	 K0QbxG4lfEKE3+AkQuuKP65lZ4pahKcnI6glT4rmxEpn49cDbhLysGftFtkLBjdli1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sfzQ8OP5+ZZR5YR+YYfsS5KB0hO+78p3lCbmNJJKDsY=;
	b=rfimHq07cA36/8LeF6x/peCZSMlFZCwOnnAEHOnGa9atkE6Caar2MwlEhhPfcwBLS3Oj
	 AHBUJJo8ociDitMRolC0/sP6/Yx1nLw6xmVPcXo3R/kfdYc3NHlKP7C6r7QanTCPV440Q
	 rvID4QkabiVaExplB6gDDIwyCCWJIQ1AqEWXtcJrP1hm9opFeIClzsjYLZyK0oPsM+8WW
	 Witht6hRghBIx1qN9TL98x1fR4+Zy5OiwB39kEgUswY9rSyGM61FZS7AwuNIzyUmeoUoi
	 qhQl2+2XMWlCCA5sc5+BHOZcd1FuRC5MpysgFMuVn85e1H142SmyjDHz3jtgnyKdMUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438976;
	bh=sfzQ8OP5+ZZR5YR+YYfsS5KB0hO+78p3lCbmNJJKDsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jb2M8JNpklh6KJo+2J/1owGcAJt9Msuqd7Gqn0YOMs2e2vzcb29gjqkLfpHIruzK9
	 djEa2OZRM3s9492GZx6sEqx/fo/AV+xXxqBt1RCjViD6u99VgVyb6mBh9ex0sWJZ6K
	 Irs6FhKdZJhNKlUW676zZoniCahBRjZXMKdhtwjTo1GVEcKxoAaTyfNzJBWdiD4By0
	 jnFPhr/VHBH5PvEqAnGm4FYKePo7yBq4UnluZVVnQA80s1a7+J7Bk+yxTX0WgvFmnW
	 LQlkvqeSLh0HNy+lm/L5sG+PnRWPGhp0jIaJ1jBs3+l1uVC2UhMC7nVrynzsKHHMIa
	 d8X2xyRfp/V4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F071405E0;
	Mon, 19 Oct 2026 19:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A3111CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B83606DC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdXrZdA-7YuP for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40FEB606F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438971;
 b=gNkrsJf/TqYDt7fv/twyNzrs1S96vUtcQ3chCjx40uXQuOtKAu+us/YXkh0LdPsjpdv5
 JpdlpW3aFYByJNEL6pwJroONV+vahoJYxFyNVP7Elu0sdjNGShmuO3ltf4o8URYb1w5k8
 eksE9h49tCrprg4AycZ/eopnXkritGNoVxoVOSmdYNnKtl1iw14NobxRqgJXWQmyiMZUs
 ESrKO9G/1PZubk9RnRoBaQZyD/dQYnI9ZC8qw7uwgKfSTDFOzWNx+qz3lVbAsVdSZLIJQ
 RPr1h7lYrhmyOcRqd4vFUNooMDQ1lxMYl1s2B+IwqE8PtH3Pnjqd1YJqgbedo1uFZ5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438971;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JsdfZbeI+5T9ZF7rcVACpykQ5QAKISmw8fadxqbeuYg=;
 b=FgpCyzUH9kGAHdq7bIkDUtVwA0XrZk1e2BX64uQi3q+X2ynjSDrjxZjNixFSuEtZkynq
 /q4YZEQjJFSpPKjwF5HCkg2X019m8EW4gFIKwCa3yFC495U/1V+eKymtlC4RvyVFlfV1b
 ssAxa/KS30q1HnnhTz3JX6d5aKMqF3X8KXHXbfJUvbInG62CvbSLTQymchN5HZ0VKebr7
 SmGtuctKiw6vsdqEzWB4ndtmyKenk4Zmmm3G4hPKqDDIJkW/H45P6639v6zhD8SecgLHO
 xvKuuQHw/ijkE4rp46yyGiv5CTO0/xqfr5LqsL6JuQL9pTQPadHTpbUeW/VGYQkUqXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40FEB606F2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA7D995C3; Mon, 19 Oct 2026 19:41:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:38:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38468a4713c69bd4c11d19fbac1bff6c7638e83
X-Git-Newrev: 47cffe76f391863199e9c2ef577bdc7a0137832a
X-Patchwork-Hint: ignore
Message-Id: <20261019194128.7FA7D995C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmlib: add warning about the need
 for NXP kernel
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47cffe76f391863199e9c2ef577bdc7a0137832a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building fmlib, either on PowerPC or ARM64 against an upstream kernel
will fail to build as the kernel modules include fm_ioctls.h, which
doesn't exist upstream. fmlib will only build with NXP-provided Linux
kernel sources. This commit mentions this in the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmlib/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 459d5bf102..17ab47ec08 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_FMLIB
 	  configure driver parameters and PCD (parse - classify -
 	  distribute) rules.
 
+	  This package builds kernel modules that need header files
+	  only available in NXP-provided Linux kernel sources.
+
 	  https://github.com/nxp-qoriq/fmlib
 
 if BR2_PACKAGE_FMLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
