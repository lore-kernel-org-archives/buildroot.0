Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC813CDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673BA80BE2;
	Thu, 25 Jun 2026 18:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvK_LPQV_Xaa; Thu, 25 Jun 2026 18:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60EC280C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782410506;
	bh=y+RRY/pYGION3PiNLiJfKd9nE6BtmJLHAclKh2ljnPQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mHImbQ+MIHMwphq+wg7Qvw/Wx+NYEWrOXK/CCcph4yTRnoZi1sLfeFt0ri3IiC6E+
	 KV+veu9pjmbLiQA/pmmOcVlBozr8ctQdQBV5heP0sHKw6ZqA2aLvPLEQ3uAR0W+hiw
	 vlWnWnN9tZr+FjncnLKUxdomGtdOU17HOUhsGm/6p2GSPyIx/GOBCDdnlmbR+0yQS0
	 M4iuP1Iy78wr3zYfhhQAFAYTHiB+MKQ93As0aKvDwD/FYailX7P30ww9BFfdP35dLO
	 CyxIcE0wKUtZS2Qm069UgbWEcWChrACsFre9EpFZ26CD1G5g9jSs842VUypl16NJxt
	 joBaL6IPpS6Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EC280C12;
	Thu, 25 Jun 2026 18:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 797E63AD
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ABE840D94
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnVeXp1iSzrQ for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 18:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD7A840D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7A840D91
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD7A840D91
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:01:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1xNdh10YcU-00zGvP; Thu, 25
 Jun 2026 20:01:41 +0200
Message-ID: <e9454ca5-e5b4-4651-b6c7-a6373622178e@gmx.de>
Date: Thu, 25 Jun 2026 20:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260624140645.185318-1-thomas.perale@mind.be>
 <20260624140645.185318-5-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260624140645.185318-5-thomas.perale@mind.be>
X-Provags-ID: V03:K1:XTZCJC0x19Ulie1ltyChGOpC7DjYZo23M22o/M37AufTSrABYLO
 qO1BznyhBG5feVxxzjLXyxEwg8wX6kmXiMXzRTpTKStIjpVhLAodPjr0x6LfbCOgHMiCxLz
 YXN1Uu39mNLNLtJyHpwqQy1XKvGCUPcFfUocJLYWOKloDnThabs0TAxqjOpnyssiNAkuWKW
 CKz5gx3wDncmsYeyA4dUw==
UI-OutboundReport: notjunk:1;M01:P0:+ycBBfUJuUA=;xMThSjEE91cClEkSRUhsPYY2emn
 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
 a42kyee7E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782410501; x=1783015301; i=fiona.klute@gmx.de;
 bh=DLSEXRLUE6d7QozF64d7vxfq3fz/ZuYim1vPfb95k+k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UZAoE3HHlMTS45Y0omAPaO7C66tedKVWR+CUUsm82tx49PvhH0sepWkmmnmeio8V
 V9VmdGU6mP1RWgGxNzaUwkRnE3E2Z/D0W/svtilEB4WmzdJUNIvhWZd64Jb8IL1Gm
 mVwJNdXSUEO8IjhrUw6QEjrXKIIaZ/mLFsZRIsfhxUEFiUEHtTpwsAX76gzd3TTLX
 2DRGHL1LC0jufBSualYpKJVhAX2YQqYT4f7ctYCLARs/AfFnr0VjBSkL1zN7Y+L0r
 wr2FBhY7VWdQvJZxiLuA23RMqDGMmszvTRXnSdq62fT+xFeGXNNjLRg1Aa8499F/o
 wAD2c7FV/9I+h4dsyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UZAoE3HH
Subject: Re: [Buildroot] [RFC PATCH 04/14] utils/generate-cyclonedx: support
 vulnerability details
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

Am 24.06.26 um 16:06 schrieb Thomas Perale via buildroot:
> Translate the OpenVex notation used to describe the vulnerabilities that
> aren't patched in Buildroot into the CycloneDX format.
> 
> - fixed -> resolved
> - not-affected-component-not-present -> false_positive
> - not-affected-vulnerable-code-not-present -> not_affected &
>    code_not_present
> - not-affected-vulnerable-code-not-in-execute-path -> not_affected &
>    code_not_reachable
> - not-affected-vulnerable-code-cannot-be-controlled-by-adversary -> not_affected &
>    protected_by_mitigating_control
> 
> See https://cyclonedx.org/docs/1.7/json/#vulnerabilities_items_analysis
> for more information
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 83 +++++++++++++++++++++++++++++++++-------
>   1 file changed, 69 insertions(+), 14 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index df12ee84c0..c1aa1f980d 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -403,6 +403,43 @@ def cyclonedx_dependency(ref, depends):
>           "dependsOn": sorted(depends),
>       }
>   
> +def openvex_to_cyclonedx_analysis(state) -> dict:
> +    """Convert an OpenVex vulnerability state into a CycloneDX analysis.
> +
> +    Supported:
> +      - fixed
> +      - not-affected-component-not-present
> +      - not-affected-vulnerable-code-not-present
> +      - not-affected-vulnerable-code-not-in-execute-path
> +      - not-affected-vulnerable-code-cannot-be-controlled-by-adversary
> +
> +    Args:
> +        state (str): OpenVex status string.
> +
> +    Returns:
> +        dict: CycloneDX analysis dict with 'state' and optional 'justification'.
> +    """
> +    MAPPING = {
> +        "fixed": {
> +            "state": "resolved",
> +        },
> +        "not-affected-component-not-present": {
> +            "state": "false_positive",
> +        },
> +        "not-affected-vulnerable-code-not-present": {
> +            "state": "not_affected",
> +            "justification": "code_not_present",
> +        },
> +        "not-affected-vulnerable-code-not-in-execute-path": {
> +            "state": "not_affected",
> +            "justification": "code_not_reachable",
> +        },
> +        "not-affected-vulnerable-code-cannot-be-controlled-by-adversary": {
> +            "state": "not_affected",
> +            "justification": "protected_by_mitigating_control",
> +        },
> +    }
> +    return MAPPING.get(state, {"state": "in_triage"})

Maybe a bit nitpicky for an RFC, but MAPPING is a constant, so it should 
probably be at module level (with a prefix added to the name) instead of 
recreating it on every call to this function.

Best regards,
Fiona

>   
>   def cyclonedx_vulnerabilities(show_info_dict):
>       """Create a JSON list of vulnerabilities ignored by buildroot and associate
> @@ -421,20 +458,38 @@ def cyclonedx_vulnerabilities(show_info_dict):
>           for cve in comp.get('ignore_cves', []):
>               cves.setdefault(cve, []).append(name)
>   
> -    return [{
> -        "id": cve,
> -        "source": {
> -            "name": "NVD",
> -            "url": "https://nvd.nist.gov/vuln/detail/" + cve
> -        },
> -        "analysis": {
> -            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
> -            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
> -        },
> -        "affects": [
> -            {"ref": bomref} for bomref in components
> -        ]
> -    } for cve, components in cves.items()]
> +    ret = []
> +    for cve, components in cves.items():
> +        # retrieve first occurance of the "cves_status" for this CVE.
> +        cve_status = next(
> +            (status for comp_name in components
> +             if (status := show_info_dict.get(comp_name, {}).get("cves_status", {}).get(cve, {}))),
> +            {}
> +        )
> +
> +        if cve in VULN_WITH_PEDIGREE:
> +            state = {"state": "resolved_with_pedigree"}
> +        else:
> +            state = openvex_to_cyclonedx_analysis(cve_status.get("status"))
> +
> +        detail = cve_status.get("detail", f"The CVE '{cve}' has been marked as ignored by Buildroot")
> +
> +        ret.append({
> +            "id": cve,
> +            "source": {
> +                "name": "NVD",
> +                "url": "https://nvd.nist.gov/vuln/detail/" + cve
> +            },
> +            "analysis": {
> +                **state,
> +                "detail": detail
> +            },
> +            "affects": [
> +                {"ref": bomref} for bomref in components
> +            ]
> +        })
> +
> +    return ret
>   
>   
>   def br2_virtual_is_provided_by(ref, show_info_dict) -> list:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
