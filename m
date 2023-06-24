Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6550EEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031D961131;
	Sat, 24 Jun 2023 14:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 031D961131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUCKEqbRQqzE; Sat, 24 Jun 2023 14:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D626112B;
	Sat, 24 Jun 2023 14:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D626112B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99AC51BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 801D96112B
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801D96112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIE1QIiTSWsI for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 108E560F2E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 108E560F2E
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:32:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 38D73B0053E;
 Sat, 24 Jun 2023 16:32:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 16:31:59 +0200
Date: Sat, 24 Jun 2023 16:31:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624143159.GT24952@scaer>
References: <20230624141847.3243715-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624141847.3243715-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687617123;
 bh=Zj3X5ZIDzKletkddym6D9td6xJ4AH8hbXOrz5ok6Ly4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8vif7rTYIKYmty6CgSMoiMFUW7FxVW3+5Sny2Q/aRI6JDGcgoRIczco2GhMsjZyB
 8CN5J8vDBMm4Zp+uME6LW0yVthfCRRuZJuwo+ahPhNVRlDJ8kEacns/X507ow+Od0Z
 v36955POsqd4WQROtmcfEttbrt3yCFejM9zzVEDjyi6zKg56kAEnN+5WnQ/1FUbfo1
 n6IrO7j3ga0rgsXSE8jxn5VhZcoawb272GE7juFdP1rmSuqKbM5GCjH4+8wcJqv0f/
 y29ZW3AQjN768YzzKb7ctBtZj/2xfunyjYeF2DHpl4jcgX+GwuxBKCJOT3I+xudFfN
 IchgIHiKEj7gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d8vif7rT
Subject: Re: [Buildroot] [PATCH v2 1/2] package/heimdal: Use perl module
 JSON:PP, part of core, instead of JSON package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-06-24 16:18 +0200, Bernd Kuhls spake thusly:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Fixes:
> http://autobuild.buildroot.net/results/48b/48b52d205150e30e522b40d1c7b51f339ae8b0db/
> 
> This patch ports the existing patch for the samba4 package:
> https://git.busybox.net/buildroot/tree/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I know first-hand how multiple personalities can be hard to handle. ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: Fix typo in title, add upstream URL (Yann)
> 
>  ...JSON-PP-part-of-core-instead-of-JSON.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
> 
> diff --git a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
> new file mode 100644
> index 0000000000..7323ac70df
> --- /dev/null
> +++ b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
> @@ -0,0 +1,57 @@
> +From f6fdb0a28e3bfcb3fd0aa1c81ad59c5411c0d660 Mon Sep 17 00:00:00 2001
> +From: Andrew Sim <andrewsimz@gmail.com>
> +Date: Sat, 10 Jun 2023 09:00:24 +0200
> +Subject: [PATCH] Use perl module JSON:PP, part of core, instead of JSON
> + package
> +
> +This patch removes the need for an external package.
> +
> +Ported from
> +https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
> +https://github.com/openwrt/packages/commit/402f4ba4eff65b80a9deaa6085256112bec4d67b#diff-208d4e0345c9d29fbec23d6f655ba794afd3052f5cb8dd73944db72ce81b847b
> +
> +Upstream: https://github.com/heimdal/heimdal/pull/1176
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
> + 
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
> +index cedb4c01f..cecd030e6 100644
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
