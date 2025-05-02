Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB58C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C9B83CDF;
	Fri,  2 May 2025 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSJuswPXX-y4; Fri,  2 May 2025 10:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F7082241
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F7082241;
	Fri,  2 May 2025 10:44:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56099EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C0CF82241
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGFbpJnWiGfL for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 849388136B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 849388136B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 849388136B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5862E1C1120; Fri,  2 May 2025 12:44:49 +0200 (CEST)
Message-ID: <1be658e7-fcee-4132-83d2-7f4e1bd9f6f8@rnout.be>
Date: Fri, 2 May 2025 12:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BSHoZE6c1wV2iFYW/Wze1sqh4mJjbrqeBJ13zTPB8Pc=;
 b=FWXC+xjC5x7o1C8+MRqCeLMz6a2DDUHAgA1GvTIAneUhn02SXjCgkMl4VRg+wo4B3WZTmS
 Sz4T/5nDuevWTt6CaznS0G4dXfYwxzWNLFsHAd22dfjot+QKKMHZ3POzoQWaRDtY6SwI27
 o/byRfe5vndxgusqvQ3YRNwtO66QesNM0aqRcD1WMoQbkVfiXP8pBGPj2C6kz8q9WZVJce
 BsHiKU2V5F60YbzMA2xe86+8jd5GI5QRd70YvIcLO+uJCPTomnKMkM1bVWNbSizbpHsVd6
 nPDS1or6rTHilcDk4PYHUXizg9awZ7l0Rj+oVIP917UhYyLVudqE2xfVrbZMkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FWXC+xjC
Subject: Re: [Buildroot] [PATCH 0/9] package/libcamera: bump v0.5.0,
 new pipelines, misc improvements and bug fixing
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2025 18:47, Quentin Schulz wrote:
> This bumps libcamera to v0.5.0, its latest release.
> 
> This removes the boost dependency for the VC4 pipeline which hasn't been
> needed for a while already.
> 
> This improves current reproducibility by adding optional dependencies to
> the list of package dependencies whenever their symbols are enabled.
> 
> This improves future reproducibility by making all "auto" features
> "disabled" so that new auto features aren't detected by meson when
> building libcamera as a missing optional dependency in the package mk
> file will introduce a reproducibility issue due to build order of
> packages.
> 
> This adds knobs for Mali-C55 and PiSP pipelines as well as a package for
> libpisp, a dependency for the latter pipeline in libcamera.
> 
> This also fixes documentation being built regardless of the
> "documentation" feature being disabled, if sphinx-build-3 is available
> on the host system.
> 
> Finally, this fixes a crash when running on Linux kernel predating 6.4.
> 
> Note this was only build tested.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (9):
>        package/libcamera: remove dependency on boost for rpi/vc4 pipeline
>        package/libcamera: fix documentation being built even if disabled
>        package/libcamera: fix crash on Rockchip with kernels before 6.4
>        package/libcamera: improve future reproducibility by forcing auto features to disabled
>        package/libcamera: improve reproducibility for optional dependencies

  Applied these 5 to 2025.02.x, thanks.

  Regards,
  Arnout

>        package/libcamera: add support for Arm Mali-C55 ISP pipeline
>        package/libcamera: bump to 0.5.0
>        package/libpisp: add new package
>        package/libcamera: add support for PiSP pipeline
> 
>   package/Config.in                                  |   1 +
>   ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 110 +++++++++++++++++++++
>   ...t-automatically-build-documentation-if-sp.patch |  42 ++++++++
>   package/libcamera/Config.in                        |  18 +++-
>   package/libcamera/libcamera.hash                   |   2 +-
>   package/libcamera/libcamera.mk                     |  47 +++++----
>   package/libpisp/Config.in                          |  22 +++++
>   package/libpisp/libpisp.hash                       |  11 +++
>   package/libpisp/libpisp.mk                         |  33 +++++++
>   9 files changed, 265 insertions(+), 21 deletions(-)
> ---
> base-commit: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
> change-id: 20250404-libcamera-0-5-0-b9ecf899ddb4
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
