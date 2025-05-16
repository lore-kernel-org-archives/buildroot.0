Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F059C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34262417FC;
	Fri, 16 May 2025 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHo5S5hcPDwM; Fri, 16 May 2025 18:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54BA4417C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BA4417C7;
	Fri, 16 May 2025 18:00:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE45F185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB126613AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBqGQkhMvwYO for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EB84612F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB84612F2
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB84612F2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37E6A1C110E; Fri, 16 May 2025 19:59:52 +0200 (CEST)
Message-ID: <f935d666-27c5-4462-b34d-31351aa95aa7@rnout.be>
Date: Fri, 16 May 2025 18:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
References: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
 <20240719161557.8832-2-javad.rahimipetroudi@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240719161557.8832-2-javad.rahimipetroudi@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iwd7R4LV+xFWoC0X6d3jU8E9+my+bRVMv0xVJLhgrMw=;
 b=i7PuRt+lqRGZeNuT8T3iZ9n5aa8JOYoIFp4zJwVH+tBivXndSErInFfB74lwU2HoTrkqbB
 4BV2POp6WQyrb4RHbKFNU8u5TXXU2nI2PED/+NcycpzhM1E4tLx/UcZDbU2lpZS+hDOK4m
 sElCGUWAxEOaSDEEEy2HlFfXzC+GnleJzwK8RAuU/q3Q+SeZyOaqsaiZP/BtKuUk1YHo7S
 6XZ1qkKNomHkkHL/0QMuSVZ5orut49iHliLgjvlimoMF960TkJRvtcSKw3bpm1Giqrzytv
 Y8yUSLMpVNB/M6H07fktmnw0W7jR0VlIYuEMxgJGa8ccn48NOt7HZ68s+ZcU4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=i7PuRt+l
Subject: Re: [Buildroot] [PATCH 2/2] package/mpv: bump version to v0.38.0
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



On 19/07/2024 18:15, Javad Rahimipetroudi via buildroot wrote:
>   ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> -MPV_CONF_OPTS += --enable-rpi --enable-gl
> +#MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
>   MPV_DEPENDENCIES += rpi-userland
> -else
> -MPV_CONF_OPTS += --disable-rpi
> +#else
> +#MPV_CONF_OPTS += -Drpi=disabled

  You shouldn't have this commented-out stuff. In meson, if -Drpi=enabled 
exists, than -Drpi=disabled _must_ also exist, so why is this commented out?



  BTW I've marked both as Changes Requested in patchwork.

  Regards,
  Arnout

>   endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
