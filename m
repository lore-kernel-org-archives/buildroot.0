Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 14:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0D8419F1;
	Fri,  6 May 2022 14:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyYeQYGxHJRl; Fri,  6 May 2022 14:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5273741891;
	Fri,  6 May 2022 14:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFFB1BF29C
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 14:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D18860BD6
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 14:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64RgKdgmnhds for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 14:29:25 +0000 (UTC)
X-Greylist: delayed 00:05:28 by SQLgrey-1.8.0
Received: from mout3.freenet.de (mout3.freenet.de [IPv6:2001:748:100:40::2:5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25D1B605A7
 for <buildroot@buildroot.org>; Fri,  6 May 2022 14:29:24 +0000 (UTC)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
 by mout3.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nmys5-00GKGh-Ko
 for buildroot@buildroot.org; Fri, 06 May 2022 16:23:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5YecWKw739Whe7vXyhgxNoIUDfT909/9Gm3R1PwY+E=; b=pJ5Z6ff/T36g509hPSnJqTfK7E
 wnMiyzy5TLCBdV415srelZO6gE6HU5YrbKG+oNmA/b8HeP1SmBIuqEQfNfnyGPsA5+0SnLPTARXJo
 d6DNK+HOB5Imsj/CdLui1RFjRQjvFBG9vUJZuMFTAMiJd5VQ8mkZLizuJT8a5pG8S0CN3R9oAUUsN
 HGg4ieGPTVUuRf9UTU+pIK+YPImJd7kph2r8QCFABNS3M0mbRXnff8kF+UwYPydbkckGRjrpjU4OF
 jdxvND4m6IhNRqgzDgk6XrhE14cxuFEPXJ9SUIjxSds4nDO413FTm44ds1JJzWOeCA+Otv+RnAIKk
 5ZfKBgUw==;
Received: from p5df03b90.dip0.t-ipconnect.de ([93.240.59.144]:62128
 helo=[10.32.8.78])
 by sub2.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nmys5-00G0OL-Pa
 for buildroot@buildroot.org; Fri, 06 May 2022 16:23:53 +0200
Message-ID: <7326b3e0-5793-611e-6fed-3e503192108c@freenet.de>
Date: Fri, 6 May 2022 16:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: buildroot@buildroot.org
From: Earthquake <earthquake.de@freenet.de>
X-Originated-At: 93.240.59.144!62128
X-Scan-TS: Fri, 06 May 2022 16:23:53 +0200
Subject: [Buildroot] buildroot host builds with g++
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

building package for the host, ends with:
g++: error: /usr/bin/g++": No such file or directory

Building the same package for the target works....

Package mk for host build calls generic-package and host-generic-package.


Best regards,

Alex

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
