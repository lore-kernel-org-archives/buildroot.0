Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BF606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e/VsEqpp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841FE81231;
	Fri,  6 Nov 2026 15:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhYytiUQJv3d; Fri,  6 Nov 2026 15:58:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 413FB81241
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980733;
	b=Oq2ElBz+eo5DKVqOO1yHDLeN3aJXEigOxAuOwj+TVYWnu0UrXguEHb2AS41b8PpbdDv2
	 H1a5vX3AVFVA/dB5+mQnOg2eKbp44xCXmpCeh217z5mliBKUiCYdwNXJAtYTkHHe+yGGx
	 5b+kO9FNcVQgmYcWQigqtjq+F/YW+XqJ2JHYvmM6SNwXx5UcI5G5Ycb2pQODa/fX9Gurr
	 pQNc+xg7/hENHBa9RV9+qax3kp1RpK+l94rNfQKJFf/vA7nqAkHVPvLs5rWAGyFTeCvYw
	 Cc/YWn3NRIQafQ9fzjGFoVbgyYK9cbVh/ZX4gcLJLch9xaZj13rI94sTkF+GUrK33Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tZTlchZ/nbzoJlct3OKGrOJE9VXCwTVsPUgKkCfmoa8=;
	b=pqVVOyMgFOlVp8FPPXtyXNwh8scAGODRAn0h1pmEHF3Au4W3wywgXui8cE98/XS6aC/D
	 +MHyh9Hm3rN1kvH4V3VOEkdyz/PMZEtgey0bduYZ0aW3Mcfx7SZlhL127srRJi9z0yeJt
	 3ni8XQ7d437xus07eYFnWkskqdCYuL0x6P9ZT2nc1yXn7V5c22M/v996HL5+TaKU7MaMU
	 86oGiZ25zatXHbJo4srUq2Frxd0zFePOxwJxrzJ9VuYSw4fibC1t1Qqgy0dN5Y+/DRyuS
	 I9PoWxizSig3tFlMDmRmuWbgfImjV//r/u4SIdjiSr66sno9lDKzIXETZtwKbmjO4nw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980733;
	bh=tZTlchZ/nbzoJlct3OKGrOJE9VXCwTVsPUgKkCfmoa8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e/VsEqppRszy1M3Dsy0kaJMArmZFTpA/PVs5B5UugRTOaaY5isG3GqKFdfZ21NCtA
	 SoMq648mQSFGuEEIFisrhD3QesGA85oOvx0XMH6pXwLVewIKXnzXOpADum7M6jhyqN
	 TeInfG1bc5la+QUdfK/aAL/Ze2w/+DAoRBZiG6zr1A+UruZstvzaaWoa7p/gSjbfRJ
	 Uac5MvdLJwT6GRHdo6FU4P/omq4FnDoloIIQrFmzivXTn2ssSW8IYMoxTKWlayOcUD
	 ePdKP60U/qHUU0QNAr13lmIuHBThuxRea0FHDgfJ3A+IevHBQsqNztriQGwVoT0tCm
	 /Fho9XOrRec2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413FB81241;
	Fri,  6 Nov 2026 15:58:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DF24B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F43403DF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbovLOjYkoKq for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B29A3403DC
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B29A3403DC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9B699E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bada8c6f630e7861aa112837f5f1cb0e71a53e1c
X-Git-Newrev: 821a4db80e9b9f3eb261a4814ea764c1b06ef9dd
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.E9B699E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
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
Content-Type: multipart/mixed; boundary="===============8456647858156154282=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8456647858156154282==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/821a4db80e9b9f3eb261a4814ea764c1b06ef9dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8456647858156154282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8456647858156154282==--
