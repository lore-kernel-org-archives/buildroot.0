Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65240C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A41381F87;
	Thu,  3 Nov 2022 22:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A41381F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-t6beTHYyxx; Thu,  3 Nov 2022 22:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282DF81F77;
	Thu,  3 Nov 2022 22:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 282DF81F77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9E261BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9139840BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9139840BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTUSVln5pTFx for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:10:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03BBB40519
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03BBB40519
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:10:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2645BC0009;
 Thu,  3 Nov 2022 22:10:22 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:10:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103231020.5f0705b2@windsurf>
In-Reply-To: <20221025135813.2387865-1-james.hilliard1@gmail.com>
References: <20221025135813.2387865-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqVQEM16UreqdM4wukVTLOAAt869M/Reep8ACpl5HGk=;
 b=fCS5Qqza8zcxzxPc5H6k8NLDXOigP9yUQ9+slxxslNN0yIzUM5/jrpVxW/Nvxr7NfVZAi2
 ucBs8RRmUkAAWUEjMhRfwy0mqYHvWvsjScnOkeXyMy+yBX1aC35+BGH6eOnDs/FnDgTjct
 1HAHSQ6E/fUIryRODvQBGsKxLaweEyDWsWfJzKu5QD72lcXphW3y31f8kkd9k3PWOaIMTk
 9NKfBCgyNArdvjGGxOzAHDyKxesexhI7HBv667e5NzWcc7WT/kUzvHL8VBR07wuLSCCS5C
 T58QR7Z7lAKKA8LNMHd5WLInlMRLy8ni5iy8DJ5+DepDIhtDdC8RpK2KHG5Spg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fCS5Qqza
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.11.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 07:58:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-pkgconf host python3 dependency.
> 
> Set new --with-build-python conf options for target python build.
> 
> Drop Fix cross compiling the uuid module patch which is no longer
> required as pkgconfig is now used for include directory detection.
> 
> Refresh patches.
> 
> License hash changed due to year update:
> https://github.com/python/cpython/commit/ba00f0d93a4aea85ae8089f139856a7c450584d7
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch | 14 +++---
>  ...taddrinfo-configure-test-when-cross-.patch | 20 ++++----
>  ...re-to-disable-the-build-of-certain-e.patch | 32 ++++++------
>  ...y-header-paths-for-cross-compilation.patch | 12 ++---
>  ...ook-in-usr-lib-termcap-for-libraries.patch | 10 ++--
>  .../0006-Don-t-add-multiarch-paths.patch      |  8 +--
>  .../0007-Abort-on-failed-module-build.patch   |  8 +--
>  .../0008-Serial-ioctl-workaround.patch        |  6 +--
>  ...e-shebang-of-Python-scripts-for-cros.patch |  6 +--
>  ...ig.sh.in-ensure-sed-invocations-only.patch |  4 +-
>  .../0011-Add-an-option-to-disable-pydoc.patch | 32 ++++++------
>  ...012-Add-an-option-to-disable-lib2to3.patch | 43 ++++++++--------
>  ...option-to-disable-the-sqlite3-module.patch | 37 ++++++--------
>  ...d-an-option-to-disable-the-tk-module.patch | 24 ++++-----
>  ...-option-to-disable-the-curses-module.patch | 18 +++----
>  .../0016-Add-an-option-to-disable-expat.patch | 49 +++++++------------
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  8 +--
>  .../0018-Add-an-option-to-disable-NIS.patch   |  8 +--
>  ...Add-an-option-to-disable-unicodedata.patch |  8 +--
>  .../0020-Add-an-option-to-disable-IDLE.patch  | 26 +++++-----
>  ...021-Add-an-option-to-disable-decimal.patch | 36 +++++---------
>  ...on-to-disable-the-ossaudiodev-module.patch | 14 +++---
>  ...an-option-to-disable-openssl-support.patch |  8 +--
>  ...ption-to-disable-the-readline-module.patch |  8 +--
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |  8 +--
>  ...thon-config.sh-don-t-reassign-prefix.patch |  6 +--
>  ...dd-an-option-to-disable-uuid-module.patch} |  8 +--
>  ...-Fix-cross-compiling-the-uuid-module.patch | 43 ----------------
>  ...-fix-building-on-older-distributions.patch | 47 ++++++++++++++++++
>  ...p-CC-print-multiarch-output-for-mus.patch} |  8 +--
>  ...-fix-building-on-older-distributions.patch | 38 --------------
>  ...on-to-disable-the-berkeleydb-module.patch} |  8 +--
>  ...ng-doesn-t-set-errno-when-encryptio.patch} |  8 +--
>  package/python3/python3.hash                  |  4 +-
>  package/python3/python3.mk                    | 12 +++--
>  35 files changed, 285 insertions(+), 344 deletions(-)
>  rename package/python3/{0028-Add-an-option-to-disable-uuid-module.patch => 0027-Add-an-option-to-disable-uuid-module.patch} (81%)
>  delete mode 100644 package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
>  create mode 100644 package/python3/0028-fix-building-on-older-distributions.patch
>  rename package/python3/{0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (91%)
>  delete mode 100644 package/python3/0029-fix-building-on-older-distributions.patch
>  rename package/python3/{0031-Add-an-option-to-disable-the-berkeleydb-module.patch => 0030-Add-an-option-to-disable-the-berkeleydb-module.patch} (80%)
>  rename package/python3/{0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (89%)

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
