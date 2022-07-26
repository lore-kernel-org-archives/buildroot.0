Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64630C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14DEA40167;
	Tue, 26 Jul 2022 20:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14DEA40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0EJ4xbc3qKi; Tue, 26 Jul 2022 20:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 231954013F;
	Tue, 26 Jul 2022 20:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231954013F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF581BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 759FE80BA4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759FE80BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JR4WYId8dAPt for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D13D80B9F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D13D80B9F
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:53:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 606BC1C0002;
 Tue, 26 Jul 2022 20:53:41 +0000 (UTC)
Date: Tue, 26 Jul 2022 22:53:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726225340.53ea9dd0@windsurf>
In-Reply-To: <20220726173235.24338-1-fontaine.fabrice@gmail.com>
References: <20220726173235.24338-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658868821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X38pSYe508uA8KOUUUOcjRgaUaLNGPsITil8RixlTGM=;
 b=iWhOoCFH8yBLdZTbys1R4ycLUWc7kFaJ/fcurNr6Y9htao0BD9vT4yolH77MLzSuqdyKA0
 S3ebqAHhPZwxs53/je8Cq2unNuwzklE5h9GGig77Dl7FNBGj/nnAMsC1snTCXPCH2vSOFz
 c558nlJdS12w2UpxrnAWfEaZf7nppZ2uvQZ9LRdf+LEtZWpi0OigxFKui9fgOd/yz8d/Zn
 QcDcf2+IgPEMwYkwuplUSQ2KBmNpWyj4xq9gVP1H9O43NFcSBisx8w9Wi9ANpYfFsTemJ/
 /LciKZmIlAuDcSkYadACnm9tBkczlx3O7akTj6XwR6s9HPoGmoj9qnognMIxnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iWhOoCFH
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version
 1.0.3
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 19:32:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Rebased second patch
> - Drop third and fourth patches (already in version)
> - duktape is an optional dependency since version 1.0.0 and
>   https://github.com/meetecho/janus-gateway/commit/fab4215b7826638660eba2147bb772dd57fed10c
> - gengetopt is not a dependency since version 1.0.1 and
>   https://github.com/meetecho/janus-gateway/commit/c21500c02e93e4b08c5242d0f0066d26ffc9f1a9
> 
> https://github.com/meetecho/janus-gateway/blob/v1.0.1/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dd-test-for-Wunused-but-set-variable.patch |  8 +++---
>  .../0003-Fixed-missing-XSS-mitigation.patch   | 25 -------------------
>  .../0004-Fix-build-with-libressl-3.5.0.patch  | 25 -------------------
>  package/janus-gateway/Config.in               |  8 ++++++
>  package/janus-gateway/janus-gateway.hash      |  2 +-
>  package/janus-gateway/janus-gateway.mk        | 14 +++++++----
>  6 files changed, 23 insertions(+), 59 deletions(-)
>  delete mode 100644 package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
>  delete mode 100644 package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch

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
