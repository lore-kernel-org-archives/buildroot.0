Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B1C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D915416C4;
	Wed, 22 Feb 2023 16:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D915416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-a_YSuGDQ-o; Wed, 22 Feb 2023 16:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A616416C0;
	Wed, 22 Feb 2023 16:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A616416C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFAE61BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A574198B
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A574198B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3qALJUWxGCr for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:23:54 +0000 (UTC)
X-Greylist: delayed 00:08:34 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D7C64194F
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D7C64194F
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:23:53 +0000 (UTC)
Received: from x230 (37-169-40-60.coucou-networks.fr [37.169.40.60] (may be
 forged)) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 31MGJm1l031417
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 17:19:48 +0100
Date: Wed, 22 Feb 2023 17:19:41 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222171942.11601e98@x230>
In-Reply-To: <20230222160514.2069544-2-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
 <20230222160514.2069544-2-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 2/5] package/gnuradio: disable examples
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

On Wed, 22 Feb 2023 17:05:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Examples can be disabled since version 3.9.0.0 and
> https://github.com/gnuradio/gnuradio/commit/530262c6df3fb9b87a80133dbde5650dbe948c4c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/gnuradio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index c2fcba9586..c2e5ec5cad 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -22,6 +22,7 @@ GNURADIO_DEPENDENCIES = \
>  GNURADIO_CONF_OPTS = \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
>  	-DENABLE_DEFAULT=OFF \
> +	-DENABLE_EXAMPLES=OFF \
>  	-DENABLE_GNURADIO_RUNTIME=ON \
>  	-DENABLE_TESTING=OFF \
>  	-DXMLTO_EXECUTABLE=NOTFOUND
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
