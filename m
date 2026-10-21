Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5C60A2614
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kYHfS4LZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org header.a=rsa-sha256 header.s=s1-ionos header.b=g/+gBEwu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A1140E50;
	Wed, 21 Oct 2026 21:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e_6a8eNQFuC; Wed, 21 Oct 2026 21:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 778B040CF4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792616564;
	b=fRUiebxlJQgds85rYnksLZF1/60HM/lf+IByUSu3IBoWNNV/mE1IjJU0340C7EZGvBxH
	 5rcmnjpn1NcwMz0x5YpZfALkbyIF89eSQSY0yV4+ecZZAxpOhOhzqjcMJp44+/c4eWwCR
	 nF9GrI/IlOdXWWGKXNWS4uRrMnFx8VF4lbXi8uO4EJ+kno9ZWa79SJLBKsVVdfKJid3ua
	 DXC0tORarQaE9OkeGWmmbxfs6Ez2raWZqjoygKdZhuPBL7SehkQkCq7Ooaz0ivyu/4Oto
	 u5UeGDl+AmodVr5Ah/fmi8nwMeL/jcU94PuNHa2xLIA+Mcn9pvyWEtA3clDGyOhb7Og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792616564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:X-UI-Sender-Class:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d0/QUflCt8r10VEDZ6p1DTclvmDDNERbOoOuZY8R/3Y=;
	b=N6GmsurkD3hdwGrE0rFCfRMovyxyaMBEM30+W3fx48PllGuUD+Xzao39QrXB8vZUPk3P
	 SRSby3Mcz9UsWto0v1rNtte/ugR1kTJYV2BM643PqyDS3EvGZZfHJxndBDSmx7tEbszl0
	 mVdPeMXHO8LjLTQfkbaBPPJZ1ueaHGgPgzPfHIgTXm9ohocNQ7BYOvMhYGpbkUy94Voa0
	 gnk6vru/ZeBnNiRPAmOpTL6nvOUap8Z4WwHS1bKfI2eCFwsb4lLC+ECG7ENOzs/XeqZDY
	 c6chDcVqlcWR99NVp8/MDhe4F7MiivocpJVJcBHSAUYzWl5no21sBQEfas4VOYL4lFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792616564;
	bh=d0/QUflCt8r10VEDZ6p1DTclvmDDNERbOoOuZY8R/3Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kYHfS4LZFl6ctUr3a3jN3JtVL+6mHvwqC+N58cMnEiHkMPk5GCVDxqHYtyEzRkanW
	 xkBJmVTDNjQ/ASwLG7G+Xq7auCC0vXdCUJC9maol05fa8Yau+ppWqXJhHCMQ+attD/
	 /T/UbKCxkRunwlJtOx63y6JEw3daJrB2aJ0T5SJc9MlIXKJFWAWog48h6Rpd41EYC/
	 oInngZLAix6iztu4WTn14U6KFm+Qt/6s2WAP3WGb8m/ighMPnz1Hovawy6k1Ztbaik
	 l4PxM0+BU4+iDYJOU3hNM5SJf/9ECAOrEGlcE/KLa2eg++onOid5kmp7sxpe6UeSZj
	 yTwlFAUhkw5ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 778B040CF4;
	Wed, 21 Oct 2026 21:02:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B3F73C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B3A817C0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4JH-Y820cRA for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 32CAB817BA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=212.227.17.10
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792616560;
 b=Z2iKUHRWEkFKz4OdTxC03fvPNAubC186xlm5zuRp4KtsvGhxTTkOQPkmdey8WL/S+ONm
 GmcKeScsJf9FVQr0j8He0t7E855Ez27mwIuRunzCfIi1HK1H4FcOWLBAhm2x8TMokW9F6
 1nHI2KFYvqgUFzrEfTTUQfGdkICcftZ/JyOUdXdahesD2s6MsI9KSC8Zd5scMnZktOVr/
 yBKs49KcDCwYZ7LFNyIuMyd66Xb6AIqmUR5DNH1vk8PS3Q1H1e80oLDacYpBm67zT1M/F
 hqcLBFFMRvulREpKlzys+z6zvFJAx5VIsTirXmeh32EnCkJA51f0to54LBWD8ULH+nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792616560;
 h=X-Greylist:Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=6Rfqp3li837T2XC1f6RLf6RrflutVDKRzQ0/3hbBYmw=;
 b=ljrGaH4BGnA2UQgpWxMXdNGpVH0FbHxgEoomBMqdR3J6PIWPRqZWrabfwxnXZR1Tcl0O
 ErNXYG8A0pX31DzQHx71Q6ZnRvwddZU6lM8ZvSVhTpv3P7umrfH9yFPETPvzbel/Hlrcx
 sI8ZBA7teI1Fdsvrx0KezjOuJ+a1/xmxwolVGjMv824MFZY0iSNB2QKSiZkIXZlFYWfds
 AQ9ssxv8nY3SBjp/xtIz18NGDV1B5fLGBgnbGumPilrb0cF9LjKEXltPeN1MrPRYoogyM
 qpF9H9yDs16KC7Tpu2LTNq3o0rCfJugCGQ8nek7MtpXy9W9HsSKRNRNcob5KQ5mTHdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=paguilar.org;
 dkim=pass header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b="g/+gBEwu"; 
 arc=none smtp.remote-ip=212.227.17.10
X-Greylist: delayed 321 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 21 Oct 2026 21:02:40 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=paguilar.org
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=g/+gBEwu
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32CAB817BA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paguilar.org;
 s=s1-ionos; t=1792616558; x=1793221358; i=paguilar@paguilar.org;
 bh=6Rfqp3li837T2XC1f6RLf6RrflutVDKRzQ0/3hbBYmw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=g/+gBEwuTxWQMsP0YUdVstrD+uKB5sgn+GPUvsEInH3s93Yk6cOUM8m6U/NaliWg
 HZpEslXE5eKmMXzGqdvXVUiEKNZGUCe9dS/sjtUMCtrJrE335X7oa5Dont80Do4IM
 LhvTWG54d1KWzprv/1zv2GweD3qqrBuBJ1ZJvaE//xnzAbvJtldYO1LcprkVjqOdw
 NzTzhWJc+YErRiJOm48Nqm3PebyhZDZmpayzddB6us0WD9vX7S/+EhQrPuFIv9TC2
 +dyfRx7ACqErWLPUiMuKGdwkMYAuqh3gx7FcaQMwymy46rmdfJgyTnfLqfShO0m1M
 xyXGzkCIkNoz2AGX6Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1Md6V3-1wkqWF0gaZ-00nBNJ; Wed, 21
 Oct 2026 22:57:16 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:56:53 +0200
Message-ID: <20261021205653.895333-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7l+vLdksH+c7igDNFvPdD5i/C12HKnWCmzx9QLqdnIzZr0gcFTs
 8gxYT3bKkrzuKg0ep1GvvbokCNK9nUU8XIRExDDjFYZ20zrF9EkqR8GmVAk0InlD0M8fob8
 U+k6bEcR4CNp4yiNv7kwah3uLhlntUviAGmX2a4cqw/ooFJHVOPmSQYuTSycdkt4DN8n1N+
 bw6IMfinHX3pr2ofRPJ1A==
UI-OutboundReport: notjunk:1;M01:P0:zVODDzbm9h0=;v7+pRcTSgiz16JcyQpOWVcLnkYX
 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
Subject: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: Use typing
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
Cc: Pedro Aguilar <paguilar@paguilar.org>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>, Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
