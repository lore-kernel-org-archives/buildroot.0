Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31B0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB356058D
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EB356058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D4B80F94;
	Wed,  3 Nov 2021 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pt_1EO79i9LH; Wed,  3 Nov 2021 19:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E5E80FBC;
	Wed,  3 Nov 2021 19:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28DF91BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B73D60634
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZik06IrLGJM for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B65B6063A
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635968887;
 bh=URH/OGX0+bGWVM0DoOIagIjRaIxIaRZFJ0kfg563Vxc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=VVdcQq7oBlp5NI/4bPK/43bXDSUUlXRSBef/wwNuiwA+ifO0dKdxkKSmqwetfbISH
 VjFr1LzvSmBfdmocwAyPMLIcoa0m6SFUhdmW2k5wk6weqTqndOTzYOUWzrWQkGWoaO
 E9n8NchOkN7kqA3cgMbJPLuew1RBxJwUhI6JlRyQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MStCY-1nBP8j04Du-00UIFP; Wed, 03
 Nov 2021 20:48:07 +0100
Date: Wed, 3 Nov 2021 20:48:05 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211103204805.1facb4a9@gmx.net>
In-Reply-To: <20211029065957.3084528-1-james.hilliard1@gmail.com>
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:cpCGjw6qob4SUVikf/epLyFvPBZr03dtvlItc8ps79hl2sd9z1m
 kMZSkEwgq3WY1uKm3nN1itEqik0ONhPveQ4Gfn2rWmbdK+5CTQYwWHp53efPSRJVA+h5OCs
 gFWaRxy2BrjRVA++hnwn2G+t12La+K6KWHvmSZ1pob55KcZ7I0uXmc6kNPEvt0qC70pMpoL
 8CRhJi+gnmrUlUGmP4opg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HB+Cn1FGv2I=:TV3Zuud/thIBU/VGMUA22l
 BvWNMJKZ5IJIjJ9wWR7+D/i0XEKD8S39tTy47RX/61/s9sWv73T5aXVEoqAn7i+S022sErVEj
 HTkPT5AP+DIxZpqY3w8PgX1dAGk7NgMmZgHdmbLTol3yWUF3M/qmU0e8XvKwJKFvyvHXlc7Ok
 bBbhs/WNPzCIBN9vJWNHmpBiUgkdbWHnf3vISq05DrmbUuOI5o0EFDQbg+SarHLt7eA9+3lFq
 4MKfKjlGGER4TJGRskpHTeMwmiVVRnsj9n/2d3DceO/q4ZlKzhEj0ss3tKWOSZPrWJkuV9LG6
 a6DGE+8n9UJlxTatvkM9MmtH8+73phl/odxINje3Hk58ND75qAav9OimSMN5eQg3absPfYiWJ
 rczZmIXaj7ajohARQLAwlTGuNfAghvJhAPZW+xwOpuaDudPX+/K0k+mu1o7G4DPXT+BOIPfQ0
 1/XY5fxbO7dHBRR7cN+7ujQ2nC9lUwxK39VFFJ/FTj7IyJmVyU5qt5Hn9wL9AHt0Uww57BCDm
 Kg+HyS3FRCPfsi9s1PQ9Eysl13WjeP+uNTuwfVJNCQaWYHUEMf2zorBh01MlhQA2SmERKRfJI
 ad2qteh8tv/7MGN2zaFTF8nFTzfV3RW/7fGvwaAG+6GB3u/SzdIaP0BgEpzM7/mncswINN4sS
 daypV/7rdcYAsBEABUKcpVZKDP0gkHzBjLsaNFJ+IxtYoXijfg3m/xtotc27xEDWuf01XH2uj
 q5mF+6gY3mJ7aCzu4QWHv9GiyL4e0pjZocLldOFgDzYolhF0Ydc3JLBFYa3ZCTltRdE4sKySE
 jbKiVJ2Aw7v8gD7VMOyy13nTF4S46cS1fIahJaZlM+kMJ50DjPHKyuKlVo7rm0JfoK2MVeVph
 vv0hHtzVGlTBWWqQqqtN9cPGH+B8cSii/nNCkaJF3Lfy6sjAIO/c//FQhmOz8FukQWCdjbrXN
 q+YfoKrdu39W1EDytMbWVyeGiEbG3SjPPLRKA60OpbslKxsSd0gQIZy0+vgLOjIQXcxrR/i1x
 N1ROfTysKumfm5UOC3kv/wDTi/JO/W9EyhNIzgwqsSNHeerCKSmS8QWQPE7nLZ/aZdBnyetcT
 mtTnWBRH82VabA=
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Fabrice, *

On Fri, 29 Oct 2021 00:59:57 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> This dependency wasn't added during the removal of
> python3-cryptography.

The conversion/dropping of python3-cryptography was done with commits [1] and [2],
and the commit log of [1] states the dropping of the host-python3-six dependency
was intentionally:

	[...]
	While at it, drop host-python3-pip and host-python3-six as these
	dependencies are not needed. Indeed, pip was never a dependency of
	cryptography and six is not a dependency with python3 and will be
	dropped in version 3.4 and
	https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
	[...]

But the package python-cryptography is still at version 3.3.2 (and clearly depends on six)

@Fabrice: version bump pending?

@James: with a bit of explanation added to the commit log you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

But although fine with an version bump of the package ;-)

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
[2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a

>
> Fixes:
>  - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index e21b9db042..081dfc06a0 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
>  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
>  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
>  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
> +	host-python3-cffi \
> +	host-python3-six \
> +	host-openssl
>
>  $(eval $(python-package))
>  $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
