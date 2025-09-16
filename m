Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F59CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 14:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369C040939;
	Tue, 16 Sep 2025 14:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYqBy2tWHgc1; Tue, 16 Sep 2025 14:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C9840949
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C9840949;
	Tue, 16 Sep 2025 14:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD4012D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB0840949
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrkcslbUy0TO for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 14:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51A55408E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A55408E1
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51A55408E1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id AA2381814B9; Tue, 16 Sep 2025 16:51:17 +0200 (CEST)
In-Reply-To: <aMlx-vByLFUkXXSh@colin-ia-desktop>
References: <20250818064235.258181-1-christian@klarinett.li>
 <aMlx-vByLFUkXXSh@colin-ia-desktop>
Date: Tue, 16 Sep 2025 16:51:17 +0200
Cc: "Christian Hitz" <christian@klarinett.li>, buildroot@buildroot.org,
 "Christian Hitz" <christian.hitz@bbv.ch>,
 "Norbert Lange" <nolange79@gmail.com>, "Sen Hastings" <sen@hastings.org>
To: "Colin Foster" <colin.foster@in-advantage.com>
MIME-Version: 1.0
Message-ID: <fbed1398-da08-c505-70fd-5387ba6a24fc@heine.tech>
User-Agent: SOGoMail 5.12.3
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1758034278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IIAK7J9Hhlh6THAKUIx+QQdyz9zNfwRARHd7YAdAp5M=;
 b=aupfgKaVp11+J9lvVvlWtI/h6n2Ra9EB4ZF3YH5qOkE45EPd25HIWpXuVMXAwyzDukMOvo
 4KCNp6ovZ0/krSQBTG6xcJEPU/35beniZLQf6qvLsdGopxDzx2nYBqI0H9C096vG5a6R64
 AF+EDtQlEV6mGlmejgnoXEgzA7lYIsw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=aupfgKaV
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_2020=2E02=2Ex=5D_package/systemd?=
 =?utf-8?q?=3A_bump_required_toolchain_headers_for_systemd-networkd?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Collin, all,

On Tuesday, September 16, 2025 16:19 CEST, Colin Foster <colin.foster@in-advantage.com> wrote:

> Hello,
> 
> On Mon, Aug 18, 2025 at 08:42:35AM +0200, Christian Hitz via buildroot wrote:
> > From: Christian Hitz <christian.hitz@bbv.ch>
> > 
> > Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
> > the sockios.h header, which uses the SIOCGSTAMP_OLD macro.
> 
> FYI, this seems to break in 2024.02.6. The
> TOOLCHAIN_EKTERNAL_BOOTLIN_*_STABLE refer to
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19.
> 
> However, the website https://toolchains.bootlin.com/ suggests the
> stable headers are 5.4.296. Perhaps those toolchains only need updating?
> 
> It isn't immediately clear which headers are in ARM 14.2.rel1, but that
> claims to be AT_LEAST_4_20
> 
> The end result I'm seeing is systemd-networkd doesn't compile.
> Compilation failed in 2025.02.5, actually, due to the same macro.
> 
> Does this need an upstream patch?
> 

I ran into the same issue when bumping our build to 2025.02.5. We are building
for arm32 and use the default arm toolchain which contains Kernel Headers 4.20 (I verified this
in the linux/version.h file).

The solution for our build was dropping the header from the systemd src. It doesn't
seem to be required atm. See patch here: https://gitlab.com/-/snippets/4888828

Nevertheless I now see the warning introduced by the Patch from Christian in 2025.02.6.
I guess I need to revert it in our build. Until we can move to a newer toolchain.
I think we will move to the bootlin toolchain when bumping 2025.08 because it has
the matching headers while the arm-toolchain even in the latest release (which is not
bumped in buildroot yet) is still on 4.20.

I thought about proposing the patch for the 2025.02.x branch but I'm not sure if it breaks on
other Toolchain variants.

Regards,
Michael

> 
> Colin Foster
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
