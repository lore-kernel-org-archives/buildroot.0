Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13216FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86557402A7;
	Tue, 25 Oct 2022 18:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86557402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6HVowg4XauZ; Tue, 25 Oct 2022 18:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666644029D;
	Tue, 25 Oct 2022 18:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666644029D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 232471BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BDD360A70
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BDD360A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0XpaEFepQr3 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:22:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4336607F4
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4336607F4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:22:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D48B100009;
 Tue, 25 Oct 2022 18:22:52 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:22:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202250.656b2750@windsurf>
In-Reply-To: <20221023165026.13707-1-fontaine.fabrice@gmail.com>
References: <20221023165026.13707-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfWRYUy/+m/Ta+KI4gbEThQ8tGiyto4iA3BazPkNsbU=;
 b=JmmWHoi+aKBf67/A09oo5OhwvXrfKyIDW/co//Lh+DmPkWrxj/JPYQUAhkl5H0Ql3DOpxd
 6zDL8SLio+85Utm4mN8BbPlBnGkw0DAPep2/oXC0xNFdjka4PdwMlwg2RuL21i2yza/0ou
 KkBp+ssnLi8HRfyq+q3m58kNjizh3y9weqYLowOxLbfx2+13pZU68G280RuT/dNaP/vumB
 7qfIcdKjggBPhv3dM0dxPDxFXTzBTkVZ057Iq6SWZXz//R/u7fLF9QgOtOwDxWGUEa2His
 mRA4FvjR4hRQT+vr09ma8moKXLbQgpFuJKDuDqQNIMJqKUcirZx2QkpZnJytHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JmmWHoi+
Subject: Re: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.2.13
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

On Sun, 23 Oct 2022 18:50:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - Replace README by LICENSE file added with
>   https://github.com/madler/zlib/commit/352cb28d12baf02863ff5d4d96be0587ced419a1
> 
> https://github.com/madler/zlib/releases/tag/v1.2.13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...hat-discarded-provided-CC-definition.patch | 28 ---------------
>  package/libzlib/0002-fix-CVE-2022-37434.patch | 35 -------------------
>  .../0003-fix-CVE-2022-37434-regression.patch  | 32 -----------------
>  package/libzlib/libzlib.hash                  |  4 +--
>  package/libzlib/libzlib.mk                    |  7 ++--
>  5 files changed, 4 insertions(+), 102 deletions(-)
>  delete mode 100644 package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
>  delete mode 100644 package/libzlib/0002-fix-CVE-2022-37434.patch
>  delete mode 100644 package/libzlib/0003-fix-CVE-2022-37434-regression.patch

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
