Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4EFC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77EB560F46
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77EB560F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2507760835;
	Mon, 25 Oct 2021 09:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5ui5vsSroe7; Mon, 25 Oct 2021 09:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4EB607CA;
	Mon, 25 Oct 2021 09:06:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D651A1BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C44DE80CFF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcZEMU1qi16o for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:06:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8661C80CD5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:06:27 +0000 (UTC)
Date: Mon, 25 Oct 2021 10:06:15 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Matthew Weber <matthew.weber@collins.com>
Message-Id: <FYZI1R.QAI4TMAEMRIG2@crapouillou.net>
In-Reply-To: <20211018214014.1202-2-matthew.weber@collins.com>
References: <20211018214014.1202-1-matthew.weber@collins.com>
 <20211018214014.1202-2-matthew.weber@collins.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/lightning: [revert]ignore not
 applicable CVE-2020-7747
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matthew, all,

I still get the emails about CVEs in Lightning though :(
I just got one a few hours ago.

-Paul


Le lun., oct. 18 2021 at 16:40:14 -0500, Matthew Weber =

<matthew.weber@collins.com> a =E9crit :
> This reverts commit 613953f8217bf5b27489e0a939147ef7c74c3f7a.
> =

> A new CPE ID was assigned by NIST and this whitelist can be
> dropped as the package is setup to use the correct CPE (Not
> to be confused with the other lightning-* packages which show
> up when a free txt search is used to find the CVE.)
> =

> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  package/lightning/lightning.mk | 4 ----
>  1 file changed, 4 deletions(-)
> =

> diff --git a/package/lightning/lightning.mk =

> b/package/lightning/lightning.mk
> index c0036e5cd1..da8c07e61f 100644
> --- a/package/lightning/lightning.mk
> +++ b/package/lightning/lightning.mk
> @@ -13,10 +13,6 @@ LIGHTNING_CPE_ID_VENDOR =3D gnu
>  # We're patching include/Makefile.am
>  LIGHTNING_AUTORECONF =3D YES
> =

> -# CVE-2020-7747 is for the Javascript lightning-server project, and =

> not for
> -# GNU Lightning.
> -LIGHTNING_IGNORE_CVES =3D CVE-2020-7747
> -
>  ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
>  LIGHTNING_DEPENDENCIES +=3D binutils zlib
>  LIGHTNING_CONF_OPTS +=3D --enable-disassembler
> --
> 2.17.1
> =



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
