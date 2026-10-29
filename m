Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4008606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BZl2K5Xj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B187640D4F;
	Fri, 30 Oct 2026 14:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9CzdkHXxxoJ; Fri, 30 Oct 2026 14:19:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A390940D66
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369958;
	b=V4i+a3KFt1VJuvYxL2rJtVLjdwFgtObzo/f+Xh3Q1gnU7TpMkvcHobZZdVRFFbDuG03L
	 oFxbByAIuUEo6130ZLkLmF6C/EH0Jw6LFDSEJQYE8D1fFgZB0kpQaN9YTd+HcMQvZQHe5
	 /q5ynIlVma29KeIywNgVt4UElphfVsMX4pA3KVTfgLdiHQDeHf87kOcsaqhouSZKTMO3I
	 V7RdsRsz9t9J3CJik0ig6+1txtx+bEBpO9JiIRWu+lplpZLajUjNjp5F+TxHYJu3drYcM
	 XU0e2KlWRtCcaonAndeD/Wk00+m6DpvyNf0B91hyVfgabgVGm3OspKifzqNYTeYEQOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aIZwrTWZje/QC/Y4jLfreMLtTYQuKFGm/vrKWYeLbTg=;
	b=IMZLF0laeiaSlyH2KEfbvqyOoHDAmo7xCiYSW1A1mtbNKiSzIKKNxg6yBgetEK+boyBg
	 YOQqmw7UHuP/R4UBXArnhx6EvwNrqf/f7hp9/POrORag1IVuWSTOMXW/KyWnFmK8HMOty
	 y1RHXIn1eBvhLntuaf2IwDw3Gyy7WsRc+s+zFebxrOvBB4827ipoF3O5yj35yib8ld7ga
	 3Oc3JgnkmuhaDlVM0maPsSTalXR2iU9/o4Po83t6iJoLkFzUyx0iGw7mEiFVkRt7Hwas5
	 t04cuk0kaneKxI8u865skstTaJObWgfDN/KeWu+Mkt6PTeGqbyTUyyl/i8xt6a/OJJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369958;
	bh=aIZwrTWZje/QC/Y4jLfreMLtTYQuKFGm/vrKWYeLbTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BZl2K5XjRwueW/lNp7p7qW1cMXEs5ZmQYF7Ui7A9JfhahWOq3uf4y9rWfUKyJMRtS
	 idKzEUXYJP2MvWSPavKspe3TLSQsq4eFg2NW++nzSDGMwmTKNeL49VBjgxP4mZbcTc
	 dzub6CbD5xDo6YPoHFcv0CYyDfkRy0c9PDnfMNHUuC6EHpPSD3hAX4KV8jiRS2aHU8
	 jhbAjI7EYabDxBaTviJbDjYyf3qTNoynf2fkAgSwyKBDRKr+Dnn+fAzw0TDBXWF2ow
	 kI4dXWthxk7wB5fdQ5159/Xda/3UAUY5Edrp0ohDmzwot461A675SccmsKqjm9hu03
	 JNNeKGwFv3WjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A390940D66;
	Fri, 30 Oct 2026 14:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE50E712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C3040243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxp8pbeG9wKS for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C79A840530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=OYqePjPG2/L+K2LVxS3iukIP2DqlCp43YmZNEr7zNWmmGiM62lJjs50G/FXVYLv0/M7s
 iOocyDzFJzWPFPGsAxFdH+vVy4ahewlzvSDgpUT2gdRHDtfF1sHCjyg8o5VUzmb3QLKP/
 zyuRPfFCXTdIxPe45UopCfxifbbtKj8EQJG5xevo/RscnCX0gl/F+3sIhtle1Mk0n5dY6
 ZekS/I9wikGe2UfAwsYrjjj1a4V99EIShXLDtWyJICcMzXHeqGsdz3tHb/3KivV+MgAWf
 O4Fj01ImLgCDRz+MUV7jiLqBPcB8Itu8NBq5/j2Yv3d5LQOgW/zRx2NNrkncMtS7BVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2cRVVb34k3DThjJYKBtaZdXjSjg7cvsANB51EjnuV3c=;
 b=UY03QJ2/gNlj2hASGZLl/GeImSNiYw6iOka3/ZREqPZVeTP5eWHql3qnd0qJDnwMPisc
 kFTOY8RE3iW560+5oqjC/KkBJ5zzRkAHmL1UKnttzv4DLpx2/5zTeBwAQV6ZIMKm5Nsri
 3EanGoJkOnvrUc9BRD1qXqxcCyibNOTR5K/d00qjBgUfhd+WfApdlWMSdPzI90o3tluT9
 q071zmx5E0qAhkkeWR+VsmW69MgaoTCUcO9ZQ3kuH4mTEfbsU9c0RkCpR+1MTL5qYYAUm
 0yGcTbM+oJlFcqV0jnj3+qm2LSwrRIsao3FKgTQhMhR9z36AEJEfR5gVyX+KpD1sPsA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C79A840530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6BE49D389; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5197dcb6e1a4de06b4c94d599c7dfec9a7cf3c0e
X-Git-Newrev: f38d10011347b3d72a8a4724dcfcb2ec14c63887
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.E6BE49D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/nginx: security
 bump to version 1.30.6
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
Content-Type: multipart/mixed; boundary="===============3803678167757745479=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3803678167757745479==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f38d10011347b3d72a8a4724dcfcb2ec14c63887
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes the following vulnerabilities:

Changes with nginx 1.30.6                                        14 Oct 2026

    *) Security: a buffer overflow might occur in a worker process when
       using the "alias" directive if the request URI was changed by the
       "rewrite" directive and was then mapped to a file path
       (CVE-2026-15176).

    *) Security: a buffer overflow might occur in a worker process while
       evaluating string expressions with variables, which affected the
       document root calculation and request logging in the http and stream
       modules (CVE-2026-93479).
       Thanks to Matt Suiche of Tolmo Inc.

    *) Security: when using HTTP/3 a part of an unknown frame might be
       treated as the request body, which might result in bypassing the
       "client_max_body_size" limit or injecting data in the proxied request
       (CVE-2026-95101).
       Thanks to Hansol Lee of GOTROOT.

    *) Security: when using TLS session ticket key rotation, one of the keys
       was left uninitialized, which might allow to forge a session
       (CVE-2026-97629).
       Thanks to PhiNode Labs.

    *) Security: when using asynchronous file I/O (AIO), use-after-free
       might occur in certain configurations if the SSI page has "include
       virtual" commands (CVE-2026-97205).
       Thanks to cyberlancer.

Changes with nginx 1.30.5                                        15 Sep 2026

    *) Security: a heap memory buffer overflow might occur in a worker
       process under certain configurations when using HTTP/3 with OpenSSL
       3.5.0 and earlier (CVE-2026-90439).
       Thanks to Banny Liao.

Changes with nginx 1.30.4                                        15 Jul 2026

    *) Security: heap buffer overflow might occur in a worker process when
       using the map directive with regex matching if the map variable was
       included in a string expression after a capture affected by this map;
       a similar issue might happen when using a non-cacheable variable in a
       string expression (CVE-2026-42533).
       Thanks to Mufeed VH of Winfunc Research and Maxim Dounin.

    *) Security: uninitialized memory access might occur when using unnamed
       regex captures with the "slice" directive or background cache update,
       which could result in worker process memory disclosure or worker
       process termination (CVE-2026-60005).

    *) Security: use-after-free might occur when processing a specially
       crafted proxied backend response with the ngx_http_ssi_filter_module
       (CVE-2026-56434).
       Thanks to P4P3R-HAK.

https://nginx.org/en/CHANGES-1.30

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0aef99c165ba6fb4db33efaec77c113ff03eb80d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 6c3afa889d..646b51997e 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
+sha256  3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8  nginx-1.30.6.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ad61ef6140..c330e81ebf 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.3
+NGINX_VERSION = 1.30.6
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE

--===============3803678167757745479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3803678167757745479==--
