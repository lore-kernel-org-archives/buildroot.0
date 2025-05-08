Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C22C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 16:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C34408D2;
	Thu,  8 May 2025 16:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZEFyJmCPANm; Thu,  8 May 2025 16:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F1A40925
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F1A40925;
	Thu,  8 May 2025 16:01:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6B5C439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 16:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9CA1608CE
 for <buildroot@buildroot.org>; Thu,  8 May 2025 16:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZDK7HWLvzz5 for <buildroot@buildroot.org>;
 Thu,  8 May 2025 16:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.175.196.64;
 helo=euk33.eukhosting.net; envelope-from=buildroot@cairnwater.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5F08608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F08608AA
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5F08608AA
 for <buildroot@buildroot.org>; Thu,  8 May 2025 16:01:55 +0000 (UTC)
Received: from [::1] (port=41322 helo=euk33.eukhosting.net)
 by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
 (envelope-from <buildroot@cairnwater.com>) id 1uD3h2-0000000Gcsz-0qPo
 for buildroot@buildroot.org; Thu, 08 May 2025 17:01:52 +0100
MIME-Version: 1.0
Date: Thu, 08 May 2025 17:01:51 +0100
From: buildroot@cairnwater.com
To: Buildroot <buildroot@buildroot.org>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <ddcd553b270f9e9a628ad8470be48c48@cairnwater.com>
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
 bh=PEHVPBQZvJEUt43qRbTR5DrUjwz5VAlSuKU736geLIA=; b=JOmFzUM2PVE4qYSuA7X09Oa/OP
 SnWtfTWKhgSDhCksACOBl20FAxPmvK3VZNUV5Gv8DiFjWhr/MNHiJ444eBJukZtCIt0Sp6YwCsC+V
 e+rsngtvkpx5gsoBClbgOGkB+jyb9bvlBRSQ46z+OjDVfsyL2FXK3/hC3syApSy0bN2+/XW5kdSHd
 ryfOHODV+dxdXXtOMzjiSYJnnH/2c0GLrzxyNY6u1TGS0D6806fdFinEnb52QSmlhYyC523NsrWLn
 FDwg6xnpzW0DSwcoKtJaCWjrtc8tDhQftRxlJPvQR3IUPN3cPfatLNaeO/EBHxpxVJVs/P+FVyyiy
 qbJbxekg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cairnwater.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=cairnwater.com header.i=@cairnwater.com
 header.a=rsa-sha256 header.s=default header.b=JOmFzUM2
Subject: [Buildroot] buildroot Dockerfile $TARGETPLATFORM Attribute
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

I'm working on a new fully open source wildlife camera system and to 
keep everything as open and well documented as possible I'm planning to 
use the buildroot Dockerfile for the build environment.

https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/docker/Dockerfile

When building the Docker container is it OK for me not to specify the 
TARGETPLATFORM attribute - for example:

sudo docker build -t buildroot-demo-01

I'm building for the NXP i.MX 8 M Plus SoC on the Debix Model A board - 
the NXP i.MX 8 M Plus has 2 or 4 Arm Cortex-A53 64 bit cores so I was 
guessing that it would be an arm64 platform not an arm64 platform?

The TARGETPLATFORM attribute only seems to be used in two if statements 
which run if it's set to "linux/amd64":

# Install 32bit variant on x86_64 image.
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
     dpkg --add-architecture i386; \
fi

# The container has no package lists, so need to update first
RUN apt-get -o APT::Retries=3 update -y

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
     apt-get -o APT::Retries=3 install -y --no-install-recommends \
         g++-multilib \
         libc6:i386; \
fi

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
