Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2585C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CBD940498;
	Wed, 27 Jul 2022 10:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CBD940498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zcybdjMT8Kt; Wed, 27 Jul 2022 10:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8747840260;
	Wed, 27 Jul 2022 10:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8747840260
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49B4D1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24AC160B50
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24AC160B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXoaRncqtkBt for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:14:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DCC60B30
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0DCC60B30
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:14:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B6C71BF210;
 Wed, 27 Jul 2022 10:14:22 +0000 (UTC)
Date: Wed, 27 Jul 2022 12:14:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727121421.6f1d3dcf@windsurf>
In-Reply-To: <20220727092946.987973-1-fontaine.fabrice@gmail.com>
References: <20220727092946.987973-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658916863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSdw86ePWc/M5KGYy1Bj9CeTx+5vITliPsxVvyJqo7k=;
 b=f6Ieq27cx39vFxa0VjsK+HyOZIJ08+mxiIOX9bPx50AXRADQZDddA+S3W91UEKt/hB4naI
 RoBEq6zZqDmlHIwO1HJnkjrLPbKCr8zwtvrlZM6kXqenHm3i2ws6TNwXsRPBm0q8weUZeF
 kCNceqETQmHbwt4nXaHL5R1PW0Qr6k+4YesEGvwunlN4RHuh7pmXbfnTTxKoRvL9Ygg+Zt
 aTwkaIX43yNxVJuPcYmBG4MGV5mRnuX/1ek4iTxB4pH057D7luOWvSx6TrQLU0017GsooS
 uFHsAiYttU0Ag7eriEbPnt3/46UfKnTp38EMR8kn60KdCyrdQdFRMfymwXDleQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f6Ieq27c
Subject: Re: [Buildroot] [PATCH 1/1] package/jszip: security bump to version
 3.10.0
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 11:29:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Santize filenames when files are loaded with loadAsync, to avoid "zip
>   slip" attacks. The original filename is available on each zip entry as
>   unsafeOriginalName. See the documentation.
> - Drop patch (already in version)
> - Update hash of license file (dual licensing clarification with
>   https://github.com/Stuk/jszip/commit/f81c2d700d8e5fec4ed89fb565e4a266bb4dd26e)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/Stuk/jszip/blob/v3.10.0/CHANGES.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...null-prototype-object-for-this-files.patch | 56 -------------------
>  package/jszip/jszip.hash                      |  4 +-
>  package/jszip/jszip.mk                        |  5 +-
>  3 files changed, 3 insertions(+), 62 deletions(-)
>  delete mode 100644 package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch

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
