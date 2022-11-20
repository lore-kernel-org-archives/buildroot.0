Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA84C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 10:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB5160AC2;
	Sun, 20 Nov 2022 10:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AB5160AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gceV_z9DMtg; Sun, 20 Nov 2022 10:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DCD560A8B;
	Sun, 20 Nov 2022 10:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DCD560A8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 577581BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 10:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C64B60A8B
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 10:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C64B60A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmNQZWZ-20cY for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 10:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47CC60784
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E47CC60784
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 10:49:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:78ad:17ab:4254:8d91])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 709062003F3;
 Sun, 20 Nov 2022 11:49:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 11:49:29 +0100
Date: Sun, 20 Nov 2022 11:49:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221120104929.GB2516@scaer>
References: <20221120102531.16432-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120102531.16432-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668941371;
 bh=FLsznNS8iZ0ug8iBfz0TlwNQtbxhs6qump5Fo5zgy34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uJUNJvORnQlpPCoKL8qoAQnQdrgC0OwyRWjV8T1Ba1DkN5K/oJ41ZIbWY5GTDFR/j
 vM8qpNJ7erc58FqP58t+TrXLhZgrHHVx1ypr9JOy9nA1tOrWqMEB3NItdw61U8yX8Y
 G2MgW+lusfbw/bigMQr5SO7oYY8DscQZ3oyWmgToNnpTewplJN37F1lUoFUyi9pCdh
 wIHLyDkAuA9xCJHi1XuL6ua00fCayfUQwN9eQ/qDtWbWqkRtmpxWXQjs/UXcLF5WnH
 6LRPZC5y3f7treXOGOqC7VVjagqB2XWo31BoPFXHY91QRPILP+jJ7YiuhW5LfphWwV
 MGqsN5obYLPMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uJUNJvOR
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/sysstat: security bump to version 12.6.1
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

Fabrice, All,

On 2022-11-20 11:25 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2022-39377: sysstat is a set of system performance tools for the
> Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
> but prior to 12.7.1, allocate_structures contains a size_t overflow in
> sa_common.c. The allocate_structures function insufficiently checks
> bounds before arithmetic multiplication, allowing for an overflow in the
> size allocated for the buffer representing system activities. This issue
> may lead to Remote Code Execution (RCE).
> 
> Despite what is written above in the CVE announcement, and as written in
> the Changelog, the fix is also included in version 12.6.1 (12.7.1 is a
> development version):
> https://github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396bee2bd6b0ab

The issue is that the NVD considers 12.6.1 to be impacted; with your
patch applied, and a configuration that enables sysstat:

    $ make pkg-stats
    [...]
    $ jq .packages.sysstat.cves < pkg-stats.json
    [
      "CVE-2022-39377"
    ]

So, you also need to push to the NVD the fact that versions 12.6.x are
not affected, but 12.6.0 which still is.

In the meantime, I guess we need an exclusion in the the .mk, but I am
not sure what our policy is in this respect...

> Someone suspicious of the github warning that "this commit does not
> belong to any branch on this repository" could check that the
> check_overflow function is defined in common.c and used in sa_common.c.

Sorry, but I don't buy that. So I had to investigate to understand where
that commit hash comes from.

So, Github reports that "commit does not belong to any branch on this
repository", and indeed there is no branch which history contains that
commit hash.

However, said commit hash *is* reachable from the 12.6.1 _tag_. That is,
the sysstat repository does not contain any branch but master, and fix
releases are only pushed as tags with their history.

So, the warning by Github is misleading, as the referenced commit does
belong to the repository via a tag.

Regards,
Yann E. MORIN.

> https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x
> https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Update commit message
> 
>  package/sysstat/sysstat.hash | 4 ++--
>  package/sysstat/sysstat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
> index b573f312c6..b47f000e57 100644
> --- a/package/sysstat/sysstat.hash
> +++ b/package/sysstat/sysstat.hash
> @@ -1,5 +1,5 @@
>  # From: http://sebastien.godard.pagesperso-orange.fr/download.html
> -sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
> +sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
>  # Locally calculated
> -sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
> +sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index 6948f6b390..377396d986 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSSTAT_VERSION = 12.4.2
> +SYSSTAT_VERSION = 12.6.1
>  SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
>  SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
>  SYSSTAT_CONF_OPTS = --disable-file-attr
> -- 
> 2.35.1
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
