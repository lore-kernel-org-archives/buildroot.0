Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D7BC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1198416DF;
	Wed, 22 Feb 2023 16:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1198416DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APkAa0cP1HP8; Wed, 22 Feb 2023 16:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE8BA416D7;
	Wed, 22 Feb 2023 16:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8BA416D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 887D81BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61B92611E7
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B92611E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjy316ObTuck for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:24:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60660611BD
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60660611BD
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:24:01 +0000 (UTC)
Received: from x230 ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 31MGFFTM029276
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 17:15:17 +0100
Date: Wed, 22 Feb 2023 17:14:44 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222171444.5e9e8f2f@x230>
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 1/5] package/gnuradio: drop unrecognized
 volk variables
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

On Wed, 22 Feb 2023 17:05:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Volk submodule has been removed since version 3.9.0.0 and
> https://github.com/gnuradio/gnuradio/commit/80c04479da962d048d41165081b026aafdaa0316
> 
> orc dependency can also be dropped as it was only used by volk submodule
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/gnuradio.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index cc41f1e12b..c2fcba9586 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -22,9 +22,7 @@ GNURADIO_DEPENDENCIES = \
>  GNURADIO_CONF_OPTS = \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
>  	-DENABLE_DEFAULT=OFF \
> -	-DENABLE_VOLK=ON \
>  	-DENABLE_GNURADIO_RUNTIME=ON \
> -	-DENABLE_INTERNAL_VOLK=OFF \
>  	-DENABLE_TESTING=OFF \
>  	-DXMLTO_EXECUTABLE=NOTFOUND
>  
> @@ -36,13 +34,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
> -ifeq ($(BR2_PACKAGE_ORC),y)
> -GNURADIO_DEPENDENCIES += orc
> -GNURADIO_CONF_OPTS += -DENABLE_ORC=ON
> -else
> -GNURADIO_CONF_OPTS += -DENABLE_ORC=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
>  GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
>  else
> -- 
> 2.39.0
> 
Acked-by: Gwenhael Goavec-merou <gwenhael.goavec-merou@trabucayre.com>

Regargs,
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
