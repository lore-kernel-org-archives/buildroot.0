Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A423FD8FC2
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA1E78144C;
	Thu, 26 Feb 2026 15:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwcj9DGUkz_0; Thu, 26 Feb 2026 15:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE43814D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772118202;
	bh=t1CGE7aAg5rqWYmkFCvlaQJzg2z/SDVTqKieQzviduA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZB0t5qnT0WwuRponJbWI9M9dkAsGJktJrDuEojvmgzGWPkb/px969IXOJ5J0Tie+R
	 W95ba0788nIKywRRjXkLPnr7V3GBFx88q4TSVDCpDQGSEf01TAZ50zWP/2ia82gfO6
	 rT4aFq5sAY+15wO/IkqZeX/h91MGZRUicVT5WGQLfjSSbb6B1/0rJY1ibiOqg/Wk1e
	 HEVnVGPqika0+QJC6cPEbQazdYrUXzQmwD2ueLLnrqItpRksWPJafBp9ag9BPBjKQd
	 aCDibgvOu7AmPidJsMogBBpliHadQJBkkNnOzvT0bHuBoBhmitJuRKmoHyHvmoaWtN
	 oj8+2OOW7AVMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE43814D5;
	Thu, 26 Feb 2026 15:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 056CE23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EABF98144C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEVDIBARQyov for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E3EA814D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3EA814D5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3EA814D5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:03:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1vqNh83Tv3-000H07; Thu, 26
 Feb 2026 16:03:15 +0100
Message-ID: <53b6b6d9-dad5-4591-b708-f86f5a55a940@gmx.de>
Date: Thu, 26 Feb 2026 16:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Willi <martin@strongswan.org>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20260226142023.1064241-1-martin@strongswan.org>
 <20260226142023.1064241-3-martin@strongswan.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260226142023.1064241-3-martin@strongswan.org>
X-Provags-ID: V03:K1:8url2Uf0x117E2plVuixco0YL8g+0hIQ8OlJ+d5BT8xLbn0mxFm
 Xx5ND22dHHAz98W+hAmB/6YRvpc4ntUPqKNnimXRWI7o0iE5NV8rMKVVVenGcfUj4C0Qnu7
 EFfBFEpGQJSqAEhqDf6mhlafcXXX9q9PIwsLQdSQxi5SX5s+yfLi/oo72UEXJGvAz6KkkuV
 RlQNNFc9T4xole7eNLLLg==
UI-OutboundReport: notjunk:1;M01:P0:Kd3j5zy5SCw=;TbcZk7KiW7LnCg86tsErksTHy1F
 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
 WcqKvfuOA3I4WD0Vgyat
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772118196; x=1772722996; i=fiona.klute@gmx.de;
 bh=/E2SicXPumz60ezYW/6GsiTNZYOV2V0csyITjHrwnhY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=sBKBvsjO/BAogV9ctm3iptQu9ASG5nQFQhCBGNjz16tx+32HKtpnyQF3Lsa/S0J5
 VG7NMThd780UDoxjYhG7URKVjQ0wNFroLshYuocheC5BhieE8UZV41FBUsxtg3ccK
 KAncTCXJKIz/A/aKXJx3JzuEyCPfAw8nuPNdtNsf/aP17moBMt6DaYyux2mIMddWQ
 irnbfcQ5w470C1wcy+GrkszvEzrmufSnMBI22cVBn/gRjF1l33FKC+AvJbUp20Nls
 E9lXjaNZDZqltpCwv34NT8vS5DeQtQIFJkWsS3et8on46RG4jdD7+NmxNX4TY9Aiu
 x7E8hQiwkI50RxDakw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=sBKBvsjO
Subject: Re: [Buildroot] [PATCH 2/8] utils/generate-cyclonedx: allow
 referencing patches by upstream URL if available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Martin!

Am 26.02.26 um 15:20 schrieb Martin Willi:
> Scan patches for Upstream: headers that start with http:// or https://. If found,
> reference the patch by URL instead of embedding the patch content in the BOM.
> Also set the type to "backport" instead of "unofficial" for such patches.

That seems problematic to me, because it'll be incorrect in some cases 
(possibly many, but I haven't checked the ratio): The "Upstream" header 
often points at a mailing list archive or MR/PR page that shows the 
patch being sent to the upstream developers, without having yet been 
accepted. Of course it may also point at the commit for an accepted 
patch, but neither is guaranteed. An incorrect "backport" seems more 
problematic to me than an incorrect "unofficial", because "backport" 
implies upstream approval of the patch (though not necessarily the 
backport itself).

Unfortunately I don't see a reliable way to determine which it is from 
the patch or URL (there are some heuristics that could work for common 
git web interfaces, but see "reliable"). Theoretically we could add 
another header (e.g. "Upstream-Status"), but then that'd need to be kept 
current, which doesn't seem very practical: If a patch is accepted 
upstream as-is after being merged into Buildroot I wouldn't usually send 
another Buildroot patch just to update the "Upstream" header. Unless 
status at time of patch submission to Buildroot seems useful enough to 
justify the trouble?

Best regards,
Fiona

> The feature is gated by new --with-diff modes: url and url-only. url prefers URL
> references, but falls back to inline diff content. url-only skips patch entries
> without an Upstream URL, unless it resolves a CVE.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>
> ---
>   utils/generate-cyclonedx | 44 +++++++++++++++++++++++++++++++++++++---
>   1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 25248a0e2d95..b3dfc9462020 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -15,7 +15,7 @@ import json
>   import os
>   from enum import Enum
>   from pathlib import Path
> -from typing import Any
> +from typing import Any, Optional
>   import urllib.request
>   import subprocess
>   import sys
> @@ -47,6 +47,8 @@ SPDX_LICENSES = []
>   
>   class DiffMode(str, Enum):
>       INLINE = "inline"
> +    URL = "url"
> +    URL_ONLY = "url-only"
>       NONE = "none"
>   
>       def __str__(self) -> str:
> @@ -145,6 +147,24 @@ def extract_cves_from_header(header: str) -> list[str]:
>       ]
>   
>   
> +def extract_upstream_from_header(header: str) -> Optional[str]:
> +    """Extract upstream information from the patch header.
> +
> +    Args:
> +        header (str): Content of the header of a patch.
> +
> +    Returns:
> +        str|None: Upstream information if present, otherwise None.
> +    """
> +    PATCH_UPSTREAM_HEADER = "Upstream: "
> +    for line in header.splitlines():
> +        if line.startswith(PATCH_UPSTREAM_HEADER):
> +            upstream = line.partition(PATCH_UPSTREAM_HEADER)[2].strip()
> +            if upstream.startswith("http://") or upstream.startswith("https://"):
> +                return upstream
> +    return None
> +
> +
>   def patch_retrieve_header(content: str) -> str:
>       """Read the content of a patch and split the header from the content.
>   
> @@ -220,6 +240,7 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
>       for path in patch_list:
>           patch_path = brpath / path
>           patch: dict[str, Any] = {}
> +        upstream = None
>           if patch_path.exists():
>               try:
>                   content = read_patch_file(patch_path)
> @@ -241,22 +262,39 @@ def cyclonedx_patches(patch_list: list[str], mode: DiffMode):
>                       } for cve in cves
>                   ]
>   
> +            upstream = extract_upstream_from_header(header)
>               if mode is DiffMode.INLINE:
>                   patch["diff"] = {
>                       "text": {
>                           "content": content
>                       }
>                   }
> +            elif mode is DiffMode.URL:
> +                if upstream:
> +                    patch["diff"] = {
> +                        "url": upstream
> +                    }
> +                else:
> +                    patch["diff"] = {
> +                        "text": {
> +                            "content": content
> +                        }
> +                    }
> +            elif mode is DiffMode.URL_ONLY:
> +                if upstream:
> +                    patch["diff"] = {
> +                        "url": upstream
> +                    }
>           else:
>               # If the patch is not a file it's a tarball or diff url passed
>               # through the `<pkg-name>_PATCH` variable.
> -            if mode is not DiffMode.NONE:
> +            if mode in {DiffMode.INLINE, DiffMode.URL}:
>                   patch["diff"] = {
>                       "url": path
>                   }
>   
>           if patch:
> -            patch["type"] = "unofficial"
> +            patch["type"] = "backport" if upstream else "unofficial"
>               patch_contents.append(patch)
>   
>       if not patch_contents:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
