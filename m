Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F85C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C397960A8C;
	Wed,  9 Feb 2022 16:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEDSRSF6VZHX; Wed,  9 Feb 2022 16:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E6960A6F;
	Wed,  9 Feb 2022 16:21:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5721BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687FD40146
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2UQnRLSJKmU for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD928400D0
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644423693;
 bh=yRDLjVAuE/3i7BAPLUO7HPchsv8u98WaZEv1MctFYpw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aoIHmSR3+PuPSqSOK+aZtQLKKn+lwg+GC8CcIm36Jinuo/EWCfh02KEOQOIwME3B7
 Q12amToXvHOUDsWy1P2NVmo8uwglZjfm1tN4N8s8zq8owV9a3LRb7jVYUaeGroq/oL
 vcwHpWEdAcCQkZyTNDHaNAUELFXt6eJPme4sP6vM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.59]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1ny3Qg43iA-00heab; Wed, 09
 Feb 2022 17:21:33 +0100
Date: Wed, 9 Feb 2022 17:21:31 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220209172131.0f03e25f@gmx.net>
In-Reply-To: <875ypod24w.fsf@tarshish>
References: <20220208212405.19243-1-ps.report@gmx.net>
 <20220208212405.19243-5-ps.report@gmx.net>
 <875ypod24w.fsf@tarshish>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Sj42gBvbJs0BuKNW1kiB1IEl50/BfewKmQ7sWriCba4ghL0OPed
 B3ukGjNeT7eAnwHHqZyuGZBA8kYo4ZUSEeARDgHnNaMz5o9b0yf5gQnBqGEvEgVjF4jgUfb
 gUasdoSEVngNSX20k769JfdSUCeG0Jp8cWcTcJv7q5ztkPeHwv0AklQs6sv1ZJA0eUkJVuG
 VPPLvE9CVU20xd/+tgUYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:snf2m0N64D8=:c7Ra1/GLZvD1JH9hQTt0m1
 gxq7aThzE/Ic1XXywwqCQZaqlYaZjTidyRfhPaPc4X8fZqUPwExiqc9UNQjBwd1rorAnjTMID
 B0hI5zhx0ynTdJlSGVkRsmurEfW9AD20g6M4rzYRcUtpFVAgdbnUSRU+mSUhQqw2onWvkuU/R
 eRrFCctPRZ5J/IKPggNRLw1mQ0ywa9dskCbMpQPNtKhWcEEMy6Q3z5GxORIvmxDUj8SAQElXj
 VrJdaNMZTwWEgc5S18//qTufu6d7Bwk01IdlC7yIus5bpvfXhrHKysJqar2lfH/UH4biZprIi
 j2iJprVMOYrSq+2+0x7jolTOcxvBQaDO4gTbHJqmkO/6H4BgHo1hZi6anocFlpUvkd6uF60e5
 LxvHkJUBCaDBkjiJpMM1xfYZFNSJ5EitDDUZ6Ua7++hAJHLOE22m2sHFacpsFvHrBJJpEGQux
 kf2Cd2E2HRUWQ15KDQeAdlFpxdwgOdv/elZa81gN2G/ZoGaEyUe5ywIodEmGc9RtTnRgN5VKd
 FIUQz5Ow2shJaVTmtonp+uAYhIUmgQeuYqEaQX/ekvEz71BKJ5dQQ76biKs0E2yn2UHvq2GAh
 j0jXgbBI2iLhtFy+vP+NMmd6GNWNVdaifd8Am+UjWigKWGI9aFKTWCFJUp3iAaYiNYbdGLuDB
 MWLwodaUlehQH2e9slpwsVQat3VgMS+6adu65i2dsot/0r0cagwx8Oep3H4TPZkzLlLFjota8
 sa4nwen0i+gP+QeC8S3az55stGEjzGc7lNdc82Iscso1Kw79P+ES03WTE/M1Ck+pucNuoI7+G
 Aa/+0DnhR/o5bC6COsFYT+W6OsKD6DrGqL81FpP3hyL/fWtz8pTDoVHophyM6EWgNOrBGPBSg
 XXNJeYwlQiS6AUifXTEhIr9o3Ct6eOkJ03KgoFxCEl3Dx3mPc+OO96f3YYsQeOBc/AAreXaZ8
 06RNb3Gj/FFcTU2Mec8SD4JG0/klqOSMUU1sRKHSz5+1zQ8ozzxt5OkWoUhalvotbQJvZgmyE
 LSAPWeiHcjENm4VLmKSD8E0+eF4t07heSZ7ggciC+013jD2iAoiccFcpNKJYUZLTI+szDD0B0
 dDHfJeUp8cKek0=
Subject: Re: [Buildroot] [PATCH v1 04/13] package/gst1-plugins-bad: bump
 version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch,

On Wed, 09 Feb 2022 07:43:33 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
>
> On Tue, Feb 08 2022, Peter Seiderer wrote:
> > - removed 0001-neon-Allow-building-against-neon-0-32-x.patch
> >   (from upstream [1])
> >
> > - add codecalpha option (VP8/VP9 alpha support)
> >
> > - add qroverlay option (overlay data on top of video in the form of a QR code)
> >   with json-glib and libqrencode dependencies (omit json-glib explicit
> >   dependencies as they are the same as for gstreamer1, glib2 BR2_USE_WCHAR,
> >   BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_MMU), place instead to 'plugins without
> >   external deps' section into 'plugins that need external deps' section as it
> >   clearly has dependencies (prelimary to upstream commit [2])
> >
> > - add aes option (AES encryption/decryption plugin)
> >
> > - disable new option asio (Steinberg Audio Streaming, windows only)
> >
> > - disable new option gs (Google Cloud Storage, needs storage_client library)
> >
> > - disable new option ldac (LDAC bluetooth audio codec, needs ldacBT-enc library)
> >
> > - remove legacy option ofa (disabled)
> >
> > - disable new option onnx (ONNX neural network, needs libonnxruntime library)
> >
> > - disable new option isac (iSAC plugin, needs webrtc-audio-coding-1 library)
> >
> > - removed libmms ('Microsoft Multi Media Server streaming protocol' option,
> >   add Config.in.legacy entry
> >
> > - enable new gpl option ('Allow build plugins that have (A)GPL-licensed
> >   dependencies') in case gpl plugin enabled
> >
> > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0.patch
> > [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5d70c168b356691073a0d22f7ce3ea7efb20641c.patch
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  Config.in.legacy                              | 22 ++++++++----
> >  ...n-Allow-building-against-neon-0-32-x.patch | 29 ---------------
> >  package/gstreamer1/gst1-plugins-bad/Config.in | 31 ++++++++++------
> >  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +--
> >  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 36 ++++++++++++++-----
> >  5 files changed, 64 insertions(+), 58 deletions(-)
> >  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 34d8c71cc8..2d7f14f097 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,16 @@ endif
> >
> >  comment "Legacy options removed in 2022.02"
> >
> > +config BR2_PACKAGE_RPI_BT_FIRMWARE
> > +	bool "rpi-bt-firmware package was renamed"
> > +	depends on BR2_arm || BR2_aarch64
> > +	select BR2_LEGACY
> > +	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
> > +	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
> > +	help
> > +	  Package rpi-bt-firmware was moved as option to
> > +	  package brcmfmac_sdio-firmware-rpi.
> > +
>
> This is already in master (and it's unrelated).

Yes, you are right (seems to be some rebase/merge artefact), will respin the
patchset..., thanks for review!

Regards,
Peter

>
> baruch
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
