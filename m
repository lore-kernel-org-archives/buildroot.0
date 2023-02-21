Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D57C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D468781FC8;
	Tue, 21 Feb 2023 08:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D468781FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cD9luQkqGqCs; Tue, 21 Feb 2023 08:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBEF81FC9;
	Tue, 21 Feb 2023 08:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBEF81FC9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10771BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8367A417CB
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8367A417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_TYIr2ZLYJC for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC707417B5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC707417B5
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:43:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68FA2E0014;
 Tue, 21 Feb 2023 08:43:30 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:43:29 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230221094329.79cf0b8e@windsurf>
In-Reply-To: <29cebb7af48c3652e440c61cc90fafa4fe3f8046.1676300324.git.stefan@agner.ch>
References: <29cebb7af48c3652e440c61cc90fafa4fe3f8046.1676300324.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676969010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8siuxm8Sig5cB0F1P0T+tb6C6HFBpkShpRMP4KJDyQ=;
 b=OL+aZRJT83UvteTU6q8p0D3sqSAdUmHsVWgXF6bYomdnGdy97chqHEci6sDTyY1yzZsn8G
 syoNu85mIx6tmMNpGF1lAZtSdf+zTP7moltqDM5Fw/y/Y/R3E9JXf4jc+DPbdux5tGxOY2
 Zt5jsLtr5eAzIAM/RXE9oMF2YmAkasoe3W7niRmxczy7zodVOuk4jGDyOzcDGrmzistqNJ
 0lsQU30h4y3X77MAm15U28kYtfaaaSK++JxLucHmPd/EDPk0XDStua38nFPyEdawtHL+MK
 YRpPidRjXbnX9DIgzYs73nFB7k1iboALZVSe7s8ir7Te+ux4pvNJVYcxLCPFBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OL+aZRJT
Subject: Re: [Buildroot] [PATCH v2] package/dbus-broker: bump to release 33
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Mon, 13 Feb 2023 15:58:57 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This release contains mostly a bugfixes, with some improvements around
> error handling for unimplemented functionality and resiliency against
> runtime changes of dbus service-files.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Thanks a lot for the update. However see below for a comment.

> ---
>  package/dbus-broker/dbus-broker.hash | 6 +++---
>  package/dbus-broker/dbus-broker.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
> index f6c2cbe160..06c8f229b7 100644
> --- a/package/dbus-broker/dbus-broker.hash
> +++ b/package/dbus-broker/dbus-broker.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
> +sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
>  sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
>  sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
>  sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
> @@ -11,7 +11,7 @@ sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subpro
>  sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
>  sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
>  sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
> -sha256  32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5  subprojects/libcstdaux-1/AUTHORS
> -sha256  7c4b6c325b0bc02150089112f65132ee999b0f44500b73d1fc06d96c93161037  subprojects/libcstdaux-1/README.md
> +sha256  e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177  subprojects/libcstdaux-1/AUTHORS
> +sha256  92006886d7f28894fef08bf97e35ef52147067bd3c4d4d6381da7c59f9901dae  subprojects/libcstdaux-1/README.md

When there are changes in the license files, we need to have a short
explanation in the commit log about these. Indeed, if we simply
"blindly" update the hashes, then having those hashes in the first
place is completely useless: the whole point of having hashes for
license files is to detect changes in the license files, analyze them
and justify if they require or not a change in how the licensing of the
package is described in Buildroot.

Could you resend with an updated commit message that explain the
changes in the license files? Even if they are minimal/trivial, having
this explanation in the commit log will help the reviewers/maintainers
to make sure the changes in those license files have been verified.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
