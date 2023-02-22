Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E800EC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E26F416F1;
	Wed, 22 Feb 2023 16:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E26F416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJM6e_8iF5-N; Wed, 22 Feb 2023 16:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1939416F8;
	Wed, 22 Feb 2023 16:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1939416F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0D01BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F577416FA
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F577416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NofEDsOzgyi for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:32:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941B8416F1
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 941B8416F1
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:32:05 +0000 (UTC)
Received: from x230 (37-169-40-60.coucou-networks.fr [37.169.40.60] (may be
 forged)) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 31MGW2hJ003053
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 17:32:03 +0100
Date: Wed, 22 Feb 2023 17:31:56 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222173156.0f63bb68@x230>
In-Reply-To: <20230222160514.2069544-3-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
 <20230222160514.2069544-3-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 3/5] package/gnuradio: add libsndfile
 optional dependency
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

On Wed, 22 Feb 2023 17:05:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libsndfile is an optional dependency since version 3.9.0.0 and
> https://github.com/gnuradio/gnuradio/commit/18f64ba685cfc2533e2d7726aa43c524b007d97b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/gnuradio.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index c2e5ec5cad..59fb23d89d 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -55,6 +55,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
>  GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
> +ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
> +GNURADIO_DEPENDENCIES += libsndfile
> +endif
>  else
>  GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
>  endif
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
