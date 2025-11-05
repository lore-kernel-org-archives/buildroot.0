Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA100CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 18:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C33860A54;
	Wed,  5 Nov 2025 18:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY-pHVnA3Gw3; Wed,  5 Nov 2025 18:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36C660B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36C660B9E;
	Wed,  5 Nov 2025 18:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 750A3B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65E6340BDD
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpuKutqJCMew for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 18:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F9CC40BDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9CC40BDC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F9CC40BDC
 for <buildroot@uclibc.org>; Wed,  5 Nov 2025 18:57:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1vGigs-0001hw-Mh
 for buildroot@uclibc.org; Wed, 05 Nov 2025 19:57:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 05 Nov 2025 19:56:40 +0100
Message-ID: <pan$58bca$abfacec3$1d2c9e22$598e7f88@ID-313208.user.individual.net>
References: <690ad065.5d0a0220.31ae0d.7dd8__29282.5266647682$1762316413$gmane$org@mx.google.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-11-04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 05 Nov 2025 04:19:49 -0000 schrieb Buildroot Notifications:

>  powerpc64   |      libsoundtouch-2.4.0       | NOK | https://
autobuild.buildroot.org/results/16788317badcfdb3d1973dc3f1bb89ea05d3fe10 
|     

Hi,

I cannot reproduce the build error:

ERROR: while checking hashes from package/libsoundtouch/libsoundtouch.hash
ERROR: soundtouch-2.4.0.tar.gz has wrong sha256 hash:
ERROR: expected: 
3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd
ERROR: got     : 
8f9fd11a2962a5db0876a5d04041d700ab727f77055c0d5b1b9c228a8bcbc434

$ wget -q https://www.surina.net/soundtouch/soundtouch-2.4.0.tar.gz
$ sha256sum soundtouch-2.4.0.tar.gz 
3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  
soundtouch-2.4.0.tar.gz

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
