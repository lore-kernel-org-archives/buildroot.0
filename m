Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A967AC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 20:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6052460BBC;
	Sun,  4 Dec 2022 20:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6052460BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yzUeU98sjZq4; Sun,  4 Dec 2022 20:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847FA60BA4;
	Sun,  4 Dec 2022 20:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847FA60BA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89B6E1BF580
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 20:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61DF481432
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 20:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61DF481432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnS5lg8qQyRM for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 20:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F5C581431
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5C581431
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 20:00:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d5da:276a:18d1:4753])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0A6EE2003CE;
 Sun,  4 Dec 2022 21:00:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 21:00:36 +0100
Date: Sun, 4 Dec 2022 21:00:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221204200036.GC2855@scaer>
References: <20221204183253.18925-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204183253.18925-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670184041;
 bh=K9v7jG+m5Mai8fGoAckKYXkFymgIQLYbVTWkFMhmnuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqjSyg/u7L/6tO1sDgV29w9T+z3NPZmrhYQlynEHUmLn6ojx2ffNMdcI7WnDLFKVW
 cTHRPJURUZR/T5dUNxLtAGJ1XTSoyKBfASnIkWQBn2VpTD1RI7aQi/9jvMRVgDJXUB
 7Mgi3Zk8hTgj8tUAJOL+wsfgcluu+am8CHzqvhmcEOIy5b6uEvZWpA4ZnyMhIzzkeA
 jDRer5YxMqaGjfBHCZbS0lxqB1XSCWQYT1C9Ok+EZlZ16GK96i9kdOOD/tQKTfsm2Y
 QF5uNF68gWy6FBjeFG2JrkmvVUWV7pnqrS7Bw1cmXjjPJBIs5p07+dTyc9wEhLzCGp
 tKpxEuHmbZm4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BqjSyg/u
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: fix license
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-04 19:32 +0100, Fabrice Fontaine spake thusly:
> Commit 343974b99528702842e8c1dad945fcd4f0defd6c forgot to change the
> licensing information which has been updated with
> https://code.qt.io/cgit/qt/qtserialport.git/commit/?id=bb05a26d52c834cc7f3c549f3e5d66f76baf42a2
> resulting in the following build failure:
> 
> ERROR: LICENSE.GPL2 has wrong sha256 hash:
> ERROR: expected: 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> ERROR: got     :
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I changed the lists to be one item per line, for both _LICENSE and
_LICENSE_FILES, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qt6/qt6serialport/qt6serialport.hash | 11 ++++++-----
>  package/qt6/qt6serialport/qt6serialport.mk   |  7 +++++--
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
> index fb1b3dcf6b..54a45681fa 100644
> --- a/package/qt6/qt6serialport/qt6serialport.hash
> +++ b/package/qt6/qt6serialport/qt6serialport.hash
> @@ -2,8 +2,9 @@
>  sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
>  
>  # Hashes for license files:
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
> -sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
> index 01763657b8..362f5ecd8a 100644
> --- a/package/qt6/qt6serialport/qt6serialport.mk
> +++ b/package/qt6/qt6serialport/qt6serialport.mk
> @@ -9,8 +9,11 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
>  QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
>  QT6SERIALPORT_INSTALL_STAGING = YES
>  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
> -QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
> -QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs), BSD-3-Clause
> +QT6SERIALPORT_LICENSE_FILES = LICENSES/BSD-3-Clause.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/Qt-GPL-exception-1.0.txt
>  QT6SERIALPORT_CONF_OPTS = \
>  	-GNinja \
>  	-DQT_HOST_PATH=$(HOST_DIR) \
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
