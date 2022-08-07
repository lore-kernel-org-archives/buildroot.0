Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35643C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09F28132A;
	Sun,  7 Aug 2022 12:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D09F28132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBhCixRS-a2W; Sun,  7 Aug 2022 12:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB4F48131A;
	Sun,  7 Aug 2022 12:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB4F48131A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 675EC1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FCA04089B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FCA04089B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtCH8tyjc6RA for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:40:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71D2408D2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E71D2408D2
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:40:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 402E5240003;
 Sun,  7 Aug 2022 12:40:08 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:40:07 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807144007.47c8d6a5@windsurf>
In-Reply-To: <20220807100045.3188645-1-fontaine.fabrice@gmail.com>
References: <20220807100045.3188645-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1MNobSgKRLQ7HElKjavCDTrTpBitYBh+IwzXgkhcBY=;
 b=Sb5I/kTShVKb3iFRTLGh3qQgdyzpSphabJywRfPeEeCGf041cWyINu0zL0Cc6OCQl2b9D5
 C6VMU6ZfgxyqF4RdMeu9u77JKnr29EmrlE3/lnnByIFOCzTISCThJyfNK+9yMGpvwgWKPE
 Z920OrxdAyn5DAMUb6jV5SgaLrWCux2s6kQbZVC5/WlqhVfnO9OYwfUKKjVbcVUigXUyGp
 yQxZHKK+695FJAOw4qSk6v2GAv/FFHHV4ObarsSbVEzQsgxXIv3xRd1yEudBLFZO+IVE1a
 R2ngRUUr2+KntoJ818Aeqh/MzjxE5+EVL7fvWpOEoIiUbJ/p4784kG7dO/I1rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sb5I/kTS
Subject: Re: [Buildroot] [PATCH 1/1] package/mbw: fix build without C++
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 12:00:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without C++ raised since the addition of
> the package in commit e27ef7658265a62e74bf9f0e66e5e5432f453f6a:
> 
> CMake Error at CMakeLists.txt:3 (project):
>   No CMAKE_CXX_COMPILER could be found.
> 
>   Tell CMake where to find the compiler by setting either the environment
>   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
>   to the compiler, or to the compiler name if it is in the PATH.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
