Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D8C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 15:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE281404D6;
	Wed,  7 May 2025 15:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBTom_rH9oev; Wed,  7 May 2025 15:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13DB84027E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13DB84027E;
	Wed,  7 May 2025 15:41:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB98CD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F1860B6C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8eeJgxOExnc for <buildroot@buildroot.org>;
 Wed,  7 May 2025 15:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.175.196.64;
 helo=euk33.eukhosting.net; envelope-from=buildroot@cairnwater.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4F3060B36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F3060B36
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4F3060B36
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:41:44 +0000 (UTC)
Received: from [::1] (port=43564 helo=euk33.eukhosting.net)
 by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
 (envelope-from <buildroot@cairnwater.com>) id 1uCgtx-0000000DzNQ-3Il4
 for buildroot@buildroot.org; Wed, 07 May 2025 16:41:41 +0100
MIME-Version: 1.0
Date: Wed, 07 May 2025 16:41:41 +0100
From: buildroot@cairnwater.com
To: Buildroot <buildroot@buildroot.org>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
X-Sender: buildroot@cairnwater.com
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - euk33.eukhosting.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cairnwater.com
X-Get-Message-Sender-Via: euk33.eukhosting.net: authenticated_id:
 buildroot@cairnwater.com
X-Authenticated-Sender: euk33.eukhosting.net: buildroot@cairnwater.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=cairnwater.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yeAuzVd/GS0aMmSBgpGpaNNIEsTBEmhXPg4tst2DP0I=; b=EUOAIGL9+W2AGXMt9nMHe2zDhP
 92Ve3DsilESBKZvk5GJfZgLSaZnkhVOh79z747B7LZWVjEhD9z29w2bbBSO2WSQy4+VuQ/0hhcThd
 s10xOAfQyzWU9TpH45khiHNL+T4aIa0wpOCfaYGlMQlM9HZXXDpYQhnQcoeHNgtJDkG0gRkYVkdOJ
 M7Salf04JZxe/TETkj69ixyN9h/fxLfThHe8sKsfvqZR9PI59v7uF2vOMOLL3WmKT3yiq047WmmlP
 IrNIhTGn6ke+F5hNPomvbRASmgtKu65EC7s/J4qDjBTfiw87o8PZ2iXdnqOHvRiFBr8aqjOAE0A5+
 qLMkdFrA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cairnwater.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=cairnwater.com header.i=@cairnwater.com
 header.a=rsa-sha256 header.s=default header.b=EUOAIGL9
Subject: [Buildroot] Adding Device Tree Overlays for MIPI-CSI2 Camera and
 libcamera to a buildroot Build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Does anyone have any advice on how to add DTOs needed by libcamera to a 
buildroot build?

We'd like to add Kieran's DTOs

https://git.uk.ideasonboard.com/camera/dt-overlays/src/branch/main/arch/arm64/boot/dts/freescale

to the buildroot default configuration for Debix Model A SBC

https://github.com/buildroot/buildroot/blob/master/configs/polyhex_debix_model_a_defconfig

Ideally we'd also like to add the overlays for the Sony IMX 708 Image 
Sensor used in the RPi V3 camera but these aren't mainline:

https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/overlays/imx708-overlay.dts
https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/overlays/imx708.dtsi

We're planning to use the Debix Model A SBC or Debix SoM A with SoM A 
I/O board to prototype a new open source wildlife camera for our work in 
conservation of tree dwelling endangered dormice

https://new-homes-for-old-friends.cairnwater.com/

then after field studies with the prototype design a custom board for an 
NXP i.MX 8M Plus SoM.

The analysis for the new open source wildlife camera is here:

https://github.com/William-Robert-Robertson/WildCamera

Will
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
