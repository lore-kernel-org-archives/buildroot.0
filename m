Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E90DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F65440081;
	Mon, 14 Nov 2022 22:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F65440081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJzywmd55X1C; Mon, 14 Nov 2022 22:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F28D84008D;
	Mon, 14 Nov 2022 22:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F28D84008D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0814B1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7701812B1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7701812B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCmtdJyhcZYD for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:08:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84745812E9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84745812E9
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:07:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADC92C0009;
 Mon, 14 Nov 2022 22:07:56 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:07:55 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221114230755.2b5c6032@windsurf>
In-Reply-To: <1666187008-64454-1-git-send-email-gwenj@trabucayre.com>
References: <1666187008-64454-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668463676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEkeslfSXpFsR4WwBhY5oFrYBM3waizKaQ/VUG8fomM=;
 b=B9VwaAy/plgRiCVmIV7nVoA34yG+psfhXe0rmQptx8uC10fAAZSkYVYQd0yZV+/oLjsZIK
 dLOl7JMEpEvitLVVntLB5dSVKrppRJ5cOP3sNNJWcPaf8TmcdSCJzMxsZoDufSzl7pKkxm
 VBPFqufSV1XxRS2Q7ZnyBjUvhUwrgsWjtPMuMY/gBk1T6k081u24xcsj5lP6EN2cOEay0I
 iiAVZ9H1frE2OrKY7ZMi9+UEEtDCCj2SfUQodEicj+eH/JjM2J/063MmvNA2C1RXqL4lec
 asMScRb4axkHHIO/XcOB9qaod0uBlvunS3Cjk9A7N8I+/6nBWrq49+dJIZdUVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B9VwaAy/
Subject: Re: [Buildroot] [PATCH v5] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Oct 2022 15:43:28 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> - remove all no more required patches
> - backport 2 patches to fix failures induces by missing headers
> - add dependency to SPDLOG
> - add pybind dependency where python is set
> 
> Note:
> - Since gnuradio 3.10 swig was replaced by pybind. Now python libraries,
>   bindings and python wrappers are produces using pybind: this
>   why python-pybind is a buildtime dependency. As mentionned in [1], this one
>   is a stagging only package: headers must be into staging directory, so it
>   can't be host and at the same time since this package provides only headers
>   and .cmake files nothing has to be installed into the target directory. A
>   select is required because it's not an host package and
>   GNURADIO_DEPENDENCIES is updated with python-pybind to have pybind present
>   before gnuradio's build.
> - host-python-numpy is now required since some cpp bindings uses numpy's
>   functions directly. python-numpy (target package) is left required because
>   python blocks and wrappers needs this library at runtime.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2022-October/653030.html
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v4 -> v5:
> - re-add python-pybind select
> Changes v3 -> v4:
> - re-add runtime comment for numpy
> - remove python-pybind select
> - rework commit message
> Changes v2 -> v3:
> - update gnuradio version 3.10.3.0 -> 3.10.4.0
> - remove patch to fix libfmt9 (now applied)
> - backport two patch to fix failures due to missing header
> - explain in commit message why pybind and numpy are now required at
>   buildtime (Thomas)
> Changes v1 -> v2:
> - remove #runtime comment for PYTHON_NUMPY and PYTHON_PYBIND (Thomas)
> - remove host-python-mako to the dependencies list (now useless) (Thomas)
> - backport patch to fix build failure with libfmt > 9
> ---
>  ...g-missing-vector-in-blockinterleaver.patch |   42 +
>  ....h-drop-boost-cstdint.hpp-and-use-cs.patch |   39 -
>  ...rleaving.h-add-missing-cstddef-heade.patch |   33 +
>  ...aceholders_with_their_full_namespace.patch | 1012 -----------------
>  ...rdcode-INTERFACE_INCLUDE_DIRECTORIES.patch |   57 -
>  ...add-examples-c-subdirectory-when-gr-.patch |   55 -
>  ...ve-deprecated-math-common_factor.hpp.patch |  165 ---
>  package/gnuradio/Config.in                    |    5 +-
>  package/gnuradio/gnuradio.hash                |    2 +-
>  package/gnuradio/gnuradio.mk                  |   12 +-
>  10 files changed, 84 insertions(+), 1338 deletions(-)
>  create mode 100644 package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
>  delete mode 100644 package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
>  create mode 100644 package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
>  delete mode 100644 package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
>  delete mode 100644 package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
>  delete mode 100644 package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
>  delete mode 100644 package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch

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
