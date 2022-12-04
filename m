Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09403C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 20:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7A740198;
	Sun,  4 Dec 2022 20:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7A740198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYMbdywvGAvn; Sun,  4 Dec 2022 20:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED8740190;
	Sun,  4 Dec 2022 20:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED8740190
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17CF01BF580
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E715781432
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 20:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E715781432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPvhmk3n-oqS for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 20:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBEEE81431
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBEEE81431
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 20:01:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d5da:276a:18d1:4753])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EEFFE2003C8;
 Sun,  4 Dec 2022 21:01:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 21:01:38 +0100
Date: Sun, 4 Dec 2022 21:01:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221204200138.GD2855@scaer>
References: <20221204181948.13898-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204181948.13898-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670184102;
 bh=uIFkhfcQJBPceY/HoRHxd3qx4WOSOhH2+sEIQI7lZ+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7QJbidd8npzAPHMic/wHQx2acKs1TG1sqrdBIRt5/TnR9kdWL0hQdbEIfcko9mIz
 s/DzGbkqcnWNUCrm+wU9pVNRgFGYyHRUaipez8wzq54BOrjOMz3yzma+It6By07/Tb
 BOn7KcwiPMl4PuknjHhPO8xLM4J8Q/VzdeWu36zmuY58b5R/+G0HhbhOw+L4j+/4j7
 xK99ie5YANJZwgbXVPJcoLG9Ob+THcJGL98KtCP00S3mMH111KF+JXB8nKJX5eO3QV
 9ixzhisgQXLWRE1W1vGwmupo4eHOLRIXnGMq+6m3AcyvdkUJUZGIJdxHcpimwzuvSr
 zWsyNl4TAzN4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X7QJbidd
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: fix license
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-12-04 19:19 +0100, Fabrice Fontaine spake thusly:
> Commit 343974b99528702842e8c1dad945fcd4f0defd6c forgot to change the
> licensing information which has been updated with
> https://code.qt.io/cgit/qt/qtbase.git/commit/?id=05fc3aef53348fb58be6308076e000825b704e58
> resulting in the following build failure:
> 
> ERROR: LICENSE.GPL2 has wrong sha256 hash:
> ERROR: expected: 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> ERROR: got     :
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bf20b7457349f1bb7a82d471ad2c9e4307ac540c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt6/qt6base/qt6base.hash | 14 +++++++++-----
>  package/qt6/qt6base/qt6base.mk   |  9 +++++++--
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> index 5dd26973fa..6544a371c6 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -2,8 +2,12 @@
>  sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
>  
>  # Hashes for license files
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
> -sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSE.FDL
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index b7ee6037f3..5f9ea58862 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -7,8 +7,13 @@
>  QT6BASE_VERSION = $(QT6_VERSION)
>  QT6BASE_SITE = $(QT6_SITE)
>  QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> -QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
> -QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs), Apache-2.0, BSD-3-Clause, BSL-1.0, MIT
> +QT6BASE_LICENSE_FILES = LICENSES/Apache-2.0.txt LICENSES/BSD-3-Clause.txt \
> +	LICENSES/BSL-1.0.txt LICENSES/GFDL-1.3-no-invariants-only.txt \
> +	LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt LICENSES/MIT.txt \
> +	LICENSES/Qt-GPL-exception-1.0.txt

I changed the lists to be one item per line, for both _LICENSE and
_LICENSE_FILES, and applied to master, thanks.

> +	

    $ make check-package
    package/qt6/qt6base/qt6base.mk:16: line contains trailing whitespace

I also fixed that (an empty line with only a TAB), and applied to
master, thanks.

Regards,
Yann E. MORIN.

>  QT6BASE_DEPENDENCIES = \
>  	host-ninja \
>  	host-qt6base \
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
