Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3382CFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B7981286;
	Tue, 25 Oct 2022 18:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B7981286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N60GJFA0s1We; Tue, 25 Oct 2022 18:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF32681274;
	Tue, 25 Oct 2022 18:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF32681274
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E26D41BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B701381274
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B701381274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szfCQUYyoi3v for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:22:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B718126E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01B718126E
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:22:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0388520003;
 Tue, 25 Oct 2022 18:22:47 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:22:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202244.70c4556f@windsurf>
In-Reply-To: <20221023141706.197964-1-fontaine.fabrice@gmail.com>
References: <20221023141706.197964-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTSnRu3juUIi/eCCFmLDckUddqqOs/3FccDG/9pu7B8=;
 b=eXHxnvClXK3kJfdadPW62xaiMzpCtgJEnpdFmj7/fItcF2lTh11j+Q9kfmwYjcb4/qJSeD
 qqQVT4lbUtZ9+6lSlqR0w1ME8AwERNgQKfzzEcbA34IOq16i9Kgh09CIjVwhaK1snmHLUp
 LnP8gwlguoMDTF3N/31DBbebAetTZYS3JNAtL2VxP1PaVrzXL+v6Y/WbHajrmEgQeliwti
 OmFafC0RPS5Mkx0jd6ulhTYiv3BUT25s5Xh3MNBM8jw8CvyEjGRzNtH5i2SEJ2rCcrpN3d
 9Cq2W4RqJSGXhA6ZoTf1LfVqfFM+KCdfkIRNi2BEuWmxeJDy2XVkqvMVrpIe5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eXHxnvCl
Subject: Re: [Buildroot] [PATCH 1/1] package/lirc-tools: bump to version
 0.10.2
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

On Sun, 23 Oct 2022 16:17:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first to third patches (already in version)
> - Add a patch to disable documentation and avoid a build failure without
>   doxygen
> 
> https://sourceforge.net/p/lirc/git/ci/lirc-0.10.2/tree/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-build-without-Python.patch       | 63 -------------------
>  ...evinput.c-fix-build-with-musl-1.2.0.patch} |  0
>  ...0002-Fix-python-client-cross-compile.patch | 47 --------------
>  ...002-configure-add-disable-doc-option.patch | 52 +++++++++++++++
>  ...irc-version-detection-when-cross-com.patch | 51 ---------------
>  package/lirc-tools/lirc-tools.hash            |  8 +--
>  package/lirc-tools/lirc-tools.mk              |  2 +-
>  7 files changed, 57 insertions(+), 166 deletions(-)
>  delete mode 100644 package/lirc-tools/0001-Fix-build-without-Python.patch
>  rename package/lirc-tools/{0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch => 0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch} (100%)
>  delete mode 100644 package/lirc-tools/0002-Fix-python-client-cross-compile.patch
>  create mode 100644 package/lirc-tools/0002-configure-add-disable-doc-option.patch
>  delete mode 100644 package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch

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
