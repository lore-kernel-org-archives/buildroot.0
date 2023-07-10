Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E1EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A19E812F1;
	Mon, 10 Jul 2023 18:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A19E812F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddciGry_33Tt; Mon, 10 Jul 2023 18:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9F5812B7;
	Mon, 10 Jul 2023 18:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9F5812B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61D691BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 105DD60899
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105DD60899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb7YaBnr7TmL for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 857F6606A9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 857F6606A9
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:03:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23EE11BF208;
 Mon, 10 Jul 2023 18:03:52 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:03:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230710200350.5c72bcab@windsurf>
In-Reply-To: <20230626080016.2182278-1-james.hilliard1@gmail.com>
References: <20230626080016.2182278-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689012232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzXElTL0p1Ld5pn/SEdvQDJCTi2jvYN8IIJw7Bp7Hek=;
 b=ALV3yt3Z8h4TaLsMHMGzsH3DhGCJVoKGsCwA5499zfekvLgic5mzC0YFrn0z91uYe/0ROJ
 PgFmkOHKv1VqRgxZxThYo/jfDYV+sC8lGlelRZYZFGjbDXAYjaVx26x0Tz6x3UBwUZbYle
 z/f++PQ9MNgaJuEAXhbeAHwTDgb8zttus8v3JL030yxCvi5eAA6BMQQ5mBnwCUeWYtDOsy
 Ct+nlO/AE+VGteg14yqdaytp/shJH87FD1qGLOMGCNIR5ytk5diFPkujnLooU/06aOAxRt
 695vHNkJIoiC2hfSmDD2PXSkcasFcibnb+apxC3jfqHwcq15ORDzg3aBezcwLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ALV3yt3Z
Subject: Re: [Buildroot] [PATCH 1/1] package/python-msgpack: add host cython
 dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Jun 2023 02:00:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need host-python-cython for python-msgpack to build correctly.
> This is a hard error when using a pep517 frontend.
> 
> Fixes:
> * Getting build dependencies for wheel...
> running egg_info
> writing msgpack.egg-info/PKG-INFO
> writing dependency_links to msgpack.egg-info/dependency_links.txt
> writing top-level names to msgpack.egg-info/top_level.txt
> reading manifest file 'msgpack.egg-info/SOURCES.txt'
> reading manifest template 'MANIFEST.in'
> warning: no files found matching '*.c' under directory 'msgpack'
> adding license file 'COPYING'
> writing manifest file 'msgpack.egg-info/SOURCES.txt'
> 
> ERROR Missing dependencies:
> 	Cython~=0.29.30

Could you clarify if this is a current issue in the python-msgpack
package that causes build failures, or if this is in preparation to
move from setuptools to pep517 to build python-msgpack?

If you want us to merge your patches faster, please help us: explain in
the commit log the "WHY" you are doing the change. Your commit log
fails to explain it, and therefore I don't have the context to
understand the motivation of the change.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
