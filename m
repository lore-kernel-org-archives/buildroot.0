Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD618C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D38D60E2D;
	Tue,  9 Aug 2022 11:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D38D60E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnqtBnVB1bvj; Tue,  9 Aug 2022 11:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C14360BB2;
	Tue,  9 Aug 2022 11:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C14360BB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7DB1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A745140216
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A745140216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qJkpz7CLUmh for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1190A40213
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1190A40213
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:33:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D16641BF20E;
 Tue,  9 Aug 2022 11:33:13 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:33:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220809133312.3f71f4d7@windsurf>
In-Reply-To: <20220807211541.178167-1-fontaine.fabrice@gmail.com>
References: <20220807211541.178167-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660044794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+I6sHHxwaNIekrTJzeU2SytzzdZvKIIleSIZsxFSroQ=;
 b=ESDO/6HyAEVDRV733YR0p/n67trnpfdppBed8z2U5iSwfaCvawh3pE53fcXiSVrJ0vI2Tk
 cUPqnh77H8hD20hOBMM4fSgLE5g7azN9RTfjyFcEZT53E5IvJ+VTCvy/iOIXPeSJXhjLtB
 ynXnJz5u3f4T4lbbCGoDHuJGwSi3kPPbJIF0boSbOQHmn9Th36y4TOxhaAs7WwowmOfFTA
 pJPEiEpbV3Pl0ExH8odzxh5/rE1BHy7H6zsxcjiGMxsQVqSPUsciq1V9h6FA8m63+lIhmf
 rR78dNM1oRV5U8Rf1MziYBUPaJKPZF3R5IrmjuMSxw5ucAQtZcSDzp03+mtAsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ESDO/6Hy
Subject: Re: [Buildroot] [PATCH 1/1] package/waffle: fix build without C++
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 23:15:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop C++ dependency as nacl is disabled (and will be dropped by upstream
> in next release) to avoid the following build failure raised since bump
> to version 1.6.1 in commit 814f36fdcc39bbafa1e2aaf637c7c6b59e7f37dd:
> 
> CMake Error at /usr/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
>   The C++ compiler
> 
>     "/usr/bin/clang++"
> 
>   is not able to compile a simple test program.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a702495074b0393682c619781c349ce62e123133
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/waffle/0003-drop-C-dependency.patch | 46 +++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/waffle/0003-drop-C-dependency.patch

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
