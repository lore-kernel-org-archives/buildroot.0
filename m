Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3930AC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A536811DE;
	Mon, 16 Jun 2025 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjTTtvDRSX-b; Mon, 16 Jun 2025 20:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2049E811D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2049E811D8;
	Mon, 16 Jun 2025 20:30:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9040E151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8215540381
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqqj7nlbfYtl for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:30:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83A544034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A544034D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83A544034D
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:30:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93A711C0094; Mon, 16 Jun 2025 22:30:26 +0200 (CEST)
Message-ID: <d85a9587-a1f0-4bdd-876d-939160102746@rnout.be>
Date: Mon, 16 Jun 2025 22:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-6-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-6-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750105826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yKgwffeIFzDuIZarPv/MJp90lOi8EpJPkP2a9y64l18=;
 b=hNnINUFh4DaDtwDXynNUwq4ULYX+0oYeE2qTs3nP/z86EIJbhxb9o1En3QdMx9txMuR0Y4
 VqO5zpGZd4Esgn41bTsHTb7YsJZdPtuYxP7cwMbuhYK8h61IMwbVcG9/1OuZAyehmIz2yW
 pNmNMr1j5/xHGS1SLXdSgnNy3tGOZe+qJ6JfukdO5sShQ/CAE/yi0hreq4xwzoTDFk1CAm
 YsWaIItDnRU7F964R9qRLZUXiAUWT7zqoVP43uH58TPyDHnJOVSmq06mu3/94slhJ7PVvW
 W5hQEtcp7l+tMqpYMYFYTbaiu530exRF3sUeqYUoyvsRuuHn5i+R+MpN/6VArw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hNnINUFh
Subject: Re: [Buildroot] [PATCH 6/7] utils/generate-cyclonedx: add source
 field to CVE entries
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Adds the required source field to CVE entries in the generated SBOM.

  AFAICS there are no required fields at all in the schema definition of 
vulnerability.

> This field is mandatory for compatibility with DependencyTrack and

  I know that THomas has been using DT without this field, so it can't be very 
mandatory.

  That said, it's a good idea to add it!

> other vulnerability tracking tools, ensuring proper integration with
> security scanning workflows.
> 
> The generated SBOM has been validated with sbom-utility
> (https://github.com/CycloneDX/sbom-utility) and DependencyTrack
> (https://dependencytrack.org/) to ensure full compatibility.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 1cbeca01ad..30c0d48857 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -229,6 +229,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
>   
>       return [{
>           "id": cve,
> +        "source": {
> +            "name": "NVD",

  In the future I'd prefer if Buildroot's SBoM would support other sources of 
vulnerabilities as well. Since this is about the _exclusions_, not about the 
vulnerabilities themselves, that means that in the future we'll want to also 
have other sources. In particular, cve.org has version annotations that come 
from the CNA itself, which tend to be more accurate than the CPE stuff that NVD 
adds. But that means we will need to add exclusions for CVEs that can be found 
in cve.org but that have been patched out in Buildroot.

  I don't see a good way to solve this however, so for now, assuming NVD is 
sufficient.


> +            "url": "https://nvd.nist.gov/"

  This should be the _full_ URL - the spec says:

>           "description": "The url of the vulnerability documentation as provided by the source.",
>           "examples": [
>             "https://nvd.nist.gov/vuln/detail/CVE-2021-39182"
>           ]


  Regards,
  Arnout

> +        },
>           "analysis": {
>               "state": "in_triage",
>               "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
