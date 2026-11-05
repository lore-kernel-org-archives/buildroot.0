Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19048606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BLmYWCMM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD9881292;
	Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38KvmVieUkoT; Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5753E81298
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981305;
	b=UEmCIfIJK/lJSFGysodteeGTM/JL9QCWspk2QbrU/d14bFxCPxXWHS0EhCNbpnwLOSKY
	 3D0nrr63Z575TbJ0gH5A0QrrWnqoDl34t14H/mxh5W4I0/7tuyoqzw4yJqjkbfSSWaE2n
	 +0G/ASXr4ZD/AwXvKcsOJwkPcK+Z4yDJVSiOIseFAPrYIRvWcHokcOPS5EJ4NOGoyySkq
	 0iNddIbu1tI1Q8RTzVJxxVpUCcSFpCNclCc1eNUO/n5pr/NBtPw6s506ly3eXuPwGfJ64
	 uByF6+IQbBkE2aC4GKkU5iiqzyMt9FfvaB+WZ7MEcuZZYnRsTRs6Z9tNPCNA7ESaXkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nwobhUd/h2nqg1QFFYoH+dtghEatBQF5tFNENwKm6KQ=;
	b=ldgoABjWxzVDr6MAeu5r49GGr1k6gYPsrVT9BXvpJfghAz/LV6EredGyMa784u+d2JNL
	 IH7TL8umxfNRQa4AR3OnIYpHkuFJH2xS4uKPcQrr2hGIFURWacLj6o3gIESvad1drL/Tu
	 c4CB2YEqKVBFY4tAdq8tA3IJamTg+PMpbAIqE8yRJ+77fe20ccdD7zkdjaYCwZtNsdZvx
	 P7trDapR5xuhn94k++5tG9bT4zEhkjTPh9MGZcdLLNa3r7vxCVST5euFE0GiHHXhUMuwD
	 rH8J+sEwEZzrYqqeOMAOdLakX4zy2E/DUx/pQrB7dKSLXMngspQbvEhXwuT2fWGDfJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981305;
	bh=nwobhUd/h2nqg1QFFYoH+dtghEatBQF5tFNENwKm6KQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BLmYWCMMWY482emVJi83QujfF1cPp0ZEm9irMeRM4DhR0tMXfAt3/M7F6LIGRxGHU
	 gLqX4m5U4LLmiZTCxSlH1vkHkvk0IW6w22J3gkGfZCEeI9ULIBGXUc8vg8+Jusit4f
	 7ubLGTS8CUyMLuDRf9D94zutVpn29bJNbM3iB+csMen7xvRF5ncSiDz1i6fv9R1JPP
	 H87r/Ok7XZnNbm7N6zvXTJJ5OtNmMzYvMZ4rzGKy0h0s9S4a1gNF3Rm8cIp2LsZ6WM
	 yyzubXBb6yDjZTfyjVi3tKqb22rk1jQatvQsx5MrV3g1+C26p+IlIfbmZ7xlk6Noe2
	 HkXwfcD8U5f7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5753E81298;
	Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 519F42E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436D9403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqvnfiR4N1KA for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9DFFE400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DFFE400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C82C29E09B; Fri,  6 Nov 2026 16:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:56 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2a8fd8bd8bf1efa634b6c285d20d627a40b8b977
X-Git-Newrev: bbd7906616216d84c69c71aecec6f745c4afa6d3
X-Patchwork-Hint: ignore
Message-Id: <20261106160644.C82C29E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 Use typing annotations needed for Python 3.8
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
Content-Type: multipart/mixed; boundary="===============6811421310808005027=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6811421310808005027==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbd7906616216d84c69c71aecec6f745c4afa6d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Python 3.8 and older evaluate list[str] at function-definition time,
but built-in generic annotations such as list[str], dict[str, int], and
tuple[str, ...] are only supported at runtime from Python 3.9

The generate-cyclonedx script uses these built-in generic annotations
that cause the following error when executed in a host with Python 3.8:

Traceback (most recent call last):
  File "../utils/generate-cyclonedx", line 222, in <module>
    def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
TypeError: 'type' object is not subscriptable
make: *** [Makefile:23: _all] Error 141

This commit fixes this issue by replacing built-in generic annotations
with "typing" equivalents that work properly also with Python >=3.9

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c58b443d8328316906cbc177beae0d1c4c50ab5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1fbf020a3d..a79ca41fe1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -14,7 +14,7 @@ import json
 import os
 from collections import defaultdict
 from pathlib import Path
-from typing import Iterator
+from typing import Iterator, List, Tuple
 import urllib.error
 import urllib.parse
 import urllib.request
@@ -148,7 +148,7 @@ def cyclonedx_licenses(lic_list):
     }
 
 
-def extract_cves_from_header(header: str) -> list[str]:
+def extract_cves_from_header(header: str) -> List[str]:
     """Extract CVE identifiers from the patch header.
 
     Args:
@@ -219,7 +219,7 @@ def read_patch_file(patch_path: Path) -> str:
         return f.read()
 
 
-def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
+def cyclonedx_patches(comp_ref: str, patch_list: List[str]):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
 
@@ -285,7 +285,7 @@ def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
     }
 
 
-def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
+def parse_uris(uris: List[str]) -> Iterator[Tuple[List[str], str]]:
     """Parse download URIs into (schemes, url) tuples.
 
     Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
@@ -295,7 +295,7 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
     Args:
         uris (list): Array of URI strings from the show-info output.
     Yields:
-        tuple[list[str], str]: (schemes, url) for each usable URI.
+        Tuple[List[str], str]: (schemes, url) for each usable URI.
     """
     for uri in uris:
         scheme, _, stripped_uri = uri.partition("+")

--===============6811421310808005027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6811421310808005027==--
