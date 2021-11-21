Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C987C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D37B240239;
	Sun, 21 Nov 2021 13:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaMS7kitvAOl; Sun, 21 Nov 2021 13:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0241E400C8;
	Sun, 21 Nov 2021 13:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59F501BF95F
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49FA4607AE
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuxoS8XG_ZwL for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD71605D4
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:54:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D68CC100003;
 Sun, 21 Nov 2021 13:53:57 +0000 (UTC)
Date: Sun, 21 Nov 2021 14:53:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211121145354.70648629@windsurf>
In-Reply-To: <20211120110206.2883506-1-fontaine.fabrice@gmail.com>
References: <20211120110206.2883506-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/assimp: bump to version
 5.1.0
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Nov 2021 12:02:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - Update hash of license file, date updated with
>   https://github.com/assimp/assimp/commit/4e7e47bd436f4a97775be22dcdb8e99f5c158606
>   https://github.com/assimp/assimp/commit/7d68eab4a7183d701782a3e86e54be2938440918
> 
> https://github.com/assimp/assimp/releases/tag/v5.1.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...Converter-use-proper-64-bit-constant.patch |   37 -
>  ...p-to-fix-gcc-build-for-v9-2-0-32-bit.patch | 1638 -----------------
>  ...oses-2954-upgrade-to-latest-greatest.patch |  243 ---
>  package/assimp/assimp.hash                    |    4 +-
>  package/assimp/assimp.mk                      |    2 +-
>  5 files changed, 3 insertions(+), 1921 deletions(-)
>  delete mode 100644 package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
>  delete mode 100644 package/assimp/0002-closes-2733-update-of-zlip-to-fix-gcc-build-for-v9-2-0-32-bit.patch
>  delete mode 100644 package/assimp/0003-closes-2954-upgrade-to-latest-greatest.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
