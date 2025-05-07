Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA8EC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 15:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89EA440D6E;
	Wed,  7 May 2025 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIeoFDD64tjb; Wed,  7 May 2025 15:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A52640CF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A52640CF2;
	Wed,  7 May 2025 15:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4DB950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA3A60FF0
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6RMVhLesV_b for <buildroot@buildroot.org>;
 Wed,  7 May 2025 15:19:51 +0000 (UTC)
X-Greylist: delayed 1870 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 07 May 2025 15:19:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AD30610AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD30610AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.175.196.64;
 helo=euk33.eukhosting.net; envelope-from=buildroot@cairnwater.com;
 receiver=<UNKNOWN> 
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AD30610AA
 for <buildroot@buildroot.org>; Wed,  7 May 2025 15:19:51 +0000 (UTC)
Received: from [::1] (port=34050 helo=euk33.eukhosting.net)
 by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
 (envelope-from <buildroot@cairnwater.com>) id 1uCg4c-0000000DtwI-17J5
 for buildroot@buildroot.org; Wed, 07 May 2025 15:48:38 +0100
MIME-Version: 1.0
Date: Wed, 07 May 2025 15:48:37 +0100
From: buildroot@cairnwater.com
To: buildroot@buildroot.org
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <c70c057ebf2e9e7c0c0b7578f962c114@cairnwater.com>
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
 bh=pQhKFELhbc581s/daK657yht8mSWnD5XVcDQrt3hFmg=; b=vI2XqZUZFnXO3CxGeL/6YkI992
 seh+SvrXvzwrbavY+2n0+uJoDS2m2akgBggNHEqBPly1agFYejJYxsGG4Zu0AwX4r7rDprRsI4M5N
 zemLKv8S/pbUt+qEuxseVN2QKo8/93uZhVFvDJ9y9ZFTuvVQHUAqKs4eKLeo9sA9vziwvjtkPIOJX
 0MuUJefbnxTz/qj4xAfF7xRn+ZmkzFmSANAXb4CNzzGHR6pzJMko9vyPBw9eRD0jX+Q33kVnzXIRR
 HdPL59yrSyiR3VG5VQQGBuC38ZCJOyqXDMSUa29fDv103PfP8RfpIE1M1ToeeRjmcUFWoy5svAU6E
 YhsrN63w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cairnwater.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=cairnwater.com header.i=@cairnwater.com
 header.a=rsa-sha256 header.s=default header.b=vI2XqZUZ
Subject: [Buildroot] buildroot Dockerfile - Targetplatform
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

I'm using buildroot for the first time - sorry to ask a basic question.

For the buildroot Dcokerfile

https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/docker/Dockerfile

Is it acceptable for me to build the Docker container without specifying 
TARGETPLATFORM and allow the Dockerfile to use a default target platform 
or should I always specify a TARGETPLATFORM - for example is this 
acceptable?

sudo docker build -t buildroot-demo-01

I'm building for the NXP i.MX 8 M Plus SoC on the Debix Model A board - 
the NXP i.MX 8 M Plus has 2 or 4 Arm Cortex-A53 64 bit cores so I wasn't 
sure whether to just leave out the TARGETPLATFORM as above or whether to 
specify "linux/arm64/v8" e.g.:

sudo docker build --platform linux/arm64/v8

The commands I'm using at the moment are:

sudo git clone https://git.buildroot.net/buildroot

cd /buildroot/support/docker

sudo docker build -t buildroot-demo-01

sudo docker run --name buildroot-build-machine02 -it buildroot-demo-01 
bash

git clone https://gitlab.com/buildroot.org/buildroot.git

cd buildroot

git pull

make polyhex_debix_model_a_defconfig

# This can be used to customise
#make menuconfig

make

Thank you very much for your help!

Will
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
