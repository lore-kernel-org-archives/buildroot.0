Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26C3C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A18E405FB;
	Wed, 22 Feb 2023 16:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A18E405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcDxPSqCmQ5S; Wed, 22 Feb 2023 16:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4177840C3D;
	Wed, 22 Feb 2023 16:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4177840C3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F67F1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C0B611CA
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C0B611CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVdA2JjkAa5S for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:27:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F22611C8
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6F22611C8
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:27:23 +0000 (UTC)
Received: from x230 ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 31MGRKSB001504
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 17:27:21 +0100
Date: Wed, 22 Feb 2023 17:26:42 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222172621.4994893c@x230>
In-Reply-To: <20230222160514.2069544-4-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
 <20230222160514.2069544-4-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 4/5] package/gnuradio: add gr-network block
 support
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

On Wed, 22 Feb 2023 17:05:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> grnet networking block support is available since version version
> 3.9.0.0 and
> https://github.com/gnuradio/gnuradio/commit/cc37c3e8cd5eabcb5c9d919e5fffc5d938690140
> 
> gr-network is a mandatory dependency of latest gqrx
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/Config.in   | 6 ++++++
>  package/gnuradio/gnuradio.mk | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 1824589263..51237e62b9 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -134,6 +134,12 @@ config BR2_PACKAGE_GNURADIO_FILTER
>  	help
>  	  Filter signal processing blocks
>  
> +config BR2_PACKAGE_GNURADIO_NETWORK
> +	bool "gr-network support"
> +	select BR2_PACKAGE_GNURADIO_BLOCKS
> +	help
> +	  TCP and UDP source/sink blocks
> +
>  config BR2_PACKAGE_GNURADIO_QTGUI
>  	bool "gr-qtgui"
>  	depends on BR2_PACKAGE_GNURADIO_PYTHON
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 59fb23d89d..d9218b533d 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -106,6 +106,12 @@ else
>  GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNURADIO_NETWORK),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=ON
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
>  GNURADIO_DEPENDENCIES += python3 python-pybind \
>  	host-python-numpy host-python-packaging
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
