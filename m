Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F0606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HxeUrlPN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CCF81201;
	Fri, 30 Oct 2026 14:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jT1lyNnCNj-O; Fri, 30 Oct 2026 14:06:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 460ED811CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369202;
	b=at9yGY5HfBJJrGTf1G5R9XObUTwuaWz6SHzhYJMYfXpQ8N2GRzcodEmJBHhMi/GhcLyL
	 Hx/S4f56ZnIKGD2ybLHvNw5ZvjpX7TkRN9wYeweRlfaH0zkZquq/+u/oymJdeoAT5f7Ug
	 PGxm0g0XaOubEIuA3V9cG4ldZnxRwPo5AWjQt7Laj5x+P/mg1TkLNvk9KEVKvtexRIQhn
	 IMrvhwH37dz+67TmfjUYOEIMkp8XxP57Ll+wGPIZOQKaoPwq3AEFXUx0Yg7MnxUDcqnFW
	 s79lE30taBThaWEDRHz1vfRKfuP7Lr5ii5RjRoflO48QdFL1VjUcO08TuC+FecFpRng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fHzivWjYt69CHl9oOcOZrcf/LtwVm5xDNvdOvHF03VI=;
	b=U+cOO2zuKdBLakndahBmkSdlddlxD4vcyDLOFTfZPv1isNpbuN0xUDKbGLhgxS1PIQav
	 3oR04rr9s+Yp+3bmGHKW+fUkHoS1Lu1kcugghlfOPV/ifFoQAHdY2wwvFgHwgY8i5EvWs
	 GLCuZguKY0AxWTee7P4zwdxPZq2S24UH0+kyLFDphJ69Xxjv/HnwsuN4+tWwi6q3FmtwK
	 njDranOGfy6oIXZ2wdJ72hBZMZ+e6tB5gElKisyMUNFbamaN1epA4+LtI6RRbP3wU3NZq
	 8y9Mox3/a8g8xbVHm5brjA/wPO/dt137EVqlx21EXoabAUHlec5RL8aUgVa+1jVVzog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369202;
	bh=fHzivWjYt69CHl9oOcOZrcf/LtwVm5xDNvdOvHF03VI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxeUrlPNPY4lqBgy/7Ks4ssJGwSFdl4kFA29fweohU6FitvPvtrK34oJq6K63OxeA
	 VBaPrkrp7en8AR7r5ba6+tqWaByl1e1TuFGjiJSNl3oKJoZwdJRs9F45glSPYim2Y7
	 UvFrGBKz0L3xJW7oAUOPnEf7zZB1Kj/EsTC7bHKxUdyTdUM97ZJiAJPVCEqxsFyDtI
	 MJaVrKA+76EDfuIWcRswI+hjvPKyoTPCmkfYBlfSVDcsmcGPnqKfJv84RzLaraPTKa
	 8f4827Bwj4is/S0uVDA7EKjq7FTmDzoCT5oYr67gwOqi9ayJugUlsh4UwLvHCwofSd
	 WvLfyhxOUxvkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460ED811CF;
	Fri, 30 Oct 2026 14:06:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BDD362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A92B740AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuEqOf63qI3b for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CA8BE40B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=F4bQUi6ggg5z7+KIQQHH+6kP4DiwG3YrcdHV/vk44gtkc/zR5nZ7CGkuEwB6t2Vx2uzk
 8xGfEDjEve/Lgt7p1s0W1hSe7ok7hr2mXhXKIcQiKL2lQyoeW2xDT85sixfguW4fkkJ7r
 HaYj9QLn83aaGUgdC7/7O9HAAoqPi/lUTtrGYKjEV5Uhqd+Lc5uGIDAFXYvvVBddFkSkb
 3qFyiJIabT4Ohaj2CJCqtKEbvX3rk9HIDZvLkrbS9ZhaYJdYFEGVvI9f4tR1A1BAIrlOz
 1EHqVbrGT3pvhVC5nwLKepo252SQGE16T8Mi+nyexuliCcjzbskCekDkihXfqNSOoPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=efQsX+lKQRVB8kMQZAOJjex4DV2Fd8kngQGMzXwZEFE=;
 b=eqAGEx3w7m0EQpif93dNsQc9eZZSEZArO8ic/uXlTPetBp/EOpIx0uzPVp3sT47TQSPA
 xchyfHPusBkpts/Ud221yRVke4I9vNNl70xh2Kg6PPeK00UXSJpImnmL+AsUOEOn40ldx
 hgWAV/X8F6Dg2XI34YPABpW5AOjf3FOYVEAZ0OfvJX6FxbW5r0J+NJeSdhHvUZymSw7bG
 CaBK5SBMeYyc4B3cWyNJ/6cWalmst09PoPjKTt8bZ6eVT/9oZmWEjljwzkK2rJVqbBPlp
 YucnBhOpss4Bj5rZYP3MvHVEoF05XTvamXcxzpiJlRFS2P3+zDdpUjF5hD8gY8XWcoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA8BE40B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA4E89D388; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 05e8450c6546bc9b5c7d7540e4b260ed2abcb626
X-Git-Newrev: bc83223c5a58502f93d61b21312278baf3e40129
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.EA4E89D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nginx: security
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
Content-Type: multipart/mixed; boundary="===============1362404265029376649=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1362404265029376649==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc83223c5a58502f93d61b21312278baf3e40129
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============1362404265029376649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1362404265029376649==--
