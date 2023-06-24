Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5965FEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 13:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4AB60AD5;
	Sat, 24 Jun 2023 13:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4AB60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31ct7vayMepV; Sat, 24 Jun 2023 13:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16AFC607F6;
	Sat, 24 Jun 2023 13:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16AFC607F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77191BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC83607F6
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC83607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHx9mVElflfV for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 13:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD96607CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD96607CE
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 13:40:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 298D9B005A4;
 Sat, 24 Jun 2023 15:40:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 15:40:37 +0200
Date: Sat, 24 Jun 2023 15:40:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230624134037.GN24952@scaer>
References: <20230610070628.228669-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230610070628.228669-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687614040;
 bh=48EBvEDeC0Vj0zJsEBhAtkd9QohCMHdn+m1zNFfm08c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwrasSDN9pZUi+shQxfKbPRpohjjfh6EARLnlnjqrFPvq9fmar5r9nWqJZRcWB5+x
 /hbsHJCM2QGs4ir6sXVrZNsVyS6asNguKDs8cigzVrtHny0o8rP9FklATEFoxLIseB
 NGaQ2jNDS1teVzhsQLOP7UP8M+98U359VHdaEQ+ElO0XCJPGuiz9q8hZ2SzAwKGa6t
 AW5nmAwEIk6+Y5uFBaIpLXSEmWUtwiFLvdTAmu5QR9UvpJHns9u0wutTp5k1C0vgss
 G3uh7/J2Cpqoyu5vcGHt2kAz2VlHnPhtK+IA2MWna6cVCi8giPhRVvTwyN1TRVSWJ3
 8YLJS40H1Laeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CwrasSDN
Subject: Re: [Buildroot] [PATCH 1/1] package/heimdal: Use perl module JSON,
 part of core, instead of JSON:PP package
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

Bernd, A;;,

On 2023-06-10 09:06 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/48b/48b52d205150e30e522b40d1c7b51f339ae8b0db/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...JSON-part-of-core-instead-of-JSON-PP.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch
> 
> diff --git a/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch b/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch
> new file mode 100644
> index 0000000000..a7d8777a78
> --- /dev/null
> +++ b/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch
> @@ -0,0 +1,54 @@
> +From f77b0d16ace70d93c018241e25826611f3124604 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 10 Jun 2023 09:00:24 +0200
> +Subject: [PATCH] Use perl module JSON, part of core, instead of
> + JSON:PP package
> +
> +Ported from
> +https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
> +
> +Upstream: Not applicable

When a patch is not applicable upstream, this must be motivated.

> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + cf/make-proto.pl | 4 ++--
> + configure.ac     | 1 -
> + 2 files changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/cf/make-proto.pl b/cf/make-proto.pl
> +index 36a040ce6..4af21916b 100644
> +--- a/cf/make-proto.pl
> ++++ b/cf/make-proto.pl
> +@@ -4,7 +4,7 @@
> + use Getopt::Std;
> + use File::Compare;
> + 
> +-use JSON;
> ++use JSON::PP

I don't understand this change in relation to the commit title: the
change switches over from using JSON to using JSON::PP, but the title
says we are doing the opposite...

Would you care to clarify, please?

Regards,
Yann E. MORIN.

> + my $comment = 0;
> + my $doxygen = 0;
> +@@ -70,7 +70,7 @@ if($opt_x) {
> +     my $EXP;
> +     local $/;
> +     open(EXP, '<', $opt_x) || die "open ${opt_x}";
> +-    my $obj = JSON->new->utf8->decode(<EXP>);
> ++    my $obj = JSON::PP->new->utf8->decode(<EXP>);
> +     close $EXP;
> + 
> +     foreach my $x (keys %$obj) {
> +diff --git a/configure.ac b/configure.ac
> +index b946dfff4..c08cb24dc 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -56,7 +56,6 @@ if ! test -f "$srcdir/lib/asn1/der-protos.h" ||
> +     AC_KRB_PROG_PERL
> +     AC_KRB_PERL_MOD(Getopt::Std)
> +     AC_KRB_PERL_MOD(File::Compare)
> +-    AC_KRB_PERL_MOD(JSON)
> + fi
> + 
> + AC_KRB_PROG_YACC
> +-- 
> +2.39.2
> +
> -- 
> 2.39.2
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
