Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1269C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D08240F4E;
	Sun, 19 Mar 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D08240F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZQIA_h-3dbP; Sun, 19 Mar 2023 20:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B2540A02;
	Sun, 19 Mar 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B2540A02
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8385A1BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2A7818BE
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D2A7818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWskCmkHVxDE for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:52:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0701A818AC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0701A818AC
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:52:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1pf6TX22Gq-003PiX; Sun, 19
 Mar 2023 21:52:27 +0100
Date: Sun, 19 Mar 2023 21:52:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230319215226.456c67d1@gmx.net>
In-Reply-To: <20230319201701.469279-1-giulio.benetti@benettiengineering.com>
References: <20230319201701.469279-1-giulio.benetti@benettiengineering.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:i5RFqcnBerve3jc20aobsSJIuV2rIV83DDtIz5Bz80k2CCxhlrW
 Ll6gr5ai0jtIYyYvk6dtzyFjxaVRv2bPiZA/5NKWMYYJgmaQFDexyk8tvC2S/8moIyW8nAC
 b6jhcSFY78d3mBfYattBeNWe0FzcOIMlwWrxoKW+ZDN5cLWNibhFc58oa5kv5/Pbbgyvq7+
 ZOlidgGpBXAN3yihEcoaQ==
UI-OutboundReport: notjunk:1;M01:P0:sbV80wMR8YQ=;UzzXIB3MzJpZNCUJ6EqUeJzDHw8
 1wKC5Qr+iRNg9ghg3X2Wg2CremQuS2odM4DrHWb3Cz+4D1k2u+c5NF0zn/nIo5jLh442KqDSj
 krKMhINI25ILS08kI6ZrULKyTulAM6bioD/fjDSirs8d/aK0Ol+g5/MPhuPHuTjoPRXAoqV+v
 lZKjBIPg0bm4JtWhyc9xoVSMr8rKJjy9Ky6PXSQLRHxavhEXMRYQIKeIvt1mRbfv06mIm2wlT
 bMJl2FMHf3v/aaLiaBbu1FFY4aonnsJiVeSw3QDEc4RSYXU3JTYLskcHYTlMFVE+fearNk0hW
 vQxVCdFe8sEpRil/OumAUW7iGE2ppzTEuMeZN0E4IgQhjhVnRDBwmJj6T/VBj9/SyxH4wiOgs
 SEqw3MLEumqNfma54Iqshq6IFzxZ0SpEfeRDCy9Ta7KJkHrms/B2R5OI4H/GELHld/TZtJRX6
 DVm2atnGJZdVl0SPYaAw5TYoNSg7GzvQ50zoodm5huj6uS3YScP0jKvvj5niqzDZS8tfq+jhZ
 hH/ZujwnNtXGN2O/BDYVfUQScb54JE/R/42jNFPARl5uvisubjCXVZhNCd9ESFqPvI1l2ogRF
 cEq5qyo/tooHbE+7BnffQagUDrlqGgtJZJG/Hg/YfrRdKk/kRk1nnEnQUKkQYiJFy62PtcLcR
 kBIcg8lS2LjYx0dHDb8MfEPeee2tDNq07wVUJbxQkUOacA7cP+op1GaOlgetY/G9z/qNhv8r8
 UkUNGQq2nQ/LW/P8Td20NKyqIllwtqdg+JbBmkLQXu4ZIiVfsTBTwfohUMp457vg26SoKf+HR
 UvJo0SFIu0WST09+u6aDWAbB0EdwJT9IV/jukqbPaqZUe4vCIVHl4+w4h/L06QRYjm00DzIq0
 Kf8PREOGJyKyTeiUqfZhvLmwKJoxb9bIqV2kLzMI0l0LsqLdOzoNOrfq2jWd+tyeitIeC+ND+
 VMKJgSJUcR3QYU2fJxfZgZTgrR0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679259147; i=ps.report@gmx.net;
 bh=I0svwT80Pb7Y4yNEVuOMaH7AiGFRoNnlUpSLY+tJMJ0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bNbkvWFhyoKGfVboABExEAXm44+hEAq4p0eQFxmCOf5/oYAhNpG7+ix9Ka5VnxXd9
 tRAU5ELSnrLuYg5u4vwVlblwgYd+kYCJxQmJw8WUKVNh5X2Bi6H4OXmWa60CcdT7Aj
 YdTixSnkCIXiWfZrmZ4No0AjsbsmdIxV5utWGKtfi69oH3REqWuCE3Q0lbXGa1nk6K
 W7EigPu88qLaMCob92WnVCB9drzm9+McQNGyAbka7grvtXKRAoQ/nCZZPGF2J0JTmR
 S3ez8dKWRmHFl8fKk0infHem7cDhS6ZMfpf38Dbjr7RqAmdWKxHQTzNOGi6libAwb6
 RUCpIlRiRDl4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=bNbkvWFh
Subject: Re: [Buildroot] [PATCH v2] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Sun, 19 Mar 2023 21:17:01 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's also switch to a _SITE that can be accessed from a web browser and
> results to be the official one for mmc-utils.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * switch _SITE to a browsable one suggested by Peter Seiderer
> ---
>  package/mmc-utils/mmc-utils.hash | 4 ++--
>  package/mmc-utils/mmc-utils.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
> index 1256f63487..22d34c3d40 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
> -sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
> +sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
> +sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index 435e6ae7f1..44abf00dbc 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
> -MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
> +MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>  MMC_UTILS_SITE_METHOD = git
>  MMC_UTILS_LICENSE = GPL-2.0
>  MMC_UTILS_LICENSE_FILES = mmc.h

Thanks for patch update, updating the project URL from package/mmc-utils/Config.in
would be nice too ;-)

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
