Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47AFCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 761BC80F43;
	Sun, 11 Oct 2026 10:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv8u9ZZuOvQk; Sun, 11 Oct 2026 10:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8BE0F80F1F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713928;
	b=SEAG6ih9uNJ+ptej2asFbUmGNwK3cMzkckkRzMmMMhnBKM3Ukj/POhokr9ikGyzOizKK
	 oIQn/fd8mIxQbNHMqH+R8CSixrjsD1OjgbyE1Q0jl61QF2JkpRIdW3rDrggpWoLk2kaaz
	 n3taZQmp8yLcPtHjtFydmS2LiP24/qMqhSmC0NlPNQ8ntAA5xuehedbUcHrNKGuirW0tQ
	 DunZf/ZRUmM2K6XCYZFiT3UuN3RS7IVMzxOeLAGSm7e0XoraMF6JLKtXFHjSiHccdOrhP
	 986+0JrlI6dwV4oa7oCH9NyyiuVtph0P4T4eQN3+vP9xHhWNXZka/6Jf6fOZnL+ZvYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=kdObiHHxzs2M9bqWVpmQ041+9RebS/SrczyJYgntJqI=;
	b=i/LchkTgqA2MffuYDamCIE6hNthJlzB2KYgFitairrYnCDdusOD/DqzH5Cit1bkw+IMN
	 YG8i5xW2ad0my3dLrWFzNP4O/W4tZWx5i5+GpSPcX0th69S+eY+S3mQ5SRdU9L0bUtE4M
	 0QDmDULLrgK9HwLndF9hjr/TLXr/fY4JfixpxPU/B+Ua8+e24v/wfw49xNfiztAGD8O7D
	 SCnks49DfpQjJY1ECc0IfRBdB7Cj8vmZtqedhjBUxaSF4oEE+SU1GomPGrXbj2X+wW/3u
	 H63jNKcnqY1eULhb1S6IHsR7rfQkoZI1M6WQhV2PoEGilcsSwhMV45ICv2pdJzju0RA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713928;
	bh=kdObiHHxzs2M9bqWVpmQ041+9RebS/SrczyJYgntJqI=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rq3M2VXIuhonchqKwbhuvJYC/Dv3wnIlMZgc9dzYK8X+hx4MIOqX+gqwgI+RwoEZv
	 J21C2MyNiV4VAFQVCX1vO/WA+m5UwWzQvwwHrtpIZWhnSc5CQoT/EQgScbILRiVINo
	 qHSV4LEn/MLhPTn+w9ia7NIvY7abBtuiHfP++7rfs0g1wYj7PdEOmczy3oce8qWtPH
	 4U6wIcu/iURYI8czV15olOs6VTD2/Ge01yIbUPmywctcjOQ/WTgrfNZnw3uhXv3AIX
	 G0nSf/oQwh7g9mdMELRocei+9hhZuAy54lNtx1pKylqP4pvtiVpd8mZuBJZXN3gbhy
	 sirik/nD5pnmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE0F80F1F;
	Sun, 11 Oct 2026 10:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE02235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9631880DCA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vymptta9zIbE for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 896BA80F1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713926;
 b=VMEBEkkl4wv86/k12OhtcbniOULv6vYKqccrQEsTR4saSXdUDlC6T9Wq6b5x0JT/5G6h
 KY4SfW1GJaj1yvwOyMxFLZsny/pva3uDH2B7tP4kSeUyNDyPPZfTzfIPYy2zLjytB+ag1
 HA8Km8hvqb+3gdj4rUy5h8WBvhdzsCkF0tDTgTaCLizZ46Q0wUl6OdBTRoaS/+bILuK7a
 /ZetDdsK2nA6iRwlBNDTdcOaH1Lwx4IiyeACuk+2EJwUXl5xv5Nu872ZnbUywCJUHuPVb
 7SXEAfUL8Ct505G8pmI7OilkHyHTkyOc/URvNKbJxavlLnXh0fU5mM1RaGSUb2Fs+VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713926;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=Qw5FMWiKZ8SktUZR7zDLmyUrmtobwHv82Y5299GSOKs=;
 b=s72hY0nqrWmovo9+bfGiX1QhiNH2EKRkCzyDN4K4Vv6Xy5nbiEhqn3h0shjnV6dtwxnu
 2Rv1MjrcRZ8eyQpX3xgrYB59V4W+pfM6mOcgMCeBMaBTv7xh9calvU6mrqry7y7z6nIXS
 /Ljxo7RhRweP3EMGHT17yTmUa+km4Z7nXpUzy3SIwkFrtWfcxNbsVOI0wV6UmYWspTPeq
 btw9hQD8s93MH1ckv1l42usklx5vTnLiMyRlcCcwtjZ1V9lxn/uBXtJfIOVS5lvu+4HwT
 7C5LZFM2F77WR9oCHMAxbH8fhTaXSFH+3HQcct496MPZcV5aXqJoa5mu2w/MhCxSi5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=o+UgmUcX; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 896BA80F1F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE478B97A143; Sun, 11 Oct 2026 12:18:42 +0200 (CEST)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261011094214.682647-1-thomas.perale@mind.be>
References: <20261011094214.682647-1-thomas.perale@mind.be>
Message-Id: <179171391460.166238.17523831196997140418.b4-ty@b4>
Date: Sun, 11 Oct 2026 12:18:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/3] utils/generate-cyclonedx: avoid
 f-string usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Oct 2026 11:42:12 +0200, Thomas Perale via buildroot wrote:
> The argparse library documentation [1] suggest the usage of
> 'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
> show the default value of every arguments.
>
> Use this to avoid declaring this value ourself.
>
> [1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter
>
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>  utils/generate-cyclonedx | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 98009cef98..c292ef7840 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
>  
>  def main():
>      parser = argparse.ArgumentParser(
> -            description='''Create a CycloneDX SBoM for the Buildroot configuration.
> -                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
> -            '''
> -        )
> +        description='''Create a CycloneDX SBoM for the Buildroot configuration.
> +            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
> +        ''',
> +        formatter_class=argparse.ArgumentDefaultsHelpFormatter
> +    )
>      parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
>                          default=(None if sys.stdin.isatty() else sys.stdin))
>      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                          default=sys.stdout)
> -    parser.add_argument("--virtual", default=False, action='store_true',
> +    parser.add_argument("--virtual", action='store_true',
>                          help="This option includes virtual packages to the CycloneDX output")
>      parser.add_argument("--project-name", type=str, default="buildroot",
> -                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> +                        help="Specify the project name to use in the SBOM metadata")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> -                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +                        help="Specify the project version to use in the SBOM metadata")
>      parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
>                          choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
> -                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
> +                        help="Set CycloneDX version")
>  
>      args = parser.parse_args()
>  
> -- 
> 2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
