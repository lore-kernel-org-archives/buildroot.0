Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DF0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8C9A40590;
	Wed,  2 Feb 2022 20:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBuks4b4MvcD; Wed,  2 Feb 2022 20:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC5E1405AE;
	Wed,  2 Feb 2022 20:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93FA21BF346
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 820E782F84
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 20:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe9s5u1xRL38 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 20:37:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 148BE82CEC
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643834267;
 bh=hD3EoeBhtxuAjOb2WfrUM9jK5Qnvq9HUo3+jAGqngrM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IFCpJMojy8PiBD/LBlm1v85Ik8O7oWROK6EMrJ2oTPsQolmnVcOiP0HdMpmtoYMNl
 5H/9GGP2AhJD2XyIEKlo/YqFE5wfxQxgCc3n5NOIxKbTxoNkLw9OYTjy+zNk3AjKvv
 lakQTqnu+q3ir9mTA8BG1d/6q4h6E3250UocrzcE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1moJ5d1UKQ-00R4ik; Wed, 02
 Feb 2022 21:37:47 +0100
Date: Wed, 2 Feb 2022 21:37:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220202213746.779fee61@gmx.net>
In-Reply-To: <df787435-b1b1-30aa-dc11-3fff9787c86d@mind.be>
References: <20220125221533.17535-1-ps.report@gmx.net>
 <df787435-b1b1-30aa-dc11-3fff9787c86d@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:wl/vn76GZJ7TPjb+nvT5GFRca2TMOIeeAdoIZv30+4IVAj8gCTE
 HT1Njn6BKgLhOBhruye92zQFbhJXlsftRTNFW1NRQ5HDLzaV3VgIuJlIA0sXWxoMCSkLD4x
 RVGR+h1AfaT7KAzyF0TNH7q6vmBp6RoSZWq1ufpVzNA2LKcCveE8ME8VFH/Snpm2KdZEvD8
 rW382iUJ/mmwvXrCASY7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hBg+jxpGRxM=:7I9tzd0nk41ueC29nrsDGe
 syt24YKEZeOVFoWbgmYzeLJ2vO76q1Lv6Z0uOGMmU13gt/o5eO5s+X2dwOBJyXZSlG37mjWY1
 SKjfSQWdBk7FbZfw3s+TB2BCM9RDYBAqJRj3Gz0/dAslU4K2NV1uQQuo6C4cS81/J7hauOmfV
 UgERxklzO0pVLvGQ/w5qZUWkj/sPHih1Vc5XOvyXZ8+EDhFKg7zQlwStjabXIKEs27AfLAGbu
 6/iORSvzNmmUvWe1gRrJilaAjyjfQQarpnYTea/OSGsI2tF4NEf0GfeQSUPwoeIR/IEa7su3U
 DC7tsVTs12lfZy8RCxomu10Kute4I2MJmCDGHTYtr6sn+1Afnw7yeZkIOFYMljMaaT6Cb0QPi
 FBC4I+YBc2F//ZZiJoz9CfUxWbKYG4bbQsQWG0bSRk9s6NuxQqvjOA5TmUb7zuvn+F/AJ6BoI
 /Wvl4UEb2oMjGd2Zl7feioLAvs2oRarr4eLuKKctVsJnklPCzkOSOnkCSXVQqmiAbl/1L8tIf
 Hizl0eaT8Iw6GT4TSEzbSt98zR3b5tWOg5djBDgkjzId0nEx0SW9QiUtsWABoEzbxNZRhXEsL
 1SiMxCL4wN+nDwc9gjgldlBs3QDjEPTNjIBBJULdu9Z2QWYjCp4CqdrkgcKEJbCqnhs2O8x7e
 lc39cIq4s+WAOYXhlL7cmHeBlufwaZ7UZdzwWE2OKpgCUwKszDhND9sU45EmnStBu9Mb938mE
 swJlSwQIn5UqKIRBXau+teqKSp3h75URn88zbLEV0tRXbScvnsSWeg8tJZUnCtmC3svb8cwHL
 qhRKNMK2UQWdhaYClhyxfk8x531pAd3PfquADL05ZBzWYI6H/tx3gvYnwYKOcX4RpNqMUfIT/
 3C99PBp+2oX/j7jQ/SO33JOAzvpT6nVwECIJm+RI6bmgXTZ8B0cY3vNyYbjA8KlhFcRNoByPp
 dj6bnVCnkAA+VSai47gWvAbF4klbCQROXjAN9cbi6oWdwyidKmXtvDKR8BSbq0VDYiSOZUEdX
 NsRuLUwtagtQVmDYNpTmIb23flbCCTqiiheuFcGqnO/HYLxBZVFVPzrElDnKM+wlDqtIs5zv5
 XSxfEt/jvJIdk8=
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump version to
 2.37.3 (fixes CVE-2021-3996, CVE-2021-3995)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Tue, 1 Feb 2022 23:00:06 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 25/01/2022 23:15, Peter Seiderer wrote:
> > - add 'touch' workaround for missing disk-utils/raw.8 file ([1], [2]) in
> >    util-linux-2.37.4 release download package
>
> 2.37.3 I assume.

Yes...

>
> >
> > For details see [1].
> >
> > [1] https://www.spinics.net/lists/util-linux-ng/msg17037.html

This reference should be [3] and the links for [1] and [2] are missing:

[1] https://github.com/util-linux/util-linux/issues/1579
[2] https://github.com/util-linux/util-linux/issues/1577

> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> > Changes v1 -> v2:
> >    - add workaround for missing disk-utils/raw.8 file
> > ---
> >   package/util-linux/util-linux.hash | 2 +-
> >   package/util-linux/util-linux.mk   | 9 ++++++++-
> >   2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> > index eafbe9254a..9c10a42dca 100644
> > --- a/package/util-linux/util-linux.hash
> > +++ b/package/util-linux/util-linux.hash
> > @@ -1,5 +1,5 @@
> >   # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
> > -sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
> > +sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
> >   # License files, locally calculated
> >   sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
> >   sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
> > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> > index cf0fee409b..baf9ed3406 100644
> > --- a/package/util-linux/util-linux.mk
> > +++ b/package/util-linux/util-linux.mk
> > @@ -8,7 +8,7 @@
> >   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
> >
> >   UTIL_LINUX_VERSION_MAJOR = 2.37
> > -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
> > +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
> >   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
> >   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
> >
> > @@ -267,6 +267,13 @@ else
> >   UTIL_LINUX_CONF_OPTS += --without-libmagic
> >   endif
> >
> > +# workaround missing disk-utils/raw.8 file in util-linux-2.37.4
>
>   2.37.3 as well.

Yes...
>
>   I moved this hunk to the beginning of the file, to increase the chance that it
> is noticed on next bump (which hopefully makes it unneeded).
>
> > +# release download package
> > +define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> > +	touch $(@D)/disk-utils/raw.8
> > +endef
> > +UTIL_LINUX_PRE_BUILD_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>
>   I moved this to a post-patch instead of pre-build hook.
>
>
>   Applied to master, thanks.

Thanks for cleaning up my mess...

Regards,
Peter

>
>   Regards,
>   Arnout
>
> > +
> >   # Install PAM configuration files
> >   ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
> >   define UTIL_LINUX_INSTALL_PAMFILES
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
