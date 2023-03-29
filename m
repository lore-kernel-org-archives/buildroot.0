Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F1C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 20:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CB341E90;
	Wed, 29 Mar 2023 20:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48CB341E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXN-EaYVAeQQ; Wed, 29 Mar 2023 20:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B62041EAD;
	Wed, 29 Mar 2023 20:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B62041EAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4469D1BF31F
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 20:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1567784208
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1567784208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odt4ALWEZAJX for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 20:05:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E7984207
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94E7984207
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 20:05:35 +0000 (UTC)
Received: from opfednr03.francetelecom.fr (unknown [xx.xx.xx.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4PmyGP5Drhz10Gy; 
 Wed, 29 Mar 2023 22:05:33 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 29 Mar 2023 22:05:30 +0200
Date: Wed, 29 Mar 2023 22:05:30 +0200
From: <yann.morin@orange.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Message-ID: <7296_1680120333_64249A0D_7296_200_1_20230329200530.GA3381@tl-lnx-nyma7486>
References: <20230329155154.75895-1-aaron@bubbl-tek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329155154.75895-1-aaron@bubbl-tek.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1680120333;
 bh=ynO/C8duQjSLJfpFRHXsw229TMHLbHTO2FffRLWk88w=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=TUwtcxYog/S6WLY//JtNV14GZ0ub/S6WKTiPHt49tkyTZ29mxS6F9xOC9q172jHhL
 YInKFUNK1ydlhxttDYg0yEv9VSL0nljR6r4tTGriuibuUCFqBpUywbPJNQb3XH0xOX
 JoklpJwJ+vd+5IqW0A0jXiFmJj2cO1C7+Ze4lrwHJJibNZCIT8bff/9bEzTNQNBN6R
 pziDR/NvToVFREHQNKkPaMefqwoh/8AfhJm47XMwsavR2aT2eu7Vp5d3xjN01dFPoU
 0ku3hTZespeT6vNxgZTTUpmPCP+ftTlTj6Ki7ZEBQCzGZexrAWtyz0IrJ5aG2IvmsT
 M+97xRrPgtEbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=TUwtcxYo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-requests: bump to
 version 2.28.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aaron, All,

+James

On 2023-03-29 10:51 -0500, Aaron Sierra spake thusly:
> Get explicit compatibility with charset-normalizer 3.x

Yes, that warning was getting annoying in my logs, thanks! :-)

That happens since 0511458dc1ef (package/python-charset-normalizer: bump
to version 3.0.0).

a0a9edb64caf (package/python-requests: bump to version 2.26.0), changed
the dependency from chardet to charset_normalizer without explanations,
although chardet was, and is, still supported.

James, do you remember why you changed the dependency?

The only reason I could unearth, is that upstream added support for
charset_nomalizer which is MIT, while chardet is LGPL. Anything else?

If at all, that change of dependency should have been done in a separate
patch, I think... Too late now... :-(

> Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>

Acked-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  package/python-requests/python-requests.hash | 4 ++--
>  package/python-requests/python-requests.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index 1383e680d5..b6f696000b 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  796ea875cdae283529c03b9203d9c454  requests-2.28.1.tar.gz
> -sha256  7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983  requests-2.28.1.tar.gz
> +md5  09b752e0b0a672d805ae54455c128d42  requests-2.28.2.tar.gz
> +sha256  98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf  requests-2.28.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index 7a21cca52c..8f9f4b2db4 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_REQUESTS_VERSION = 2.28.1
> +PYTHON_REQUESTS_VERSION = 2.28.2
>  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf
>  PYTHON_REQUESTS_SETUP_TYPE = setuptools
>  PYTHON_REQUESTS_LICENSE = Apache-2.0
>  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
