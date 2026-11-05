Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C4606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MhTfht+g
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C613381375;
	Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yyrvefmN5GC; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D46AB8137E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981309;
	b=HaJTQgtp2+L7YzFf5M3NoBuRwvol2J0lOZN54wLzA+1KpSdwDMKmgeHNk+6BW+iePhaH
	 cBGWj06TjZa45sOwkGzce3Ff64hznR2I8GcigXMYfL+31FRnEufJhLqCEMMeHhC8X8LOE
	 0w8Qz+i8T76sojeghEHxMvfBrTWdBrDDuiyQA0ik46kXUUsCp1RduePIzoavaVD7P/S60
	 CriT+HN9rJREETFC0ak77oCZDbQBfFdzwiq3YdjYdVmwDdTMJS+kz21Fgu7pZVQ8rPpRP
	 u/J8ebbyEUMBQDxSvuUnSKBfDyw+NJFkz9EQaJKcVZ5KfSsKKYBc3pKSXhFKuUL1FUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PSRDJmNV3M4dRtY7ZBVVQh6qGpoHx5QteMYsXYt3qLg=;
	b=JXrU3d5pbkIPwIls7gSqlnNYrzWCm9t9040Fao0yzHeaEUljCoGgf0l99xezAr/7XKEY
	 Q5WBsGpufIzYzvQ+T9uNUlFaX8yFKyumiO7g/WqtgXx8kTNd5+0Gq7G6xEHEp4CSR6qID
	 omLHzwyv6BVmRY1awK5UgroPdwQFcnkkUSX1/HgZeAqeF4q7oIjFU6ka/9TTL/VF1ZyHR
	 Ihc8MXUxhmi3BuM4ljQms+dMtz/Wa0Gs7RSNbGT0VizelvEUlP+3yqu/5FIh3wErPvmxq
	 1vz3FHj2+K87m1VHqfLG+IhTxI3JlsYgm6oBaha+D66/xpsucPY39Pq34p/uZWGtWTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981308;
	bh=PSRDJmNV3M4dRtY7ZBVVQh6qGpoHx5QteMYsXYt3qLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MhTfht+gc0yX3fo9lx0acTt7KK/8/NKYRgj76YYeNiJq7UMZtytdCPusnQ3PT+ddh
	 42jbE12MQIm6lBDlZSwrenuTLNHS/xVYK8LQDf38LECI2oJgQWp5q3fyX2rpymXUZb
	 XFmlZoiuvq4ev2FRseNcgXuj5c9iNFL0rq4ukuUKC3bNx463NY5QuKBGbd0rHIAdGp
	 snF0+OEMbm78qNXxO+QwStESFF8eRHN7ZZn6xDI0WFeDiQeouUa63aoSO8NvogyEXi
	 ZHfxnvKSQaZYEjkvt+ZboHj30QfNCDZJnQdGx0Wc9D7hlum7iRj5blf3GzvHziVv4M
	 acOlfqLpsTMFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46AB8137E;
	Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B59A7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B146400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDAkB2KmeDWA for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D040D403CB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D040D403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 047EB9E09B; Fri,  6 Nov 2026 16:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0c9f80d71abd53d433824ba95935d9b09f3af4ef
X-Git-Newrev: bb5f6c575083b7828983e92bacd5f68295ef6f6c
X-Patchwork-Hint: ignore
Message-Id: <20261106160645.047EB9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/rtl8188eu: fix
 build failure using gcc >= 14
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
Content-Type: multipart/mixed; boundary="===============6724691341630790705=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6724691341630790705==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb5f6c575083b7828983e92bacd5f68295ef6f6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 40a535a386aa3caef0e4f7da4c1f11619b912b5b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8188eu/rtl8188eu.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..cc4651ed3b 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -8,7 +8,12 @@ RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+RTL8188EU_EXTRA_CFLAGS = -Wno-error
+
+RTL8188EU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8188EU=m \
+	USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
 
 define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)

--===============6724691341630790705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6724691341630790705==--
