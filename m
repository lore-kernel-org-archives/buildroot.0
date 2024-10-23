Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED7CD2E01E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 07:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA640405C6;
	Wed, 23 Oct 2024 07:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo7MA1fQX_x8; Wed, 23 Oct 2024 07:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AFD7405C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AFD7405C7;
	Wed, 23 Oct 2024 07:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D9859B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 07:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611F44051E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 07:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 861jqvB-rAWn for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 07:55:14 +0000 (UTC)
X-Greylist: delayed 355 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Oct 2024 07:55:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DB54408DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB54408DC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DB54408DC
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 07:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id C92571814B9; Wed, 23 Oct 2024 09:49:12 +0200 (CEST)
In-Reply-To: <20240924023919.1502635-1-james.hilliard1@gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
Date: Wed, 23 Oct 2024 09:49:12 +0200
To: "James Hilliard" <james.hilliard1@gmail.com>
MIME-Version: 1.0
Message-ID: <1a58f-6718aa80-1-76c39280@156352477>
User-Agent: SOGoMail 5.11.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1729669755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OZCyazlnKf33dYcrV9hJNbzvqKqu/sGgFiSstL24hWQ=;
 b=mPjL+irllEWWIfu0uGyHuYFYIDrGlTj2AJ0AdiXAabg1duw7PUz2pneHPMb0Ep1UJE508N
 l/k/vScMH1zwECdzDGY9jyQVVg15ExZspMWETX13lunuyYXWGcsmLE+DY6QzeuOUKruodf
 LRMTBOM37P5YMp/SaRMdVUi6nhb8CBo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=mPjL+irl
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2_1/3=5D_package/=7Bpython-=7Dpr?=
 =?utf-8?q?otobuf=3A_bump_to_version_28=2E1?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Robert Rose <robertroyrose@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

I finally found time to test the patchset.

On Tuesday, September 24, 2024 04:39 CEST, James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate protobuf build from autotools to cmake.
> 
> Migrate protobuf-python to use pypi sources which are now required
> for setup.py builds:
> https://github.com/protocolbuffers/protobuf/tree/v28.1/python#building-from-setuppy
> 

After applying the patchset the pkgconf detection of (host-)protobuf seems to be broken.
At least on my system it just goes into an endless loop. Which is not happening before the bump.

This breaks e.g., protobuf-c and collectd as their configure step just blocks indefinitely.

Defconfig to reproduce:

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PROTOBUF_C=y

separated command which never returns:

  ./output/host/bin/pkgconf --cflags protobuf

Can you reproduce that? Any idea what could be causing this? 

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
