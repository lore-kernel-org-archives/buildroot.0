Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BAFC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA8861122;
	Tue,  6 Feb 2024 14:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA8861122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTyn0ZDh4uDo; Tue,  6 Feb 2024 14:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C01CB60B99;
	Tue,  6 Feb 2024 14:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C01CB60B99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA7DC1BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4AB40B5B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F4AB40B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTz1mhfbQO8b for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:06:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50CDB404D8
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50CDB404D8
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1B8E513F8B5;
 Tue,  6 Feb 2024 15:06:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 15:06:16 +0100
Date: Tue, 6 Feb 2024 15:06:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Naumann <dev@andin.de>
Message-ID: <ZcI82NsG6QZj0L6_@landeda>
References: <20240114174823.2732695-1-bernd@kuhls.net>
 <20240114174823.2732695-2-bernd@kuhls.net>
 <d3a04074-1f6f-4e45-944d-006ec26ab9f3@andin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3a04074-1f6f-4e45-944d-006ec26ab9f3@andin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707228380;
 bh=gas2xO612vI+IfOSIS10zQnYaP0Y0tf3+gCz25TBCwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxLezOA8kLkyxMp+RXJHXIn9bpwi23dfdj2WqZPNB2v292aIpOeZvBQMipbwVuMHj
 qJ6eDGtAPfxmZpZPYXjTd9J2ogwnClnay0R7s7h3oyrvnFzGkEmXDeWEjlm/TMA/eV
 2xLBkTuvRL7qZU6KIVkoUet9d+9KjvRoKe+xApSaSKhpzDYv1Yf7gFrQhcFzPe6yH2
 OpHhmejRtXAMf/9ASjOeEGdub1qY0PF3LTlid0SDMCoR0Hi+jsOW09CsCL+RNsqS5Z
 hEtcOqvXuCWC3UlONMuZ6zIoneg04LRYsz3EUpYfhXJgpGMmnvN/njZvEZ1CPOOMlq
 ZwU5E2NWANQQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QxLezOA8
Subject: Re: [Buildroot] [PATCH 2/2] package/glm: bump version
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, Bernd, All,

On 2024-02-06 14:58 +0100, Andreas Naumann spake thusly:
> Am 14.01.24 um 18:48 schrieb Bernd Kuhls:
> > Fixes build error with packages depending on glm, like kodi-screensaver*
> > and kodi-visualisation*:
> > 
> > CMake Error at /home/buildroot/br2/output/per-package/kodi-screensaver-asteroids/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
> >    Could NOT find glm (missing: GLM_INCLUDE_DIR)
> > 
> > Since glm release 0.9.9.8 (bumped in buildroot with commit
> > 01ad11343172ea698e4dcc1c64cb02ce26671e49) many fixes were added for its
> > cmake support: https://github.com/g-truc/glm/pull/1054
> > 
> > Instead of backporting all of them we bump to latest git HEAD.
> > Preparations for glm 1.0.0 are underway:
> > https://github.com/g-truc/glm/pull/1180
> 
> I just now find this patch, after having sent one bumping glm to tag 1.0.0
> (which is only about 2 weeks old). However, since it's a tag, I suggest my
> patch supersedes this one.

Ah, I see you evnetually spotted this patch too! ;-)

I indeed applied your patch, but as I said, I also grabbed the kodi
failures Bernd noticed.

Regards,
Yann E. MORIN.

> regards,
> Andreas
> 
> > 
> > Fixes build error with this defconfig:
> > 
> > BR2_x86_64=y
> > BR2_x86_x86_64_v4=y
> > BR2_BINUTILS_VERSION_2_41_X=y
> > BR2_GCC_VERSION_13_X=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_PER_PACKAGE_DIRECTORIES=y
> > BR2_INIT_NONE=y
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_PACKAGE_KODI=y
> > BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
> > BR2_PACKAGE_MESA3D=y
> > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> > BR2_PACKAGE_MESA3D_OPENGL_ES=y
> > BR2_PACKAGE_PYTHON3=y
> > BR2_PACKAGE_PYTHON3_PY_ONLY=y
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > ---
> >   package/glm/glm.hash | 2 +-
> >   package/glm/glm.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/glm/glm.hash b/package/glm/glm.hash
> > index c4e2101604..6bc88739b3 100644
> > --- a/package/glm/glm.hash
> > +++ b/package/glm/glm.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> > -sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
> > +sha256  9dc8c27c2b00d44a0b9d4a619b13848f1092914e7ec60447ac3db528a8e9ba8a  glm-b06b775c1c80af51a1183c0e167f9de3b2351a79.tar.gz
> >   sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
> > diff --git a/package/glm/glm.mk b/package/glm/glm.mk
> > index ef549931f6..92357b4fe2 100644
> > --- a/package/glm/glm.mk
> > +++ b/package/glm/glm.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> > -GLM_VERSION = 0.9.9.8
> > +GLM_VERSION = b06b775c1c80af51a1183c0e167f9de3b2351a79
> >   GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
> >   GLM_LICENSE = MIT
> >   GLM_LICENSE_FILES = copying.txt
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
