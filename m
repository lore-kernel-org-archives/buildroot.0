Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAAFC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C8D4370C;
	Fri,  5 Jan 2024 13:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C8D4370C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfDWQ7we2FX7; Fri,  5 Jan 2024 13:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4822435DF;
	Fri,  5 Jan 2024 13:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4822435DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7693F1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F414371D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F414371D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqBDnuN5wlyI for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC70C435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC70C435DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED50024000D;
 Fri,  5 Jan 2024 13:01:53 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:01:53 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105140153.6112ea6a@windsurf>
In-Reply-To: <20231227113226.1142519-1-fontaine.fabrice@gmail.com>
References: <20231227113226.1142519-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PU++y6ayNtvxD8XVwZdC4/LeulzzDzAa65xBjKLSVo=;
 b=dMMTLI2st2ivatzU2W1CllNLNsMvbjBuK1L0doMZQCnpQkcJCzOYAhSqNG7xt65MRM84pM
 XBO8Qm2P5gRaFyfEnI9EOOdCQBCwcpkhtk2Pi+NscXCZAVIE+DYVq6iJrjQ148iZC8S8E8
 hVqHYQc+229HdjAeGpu3sK0RH5MquRocgEh/EP8U6aAMFkGDGy1lXXn7bxEpepCi0uBfFE
 IeNCEL9l4+t7TVA9DY/4kmCPwuyp0mW0SdXyGLwPPmDgM9LyxW/Bp7fGmRkJjYHPuy9bDD
 sn9A/aSD2jvN8nxjxrNeCKCstFilgkO+oY6va11LSyvPrkG17JLPYd00gwYCCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dMMTLI2s
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: bump to version 3.2.0
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

On Wed, 27 Dec 2023 12:32:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - Update hash of license.txt (update in year:
>   https://github.com/randombit/botan/commit/4d0371816763f16ea0b9694155016db591293c8e)
> 
> https://github.com/randombit/botan/blob/3.2.0/news.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  2 --
>  ...01-Add-superh-alias-needed-by-Debian.patch | 22 --------------
>  ...-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 -------------------
>  package/botan/botan.hash                      |  4 +--
>  package/botan/botan.mk                        |  2 +-
>  5 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/botan/0001-Add-superh-alias-needed-by-Debian.patch
>  delete mode 100644 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch

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
