Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9CA82BED;
	Fri, 17 Dec 2021 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNQF6f-7Kjoz; Fri, 17 Dec 2021 22:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6360F82AF8;
	Fri, 17 Dec 2021 22:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAC681BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99FD361162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9cylmT22O0o for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EDEC60F2B
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:06:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E03DE200002;
 Fri, 17 Dec 2021 22:06:15 +0000 (UTC)
Date: Fri, 17 Dec 2021 23:06:15 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211217230615.393532e0@windsurf>
In-Reply-To: <20211125072522.4179056-1-fontaine.fabrice@gmail.com>
References: <20211125072522.4179056-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/jitterentropy-library:
 bump to version 3.3.1
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Nov 2021 08:25:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball
> - Drop patches (already in version)
> - license files renamed with
>   https://github.com/smuellerDD/jitterentropy-library/commit/a08ae564c422b54ad3332d38be033933ade4df6d
> - Update indentation in hash file (two spaces)
> 
> https://github.com/smuellerDD/jitterentropy-library/blob/v3.3.1/CHANGES.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Makefile-cleanup-install.patch       | 54 ------------------
>  ...efile-add-additional-install-targets.patch | 56 -------------------
>  ...-the-user-to-disable-stack-protector.patch | 36 ------------
>  .../jitterentropy-library.hash                |  8 +--
>  .../jitterentropy-library.mk                  |  8 ++-
>  5 files changed, 9 insertions(+), 153 deletions(-)
>  delete mode 100644 package/jitterentropy-library/0001-Makefile-cleanup-install.patch
>  delete mode 100644 package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
>  delete mode 100644 package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch

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
