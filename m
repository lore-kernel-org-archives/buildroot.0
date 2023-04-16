Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE78C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6E0613B9;
	Sun, 16 Apr 2023 08:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6E0613B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6wRvreqU13m; Sun, 16 Apr 2023 08:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404FD613A2;
	Sun, 16 Apr 2023 08:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404FD613A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F85C1BF31F
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 08:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4237C613A2
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 08:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4237C613A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 578DOMvjFEOi for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 08:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0395961149
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0395961149
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 08:55:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D18085FFB9;
 Sun, 16 Apr 2023 10:55:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 10:55:24 +0200
Date: Sun, 16 Apr 2023 10:55:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230416085524.GX2819@scaer>
References: <20230320073419.707352-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320073419.707352-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681635328;
 bh=fwewWXVK2BZAl/kKhrtE83oLrgtVFJhImxxnJDwsR8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isPQt5xQ485TTB1sEfDHJZUxlVA+C2mJKiLMfjKuF3j8jCHlJ9MVU3AcH+tmNYkrf
 Arp81m9bPP+jRe8WjLwo4vGKHMvaDTENEiubDQzhN7bzl8ehoCFIr70h+oUx9V7tp1
 aNx1nFz5M05Luk+U3k7dsevbj572ogXn45oFixf1W9hc97PBcf48ZtWDUa+4kTZFyf
 iGpg8StpeYNZmZUh1PT4t+iGctpl8RgBrcLwdwJynrSAPlgrIYyKUH+ItaaP6MVNiF
 3AiAavZYJGPXZWC6ccgLmGMrpEdKy4A19qo1Jtn8/uYsnND4Z+w6PbAK901f9/pIel
 57k9XATvfkm1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=isPQt5xQ
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: security bump to
 version 4.6.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-03-20 08:34 +0100, Fabrice Fontaine spake thusly:
> - Fixed (security) [APP-70]: Memory leak in MibLeaf::set if same OID is set
>   twice in the same PDU.
> - Fix the following build failure raised since bump of snmppp to version
>   3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:
> 
> snmp_pp_ext.cpp: In member function 'int Agentpp::Snmpx::send(const Agentpp::Pdux&, Snmp_pp::SnmpTarget*)':
> snmp_pp_ext.cpp:1172:47: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
>  1172 |     status = snmpmsg.loadv3(Snmp::get_mpv3(), pdu, engine_id, security_name,

That does not seem to be fixed, unfortunately;

    http://autobuild.buildroot.org/results/694/694dfd225d2b8392cd231a8622d731d53579c713/

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.net/results/d7347b8b3953596b66da6ca6d85f084fb427934c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/agentpp/agentpp.hash | 2 +-
>  package/agentpp/agentpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
> index 99aae70263..527414eed5 100644
> --- a/package/agentpp/agentpp.hash
> +++ b/package/agentpp/agentpp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  5f2cfe98fd1d50683e02c65fccd9423351254df427e5825e4f321c488a9234eb  agent++-4.5.4.tar.gz
> +sha256  e09dc2d40277d468c18f1539ad18f43e0c3a95b10fad8a02184e9ace8bac0d67  agent++-4.6.0.tar.gz
>  sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
> diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
> index d020228e44..0ef549426e 100644
> --- a/package/agentpp/agentpp.mk
> +++ b/package/agentpp/agentpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AGENTPP_VERSION = 4.5.4
> +AGENTPP_VERSION = 4.6.0
>  AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
>  AGENTPP_SITE = http://www.agentpp.com/download
>  AGENTPP_LICENSE = Apache-2.0
> -- 
> 2.39.1
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
