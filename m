Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC80C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 09:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B090E404D3;
	Thu,  6 Mar 2025 09:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKZu3DFM_TFq; Thu,  6 Mar 2025 09:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A15F40575
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A15F40575;
	Thu,  6 Mar 2025 09:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E20A0E2E
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D6D80E60
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJoMZFEdBub5 for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 09:40:33 +0000 (UTC)
X-Greylist: delayed 313 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 06 Mar 2025 09:40:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 725F080D59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725F080D59
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.33;
 helo=mail3.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
Received: from mail3.hostpark.net (mail3.hostpark.net [212.243.197.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 725F080D59
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.hostpark.net (Postfix) with ESMTP id 3B5F116342;
 Thu,  6 Mar 2025 10:35:16 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail3.hostpark.net ([127.0.0.1])
 by localhost (mail3.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id uf1T-qegiOpz; Thu,  6 Mar 2025 10:35:15 +0100 (CET)
Received: from roundcube.hostpark.net (unknown [10.100.20.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail3.hostpark.net (Postfix) with ESMTPSA id BE02116343;
 Thu,  6 Mar 2025 10:35:15 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 10:35:15 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Hitz via buildroot <buildroot@buildroot.org>, Christian Hitz
 <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>, Samuel
 Martin <s.martin49@gmail.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>
In-Reply-To: <20240914132142.22afe629@windsurf>
References: <20240911131230.2299474-1-christian@klarinett.li>
 <20240914132142.22afe629@windsurf>
Message-ID: <bee30fc3929533d2704cfed5834b5989@klarinett.li>
X-Sender: christian@klarinett.li
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:content-type:content-type:message-id
 :references:in-reply-to:subject:subject:from:from:date:date
 :mime-version; s=sel2011a; t=1741253715; bh=0kM7cXGUShTHLbputXAj
 Sr/3skodiCytVpE/8EunCLI=; b=NcHRwmAjrOHDpdLV3TUjODCXi0KfP4+X3Uum
 ieOMEZ91Doml9qcyjg2/ZMjWo2hXMI6Hr55NHtlQ4qncSZSyaZFNTu+XiVmzm7wh
 Zfo3AXCfgBEEK8dU2oDX6OBdJDTlSJd39d8BcBAURszdIfSsvygkmGBFmBLVhtKT
 0ZKsN0c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=NcHRwmAj
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6connectivity: new package
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
From: christian--- via buildroot <buildroot@buildroot.org>
Reply-To: christian@klarinett.li
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas

Thanks for the review.

Am 2024-09-14 13:21, schrieb Thomas Petazzoni:
>> +++ b/package/qt6/qt6connectivity/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_QT6CONNECTIVITY
>> +	bool "qt6connectivity"
>> +	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS
> 
> There is nothing related to neard support in qt6connectivity as far as
> I can see.
The qt6connectivity module uses neard to provide NFC services on Linux. 
[1]
DBus is used to communicate with neard. Technically, the neard
dependency is runtime only.

> 
> Also, I believe bluez is not mandatory. I've done a build of
> qt6connectivity with neither neard nor bluez5-utils and it did
> build/install Qt6Nfc.
I tried to reduce the bluez dependency down to runtime-only, but if
bluez is not available at compile time, QBluetooth is only built
with a dummy backend, skipping the relevant bluez backend.

> 
>> +	select BR2_PACKAGE_QT6BASE_NETWORK
>> +	select BR2_PACKAGE_QT6BASE_CONCURRENT
>> +	select BR2_PACKAGE_QT6BASE_DBUS
> 
> Concurrent is definitely not needed.
Agreed.

> DBus doesn't seem to be mandatory either (I tested to build without it,
> and it built fine).
Network and DBus are required to build. [2] [3] [4]

I will sent a v2 version addressing these points.

Regards,
Christian

[1] 
https://github.com/qt/qtconnectivity/blob/817a2ccffba47d5dd1175a2a10e8ac6628570314/src/nfc/configure.cmake#L10
[2] 
https://github.com/qt/qtconnectivity/blob/817a2ccffba47d5dd1175a2a10e8ac6628570314/src/bluetooth/CMakeLists.txt#L45
[3] 
https://github.com/qt/qtconnectivity/blob/817a2ccffba47d5dd1175a2a10e8ac6628570314/src/bluetooth/CMakeLists.txt#L96
[4] 
https://github.com/qt/qtconnectivity/blob/817a2ccffba47d5dd1175a2a10e8ac6628570314/src/nfc/CMakeLists.txt#L113
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
