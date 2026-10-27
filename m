Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AE4606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hu1FOdLp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB22740583;
	Tue, 27 Oct 2026 07:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWEMrpFBHGn0; Tue, 27 Oct 2026 07:03:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 12C2540587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793084592;
	b=XWl5/whzivWRe7wCsYCn6p3zv9ORfcgkATxiZw5XUEDt+pLlcG6YJv8ZR+fooSGrT1N5
	 bCwuD1Z5hpx/Jev3bqREjN3AUMr0uOPqg0QCNDL1wdAdmrFKtTbgZjW2akeBGQpCFoZW2
	 I0ITmH7rg1yX4NNtLt/mFOJkQkBRH1QKQgHaGv++MMlMFR+2H2ONftFaC2u2SaNFliZb9
	 9zANMmtuDiE0KbZOtiiId/01R5bhXbjNmvqGxGfYxGI7dEYOtMDO+UMPVvSEP0QL89LRe
	 DE/OeG73BwQWrC95jhc6XvX5KCOVsSVexUZLa2PG9aAF3rFk/vVQUKhiTpY21iznWTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793084592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=lbLpaNRf5bdHJ7tlS0ZDRbmxetQJIRpyxWvIN9Tex80=;
	b=ippT40uG4YybW0iYs0NF3oau71G5nTqXyMM+7cSfwNT8keAzkhZVPwSImB0nm7Hf9P5m
	 c1kAltj0lRxdSvDoEzfjLY8fE/fYg8PsDGkqsNnQ7rUlycfbQ/zWsx4kW3ju1i672XRrw
	 y81OHAqmIyd6wQDJvecXoUCJFwshavaq6MBQjWbEaYAmPttRaLO7y/4xPIGyB2yUUG2i/
	 koif3pt34UoWiH9JCO4UOzW8LCTORqjpXWwoCotKzqlivmvIXtEZFnH5a7qanO96NsMyx
	 ga6BTthtAOKFcgNksfAdG7gu/fqkxmAZ2lMGYJaVmQjKSlVZ1EGx/KQFsKPP8zZqy0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793084592;
	bh=lbLpaNRf5bdHJ7tlS0ZDRbmxetQJIRpyxWvIN9Tex80=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hu1FOdLplMlkvPUpkCJ2EgbImgHnTCo5/tIW8RO0RspgdKnph7mg6d+XRoAs9UEFP
	 UOSiUccblXg5XxzU6fP7AcSaAgyNn3wuT6rFmLHJZkW/r9EZQvfMLcbAbLBu+DXAGU
	 y1K8sRYQeXAtBH8U22XD5UnLs2awEL4GXhT0EePnO642ClgsVkiZ8hPdeRDyxf6h/E
	 2Ii3RACWd7GpfOo3QVCBukbRbtGb2uyrfWm6dAl8WGFTsqaqurGluHpeBDipK7ypuy
	 /JWbDDXd9oSeBnx8ZTmxQZDx2lR/zf+SOwPSUYpqFp82gMKyVY0VUwjPawQ+YxTq5w
	 5W4GgJs83aWqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12C2540587;
	Tue, 27 Oct 2026 07:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9974E356
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F69F400A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWL0PffwA0fL for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 07:03:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C1B2440062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793084589;
 b=dWK9V5WWk+0GGq24fgH5rikauBbqfasdvzX18agMU/NfwAfih6MvPpft797xiGL5T6OL
 ygDSUxK1ttZ+Y2x5zQxdV7LTRu1wJST0SMABfYLVUBukTuD91PoGd1Y86ZaK2ZHr9FqBU
 W6E2+Cg+vTWuh+uTTZ42YCJb5YqOtFOgjkdLE8OCtdtWhRrIoaOcJ5Uccp4SmyOctE8tB
 G4609W1XOgO5lwoKb1qjjSptfeLPJXBwN7hWVRqqUwMTYN2fnK6nXYiv1JpcxLIpTy5PN
 Hdcq69hdUnXjzPPU0JzEDQDtoNc2ALjnBp+WkKrlKm6v2xdJG8A1Y2l8gbVbnRcdaww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793084589;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nn8If1NfLCtoIE3lofwQHWXTtTrwPgrdy3KRvSyxbVs=;
 b=ZS9BzVRZtsB5B2GtOrgU1sbbu1q4nzhFuA/fB+KYqQgr+Y/XpyE38OuToYickhxZa3v3
 1Nxy6LLiuPffPFR+V6GqVO1/xVfWNIHMdCJFgpytRFcDAZGYU7kh3sDjkmBoBYlIcYfOn
 5jmm6CEj087b5RXOdl0sMHVOZehM1Di6CN90oW06jnPdu95VFX19M1O+AQUVbsp2Q19Ie
 ofe12G+gYAdPjrFpYXHX6LVlhBfAuLx15UUpHwfrH1dQ7KxJqDrDrlJVsp1cox2nJGI0e
 dJ0ewUczy2DhAlcEgurwA23IWzzpHwfS/6/WkA8kq80xiwosqbwA1cG9K7EdhfQUyGA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B2440062
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:03:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 709AC9D069; Tue, 27 Oct 2026 07:01:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 08:02:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fcca1794b352223f868daab062045860a827a45
X-Git-Newrev: 0c58b443d8328316906cbc177beae0d1c4c50ab5
X-Patchwork-Hint: ignore
Message-Id: <20261027070143.709AC9D069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: Use typing
 annotations needed for Python 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c58b443d8328316906cbc177beae0d1c4c50ab5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
