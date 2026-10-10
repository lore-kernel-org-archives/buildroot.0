Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E8ECA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACDA160720;
	Sat, 10 Oct 2026 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JK-xKpF7tl_A; Sat, 10 Oct 2026 20:40:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF99960639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664826;
	b=g7UquRVHrYnp3tOcvXSrBdq+C5ciS75G+S7OanhnifNnxR4qR7kLHmDsomrlQUEECkLW
	 Ox0GEgkveLBBLbtYYEqLNS67xMcDTRuPZ2hswjh6tO7BbpsvTvJLI8AVMeAjm+h2Zte7t
	 New7anANtdhAkeP/8YL7ySoxGA1QRTPmRPw3CF0qW3uDZJUo26sOJx/LC5vVEKVgtWp8U
	 5MiLIn/5n0brb3MYN6MzTOZf24dp1yt0+mIDIVSp9Bz2ro7sL9St0X+THFdtEUwmsno5U
	 Xw8zJ6RmcvSgSSbBGvjfHn+nR7yy9Lo3NJRWmCf/xLBXySQ4HIHAOPpo0KcZBtsYv0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=7tcTA07XKh2uxZZeHGmmLVEvj9TqDrOUdJHM7bBEEkU=;
	b=jHi95UsD3cqnToJy7HWYLWQMyRb4ppanQ0o635K5M4urLOuc3N8+8csYA7DpTy8pCXrg
	 9qAX6vGA2YNtIHuj8K0pCOT82LpoP8OSXPBeS3sScgVltbt7z3Z2gb6xLvtLO5k5uTmmc
	 D1QN8B0qh4CFCPaN016p9ezpn/f/4xA9rDSFF9bjeLB8nBd5vT3OHTiQYXReVeNeyvlVF
	 VIvzvI39Ap5A04XkVxJjH+W+3B+m3LgcAOhxog8aGchCeK9DKpeyY6IayiE41APED/y9S
	 WvN+GJhJ4bQc0GmMJwz1PWmHdegwp1z4shtohsFPD+NTP/aG+VYoEkUF8dVkOzoUHLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664825;
	bh=7tcTA07XKh2uxZZeHGmmLVEvj9TqDrOUdJHM7bBEEkU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dfzy0n6bkE2vqaRnlS8Ch4eDvH8ok5dHgdvixIHS1MVPQe4Cs7TNC27hvm5HRk0BM
	 5XgVza7mCihMyX2HELokKSP0I5+aevSbewoaOzyJTS3cVxJhb+Zg5AQ1ymJSc2eqER
	 pbooWX4mfhn8W25HGoz0rlWom88ymsMb3oUtsWVLgGFZSEsoO57840g6XlkNDPlbg+
	 8eZPHSrbDjckPXs7JFn6k9rp8D4y4Fsyo5BNMVb/KxPijTms7AqRMZpTm23zeoukZR
	 c3ZN52W8DWS+K1gMjweg0+fJK41OZ1wQszzylH7ldhsBqc4cFLpau7JVfgVo4feR54
	 8l5S86LuDGbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF99960639;
	Sat, 10 Oct 2026 20:40:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33BD8156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B6A40878
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZsxPL3ygmlf for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:40:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5D8740872
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664821;
 b=s+Z3XaoXiJxdcc/3rt6saBQMLuMpL7EkY84Al4UWuMq2+sngCfCFt8zXYM34u3yrh+8c
 v4aNSc5ab06jcH1ex2OTfJFF3zoiSKeYWIKPzueDIgC0zvvB5ZlS7an8uND7afGB+vC0z
 B5F8/0AspWidfqQojUTbceri9L0X2gN9HMWXsKQRv2XhwjPI3a255fLRtXJu/xP1AKRnh
 cfB9lkczeJrVg5jhH9SxcRcasZ8TyavGHCcZ9qu03Zr7aAElU0gmQqLl2324uoQhx948t
 tEQIGCEorSlH5dSxwhuoyDaqyaPdeyQjGe+2TsTfUeiorPB2VqIlj3e6pxP6WS3SQrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664821;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ipAvN4Iquxgyqs3gj8L3/562ixKb8pkIcKiRAjkPNQk=;
 b=RKIWhaSPDJc3odYE2mMqffvbMBUlXFGhcR0EqhkbwFzjKZHJ8DJt5I1kKqlWsd3LxCgm
 Z+0xCGT98Q44vE5vWunZVQw1n2bnLnG51S8AUzq7eJnMJJYK4AE8VeEM2ngsnLDS8vS+4
 Ef1mKJjuATm7f6JX5IM3IRgnlfK+1Y9/bPmnFvRKufbEB3k/fGSnDA2r/hDBvuGP5pl6v
 RB1UpGK043+VTsfmkOQ8ck6PATqpss2uldneK92hJS99DU+0Ml/cnYeOkaWJqFMLfgakT
 pr2JKCZrwKo9DYLvO2pxm7ZkxibJK3luayYVknavDwTX/CqQh6uknBJTYDA9Al3TueQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=nhETRYZp; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5D8740872
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:40:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AD15B979FA9; Sat, 10 Oct 2026 22:40:17 +0200 (CEST)
Message-ID: <5853e85d-141e-47d1-b12b-6d65d760a8a2@rnout.be>
Date: Sat, 10 Oct 2026 22:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260624101340.80670-1-thomas.perale@mind.be>
 <20260624101340.80670-6-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260624101340.80670-6-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: support
 custom version
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



On 24/06/2026 12:13, Thomas Perale via buildroot wrote:
> Support using minor revision for CycloneDX 1.6 by passing the version
> from the command line. Currently supported:
> 
> - 1.6
> - 1.6.1 [1]
> - 1.6.2 (default) [2]
> 
> This is used to fetch the latest SPDX license list available upstream.
> 
> [1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
> [2] https://github.com/CycloneDX/specification/releases/tag/1.6.2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9738db71d6..8d055c3bbd 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -22,7 +22,7 @@ import sys
>   import re
>   
>   
> -CYCLONEDX_VERSION = "1.6"
> +DEFAULT_CYCLONEDX_VERSION = "1.6.2"

  The test was still using version 1.6. This doesn't break the test because it's 
only to generate a dummy file that avoids having to download it - so it just 
means that the test actually downloads the file, which fails when it is run 
without network. Not critical but I fixed it anyway.

  Regards,
  Arnout

>   
>   brpath = Path(__file__).parent.parent
>   
> @@ -538,6 +538,9 @@ def main():
>                           help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>       parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                           help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
> +                        choices=["1.6", "1.6.1", "1.6.2"],
> +                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
>   
>       args = parser.parse_args()
>   
> @@ -545,7 +548,7 @@ def main():
>           parser.print_help()
>           sys.exit(1)
>   
> -    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
> +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
>       show_info_dict = json.load(args.in_file)
>   
>       # Remove rootfs and virtual packages if not explicitly included
> @@ -553,10 +556,11 @@ def main():
>       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                  if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
>   
> +    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
>       cyclonedx_dict = {
>           "bomFormat": "CycloneDX",
> -        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
> -        "specVersion": f"{CYCLONEDX_VERSION}",
> +        "$schema": f"http://cyclonedx.org/schema/bom-{cdx_spec_version}.schema.json",
> +        "specVersion": cdx_spec_version,
>           "metadata": {
>               "component": {
>                   "bom-ref": args.project_name,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
