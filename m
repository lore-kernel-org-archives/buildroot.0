Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F88DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1159460DC6;
	Sun, 26 Dec 2021 15:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWo-hjGn9-Qo; Sun, 26 Dec 2021 15:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8881960D80;
	Sun, 26 Dec 2021 15:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF5B1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DCC140966
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1fDpnADxvY3 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:01:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F4F0408FD
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:01:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 245DE200005;
 Sun, 26 Dec 2021 15:01:03 +0000 (UTC)
Date: Sun, 26 Dec 2021 16:01:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211226160103.0dcef6c8@windsurf>
In-Reply-To: <20211226145218.672996-1-fontaine.fabrice@gmail.com>
References: <20211226145218.672996-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fakeroot: bump to version 1.26
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

On Sun, 26 Dec 2021 15:52:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (not needed anymore)
> - Drop second to fifth patches (already in version)
> - Drop autoreconf
> 
> https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.26-1/debian/changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fakeroot/0001-skip-doc-subdirs.patch  | 14 ----
>  ...fine-_STAT_VER-if-not-already-define.patch | 45 -----------
>  ...d-wrappers-for-new-glibc-2.33-symbol.patch | 80 -------------------
>  ....ac-fix-__xmknod-at-pointer-argument.patch | 66 ---------------
>  .../0005-fix-build-regression-on-macOS.patch  | 63 ---------------
>  package/fakeroot/fakeroot.hash                |  4 +-
>  package/fakeroot/fakeroot.mk                  |  6 +-
>  7 files changed, 4 insertions(+), 274 deletions(-)
>  delete mode 100644 package/fakeroot/0001-skip-doc-subdirs.patch
>  delete mode 100644 package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
>  delete mode 100644 package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
>  delete mode 100644 package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch
>  delete mode 100644 package/fakeroot/0005-fix-build-regression-on-macOS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
