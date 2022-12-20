Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A2AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 16:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19222416E2;
	Tue, 20 Dec 2022 16:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19222416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUHlDCMC-ZPF; Tue, 20 Dec 2022 16:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78C341750;
	Tue, 20 Dec 2022 16:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78C341750
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40B481BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1998A41750
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1998A41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AT_AsuokcJPv for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 16:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678CA416E2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 678CA416E2
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 16:12:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 855105FFC1;
 Tue, 20 Dec 2022 17:12:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 17:12:47 +0100
Date: Tue, 20 Dec 2022 17:12:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20221220161247.GH2909@scaer>
References: <20221219214620.28780-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219214620.28780-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671552769;
 bh=Qtgn70W3omxARw6GyLnt0Tr/foIHq1e5mvXUl5InCCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cHSs0Y+GUJ13T/+JwqCu6bhQUWgyGsdYkxCV2lXpxslZXqxb6GqeZt2K13fM7tqDC
 MyC+obgQe0WuKI8I1MTtEsex76n/lp5bXoZzu+3Si5ndjJdhK3b/yDWCbrkQNd3cc2
 M9rZm69nQM2S35Y6YOW+Sh4KxdC/QlBzB4kSx7d5tCPekvkxqjlu5m/NuNi/YqMsBl
 me8BuKIXGtKfHNHneKfTDLaQ1lEo2zKZPd2mmcsjsEFp/GNNzuRynF8lpnLTX2ltOK
 kz31Zcdm0mtFvLrPAOy+yT8v0ekeJUBJM69eex6tWOuASEN8+p6goIFI2+A/LL0zpN
 KSbsp5WpPIuTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cHSs0Y+G
Subject: Re: [Buildroot] [PATCH v1] utils/scancpan: update cpan.org and
 spdx.org URLs from http to https
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-12-19 22:46 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/scancpan | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index 075f193563..168619164f 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -31,7 +31,7 @@ $fatpacked{"MetaCPAN/API/Tiny.pm"} = <<'METACPAN_API_TINY';
>            if $params{ua_args} && ref($params{ua_args}) ne 'ARRAY';
>  
>        my $self = +{
> -          base_url => $params{base_url} || 'http://api.metacpan.org/v0',
> +          base_url => $params{base_url} || 'https://api.metacpan.org/v0',
>            ua => $params{ua} || HTTP::Tiny->new(
>                $params{ua_args}
>                    ? @{$params{ua_args}}
> @@ -525,8 +525,8 @@ my %deps_build;         # name -> list of host dependencies
>  my %deps_runtime;       # name -> list of target dependencies
>  my %license_files;      # name -> hash of license files
>  my %checksum;           # author -> list of checksum
> -my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
> -my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
> +my $mirror = 'https://cpan.metacpan.org';        # a CPAN mirror
> +my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'https://fastapi.metacpan.org/v1');
>  my $ua = HTTP::Tiny->new();
>  my $new_pkgs;
>  
> @@ -698,7 +698,7 @@ sub brname {
>      return uc $name;
>  }
>  
> -# Buildroot requires license name as in http://spdx.org/licenses/
> +# Buildroot requires license name as in https://spdx.org/licenses/
>  sub brlicense {
>      my $license = shift;
>      $license =~ s|apache_1_1|Apache-1.1|;
> -- 
> 2.39.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
