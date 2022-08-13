Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8747C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DDD260E30;
	Sat, 13 Aug 2022 10:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DDD260E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id am3iGRLEbmHu; Sat, 13 Aug 2022 10:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17A060BEC;
	Sat, 13 Aug 2022 10:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A17A060BEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B69AC1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9064F416C2
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9064F416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7ljDpYQqKVT for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E79416AB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47E79416AB
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:57:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A02D60003;
 Sat, 13 Aug 2022 10:57:21 +0000 (UTC)
Date: Sat, 13 Aug 2022 12:57:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220813125720.47779946@windsurf>
In-Reply-To: <20220813102643.978802-1-fontaine.fabrice@gmail.com>
References: <20220813102643.978802-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQSEYb9CLBvE0heF52/7FW9Xr39V2wuD/4u0OLZ4UWo=;
 b=bCG9gUSkapDNVYZYUTw9ZRITJJ6UTnRppzf/MiEF7GbFNlSgpdnH+qrEmY/OkUPXksy/KJ
 FVEpvmScWzGvhyt+RzyatdCOG1J1SaSTJfp/KDz8idoMJhpMsbVZ7zwgwqghCygxZrVMPc
 s7qg5ybFHdd9hA1zJbEtFYjXQUBJfeR5Zp3dj1Lpn+R07Jerdi5QROhSr+PE76iVtuKNC7
 myia0erdcBpl65KffGMrEfmMJ1np0+wKaavlueoSZTTLst3S8K9sBLRsDDo1RWBPkaykq6
 +Ow3mtMa22/AEbUaA2nPD5LPv39IFV3G6XaDKnODWIC4elIIaTpiJ1Wwgk4W5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bCG9gUSk
Subject: Re: [Buildroot] [PATCH 1/1] package/ne10: fix build without C++
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Aug 2022 12:26:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without C++ raised since bump to version
> 1.2.0 in commit 8cdf680799d7055a272190387064f87c7c638906 and
> https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:
> 
> CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>   The C++ compiler
> 
>     "/usr/bin/clang++"
> 
>   is not able to compile a simple test program.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ne10/0002-fix-build-without-C.patch | 55 +++++++++++++++++++++
>  package/ne10/ne10.mk                        |  6 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/ne10/0002-fix-build-without-C.patch

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
