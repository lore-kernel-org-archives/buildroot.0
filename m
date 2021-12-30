Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36272C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0E2409BB;
	Thu, 30 Dec 2021 22:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8pIhz0fDeJY; Thu, 30 Dec 2021 22:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53A4409AB;
	Thu, 30 Dec 2021 22:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89C3D1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78406812ED
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiFPfB7whtku for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE1D3812EA
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:02:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D8817240002;
 Thu, 30 Dec 2021 22:02:19 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:02:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230230219.1288bb21@windsurf>
In-Reply-To: <20211230204103.282138-2-aduskett@gmail.com>
References: <20211230204103.282138-1-aduskett@gmail.com>
 <20211230204103.282138-2-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] package/python3: bump to version
 3.10.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 12:41:02 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> - Remove 0013-Add-an-option-to-disable-installation-of-test-module.patch as
>   it is now upstreamed.
> 
> - Refactor and rename all other patches as necessary.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch |  14 +--
>  ...taddrinfo-configure-test-when-cross-.patch |   8 +-
>  ...re-to-disable-the-build-of-certain-e.patch |  26 ++--
>  ...y-header-paths-for-cross-compilation.patch |  54 ++++----
>  ...ook-in-usr-lib-termcap-for-libraries.patch |   8 +-
>  .../0006-Don-t-add-multiarch-paths.patch      |   8 +-
>  .../0007-Abort-on-failed-module-build.patch   |   8 +-
>  .../0008-Serial-ioctl-workaround.patch        |   4 +-
>  ...e-shebang-of-Python-scripts-for-cros.patch |   4 +-
>  ...ig.sh.in-ensure-sed-invocations-only.patch |   4 +-
>  ...locale-and-set-to-default-when-addin.patch |  12 +-
>  ...Add-importlib-fix-for-PEP-3147-issue.patch |  12 +-
>  ...-disable-installation-of-test-module.patch | 117 ------------------
>  ...0013-Add-an-option-to-disable-pydoc.patch} |  51 ++++----
>  ...14-Add-an-option-to-disable-lib2to3.patch} |  85 +++++++------
>  ...ption-to-disable-the-sqlite3-module.patch} |  48 +++----
>  ...d-an-option-to-disable-the-tk-module.patch |  74 +++++++++++
>  ...option-to-disable-the-curses-module.patch} |  39 +++---
>  ...d-an-option-to-disable-the-tk-module.patch |  73 -----------
>  ...0018-Add-an-option-to-disable-expat.patch} |  45 +++----
>  ...Add-an-option-to-disable-CJK-codecs.patch} |   8 +-
>  ...> 0020-Add-an-option-to-disable-NIS.patch} |   8 +-  
>  ...dd-an-option-to-disable-unicodedata.patch} |   8 +-
>  ... 0022-Add-an-option-to-disable-IDLE.patch} |  53 ++++----
>  ...23-Add-an-option-to-disable-decimal.patch} |  14 +--
>  ...n-to-disable-the-ossaudiodev-module.patch} |   8 +-
>  ...n-option-to-disable-openssl-support.patch} |   8 +-
>  ...tion-to-disable-the-readline-module.patch} |   8 +-
>  ...o-disable-zlib-bzip2-and-xz-modules.patch} |   8 +-
>  ...hon-config.sh-don-t-reassign-prefix.patch} |   6 +-
>  ...-Fix-cross-compiling-the-uuid-module.patch |  43 +++++++
>  ...Add-an-option-to-disable-uuid-module.patch |   8 +-
>  ...-fix-building-on-older-distributions.patch |   4 +-
>  ...up-CC-print-multiarch-output-for-mus.patch |   9 +-
>  ...ion-to-disable-the-berkeleydb-module.patch |   8 +-
>  ...-ng-doesn-t-set-errno-when-encryptio.patch |   4 +-
>  ...teration-error-in-_ExecutorManagerTh.patch |  29 -----
>  package/python3/python3.hash                  |   8 +-
>  package/python3/python3.mk                    |   4 +-
>  39 files changed, 425 insertions(+), 515 deletions(-)
>  delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
>  rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (72%)
>  rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (65%)
>  rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (60%)
>  create mode 100644 package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
>  rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (60%)
>  delete mode 100644 package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
>  rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (74%)
>  rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (82%)
>  rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (84%)
>  rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (83%)
>  rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (67%)
>  rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (89%)
>  rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (85%)
>  rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (83%)
>  rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (82%)
>  rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (87%)
>  rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (94%)
>  create mode 100644 package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
>  delete mode 100644 package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch

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
