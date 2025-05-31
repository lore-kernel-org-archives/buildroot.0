Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BCEC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235B16064E;
	Sat, 31 May 2025 16:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id db4bRuIonCr8; Sat, 31 May 2025 16:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7566072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7566072E;
	Sat, 31 May 2025 16:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2203235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A365283B95
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nh5FGuv0A5zi for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB80283B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB80283B6E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB80283B6E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:57:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB2B01C00DB; Sat, 31 May 2025 18:57:13 +0200 (CEST)
Message-ID: <69894129-77a2-4feb-8383-a091830c3162@rnout.be>
Date: Sat, 31 May 2025 18:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-7-roykollensvendsen@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515103632.2631227-7-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KeT/hJPAbrWf9/fLElqIps4Hlw3snvV4IN9BF8DQiGs=;
 b=dKLo9MW13ov8hmzTkwP12MmoqjACKM2ammfREVSlm2o2J6LoabpP53m0fj/zadqP42JyKF
 vltjX3S2SHg3xh9hw0JgXZG/XSXJ6ke4Mv3tu7mV6oZMoojBKX9zk0D5Oy8V8JsXEnE8hD
 +AQ/mWOjgvh4Bv6KMlMPTAxF/bgMaNfm2oEHVq2O3SG5NSAL1qcn/XAWexc1Hjo3wMPhvl
 2iynuANrpW5j3UXyW43ZJzPRAD8iP/sVkrXNK/EYBbyat8jW9MDc1l7epWi5cit1feJKd5
 Tbw8/Z6v7mHQCU9J2wLTCFBklpVUPd2iUKYG2gt4d7KNrDcEYmuNwwiYn64VLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dKLo9MW1
Subject: Re: [Buildroot] [PATCH 07/10] package/qt6/qt6base: fix build when
 xcb support is enabled
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



On 15/05/2025 12:36, Roy Kollen Svendsen wrote:
> Fixes:
> ERROR: Feature "xcb": Forcing to "ON" breaks its condition:
> QT_FEATURE_thread AND TARGET XCB::XCB AND TEST_xcb_syslibs AND QT_FEATURE_xkbcommon_x11
> Condition values dump:
> QT_FEATURE_thread = "ON"
> TARGET XCB::XCB found
> TEST_xcb_syslibs = "FALSE"
> QT_FEATURE_xkbcommon_x11 not evaluated
> 
> The xcb feature is defined in [2].
> 
> According to [1] XCB::CURSOR is needed for xcb support.
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n522
> [2] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n1016
> 
> This bug was introduced in e634be8906bd64d6a9de1768204d0f03d8d8357a.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/qt6/qt6base/qt6base.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index a4c56da601..39fb440be7 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -211,6 +211,7 @@ QT6BASE_CONF_OPTS += \
>   QT6BASE_DEPENDENCIES += \
>   	libxcb \
>   	libxkbcommon \
> +	xcb-util-cursor \
>   	xcb-util-wm \
>   	xcb-util-image \
>   	xcb-util-keysyms \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
