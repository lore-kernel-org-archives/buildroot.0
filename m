Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CABC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BC481766;
	Mon, 15 Aug 2022 20:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BC481766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AUhmPKCSCEl; Mon, 15 Aug 2022 20:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B51881761;
	Mon, 15 Aug 2022 20:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B51881761
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D37BE1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8443640893
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8443640893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lu_0LEbhsz_c for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA684088F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFA684088F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:21:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 714301BF203;
 Mon, 15 Aug 2022 20:21:08 +0000 (UTC)
Date: Mon, 15 Aug 2022 22:21:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815222106.499394bb@windsurf>
In-Reply-To: <20220809190926.2535336-1-fontaine.fabrice@gmail.com>
References: <20220809190926.2535336-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660594869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfBle6uKwESPrkqEEzzRXBgGnyeTy9tkMatK1l8yyk4=;
 b=m9TT4rl/q1cm8qjuNrkudMwI3jAtBRGnD1jd6DcX4S5VnSLgD7VlFbqgrAJpQIQi9WYsKT
 4iJgPJ3sngociHhdfFJ2u+7OKZpnUKZrtqHm2FGwKbDXU3FngPNJGLbB965TZ+9DTK5KLp
 N8LO52/GH6KcAYymhv7mTU1KEM4OXY1glmjcYjIY6fxVuJUuw6G3yheX3c9HkexnGIZCZX
 LSksNCv4zLCplQBXIgAg+rDeR3AiEGm2k+4SNzOsqvD9TvT1kiXrKH2VHTAzEf2Q6rqsRh
 VT9FTylLicy4XKhb5y7cmT9K7UJLDB/MQhr55YHi7xjwErQApxktMlf200mB6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9TT4rl/
Subject: Re: [Buildroot] [PATCH 1/1] package/gauche: fix build
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 21:09:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 9.12.0 in
> commit f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d and
> https://github.com/shirok/Gauche/commit/9601603db7aea7bb6e075b4f7f09210a919a35b5
> which deleted the internal libatomic_ops:
> 
> configure: error: libatomic_ops is required.  You can either install it on
>                   your system, or fetch and unpack a recent version into the
>                   source directory and link or rename it to libatomic_ops.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c7a1b690d1b12e39b6b24f8cc8a144f79c73711
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gauche/gauche.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. When --with-libatomic-ops=none, gauche will
use the atomic builtins of the compiler, which on some architectures
requires linking with libatomic. But it seems like the intersection of
architectures supported by gauche and the architectures that neeed
libatomic is empty, so it seems to be OK as-is. The autobuilders will
tell us :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
