Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD89606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hvQ5a2SK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7336160828;
	Tue, 20 Oct 2026 07:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXbbiW2aPSSX; Tue, 20 Oct 2026 07:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CC9060808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792480557;
	b=BFhzzBPBnkF6oot9Ew7prOVhRha+LwRG5390ICDIcdGUq3Rh70MtDXk3qUBy2dSqPSym
	 xq4kYU4cObDXnnIT2aD3Z4c2bd5anSSESVqlW/+L0S8lD7Oifyg31pSwV1Gfm0jN1BGdq
	 NU4rMBZFBppnxYkq16opkN7Qc8nxUA8WY29TZskxWnur38hnxdvfOD7PTWFiQoD+yrZKG
	 qBruty8b8vHCmbKt5/9uWJ6d7+OK1vH0Hq/JTDG9/E6Lefv9WGwdAqbS+4rLJp/wTTG8m
	 AGgLWG6qErJS0Z2mhemJ8czQaV1ZO0Mi7CuwUvL7RvFndmVRy6tSNFofvnPwwv82eug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792480557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UBJwFtxJaBNblq5mEaCjsVuBTT+F+lzhdyTnn1xg1fI=;
	b=GEcL42+2XUFnECnY5T2DS9FbLKcG/TeM/owZsqerVh2AIEeUK/E5DzKIwL02UnoitmXu
	 g/3ib2VRDqhwxt/OhKxPdj8+kRIqCWwG5KgEIdBzqUeQwgIeHX1Z5KTy0RSBiMJIkbKTr
	 zkA3QDbcWojUP0mc67Q10a/bYIihoeBCihFm/RV2MyziBw7/VLGCSRtXD5aAUYIiaWr3o
	 NTkGe2CN2tdz/xUK79X7sI3rIAh2KIjQ9oViaodtYbQuWMGsXcf4n/z3a/PKgy2/fVes3
	 AMIXc4qsxaAwi9dgCruNKoUbIf4LPrZKfeA53ChWNcxElibe8Li2VzKYajlzKo2d1XQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792480557;
	bh=UBJwFtxJaBNblq5mEaCjsVuBTT+F+lzhdyTnn1xg1fI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hvQ5a2SKZfo+31odws4K0s+A7l2GixTsCVO9UFxzxtLIX4Kghko6NdaYAYvXqix7t
	 dGMGVM72FRrTw9JJe5FktKhJMH7+ghyeDCZyuEG5xKSIuQpAPNL6obY1JTmOaMrjaz
	 jif1Q8uhfEidyjgcI9LzQekmvA726OS7xwbLX/eNG+u9Rxgiog+53WidM76xB5+ZD7
	 onEiy362gsrr9RK2R9mOTgRKDatRVpMAmWnMlWAEDfTf2Zwlj71fFOGyKdwj/52BQ+
	 iv35v23O8VxK+su0UiuFsq4FFt4Qs5oeOSypUO1HVmSPwdaVIpDtQX4Dh7Sgu8GJ/G
	 mE4tPE5CFy1Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC9060808;
	Tue, 20 Oct 2026 07:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0A6765
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A31740312
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDZCAvb8EG_U for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B5FAF4008B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792480553;
 b=V+cg5T/etx2WbAb87DLeCW89WHaW8ULLdBuXvncTt717XguXZubmp6Rljk2iNOWh+XqQ
 o/DwvqM4Td+6xQh11E6bk0NVX/gvx8BvDgouhC6uwXK/XN5y4OmafOaybl9Z9v4fplo/B
 EplS07uvr7GazNGJE0VVSSuwQ03zY01nlXZxd+7YbADQZdhX08V2i72UYKaWns7LYvbp6
 hD1eOd9+0Tky/XwIJQPqAnerkQ1nyEvlLLethvxflf62T/PWBET4rfGX66McxC2A3qd0W
 Wl1RSRsyijqQYEuEquR7fSN02GiUpaNtA1vJSVttgUR80cvZAyt+Bf5mgaklfMmDKxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792480553;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QVgZGeLTD1n2rZcpdcuOgHKSeBkrxSGQ4NCrLj8awwk=;
 b=Oj/PZ4t58/hYMXk8mcz/WKkI2SPKS/JBHVtY2Yg8QI6tmSAy1JaAf3YLoPiiIKvpmsHD
 Bq5H0bT8CHf8fYx3wk1B/ElwUgNGC9xN3WeqwfatG7R8FYzgjuYoyxoRGK8Jz1Ksv8hMA
 aE3gN3lu8nZNgSJV7o/Cy0YPnmnaH//lkFC9KfKOJsRclOt4uAWJVM1NI0vg7EaWI703x
 5qeZfpVtP0phdjTM7xg1XH6+QzOt7RFFPSZKK7HGK+5XPk254NV0URGZ+AaJ9LKK2yQ+Z
 yvrXUb1ZTxdMqyHTi/UxuIFf9kKPAcY6bXRnVq85O7A5WxxYJg3p7xY9fXmsaMlTxOg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5FAF4008B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:15:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD4D29969E; Tue, 20 Oct 2026 07:14:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:51:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f89e8c1926fafb30163df76985d4711c8985f76
X-Git-Newrev: de94a27a6379d4fe0142147b980a1d2fea351abc
X-Patchwork-Hint: ignore
Message-Id: <20261020071430.BD4D29969E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.54.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de94a27a6379d4fe0142147b980a1d2fea351abc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_54_1.html
https://sqlite.org/src/timeline?from=version-3.54.0&to=version-3.54.1&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 25ac602fd7..80f1a5bad1 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed  sqlite-autoconf-3540000.tar.gz
+sha256  926ef8d3eab93fbf6e06011901273eec076b25594a4e1cdadd50c987f4f6d64e  sqlite-autoconf-3540100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index df22314091..f77233bc6a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.54.0
-SQLITE_TAR_VERSION = 3540000
+SQLITE_VERSION = 3.54.1
+SQLITE_TAR_VERSION = 3540100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
