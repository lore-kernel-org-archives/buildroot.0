Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B231F432A5;
	Wed,  1 Nov 2023 22:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B231F432A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7O_DRETQazMd; Wed,  1 Nov 2023 22:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDA8C432AA;
	Wed,  1 Nov 2023 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA8C432AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A48E21BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E23F6FCA7
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E23F6FCA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2nFHmGQRIOz for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:13:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6992B6FC5A
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6992B6FC5A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EF7920004;
 Wed,  1 Nov 2023 22:13:19 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:13:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101231318.496e60ea@windsurf>
In-Reply-To: <20231015201449.1279312-1-fontaine.fabrice@gmail.com>
References: <20231015201449.1279312-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698876800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98wYZ68Wvt2gNRgglL+H2xqSlVK3t9VNLa2pVOWIac0=;
 b=bzu6yEBb2SCem8mPquAEtMn7nfVMG8cORT23sfvHJSxFizhpyEe8y+IjHy55NZ/oDM96iB
 xtfBJhH82/bDKYPhN+tj+DEaXnTrh1jr/JbaYPGcWFjTBwSM+Jmw+cfa9H+YtEOOeRkXG3
 PywZP9tK/oHsoq2u0mEVwR8nIScHDleuPR4GfCRt9KEu/AJLv0Ut92GmC1zQlYwd+I20Yl
 xeSe6rG6svkaPQoT6eZ0jWXaIQ7LUoyJWg7h+JTuLqhEDVKdpKW7Xbq6wbo165eF3T4aIK
 7EXrNGO6UnxVdmh/6ALGwKAiOJBwktWf4zaRyovucSgetAPZDde1Ox8Bcguepg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bzu6yEBb
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: needs gcc >= 4.9
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Oct 2023 22:14:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libgeos needs gcc >= 4.9 since bump to version 3.12.0 in commit
> 16727d4595dd1972a46e92bbd2260a896cc19b60 and
> https://github.com/libgeos/geos/commit/289ed4efb26a9944f4385381e1574184b1e7448e:
> 
> In file included from /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/src/algorithm/ConvexHull.cpp:30:0:
> /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/include/geos/util.h:38:12: error: 'std::make_unique' has not been declared
>  using std::make_unique;
>             ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/56bb572fb1d56d45dbb950a73b9b888239fa6968
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgeos/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I've applied, but you had forgotten to look at the reverse dependencies
of BR2_PACKAGE_LIBGEOS. Namely, BR2_PACKAGE_POSTGIS selects
BR2_PACKAGE_LIBGEOS, so it needs to inherit this dependency on gcc >=
4.9, so I fixed that when applying.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
